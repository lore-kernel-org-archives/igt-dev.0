Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 08 Jun 2022 17:16:15 -0000
Message-ID: <165470857557.15584.4921082865789895976@emeril.freedesktop.org>
References: <20220608171304.22536-1-swati2.sharma@intel.com>
In-Reply-To: <20220608171304.22536-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fscaling=5Ffilters=3A_New_IGT_to_validate_scaling_filter?=
 =?utf-8?q?s?=
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

Series: tests/kms_scaling_filters: New IGT to validate scaling filters
URL   : https://patchwork.freedesktop.org/series/104905/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
2aff41793e5f7f23206547ff615187708e728b92 tests/i915/kms_big_fb: Move cleanu=
p code to fixture

[207/939] Linking target tests/feature_discovery
[208/939] Linking target tests/kms_atomic_interruptible
[209/939] Linking target tests/kms_3d
[210/939] Linking target tests/kms_addfb_basic
[211/939] Linking target tests/kms_async_flips
[212/939] Linking target tests/kms_cursor_crc
[213/939] Linking target tests/kms_atomic
[214/939] Linking target tests/kms_atomic_transition
[215/939] Linking target tests/kms_bw
[216/939] Linking target tests/kms_concurrent
[217/939] Linking target tests/kms_content_protection
[218/939] Linking target tests/kms_cursor_edge_walk
[219/939] Linking target tests/kms_cursor_legacy
[220/939] Linking target tests/kms_dither
[221/939] Linking target tests/kms_display_modes
[222/939] Linking target tests/kms_dp_aux_dev
[223/939] Linking target tests/kms_dp_tiled_display
[224/939] Linking target tests/kms_getfb
[225/939] Linking target tests/kms_flip
[226/939] Linking target tests/kms_flip_event_leak
[227/939] Linking target tests/kms_force_connector_basic
[228/939] Linking target tests/kms_multipipe_modeset
[229/939] Linking target tests/kms_hdmi_inject
[230/939] Linking target tests/kms_hdr
[231/939] Linking target tests/kms_invalid_mode
[232/939] Linking target tests/kms_plane
[233/939] Linking target tests/kms_lease
[234/939] Linking target tests/kms_panel_fitting
[235/939] Linking target tests/kms_plane_alpha_blend
[236/939] Linking target tests/kms_plane_cursor
[237/939] Linking target tests/kms_plane_lowres
[238/939] Linking target tests/kms_plane_multiple
[239/939] Linking target tests/kms_plane_scaling
[240/939] Linking target tests/kms_prime
[241/939] Linking target tests/kms_prop_blob
[242/939] Compiling C object tests/kms_scaling_filters.p/kms_scaling_filter=
s.c.o
FAILED: tests/kms_scaling_filters.p/kms_scaling_filters.c.o=20
ccache cc -Itests/kms_scaling_filters.p -Itests -I../tests -I../include/drm=
-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I=
.. -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu=
/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/includ=
e/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr=
/include -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways =
-D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D=
_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wd=
eclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogica=
l-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -=
Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith=
 -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -W=
no-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-=
pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno=
-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit =
-Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3D=
missing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dre=
turn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-stri=
ngs -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ tests=
/kms_scaling_filters.p/kms_scaling_filters.c.o -MF tests/kms_scaling_filter=
s.p/kms_scaling_filters.c.o.d -o tests/kms_scaling_filters.p/kms_scaling_fi=
lters.c.o -c ../tests/kms_scaling_filters.c
../tests/kms_scaling_filters.c: In function =E2=80=98test_scaling_filter_on=
_output=E2=80=99:
../tests/kms_scaling_filters.c:107:33: error: =E2=80=98IGT_PLANE_SCALING_FI=
LTER=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98IGT_PLANE_COLOR_RANGE=E2=80=99?
  igt_plane_set_prop_enum(plane, IGT_PLANE_SCALING_FILTER, kmstest_scaling_=
filter_str(flags));
                                 ^~~~~~~~~~~~~~~~~~~~~~~~
                                 IGT_PLANE_COLOR_RANGE
../tests/kms_scaling_filters.c:107:33: note: each undeclared identifier is =
reported only once for each function it appears in
../tests/kms_scaling_filters.c: In function =E2=80=98test_scaling_filter=E2=
=80=99:
../tests/kms_scaling_filters.c:137:35: error: =E2=80=98IGT_PLANE_SCALING_FI=
LTER=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98IGT_PLANE_COLOR_RANGE=E2=80=99?
    if (!igt_plane_has_prop(plane, IGT_PLANE_SCALING_FILTER))
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
                                   IGT_PLANE_COLOR_RANGE
ninja: build stopped: subcommand failed.

