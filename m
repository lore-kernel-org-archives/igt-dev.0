Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 24 Feb 2022 08:59:50 -0000
Message-ID: <164569319022.32674.3684436260455911649@emeril.freedesktop.org>
References: <20220224051648.91470-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220224051648.91470-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_A?=
 =?utf-8?q?dd_Negative_tests_to_VRR_=28rev4=29?=
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

Series: Add Negative tests to VRR (rev4)
URL   : https://patchwork.freedesktop.org/series/100539/
State : warning

=3D=3D Summary =3D=3D

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/517458 fo=
r the overview.

build:tests-fedora-clang has failed (https://gitlab.freedesktop.org/gfx-ci/=
igt-ci-tags/-/jobs/19186453):
  [10/919] Linking static target lib/libigt-igt_kmod_c.a.
  [11/919] Linking static target lib/libigt-igt_vc4_c.a.
  [12/919] Linking static target lib/libigt-igt_amd_c.a.
  [13/919] Compiling C object 'lib/76b5a35@@igt-igt_edid_c@sta/igt_edid.c.o=
'.
  FAILED: lib/76b5a35@@igt-igt_edid_c@sta/igt_edid.c.o=20
  clang -Ilib/76b5a35@@igt-igt_edid_c@sta -Ilib -I../lib -I../include/drm-u=
api -I../include/linux-uapi -I../lib/stubs/syscalls -I. -I../ -I/usr/includ=
e/cairo -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/includ=
e/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/=
libdrm -I/usr/include/libdrm/nouveau -I/usr/include/valgrind -Xclang -fcolo=
r-diagnostics -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -s=
td=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wb=
ad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wmissing-decla=
rations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes =
-Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decls -=
Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-missing-field-ini=
tializers -Wno-pointer-arith -Wno-address-of-packed-member -Wno-sign-compar=
e -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -Werror=3Daddre=
ss -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3D=
int-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnu=
ll -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-p=
oint -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-b=
uiltin-calloc -fcommon -fPIC -pthread '-DIGT_DATADIR=3D"/usr/local/share/ig=
t-gpu-tools"' '-DIGT_SRCDIR=3D"/builds/gfx-ci/igt-ci-tags/tests"' '-DIGT_LO=
G_DOMAIN=3D"igt_edid"' -MD -MQ 'lib/76b5a35@@igt-igt_edid_c@sta/igt_edid.c.=
o' -MF 'lib/76b5a35@@igt-igt_edid_c@sta/igt_edid.c.o.d' -o 'lib/76b5a35@@ig=
t-igt_edid_c@sta/igt_edid.c.o' -c ../lib/igt_edid.c
  ../lib/igt_edid.c:175:7: error: array index 2 is past the end of the arra=
y (which contains 2 elements) [-Werror,-Warray-bounds]
                      timings.pixel_clock[2] !=3D 0x00)
                      ^                   ~
  ../lib/igt_edid.h:154:2: note: array 'pixel_clock' declared here
          uint8_t pixel_clock[2]; /* need to multiply by 10 KHz, zero if no=
t a pixel timing */
          ^
  1 error generated.
  ninja: build stopped: subcommand failed.
  section_end:1645692894:step_script
  section_start:1645692894:cleanup_file_variables
  Cleaning up project directory and file based variables
  section_end:1645692895:cleanup_file_variables
  ERROR: Job failed: exit code 1

=3D=3D Logs =3D=3D

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/p=
ipelines/517458
