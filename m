Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karolina Stolarek" <karolina.stolarek@intel.com>
Date: Wed, 21 Dec 2022 16:56:17 -0000
Message-ID: <167164177760.32312.2142823711936803441@emeril.freedesktop.org>
References: <cover.1671446367.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1671446367.git.karolina.stolarek@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?ntroduce_blt=5Fcmd=5Finfo_struct?=
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

Series: Introduce blt_cmd_info struct
URL   : https://patchwork.freedesktop.org/series/112055/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/767402 fo=
r the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/33833368):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/1223] Generating version.h with a custom command.
  [2/1221] Compiling C object 'lib/76b5a35@@igt-i915_blt_tiling_c@sta/i915_=
blt_tiling.c.o'.
  FAILED: lib/76b5a35@@igt-i915_blt_tiling_c@sta/i915_blt_tiling.c.o=20
  clang -Ilib/76b5a35@@igt-i915_blt_tiling_c@sta -Ilib -I../lib -I../includ=
e/drm-uapi -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr=
/include/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr=
/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/i=
nclude/libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -Xclang=
 -fcolor-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -We=
xtra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=
=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wmissi=
ng-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-pro=
totypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant=
-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-f=
ield-initializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sig=
n-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=
=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -W=
error=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=
=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dse=
quence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-mallo=
c -fno-builtin-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/=
share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '=
-DIGT_LOG_DOMAIN=3D"i915/blt_tiling"' -MD -MQ 'lib/76b5a35@@igt-i915_blt_ti=
ling_c@sta/i915_blt_tiling.c.o' -MF 'lib/76b5a35@@igt-i915_blt_tiling_c@sta=
/i915_blt_tiling.c.o.d' -o 'lib/76b5a35@@igt-i915_blt_tiling_c@sta/i915_blt=
_tiling.c.o' -c ../lib/i915/blt_tiling.c
  ../lib/i915/blt_tiling.c:146:2: error: initializer element is not a compi=
le-time constant
          pre_gen6_info,
          ^~~~~~~~~~~~~
  ../lib/i915/blt_tiling.c:154:2: error: initializer element is not a compi=
le-time constant
          gen12_info,
          ^~~~~~~~~~
  2 errors generated.
  ninja: build stopped: subcommand failed.
  section_end:1671640863:step_script
  section_start:1671640864:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1671640865:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/767402
