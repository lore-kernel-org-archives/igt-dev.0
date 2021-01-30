Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 30 Jan 2021 04:42:50 -0000
Message-ID: <161198177093.13908.10227066086048041672@emeril.freedesktop.org>
References: <20210130041704.19527-1-ashutosh.dixit@intel.com>
In-Reply-To: <20210130041704.19527-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_m?=
 =?utf-8?q?eson=3A_Turn_on_-Werror?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: meson: Turn on -Werror
URL   : https://patchwork.freedesktop.org/series/86465/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/263927 for the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/6994602):
  [11/983] Compiling C object 'lib/76b5a35@@igt-i915_gem_vm_c@sta/i915_gem_vm.c.o'.
  [12/983] Linking static target lib/libigt-i915_gem_vm_c.a.
  [13/983] Compiling C object 'lib/76b5a35@@igt-i915_gem_mman_c@sta/i915_gem_mman.c.o'.
  [14/983] Linking static target lib/libigt-i915_gem_mman_c.a.
  [15/983] Linking static target lib/libigt-igt_collection_c.a.
  [16/983] Compiling C object 'lib/76b5a35@@igt-igt_color_encoding_c@sta/igt_color_encoding.c.o'.
  [17/983] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
  FAILED: lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o 
  clang -Ilib/76b5a35@@igt-igt_aux_c@sta -Ilib -I../lib -I../include/drm-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -std=gnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Waddress -Warray-bounds -Wimplicit -Winit-self -Wint-to-pointer-cast -Wmain -Wmissing-braces -Wnonnu
 ll -Wpointer-to-int-cast -Wreturn-type -Wsequence-point -Wtrigraphs -Wwrite-strings -Werror -fno-builtin-malloc -fno-builtin-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR="/usr/local/share/igt-gpu-tools"' '-DIGT_SRCDIR="/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LOG_DOMAIN="igt_aux"' -MD -MQ 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o' -MF 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o.d' -o 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o' -c ../lib/igt_aux.c
  ../lib/igt_aux.c:500:1: error: function 'sig_abort' could be declared with attribute 'noreturn' [-Werror,-Wmissing-noreturn]
  {
  ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1611981119:step_script
  section_start:1611981119:cleanup_file_variables
  Cleaning up file based variables
  section_end:1611981124:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/263927
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
