Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 25 Aug 2022 21:36:13 -0000
Message-ID: <166146337375.24645.6936051805888762963@emeril.freedesktop.org>
References: <20220825210611.19636-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220825210611.19636-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fwriteback=3A_Test_Cleanup?=
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

Series: tests/kms_writeback: Test Cleanup
URL   : https://patchwork.freedesktop.org/series/107764/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
1298b5f0e1b3e010657ffba41d2e775fab028e08 igt: Allow overriding the commit h=
ash in the version string

[334/663] Linking target tests/kms_plane_alpha_blend
[335/663] Linking target tests/kms_plane_lowres
[336/663] Linking target tests/kms_plane_multiple
[337/663] Linking target tests/kms_plane_scaling
[338/663] Linking target tests/kms_prop_blob
[339/663] Linking target tests/kms_prime
[340/663] Linking target tests/kms_rotation_crc
[341/663] Linking target tests/kms_properties
[342/663] Linking target tests/kms_rmfb
[343/663] Linking target tests/kms_scaling_modes
[344/663] Linking target tests/kms_selftest
[345/663] Linking target tests/kms_sequence
[346/663] Compiling C object tests/kms_writeback.p/kms_writeback.c.o
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
../tests/kms_writeback.c: In function =E2=80=98detach_crtc=E2=80=99:
../tests/kms_writeback.c:172:19: warning: passing argument 1 of =E2=80=98ig=
t_display_fini=E2=80=99 from incompatible pointer type [-Wincompatible-poin=
ter-types]
  igt_display_fini(&display);
                   ^~~~~~~~
In file included from ../lib/igt.h:38,
                 from ../tests/kms_writeback.c:31:
../lib/igt_kms.h:454:38: note: expected =E2=80=98igt_display_t *=E2=80=99 {=
aka =E2=80=98struct igt_display *=E2=80=99} but argument is of type =E2=80=
=98igt_display_t **=E2=80=99 {aka =E2=80=98struct igt_display **=E2=80=99}
 void igt_display_fini(igt_display_t *display);
                       ~~~~~~~~~~~~~~~^~~~~~~
../tests/kms_writeback.c: In function =E2=80=98writeback_fb_id=E2=80=99:
../tests/kms_writeback.c:280:2: error: expected =E2=80=98,=E2=80=99 or =E2=
=80=98;=E2=80=99 before =E2=80=98for=E2=80=99
  for (i =3D 0; i < ARRAY_SIZE(fb_id_tests); i++) {
  ^~~
../tests/kms_writeback.c:280:14: error: =E2=80=98i=E2=80=99 undeclared (fir=
st use in this function)
  for (i =3D 0; i < ARRAY_SIZE(fb_id_tests); i++) {
              ^
../tests/kms_writeback.c:280:14: note: each undeclared identifier is report=
ed only once for each function it appears in
../tests/kms_writeback.c:280:46: error: expected =E2=80=98;=E2=80=99 before=
 =E2=80=98)=E2=80=99 token
  for (i =3D 0; i < ARRAY_SIZE(fb_id_tests); i++) {
                                              ^
                                              ;
../tests/kms_writeback.c:280:46: error: expected statement before =E2=80=98=
)=E2=80=99 token
In file included from ../lib/drmtest.h:39,
                 from ../lib/igt.h:27,
                 from ../tests/kms_writeback.c:31:
../lib/igt_core.h:350:16: warning: left-hand operand of comma expression ha=
s no effect [-Wunused-value]
         format), \
                ^
../lib/igt_core.h:372:2: note: in expansion of macro =E2=80=98__igt_dynamic=
_f=E2=80=99
  __igt_dynamic_f(igt_unique(__tmpchar), f)
  ^~~~~~~~~~~~~~~
../tests/kms_writeback.c:281:3: note: in expansion of macro =E2=80=98igt_dy=
namic_f=E2=80=99
   igt_dynamic_f("%s\n", fb_id_tests[i].name) {
   ^~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

