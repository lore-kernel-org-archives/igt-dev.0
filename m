Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 06:48:44 -0000
Message-ID: <157984852470.15089.17392946597030611866@emeril.freedesktop.org>
References: <20200123122711.1390696-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200123122711.1390696-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_t?=
 =?utf-8?q?ests/dumb=5Fbuffer=3A_Try_to_compute_the_largest_possible_dumb_?=
 =?utf-8?q?buffer?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/dumb_buffer: Try to compute the largest possible dumb buffer
URL   : https://patchwork.freedesktop.org/series/72463/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100451 for the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1437837):
  [141/618] Linking target tests/gem_cs_tlb.
  [142/618] Linking target tests/gem_ctx_bad_destroy.
  [143/618] Linking target tests/gem_ctx_clone.
  [144/618] Linking target tests/gem_ctx_create.
  [145/618] Linking target tests/gem_ctx_engines.
  [146/618] Compiling C object 'tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o'.
  FAILED: tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o 
  clang -Itests/59830eb@@gem_ctx_isolation@exe -Itests -I../tests -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -I/usr/include/libdrm/nouveau -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -std=gnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=address -Werror=array-bounds -Werror=i
 mplicit -Werror=init-self -Werror=int-to-pointer-cast -Werror=main -Werror=missing-braces -Werror=nonnull -Werror=pointer-to-int-cast -Werror=return-type -Werror=sequence-point -Werror=trigraphs -Werror=write-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o' -MF 'tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o.d' -o 'tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o' -c ../tests/i915/gem_ctx_isolation.c
  ../tests/i915/gem_ctx_isolation.c:880:10: error: address of array 'e->name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
               e->name; e++) {
               ~~~^~~~
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1579785669:build_script
  [0Ksection_start:1579785669:after_script
  [0Ksection_end:1579785670:after_script
  [0Ksection_start:1579785670:upload_artifacts_on_failure
  [0Ksection_end:1579785672:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100451
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
