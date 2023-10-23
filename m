Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Harry Wentland" <harry.wentland@amd.com>
Date: Mon, 23 Oct 2023 21:16:25 -0000
Message-ID: <169809578549.19838.12039879641809527896@emeril.freedesktop.org>
References: <20231019212301.245282-1-harry.wentland@amd.com>
In-Reply-To: <20231019212301.245282-1-harry.wentland@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJR1Qg?=
 =?utf-8?q?tests_for_the_KMS_Color_Pipeline_API_=28rev2=29?=
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

Series: IGT tests for the KMS Color Pipeline API (rev2)
URL   : https://patchwork.freedesktop.org/series/123448/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
15e7d92ca5f98d10feffa27a76724c33cbd68da5 tests/kms_cursor_crc: Fix test int=
ermittent failures on AMD gpu

Tail of build.log:
../../../usr/src/igt-gpu-tools/lib/igt_kms.h:399:2: error: unknown type nam=
e =E2=80=98drmModeColorop=E2=80=99
  399 |  drmModeColorop *drm_colorop;
      |  ^~~~~~~~~~~~~~
[112/1650] Compiling C object 'tests/59830eb@@kms_color@exe/kms_color_helpe=
r.c.o'.
FAILED: tests/59830eb@@kms_color@exe/kms_color_helper.c.o=20
cc -Itests/59830eb@@kms_color@exe -Itests -I../../../usr/src/igt-gpu-tools/=
tests -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-t=
ools/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi -=
Ilib -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-tools/=
lib/stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include/cai=
ro -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/=
usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/in=
clude/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/usr=
/include/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE=
_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SO=
URCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarat=
ion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -W=
missing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissin=
g-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredu=
ndant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clob=
bered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer=
-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wn=
o-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bou=
nds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -W=
error=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-t=
o-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigrap=
hs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread=
 -MD -MQ 'tests/59830eb@@kms_color@exe/kms_color_helper.c.o' -MF 'tests/598=
30eb@@kms_color@exe/kms_color_helper.c.o.d' -o 'tests/59830eb@@kms_color@ex=
e/kms_color_helper.c.o' -c ../../../usr/src/igt-gpu-tools/tests/kms_color_h=
elper.c
In file included from ../../../usr/src/igt-gpu-tools/lib/igt.h:38,
                 from ../../../usr/src/igt-gpu-tools/tests/kms_color_helper=
.h:38,
                 from ../../../usr/src/igt-gpu-tools/tests/kms_color_helper=
.c:25:
../../../usr/src/igt-gpu-tools/lib/igt_kms.h:399:2: error: unknown type nam=
e =E2=80=98drmModeColorop=E2=80=99
  399 |  drmModeColorop *drm_colorop;
      |  ^~~~~~~~~~~~~~
[113/1650] Compiling C object 'tests/59830eb@@kms_concurrent@exe/kms_concur=
rent.c.o'.
FAILED: tests/59830eb@@kms_concurrent@exe/kms_concurrent.c.o=20
cc -Itests/59830eb@@kms_concurrent@exe -Itests -I../../../usr/src/igt-gpu-t=
ools/tests -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-=
gpu-tools/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-u=
api -Ilib -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-t=
ools/lib/stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/includ=
e/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/includ=
e -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/u=
sr/include/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -=
I/usr/include/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D=
_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_G=
NU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdec=
laration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-=
op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wm=
issing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -=
Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno=
-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-po=
inter-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limit=
s -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darra=
y-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-ca=
st -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoin=
ter-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtr=
igraphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pt=
hread -MD -MQ 'tests/59830eb@@kms_concurrent@exe/kms_concurrent.c.o' -MF 't=
ests/59830eb@@kms_concurrent@exe/kms_concurrent.c.o.d' -o 'tests/59830eb@@k=
ms_concurrent@exe/kms_concurrent.c.o' -c ../../../usr/src/igt-gpu-tools/tes=
ts/kms_concurrent.c
In file included from ../../../usr/src/igt-gpu-tools/lib/igt.h:38,
                 from ../../../usr/src/igt-gpu-tools/tests/kms_concurrent.c=
:25:
../../../usr/src/igt-gpu-tools/lib/igt_kms.h:399:2: error: unknown type nam=
e =E2=80=98drmModeColorop=E2=80=99
  399 |  drmModeColorop *drm_colorop;
      |  ^~~~~~~~~~~~~~
[114/1650] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o=
'.
FAILED: tests/59830eb@@kms_atomic@exe/kms_atomic.c.o=20
cc -Itests/59830eb@@kms_atomic@exe -Itests -I../../../usr/src/igt-gpu-tools=
/tests -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-=
tools/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi =
-Ilib -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-tools=
/lib/stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include/ca=
iro -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I=
/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/us=
r/include/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FIL=
E_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_S=
OURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclara=
tion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -=
Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissi=
ng-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wred=
undant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clo=
bbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointe=
r-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -W=
no-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bo=
unds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -=
Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-=
to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigra=
phs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthrea=
d -MD -MQ 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o' -MF 'tests/59830eb=
@@kms_atomic@exe/kms_atomic.c.o.d' -o 'tests/59830eb@@kms_atomic@exe/kms_at=
omic.c.o' -c ../../../usr/src/igt-gpu-tools/tests/kms_atomic.c
In file included from ../../../usr/src/igt-gpu-tools/lib/igt.h:38,
                 from ../../../usr/src/igt-gpu-tools/tests/kms_atomic.c:47:
../../../usr/src/igt-gpu-tools/lib/igt_kms.h:399:2: error: unknown type nam=
e =E2=80=98drmModeColorop=E2=80=99
  399 |  drmModeColorop *drm_colorop;
      |  ^~~~~~~~~~~~~~
[115/1650] Compiling C object 'tests/59830eb@@kms_color@exe/kms_color.c.o'.
FAILED: tests/59830eb@@kms_color@exe/kms_color.c.o=20
cc -Itests/59830eb@@kms_color@exe -Itests -I../../../usr/src/igt-gpu-tools/=
tests -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-t=
ools/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi -=
Ilib -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-tools/=
lib/stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include/cai=
ro -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/=
usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/in=
clude/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/usr=
/include/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE=
_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SO=
URCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarat=
ion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -W=
missing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissin=
g-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredu=
ndant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clob=
bered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer=
-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wn=
o-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bou=
nds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -W=
error=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-t=
o-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigrap=
hs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread=
 -MD -MQ 'tests/59830eb@@kms_color@exe/kms_color.c.o' -MF 'tests/59830eb@@k=
ms_color@exe/kms_color.c.o.d' -o 'tests/59830eb@@kms_color@exe/kms_color.c.=
o' -c ../../../usr/src/igt-gpu-tools/tests/kms_color.c
In file included from ../../../usr/src/igt-gpu-tools/lib/igt.h:38,
                 from ../../../usr/src/igt-gpu-tools/tests/kms_color_helper=
.h:38,
                 from ../../../usr/src/igt-gpu-tools/tests/kms_color.c:30:
../../../usr/src/igt-gpu-tools/lib/igt_kms.h:399:2: error: unknown type nam=
e =E2=80=98drmModeColorop=E2=80=99
  399 |  drmModeColorop *drm_colorop;
      |  ^~~~~~~~~~~~~~
[116/1650] Compiling C object 'lib/tests/dc197ac@@igt_ktap_parser@exe/igt_k=
tap_parser.c.o'.
[117/1650] Generating i915-perf-registers-mtlgt3 with a custom command.
[118/1650] Compiling C object 'tests/59830eb@@dumb_buffer@exe/dumb_buffer.c=
.o'.
[119/1650] Generating i915-perf-metrics-mtlgt3 with a custom command.
[120/1650] Generating i915-perf-registers-acmgt1 with a custom command.
[121/1650] Generating i915-perf-metrics-acmgt1 with a custom command.
[122/1650] Generating i915-perf-registers-acmgt2 with a custom command.
[123/1650] Compiling C object 'lib/76b5a35@@igt_device_scan@sta/igt_device_=
scan.c.o'.
[124/1650] Generating i915-perf-metrics-acmgt2 with a custom command.
[125/1650] Generating i915-perf-registers-acmgt3 with a custom command.
[126/1650] Generating i915-perf-metrics-acmgt3 with a custom command.
[127/1650] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

