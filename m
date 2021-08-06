Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Aug 2021 10:44:53 -0000
Message-ID: <162824669384.27547.615895460786658957@emeril.freedesktop.org>
References: <20210806091028.296829-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210806091028.296829-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fsetmode=3A_Fix_to_get_a_valid_config?=
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: tests/kms_setmode: Fix to get a valid config
URL   : https://patchwork.freedesktop.org/series/93450/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
2f32b9e0da5f1ac9529318dd5b836c8cf4d3c441 tests/i915/gem_exec_fence: use dev=
ice_coherent mmap

[122/427] Linking target tests/kms_flip_event_leak.
[123/427] Linking target tests/kms_flip_scaled_crc.
[124/427] Linking target tests/kms_flip.
[125/427] Linking target tests/i915_pm_rps.
[126/427] Linking target tests/i915_pm_dc.
[127/427] Linking target tests/vc4_tiling.
[128/427] Linking target tests/kms_hdmi_inject.
[129/427] Linking target tests/kms_frontbuffer_tracking.
[130/427] Linking target tests/kms_force_connector_basic.
[131/427] Linking target tests/kms_getfb.
[132/427] Linking target tests/kms_legacy_colorkey.
[133/427] Linking target tests/kms_lease.
[134/427] Linking target tests/kms_hdr.
[135/427] Linking target tests/kms_invalid_dotclock.
[136/427] Linking target tests/kms_multipipe_modeset.
[137/427] Linking target tests/kms_mmap_write_crc.
[138/427] Linking target tests/kms_panel_fitting.
[139/427] Linking target tests/kms_pipe_b_c_ivb.
[140/427] Linking target tools/intel_residency.
[141/427] Linking target tools/intel_reg_checker.
[142/427] Linking target tools/intel_gem_info.
[143/427] Linking target tools/intel_stepping.
[144/427] Linking target tests/kms_plane_multiple.
[145/427] Linking target tests/kms_plane_cursor.
[146/427] Linking target tests/kms_plane_lowres.
[147/427] Linking target tests/kms_plane_scaling.
[148/427] Linking target tests/kms_prime.
[149/427] Linking target tests/kms_prop_blob.
[150/427] Linking target tests/kms_properties.
[151/427] Linking target tests/kms_psr.
[152/427] Linking target tests/kms_psr2_su.
[153/427] Linking target tests/kms_psr2_sf.
[154/427] Linking target tests/kms_pwrite_crc.
[155/427] Compiling C object 'tests/tests@@kms_setmode@exe/kms_setmode.c.o'.
FAILED: tests/tests@@kms_setmode@exe/kms_setmode.c.o=20
ccache cc -Itests/tests@@kms_setmode@exe -Itests -I../tests -I../include/dr=
m-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I../ -I/usr/include/cair=
o -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/u=
sr/include/pixman-1 -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr=
/include/libpng12 -I/usr/include/libdrm -I/usr/include/libdrm/nouveau -I/us=
r/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/include -I/home/cidrm=
/kernel_headers/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_B=
ITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -inc=
lude config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after=
-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-d=
eclarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototy=
pes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundant-dec=
ls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbered -Wn=
o-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-arith -W=
no-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-result -=
Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dinit-s=
elf -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-braces -=
Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -Werro=
r=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-builtin=
-malloc -fno-builtin-calloc -fcommon -pthread  -MD -MQ 'tests/tests@@kms_se=
tmode@exe/kms_setmode.c.o' -MF 'tests/tests@@kms_setmode@exe/kms_setmode.c.=
o.d' -o 'tests/tests@@kms_setmode@exe/kms_setmode.c.o' -c ../tests/kms_setm=
ode.c
../tests/kms_setmode.c: In function =E2=80=98setup_crtcs=E2=80=99:
../tests/kms_setmode.c:364:63: error: expected =E2=80=98)=E2=80=99 before =
=E2=80=98config_valid=E2=80=99
     !!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
                                                               ^
                                                               )
    config_valid =3D false;
    ~~~~~~~~~~~~                                               =20
../tests/kms_setmode.c:363:6: note: to match this =E2=80=98(=E2=80=99
   if (encoder_usage_count[i] > 1 &&
      ^
../tests/kms_setmode.c:369:1: error: expected expression before =E2=80=98}=
=E2=80=99 token
 }
 ^
ninja: build stopped: subcommand failed.

