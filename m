Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 06:45:39 -0000
Message-ID: <157984833919.15090.8011849231163712079@emeril.freedesktop.org>
References: <20200123120134.2682-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200123120134.2682-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_i?=
 =?utf-8?q?915/gem=5Fctx=5Fisolation=3A_Use_static_iterator?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_isolation: Use static iterator
URL   : https://patchwork.freedesktop.org/series/72461/
State : warning

== Summary ==

Did not get list of undocumented tests for this run, something is wrong!

Other than that, pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100436 for the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/1437314):
  [5/92] Linking target tools/intel_watermark.
  [6/92] Linking target tools/intel_dp_compliance.
  [7/92] Compiling C object 'tools/f9d35d4@@intel_reg@exe/intel_reg.c.o'.
  FAILED: tools/f9d35d4@@intel_reg@exe/intel_reg.c.o 
  clang -Itools/f9d35d4@@intel_reg@exe -Itools -I../tools -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm -I/usr/include/valgrind -Xclang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -std=gnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=2 -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=address -Werror=array-bounds -Werror=implicit -Werror=init-self -Werror=int-
 to-pointer-cast -Werror=main -Werror=missing-braces -Werror=nonnull -Werror=pointer-to-int-cast -Werror=return-type -Werror=sequence-point -Werror=trigraphs -Werror=write-strings -fno-builtin-malloc -fno-builtin-calloc -pthread '-DIGT_DATADIR="/usr/local/share/igt-gpu-tools"' -MD -MQ 'tools/f9d35d4@@intel_reg@exe/intel_reg.c.o' -MF 'tools/f9d35d4@@intel_reg@exe/intel_reg.c.o.d' -o 'tools/f9d35d4@@intel_reg@exe/intel_reg.c.o' -c ../tools/intel_reg.c
  ../tools/intel_reg.c:255:40: error: address of array 'e->name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
          for (e = intel_execution_engines2; e->name; e++) {
          ~~~                                ~~~^~~~
  ../tools/intel_reg.c:786:40: error: address of array 'e->name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
          for (e = intel_execution_engines2; e->name; e++)
          ~~~                                ~~~^~~~
  2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1579782747:build_script
  [0Ksection_start:1579782747:after_script
  [0Ksection_end:1579782753:after_script
  [0Ksection_start:1579782753:upload_artifacts_on_failure
  [0Ksection_end:1579782756:upload_artifacts_on_failure
  [0K[31;1mERROR: Job failed: exit code 1
  [0;m

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/100436
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
