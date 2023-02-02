Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 02 Feb 2023 06:00:39 -0000
Message-ID: <167531763965.11116.4348507613146772911@emeril.freedesktop.org>
References: <20230202051509.28983-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230202051509.28983-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBMaW1p?=
 =?utf-8?q?t_the_execution_to_few_pipes/planes_=28rev3=29?=
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

Series: Limit the execution to few pipes/planes (rev3)
URL   : https://patchwork.freedesktop.org/series/113526/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 lib/igt_device_scan: Improve Intel=
 discrete GPU selection

[282/1021] Linking target tests/core_setmaster_vs_auth.
[283/1021] Linking target tests/debugfs_test.
[284/1021] Linking target tests/dmabuf.
[285/1021] Linking target tests/dmabuf_sync_file.
[286/1021] Linking target tests/device_reset.
[287/1021] Linking target tests/drm_buddy.
[288/1021] Linking target tests/drm_mm.
[289/1021] Linking target tests/drm_read.
[290/1021] Linking target tests/fbdev.
[291/1021] Linking target tests/feature_discovery.
[292/1021] Linking target tests/kms_3d.
[293/1021] Linking target tests/kms_atomic.
[294/1021] Linking target tests/kms_addfb_basic.
[295/1021] Linking target tests/kms_async_flips.
[296/1021] Linking target tests/kms_atomic_interruptible.
[297/1021] Linking target tests/kms_atomic_transition.
[298/1021] Linking target tests/kms_bw.
[299/1021] Linking target tests/kms_concurrent.
[300/1021] Linking target tests/kms_content_protection.
[301/1021] Linking target tests/kms_cursor_crc.
[302/1021] Linking target tests/kms_cursor_edge_walk.
[303/1021] Linking target tests/kms_cursor_legacy.
[304/1021] Linking target tests/kms_display_modes.
[305/1021] Linking target tests/kms_dither.
[306/1021] Linking target tests/kms_dp_aux_dev.
[307/1021] Linking target tests/kms_dp_tiled_display.
[308/1021] Linking target tests/kms_flip_event_leak.
[309/1021] Linking target tests/kms_flip.
[310/1021] Linking target tests/kms_getfb.
[311/1021] Linking target tests/kms_force_connector_basic.
[312/1021] Compiling C object 'tests/59830eb@@kms_plane_alpha_blend@exe/kms=
_plane_alpha_blend.c.o'.
FAILED: tests/59830eb@@kms_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o =

cc -Itests/59830eb@@kms_plane_alpha_blend@exe -Itests -I../../../usr/src/ig=
t-gpu-tools/tests -I../../../usr/src/igt-gpu-tools/include/drm-uapi -I../..=
/../usr/src/igt-gpu-tools/include/linux-uapi -Ilib -I../../../usr/src/igt-g=
pu-tools/lib -I../../../usr/src/igt-gpu-tools/lib/stubs/syscalls -I. -I../.=
./../usr/src/igt-gpu-tools/ -I/usr/include/cairo -I/usr/include/glib-2.0 -I=
/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/i=
nclude/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include=
/libdrm -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/incl=
ude -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winv=
alid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FOR=
TIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissi=
ng-format-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-extern=
s -Wold-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstric=
t-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitializ=
ed -Wno-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packe=
d-member -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unus=
ed-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werr=
or=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissi=
ng-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-=
type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -=
fno-builtin-malloc -fno-builtin-calloc -pthread -MD -MQ 'tests/59830eb@@kms=
_plane_alpha_blend@exe/kms_plane_alpha_blend.c.o' -MF 'tests/59830eb@@kms_p=
lane_alpha_blend@exe/kms_plane_alpha_blend.c.o.d' -o 'tests/59830eb@@kms_pl=
ane_alpha_blend@exe/kms_plane_alpha_blend.c.o' -c ../../../usr/src/igt-gpu-=
tools/tests/kms_plane_alpha_blend.c
../../../usr/src/igt-gpu-tools/tests/kms_plane_alpha_blend.c: In function =
=E2=80=98run_subtests=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/kms_plane_alpha_blend.c:658:4: error: =
expected expression before =E2=80=98}=E2=80=99 token
  658 |    }
      |    ^
../../../usr/src/igt-gpu-tools/tests/kms_plane_alpha_blend.c:657:6: error: =
too few arguments to function =E2=80=98run_test_on_pipe_planes=E2=80=99
  657 |      run_test_on_pipe_planes(data, pipe, output, subtests[i].blend,
      |      ^~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/kms_plane_alpha_blend.c:481:13: note: =
declared here
  481 | static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, i=
gt_output_t *output,
      |             ^~~~~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/kms_plane_alpha_blend.c:657:68: error:=
 expected =E2=80=98;=E2=80=99 before =E2=80=98}=E2=80=99 token
  657 |      run_test_on_pipe_planes(data, pipe, output, subtests[i].blend,
      |                                                                    ^
      |                                                                    ;
  658 |    }
      |    ~                                                               =
=20
ninja: build stopped: subcommand failed.

