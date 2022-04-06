Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 06 Apr 2022 18:09:07 -0000
Message-ID: <164926854722.5451.13523931524590813030@emeril.freedesktop.org>
References: <20220406162906.6057-1-swati2.sharma@intel.com>
In-Reply-To: <20220406162906.6057-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJbXBy?=
 =?utf-8?q?ovements_in_plane_scaling?=
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

Series: Improvements in plane scaling
URL   : https://patchwork.freedesktop.org/series/102280/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
7506029428b3740395ce086daf86b9498fbbeb77 tests/intel-ci/fast-feedback: Move=
 gem_lmem_swapping

[47/395] Linking target tests/kms_3d
[48/395] Linking target tests/fbdev
[49/395] Linking target tests/drm_read
[50/395] Linking target tests/feature_discovery
[51/395] Linking target tests/kms_addfb_basic
[52/395] Linking target tests/kms_async_flips
[53/395] Linking target tests/kms_atomic
[54/395] Linking target tests/kms_atomic_interruptible
[55/395] Linking target tests/kms_atomic_transition
[56/395] Linking target tests/kms_bw
[57/395] Linking target tests/kms_concurrent
[58/395] Linking target tests/kms_content_protection
[59/395] Linking target tests/kms_cursor_edge_walk
[60/395] Linking target tests/kms_cursor_crc
[61/395] Linking target tests/kms_display_modes
[62/395] Linking target tests/kms_cursor_legacy
[63/395] Linking target tests/kms_dither
[64/395] Linking target tests/kms_dp_aux_dev
[65/395] Linking target tests/kms_flip
[66/395] Linking target tests/kms_dp_tiled_display
[67/395] Linking target tests/kms_flip_event_leak
[68/395] Linking target tests/kms_force_connector_basic
[69/395] Linking target tests/kms_getfb
[70/395] Linking target tests/kms_hdmi_inject
[71/395] Linking target tests/kms_hdr
[72/395] Linking target tests/kms_plane_alpha_blend
[73/395] Linking target tests/kms_invalid_mode
[74/395] Linking target tests/kms_lease
[75/395] Linking target tests/kms_multipipe_modeset
[76/395] Linking target tests/kms_cdclk
[77/395] Linking target tests/kms_ccs
[78/395] Linking target tests/kms_pipe_crc_basic
[79/395] Linking target tests/kms_plane
[80/395] Linking target tests/kms_plane_cursor
[81/395] Compiling C object tests/kms_plane_scaling.p/kms_plane_scaling.c.o
FAILED: tests/kms_plane_scaling.p/kms_plane_scaling.c.o=20
ccache cc -Itests/kms_plane_scaling.p -Itests -I../tests -I../include/drm-u=
api -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I..=
 -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/g=
lib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/inc=
lude/libpng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/=
libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/i=
nclude -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways -D=
_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_G=
NU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdec=
laration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-=
op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wm=
issing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -=
Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno=
-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-po=
inter-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-u=
nused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -W=
error=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmi=
ssing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretu=
rn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-string=
s -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ tests/k=
ms_plane_scaling.p/kms_plane_scaling.c.o -MF tests/kms_plane_scaling.p/kms_=
plane_scaling.c.o.d -o tests/kms_plane_scaling.p/kms_plane_scaling.c.o -c .=
./tests/kms_plane_scaling.c
../tests/kms_plane_scaling.c: In function =E2=80=98__igt_unique____real_mai=
n622=E2=80=99:
../tests/kms_plane_scaling.c:785:6: error: implicit declaration of function=
 =E2=80=98test_scaler_with_modifier_pipe=E2=80=99; did you mean =E2=80=98te=
st_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-declara=
tion]
      test_scaler_with_modifier_pipe(&data, 20, 20, true, pipe, output);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      test_scaler_with_rotation_pipe
../tests/kms_plane_scaling.c:785:6: warning: nested extern declaration of =
=E2=80=98test_scaler_with_modifier_pipe=E2=80=99 [-Wnested-externs]
../tests/kms_plane_scaling.c:835:6: error: implicit declaration of function=
 =E2=80=98test_scaler_with_modifiers_pipe=E2=80=99; did you mean =E2=80=98t=
est_scaler_with_rotation_pipe=E2=80=99? [-Werror=3Dimplicit-function-declar=
ation]
      test_scaler_with_modifiers_pipe(&data, 0.75 * mode->hdisplay,
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      test_scaler_with_rotation_pipe
../tests/kms_plane_scaling.c:835:6: warning: nested extern declaration of =
=E2=80=98test_scaler_with_modifiers_pipe=E2=80=99 [-Wnested-externs]
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

