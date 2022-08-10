Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 10 Aug 2022 12:53:15 -0000
Message-ID: <166013599510.12359.17413888676513104371@emeril.freedesktop.org>
References: <20220804034029.17355-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220804034029.17355-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/i915/kms=5Fdraw=5Fcrc=3A_Test_Cleanup_=28rev6=29?=
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

Series: tests/i915/kms_draw_crc: Test Cleanup (rev6)
URL   : https://patchwork.freedesktop.org/series/106898/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
ec2ab8e3a151ce05bd2726319c528c2ab99e8a96 tests/i915/perf_pmu: Use correct c=
ontext id in "enable-race"

[502/662] Linking target tests/i915_fb_tiling
[503/662] Linking target tests/i915_getparams_basic
[504/662] Linking target tests/i915_hangman
[505/662] Linking target tests/i915_module_load
[506/662] Linking target tests/i915_pciid
[507/662] Linking target tests/i915_pm_lpsp
[508/662] Linking target tests/i915_pm_rpm
[509/662] Linking target tests/i915_pm_dc
[510/662] Linking target tests/i915_pm_rps
[511/662] Linking target tests/i915_pm_sseu
[512/662] Linking target tests/i915_query
[513/662] Linking target tests/i915_selftest
[514/662] Linking target tests/kms_big_fb
[515/662] Linking target tests/i915_suspend
[516/662] Linking target tests/kms_ccs
[517/662] Linking target tests/kms_big_joiner
[518/662] Compiling C object tests/kms_draw_crc.p/i915_kms_draw_crc.c.o
FAILED: tests/kms_draw_crc.p/i915_kms_draw_crc.c.o=20
ccache cc -Itests/kms_draw_crc.p -Itests -I../tests -I../include/drm-uapi -=
I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.. -I/u=
sr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2=
.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/=
libpng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/libdr=
m/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/includ=
e -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways -D_FILE=
_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SO=
URCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarat=
ion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -W=
missing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissin=
g-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredu=
ndant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clob=
bered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer=
-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused=
-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing=
-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-ty=
pe -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fn=
o-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ tests/kms_dr=
aw_crc.p/i915_kms_draw_crc.c.o -MF tests/kms_draw_crc.p/i915_kms_draw_crc.c=
.o.d -o tests/kms_draw_crc.p/i915_kms_draw_crc.c.o -c ../tests/i915/kms_dra=
w_crc.c
../tests/i915/kms_draw_crc.c: In function =E2=80=98fill_fb_subtest=E2=80=99:
../tests/i915/kms_draw_crc.c:215:32: error: expected =E2=80=98)=E2=80=99 be=
fore =E2=80=98;=E2=80=99 token
  igt_plane_set_fb(primary, &fb);
                                ^
                                )
../tests/i915/kms_draw_crc.c:215:2: error: invalid use of void expression
  igt_plane_set_fb(primary, &fb);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/i915/kms_draw_crc.c:213:2: error: too few arguments to function =
=E2=80=98igt_create_fb=E2=80=99
  igt_create_fb(drm_fd, mode->hdisplay, mode->vdisplay,
  ^~~~~~~~~~~~~
In file included from ../lib/igt_draw.h:29,
                 from ../lib/igt.h:33,
                 from ../tests/i915/kms_draw_crc.c:28:
../lib/igt_fb.h:141:14: note: declared here
 unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
              ^~~~~~~~~~~~~
../tests/i915/kms_draw_crc.c: In function =E2=80=98__igt_unique____real_mai=
n299=E2=80=99:
../tests/i915/kms_draw_crc.c:327:38: error: incompatible type for argument =
1 of =E2=80=98igt_display_has_format_mod=E2=80=99
      if (!igt_display_has_format_mod(display, formats[format_idx], modifie=
r))
                                      ^~~~~~~
In file included from ../lib/igt.h:38,
                 from ../tests/i915/kms_draw_crc.c:28:
../lib/igt_kms.h:863:48: note: expected =E2=80=98igt_display_t *=E2=80=99 {=
aka =E2=80=98struct igt_display *=E2=80=99} but argument is of type =E2=80=
=98igt_display_t=E2=80=99 {aka =E2=80=98struct igt_display=E2=80=99}
 bool igt_display_has_format_mod(igt_display_t *display, uint32_t format, u=
int64_t modifier);
                                 ~~~~~~~~~~~~~~~^~~~~~~
At top level:
../tests/i915/kms_draw_crc.c:145:13: warning: =E2=80=98format_is_supported=
=E2=80=99 defined but not used [-Wunused-function]
 static bool format_is_supported(uint32_t format, uint64_t modifier)
             ^~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

