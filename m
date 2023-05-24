Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Erico Nunes" <nunes.erico@gmail.com>
Date: Wed, 24 May 2023 15:27:07 -0000
Message-ID: <168494202728.11321.7670302085991469592@emeril.freedesktop.org>
References: <20230524134930.61911-1-nunes.erico@gmail.com>
In-Reply-To: <20230524134930.61911-1-nunes.erico@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJbml0?=
 =?utf-8?q?ial_tests_for_the_lima_drm_driver?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Initial tests for the lima drm driver
URL   : https://patchwork.freedesktop.org/series/118303/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
de4b71f2c13f6fdcae15a4c3fac7fbe5f5737685 intel_gpu_top: Move client name last

                 from ../../../usr/src/igt-gpu-tools/lib/igt_lima.c:20:
../../../usr/src/igt-gpu-tools/lib/i915/intel_memory_region.h:173:1: warning: empty declaration
  173 | struct gem_memory_region {
      | ^~~~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/igt_lima.c:20:
../../../usr/src/igt-gpu-tools/lib/ioctl_wrappers.h:51:14: error: storage class specified for parameter ‘igt_ioctl’
   51 | extern int (*igt_ioctl)(int fd, unsigned long request, void *arg);
      |              ^~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/ioctl_wrappers.h:120:1: warning: empty declaration
  120 | struct local_dma_buf_sync {
      | ^~~~~~
../../../usr/src/igt-gpu-tools/lib/ioctl_wrappers.h:168:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  168 | {
      | ^
../../../usr/src/igt-gpu-tools/lib/ioctl_wrappers.h:178:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  178 | {
      | ^
../../../usr/src/igt-gpu-tools/lib/ioctl_wrappers.h:188:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  188 | {
      | ^
../../../usr/src/igt-gpu-tools/lib/ioctl_wrappers.h:198:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
  198 | {
      | ^
../../../usr/src/igt-gpu-tools/lib/igt_lima.c:35:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   35 | {
      | ^
../../../usr/src/igt-gpu-tools/lib/igt_lima.c:52:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   52 | {
      | ^
../../../usr/src/igt-gpu-tools/lib/igt_lima.c:64:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   64 | {
      | ^
../../../usr/src/igt-gpu-tools/lib/igt_lima.c:76:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   76 | {
      | ^
../../../usr/src/igt-gpu-tools/lib/igt_lima.c:88:1: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘{’ token
   88 | {
      | ^
In file included from ../../../usr/src/igt-gpu-tools/lib/igt_lima.c:19:
../../../usr/src/igt-gpu-tools/lib/igt_lima.h:24:7: error: old-style parameter declarations in prototyped function definition
   24 | void *igt_lima_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned int prot)
      |       ^~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/lib/igt_lima.c:97: error: expected ‘{’ at end of input
   97 | }
      | 
../../../usr/src/igt-gpu-tools/lib/igt_lima.c:97: error: control reaches end of non-void function [-Werror=return-type]
   97 | }
      | 
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

