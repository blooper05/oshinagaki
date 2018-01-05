# frozen_string_literal: true

### Yum Repository ###
remote_file '/etc/yum.repos.d/nasm.repo' do
  mode '0644'
  owner 'root'
  group 'root'
end

### Dependencies ###
DEPENDENCIES = %w[
  autoconf
  automake
  gcc
  gcc-c++
  git
  libtool
  make
  nasm
  pkgconfig
  zlib-devel
].freeze

DEPENDENCIES.each do |dependency|
  package dependency
end

### Build Settings ###
BIN_PATH    = '/usr/local/bin'
PREFIX_PATH = '/usr/local/src/ffmpeg_build'
SRC_PATH    = '/usr/local/src/ffmpeg_sources'

### Yasm ###
YASM_GIT_URL  = 'https://github.com/yasm/yasm.git'
YASM_SRC_PATH = "#{SRC_PATH}/yasm"
YASM_COMMANDS = [
  'autoreconf -fiv',
  %(./configure --prefix="#{PREFIX_PATH}" --bindir="#{BIN_PATH}"),
  'make -j$(nproc)',
  'make install',
  'make distclean',
].freeze

git YASM_SRC_PATH do
  repository YASM_GIT_URL
end

YASM_COMMANDS.each do |command|
  execute command do
    cwd YASM_SRC_PATH
    not_if "test -e #{BIN_PATH}/yasm"
  end
end

### libx264 ###
X264_GIT_URL  = 'https://git.videolan.org/git/x264.git'
X264_SRC_PATH = "#{SRC_PATH}/x264"
X264_COMMANDS = [
  %(./configure \
    --prefix="#{PREFIX_PATH}" \
    --bindir="#{BIN_PATH}" \
    --enable-static),
  'make -j$(nproc)',
  'make install',
  'make distclean',
].freeze

git X264_SRC_PATH do
  repository X264_GIT_URL
end

X264_COMMANDS.each do |command|
  execute command do
    cwd X264_SRC_PATH
    not_if "test -e #{BIN_PATH}/x264"
  end
end

### libfdk_aac ###
AAC_GIT_URL  = 'https://github.com/mstorsjo/fdk-aac.git'
AAC_SRC_PATH = "#{SRC_PATH}/fdk-aac"
AAC_COMMANDS = [
  'autoreconf -fiv',
  %(./configure --prefix="#{PREFIX_PATH}" --disable-shared),
  'make -j$(nproc)',
  'make install',
  'make distclean',
].freeze

git AAC_SRC_PATH do
  repository AAC_GIT_URL
end

AAC_COMMANDS.each do |command|
  execute command do
    cwd AAC_SRC_PATH
    not_if "test -e #{BIN_PATH}/ffmpeg" # FIXME
  end
end

### FFmpeg ###
FFMPEG_GIT_URL  = 'https://git.videolan.org/git/ffmpeg.git'
FFMPEG_SRC_PATH = "#{SRC_PATH}/ffmpeg"
FFMPEG_COMMANDS = [
  %(./configure \
    --prefix="#{PREFIX_PATH}" \
    --extra-cflags="-I#{PREFIX_PATH}/include" \
    --extra-ldflags="-L#{PREFIX_PATH}/lib -ldl" \
    --bindir="#{BIN_PATH}" \
    --pkg-config-flags="--static" \
    --enable-gpl \
    --enable-nonfree \
    --enable-libfdk_aac \
    --enable-libx264),
  'make -j$(nproc)',
  'make install',
  'make distclean',
  'hash -r',
].freeze

git FFMPEG_SRC_PATH do
  repository FFMPEG_GIT_URL
end

FFMPEG_COMMANDS.each do |command|
  execute command do
    cwd FFMPEG_SRC_PATH
    not_if "test -e #{BIN_PATH}/ffmpeg"
  end
end
