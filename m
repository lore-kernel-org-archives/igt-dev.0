Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Tue, 14 Feb 2023 21:18:12 -0000
Message-ID: <167640949262.8402.15643777948257223397@emeril.freedesktop.org>
References: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230214210007.2026033-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_E?=
 =?utf-8?q?nable_OAM_support_in_IGT_and_GPUvis?=
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

=3D=3D Series Details =3D=3D

Series: Enable OAM support in IGT and GPUvis
URL   : https://patchwork.freedesktop.org/series/114023/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/807889 fo=
r the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/36388704):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/628] Generating version.h with a custom command.
  [2/333] Linking target lib/libi915_perf.so.1.5.
  [3/333] Generating symbol file 'lib/76b5a35@@i915_perf@sha/libi915_perf.s=
o.1.5.symbols'.
  [4/333] Linking target tests/gem_exec_balancer.
  [5/333] Compiling C object 'tests/59830eb@@perf@exe/i915_perf.c.o'.
  FAILED: tests/59830eb@@perf@exe/i915_perf.c.o=20
  clang -Itests/59830eb@@perf@exe -Itests -I../tests -I../include/drm-uapi =
-I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I=
/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I=
/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/u=
sr/include/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -Xc=
lang -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch=
 -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOU=
RCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wmi=
ssing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-=
prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredund=
ant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missin=
g-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-=
sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Wer=
ror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self=
 -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Wer=
ror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=
=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-=
malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@perf@exe/i915_p=
erf.c.o' -MF 'tests/59830eb@@perf@exe/i915_perf.c.o.d' -o 'tests/59830eb@@p=
erf@exe/i915_perf.c.o' -c ../tests/i915/perf.c
  ../tests/i915/perf.c:1981:13: error: fields must have a constant size: 'v=
ariable length array in structure' extension will never be supported
                          uint32_t report[format_size / 4];
                                   ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1676409224:step_script
  section_start:1676409224:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1676409225:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/807889
