Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 22 Sep 2022 13:22:29 -0000
Message-ID: <166385294957.19672.7882610363054374788@emeril.freedesktop.org>
References: <20220922005819.25253-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220922005819.25253-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fwriteback=3A_Test_Cleanup_=28rev3=29?=
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

Series: tests/kms_writeback: Test Cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/107764/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
129bea58b9424f0a0da995311a219fdf57732594 kms_flip_event_leak: Create dynami=
c subtests

[325/672] Linking target tests/kms_dp_aux_dev
[326/672] Linking target tests/kms_display_modes
[327/672] Linking target tests/kms_flip
[328/672] Linking target tests/kms_dp_tiled_display
[329/672] Linking target tests/kms_invalid_mode
[330/672] Linking target tests/kms_hdmi_inject
[331/672] Linking target tests/kms_flip_event_leak
[332/672] Linking target benchmarks/gem_blt
[333/672] Linking target benchmarks/gem_busy
[334/672] Linking target tests/kms_getfb
[335/672] Linking target tests/kms_hdr
[336/672] Linking target tests/kms_dsc
[337/672] Linking target tests/gen3_render_tiledy_blits
[338/672] Linking target tests/kms_lease
[339/672] Linking target tests/kms_multipipe_modeset
[340/672] Linking target tests/kms_panel_fitting
[341/672] Linking target tests/kms_pipe_crc_basic
[342/672] Linking target tests/kms_plane_cursor
[343/672] Linking target tests/kms_plane
[344/672] Linking target tests/kms_plane_alpha_blend
[345/672] Linking target tests/kms_plane_lowres
[346/672] Linking target tests/kms_plane_scaling
[347/672] Linking target tests/kms_plane_multiple
[348/672] Linking target tests/kms_prop_blob
[349/672] Linking target tests/kms_prime
[350/672] Linking target tests/kms_rotation_crc
[351/672] Linking target tests/kms_properties
[352/672] Linking target tests/kms_rmfb
[353/672] Linking target tests/kms_scaling_modes
[354/672] Linking target tests/kms_selftest
[355/672] Linking target tests/kms_sequence
[356/672] Linking target tests/kms_vrr
[357/672] Linking target tests/kms_setmode
[358/672] Linking target tests/kms_sysfs_edid_timing
[359/672] Linking target tests/kms_tv_load_detect
[360/672] Linking target tests/kms_universal_plane
[361/672] Linking target tests/kms_vblank
[362/672] Compiling C object tests/kms_writeback.p/kms_writeback.c.o
FAILED: tests/kms_writeback.p/kms_writeback.c.o=20
ccache cc -Itests/kms_writeback.p -Itests -I../tests -I../include/drm-uapi =
-I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.. -I/=
usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-=
2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include=
/libpng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/libd=
rm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/inclu=
de -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways -D_FIL=
E_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_S=
OURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclara=
tion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -=
Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissi=
ng-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wred=
undant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clo=
bbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointe=
r-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unuse=
d-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werro=
r=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissin=
g-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-t=
ype -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -f=
no-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ tests/kms_w=
riteback.p/kms_writeback.c.o -MF tests/kms_writeback.p/kms_writeback.c.o.d =
-o tests/kms_writeback.p/kms_writeback.c.o -c ../tests/kms_writeback.c
../tests/kms_writeback.c: In function =E2=80=98__igt_unique____real_main507=
=E2=80=99:
../tests/kms_writeback.c:524:21: error: incompatible type for argument 1 of=
 =E2=80=98igt_display_reset=E2=80=99
   igt_display_reset(display);
                     ^~~~~~~
In file included from ../lib/igt.h:38,
                 from ../tests/kms_writeback.c:31:
../lib/igt_kms.h:455:39: note: expected =E2=80=98igt_display_t *=E2=80=99 {=
aka =E2=80=98struct igt_display *=E2=80=99} but argument is of type =E2=80=
=98igt_display_t=E2=80=99 {aka =E2=80=98struct igt_display=E2=80=99}
 void igt_display_reset(igt_display_t *display);
                        ~~~~~~~~~~~~~~~^~~~~~~
ninja: build stopped: subcommand failed.

