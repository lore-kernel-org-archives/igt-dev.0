Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 19 Oct 2021 20:48:33 -0000
Message-ID: <163467651312.5185.5518058995709950371@emeril.freedesktop.org>
References: <20211019201940.31729-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20211019201940.31729-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBrbXM6?=
 =?utf-8?q?_Run_tiled_display_tests_on_any_set_of_connectors?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: kms: Run tiled display tests on any set of connectors
URL   : https://patchwork.freedesktop.org/series/96027/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
9b0881254557edeaf273b2196309fc4e22ea0312 tools/intel_display_poller: Add vr=
r-push test

[276/620] Linking target tests/feature_discovery.
[277/620] Linking target tests/kms_3d.
[278/620] Linking target tests/kms_addfb_basic.
[279/620] Linking target tests/kms_async_flips.
[280/620] Linking target tests/kms_atomic.
[281/620] Linking target tests/kms_atomic_interruptible.
[282/620] Linking target tests/kms_cursor_crc.
[283/620] Linking target tests/kms_bw.
[284/620] Linking target tests/kms_concurrent.
[285/620] Linking target tests/kms_content_protection.
[286/620] Linking target tests/kms_cursor_edge_walk.
[287/620] Linking target tests/kms_dither.
[288/620] Linking target tests/kms_dp_aux_dev.
[289/620] Linking target tests/kms_cursor_legacy.
[290/620] Linking target tests/kms_flip.
[291/620] Linking target tests/kms_flip_event_leak.
[292/620] Linking target tests/kms_getfb.
[293/620] Linking target tests/kms_force_connector_basic.
[294/620] Linking target tests/kms_hdmi_inject.
[295/620] Linking target tests/kms_hdr.
[296/620] Linking target tests/kms_invalid_mode.
[297/620] Linking target tests/kms_plane.
[298/620] Linking target tests/kms_lease.
[299/620] Linking target tests/kms_multipipe_modeset.
[300/620] Linking target tests/kms_panel_fitting.
[301/620] Linking target tests/kms_pipe_crc_basic.
[302/620] Linking target tests/kms_flip_tiling.
[303/620] Linking target tests/kms_flip_scaled_crc.
[304/620] Linking target tests/gem_bad_reloc.
[305/620] Linking target tests/kms_plane_alpha_blend.
[306/620] Linking target tests/kms_plane_cursor.
[307/620] Linking target tests/kms_plane_multiple.
[308/620] Linking target tests/kms_plane_lowres.
[309/620] Linking target tests/kms_plane_scaling.
[310/620] Linking target tests/kms_prime.
[311/620] Linking target tests/kms_prop_blob.
[312/620] Linking target tests/kms_properties.
[313/620] Compiling C object 'tests/tests@@kms_tiled_display@exe/kms_tiled_=
display.c.o'.
FAILED: tests/tests@@kms_tiled_display@exe/kms_tiled_display.c.o=20
ccache cc -Itests/tests@@kms_tiled_display@exe -Itests -I../tests -I../incl=
ude/drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls=
 -I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-l=
inux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/libpng16 -=
I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/libdrm -I/us=
r/include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/als=
a -I/usr/include -I/home/cidrm/kernel_headers/include -fdiagnostics-color=
=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=
=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad=
-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallth=
rough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -W=
missing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definiti=
on -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuniniti=
alized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-=
initializers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unu=
sed-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -=
Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=
=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int=
-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -W=
error=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pth=
read  -MD -MQ 'tests/tests@@kms_tiled_display@exe/kms_tiled_display.c.o' -M=
F 'tests/tests@@kms_tiled_display@exe/kms_tiled_display.c.o.d' -o 'tests/te=
sts@@kms_tiled_display@exe/kms_tiled_display.c.o' -c ../tests/kms_tiled_dis=
play.c
../tests/kms_tiled_display.c: In function =E2=80=98__igt_unique____real_mai=
n575=E2=80=99:
../tests/kms_tiled_display.c:622:30: error: incompatible type for argument =
1 of =E2=80=98chamelium_reset_state=E2=80=99
    chamelium_reset_state(data.display, data.chamelium,
                          ~~~~^~~~~~~~
In file included from ../lib/igt.h:46,
                 from ../tests/kms_tiled_display.c:39:
../lib/igt_chamelium.h:136:38: note: expected =E2=80=98igt_display_t *=E2=
=80=99 {aka =E2=80=98struct igt_display *=E2=80=99} but argument is of type=
 =E2=80=98igt_display_t=E2=80=99 {aka =E2=80=98struct igt_display=E2=80=99}
 chamelium_reset_state(igt_display_t *display,
                       ~~~~~~~~~~~~~~~^~~~~~~
ninja: build stopped: subcommand failed.

