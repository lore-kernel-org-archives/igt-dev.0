Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 26 Mar 2020 10:08:04 -0000
Message-ID: <158521728400.23003.6287152586224708905@emeril.freedesktop.org>
References: <20200326050208.29377-1-ranjeet1.kumar@intel.com>
In-Reply-To: <20200326050208.29377-1-ranjeet1.kumar@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Fset=5Ftilling=5Fvs=5Fgtt=3A_Minor_Changes?=
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
To: ranjeet1.kumar@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_set_tilling_vs_gtt: Minor Changes
URL   : https://patchwork.freedesktop.org/series/75110/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/124576 for the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/2065930):
  [214/554] Linking target tests/gem_render_copy_redux.
  [215/554] Linking target tests/gem_render_linear_blits.
  [216/554] Linking target tests/gem_render_tiled_blits.
  [217/554] Linking target tests/gem_reset_stats.
  [218/554] Linking target tests/gem_request_retire.
  [219/554] Compiling C object 'tests/59830eb@@gem_set_tiling_vs_gtt@exe/i915_gem_set_tiling_vs_gtt.c.o'.
  FAILED: tests/59830eb@@gem_set_tiling_vs_gtt@exe/i915_gem_set_tiling_vs_gtt.c.o 
  clang -Itests/59830eb@@gem_set_tiling_vs_gtt@exe -Itests -I../tests -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -I/usr/include/libdrm/nouveau -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -std=gnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=address -Werror=array-bounds -Werr
 or=implicit -Werror=init-self -Werror=int-to-pointer-cast -Werror=main -Werror=missing-braces -Werror=nonnull -Werror=pointer-to-int-cast -Werror=return-type -Werror=sequence-point -Werror=trigraphs -Werror=write-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/59830eb@@gem_set_tiling_vs_gtt@exe/i915_gem_set_tiling_vs_gtt.c.o' -MF 'tests/59830eb@@gem_set_tiling_vs_gtt@exe/i915_gem_set_tiling_vs_gtt.c.o.d' -o 'tests/59830eb@@gem_set_tiling_vs_gtt@exe/i915_gem_set_tiling_vs_gtt.c.o' -c ../tests/i915/gem_set_tiling_vs_gtt.c
  ../tests/i915/gem_set_tiling_vs_gtt.c:62:2: error: function definition is not allowed here
          {
          ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1585217191:build_script
  section_start:1585217191:after_script
  section_end:1585217193:after_script
  section_start:1585217193:upload_artifacts_on_failure
  section_end:1585217195:upload_artifacts_on_failure
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/124576
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
