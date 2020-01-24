Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 06:45:29 -0000
Message-ID: <157984832985.15091.11212253871904531874@emeril.freedesktop.org>
References: <20200123111536.28216-1-petri.latvala@intel.com>
In-Reply-To: <20200123111536.28216-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_r?=
 =?utf-8?q?unner=3A_Don=27t_check_for_taints_when_not_configured_for_it?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: runner: Don't check for taints when not configured for it
URL   : https://patchwork.freedesktop.org/series/72458/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100427 for the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1437093):
  [145/604] Linking target tests/gem_cs_tlb.
  [146/604] Linking target tests/gem_ctx_bad_destroy.
  [147/604] Linking target tests/gem_ctx_clone.
  [148/604] Linking target tests/gem_ctx_create.
  [149/604] Linking target tests/gem_ctx_engines.
  [150/604] Compiling C object 'tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o'.
  FAILED: tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o 
  clang -Itests/59830eb@@gem_ctx_isolation@exe -Itests -I../tests -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -I/usr/include/libdrm/nouveau -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -std=gnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=address -Werror=array-bounds -Werror=i
 mplicit -Werror=init-self -Werror=int-to-pointer-cast -Werror=main -Werror=missing-braces -Werror=nonnull -Werror=pointer-to-int-cast -Werror=return-type -Werror=sequence-point -Werror=trigraphs -Werror=write-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o' -MF 'tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o.d' -o 'tests/59830eb@@gem_ctx_isolation@exe/i915_gem_ctx_isolation.c.o' -c ../tests/i915/gem_ctx_isolation.c
  ../tests/i915/gem_ctx_isolation.c:880:10: error: address of array 'e->name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
               e->name; e++) {
               ~~~^~~~
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1579781261:build_script
  [0Ksection_start:1579781261:after_script
  [0Ksection_end:1579781262:after_script
  [0Ksection_start:1579781262:upload_artifacts_on_failure
  [0Ksection_end:1579781264:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100427
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
