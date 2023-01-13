Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Fri, 13 Jan 2023 06:33:51 -0000
Message-ID: <167359163158.17533.2728587812303643275@emeril.freedesktop.org>
References: <20230113062233.14750-1-jeevan.b@intel.com>
In-Reply-To: <20230113062233.14750-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBsaWIv?=
 =?utf-8?q?igt=5Fdraw=3A_Change_MOCS_settings_for_MTL_=28rev8=29?=
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

Series: lib/igt_draw: Change MOCS settings for MTL (rev8)
URL   : https://patchwork.freedesktop.org/series/111958/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
1e6d24e6dfa42b22f950f7d5e436b8f9acf8747f Update NEWS, bump version to 1.27

ninja: Entering directory `/opt/igt/build'
[1/788] Generating version.h with a custom command.
[2/785] Linking static target lib/libigt-i915_intel_decode_c.a.
[3/785] Linking static target lib/libigt-igt_device_scan_c.a.
[4/785] Linking static target lib/libigt-intel_batchbuffer_c.a.
[5/785] Linking static target lib/libigt-intel_bufops_c.a.
[6/785] Linking static target lib/libigt-rendercopy_gen6_c.a.
[7/785] Linking static target lib/libigt-rendercopy_gen7_c.a.
[8/785] Linking static target lib/libigt-rendercopy_gen8_c.a.
[9/785] Linking static target lib/libigt-rendercopy_gen9_c.a.
[10/785] Compiling C object 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o'.
FAILED: lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o=20
cc -Ilib/76b5a35@@igt-igt_draw_c@sta -Ilib -I../../../usr/src/igt-gpu-tools=
/lib -I../../../usr/src/igt-gpu-tools/include/drm-uapi -I../../../usr/src/i=
gt-gpu-tools/include/linux-uapi -I../../../usr/src/igt-gpu-tools/lib/stubs/=
syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include/cairo -I/usr/=
include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/includ=
e/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/include/libp=
ng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/usr/include/v=
algrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BI=
TS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -incl=
ude config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-=
statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-de=
clarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototyp=
es -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-decl=
s -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno=
-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -Wn=
o-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-unused-p=
arameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werro=
r=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dma=
in -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast=
 -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -fPIC -pt=
hread '-DIGT_DATADIR=3D"/opt/igt/share/igt-gpu-tools"' '-DIGT_SRCDIR=3D"/us=
r/src/igt-gpu-tools/tests"' '-DIGT_LOG_DOMAIN=3D"igt_draw"' -MD -MQ 'lib/76=
b5a35@@igt-igt_draw_c@sta/igt_draw.c.o' -MF 'lib/76b5a35@@igt-igt_draw_c@st=
a/igt_draw.c.o.d' -o 'lib/76b5a35@@igt-igt_draw_c@sta/igt_draw.c.o' -c ../.=
./../usr/src/igt-gpu-tools/lib/igt_draw.c
../../../usr/src/igt-gpu-tools/lib/igt_draw.c: In function =E2=80=98draw_re=
ct_blt=E2=80=99:
../../../usr/src/igt-gpu-tools/lib/igt_draw.c:706:38: error: implicit decla=
ration of function =E2=80=98intel_get_uc_mocs=E2=80=99; did you mean =E2=80=
=98intel_get_pci_device=E2=80=99? [-Werror=3Dimplicit-function-declaration]
  706 |   intel_bb_out(ibb, blt_cmd_tiling | intel_get_uc_mocs(fd) << 21 | =
(pitch-1));
      |                                      ^~~~~~~~~~~~~~~~~
      |                                      intel_get_pci_device
../../../usr/src/igt-gpu-tools/lib/igt_draw.c:706:38: warning: nested exter=
n declaration of =E2=80=98intel_get_uc_mocs=E2=80=99 [-Wnested-externs]
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

