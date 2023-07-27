Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Ser" <contact@emersion.fr>
Date: Thu, 27 Jul 2023 17:08:01 -0000
Message-ID: <169047768130.19794.12642519476720123808@emeril.freedesktop.org>
References: <20230727140502.284387-1-contact@emersion.fr>
In-Reply-To: <20230727140502.284387-1-contact@emersion.fr>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBkcm0t?=
 =?utf-8?q?uapi=3A_sync_with_drm-next?=
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

Series: drm-uapi: sync with drm-next
URL   : https://patchwork.freedesktop.org/series/121445/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
1d6fd796607099d189e85d1fd305160363b961f2 test/i915/gem_create: skip set_pat=
 for non MTL devices

Tail of build.log:
../../../usr/src/igt-gpu-tools/include/drm-uapi/i915_drm.h:3827:8: note: or=
iginally defined here
 3827 | struct drm_i915_gem_create_ext_set_pat {
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[58/1616] Compiling C object 'lib/tests/dc197ac@@igt_conflicting_args@exe/i=
gt_conflicting_args.c.o'.
[59/1616] Compiling C object 'lib/tests/dc197ac@@igt_timeout@exe/igt_timeou=
t.c.o'.
[60/1616] Compiling C object 'lib/tests/dc197ac@@i915_perf_data_alignment@e=
xe/i915_perf_data_alignment.c.o'.
[61/1616] Generating i915-perf-registers-mtlgt2 with a custom command.
[62/1616] Compiling C object 'lib/tests/dc197ac@@igt_exit_handler@exe/igt_e=
xit_handler.c.o'.
[63/1616] Compiling C object 'lib/tests/dc197ac@@igt_segfault@exe/igt_segfa=
ult.c.o'.
[64/1616] Compiling C object 'lib/tests/dc197ac@@igt_no_exit@exe/igt_no_exi=
t.c.o'.
[65/1616] Compiling C object 'lib/tests/dc197ac@@igt_invalid_subtest_name@e=
xe/igt_invalid_subtest_name.c.o'.
[66/1616] Compiling C object 'lib/tests/dc197ac@@igt_stats@exe/igt_stats.c.=
o'.
[67/1616] Compiling C object 'lib/tests/dc197ac@@igt_dynamic_subtests@exe/i=
gt_dynamic_subtests.c.o'.
[68/1616] Generating version.h with a custom command.
[69/1616] Compiling C object 'lib/tests/dc197ac@@igt_assert@exe/igt_assert.=
c.o'.
[70/1616] Compiling C object 'lib/tests/dc197ac@@igt_subtest_group@exe/igt_=
subtest_group.c.o'.
[71/1616] Compiling C object 'lib/tests/dc197ac@@igt_abort@exe/igt_abort.c.=
o'.
[72/1616] Compiling C object 'lib/tests/dc197ac@@igt_runnercomms_packets@ex=
e/igt_runnercomms_packets.c.o'.
[73/1616] Compiling C object 'lib/tests/dc197ac@@igt_fork@exe/igt_fork.c.o'.
[74/1616] Compiling C object 'lib/tests/dc197ac@@igt_simulation@exe/igt_sim=
ulation.c.o'.
[75/1616] Generating i915-perf-registers-mtlgt3 with a custom command.
[76/1616] Compiling C object 'tests/59830eb@@gem_close@exe/i915_gem_close.c=
.o'.
FAILED: tests/59830eb@@gem_close@exe/i915_gem_close.c.o=20
cc -Itests/59830eb@@gem_close@exe -Itests -I../../../usr/src/igt-gpu-tools/=
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
 -MD -MQ 'tests/59830eb@@gem_close@exe/i915_gem_close.c.o' -MF 'tests/59830=
eb@@gem_close@exe/i915_gem_close.c.o.d' -o 'tests/59830eb@@gem_close@exe/i9=
15_gem_close.c.o' -c ../../../usr/src/igt-gpu-tools/tests/i915/gem_close.c
In file included from ../../../usr/src/igt-gpu-tools/lib/igt_gt.h:31,
                 from ../../../usr/src/igt-gpu-tools/lib/igt.h:37,
                 from ../../../usr/src/igt-gpu-tools/tests/i915/gem_close.c=
:26:
../../../usr/src/igt-gpu-tools/lib/i915/i915_drm_local.h:69:8: error: redef=
inition of =E2=80=98struct drm_i915_gem_create_ext_set_pat=E2=80=99
   69 | struct drm_i915_gem_create_ext_set_pat {
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../../../usr/src/igt-gpu-tools/lib/i915/gem_create.h:=
11,
                 from ../../../usr/src/igt-gpu-tools/tests/i915/gem_close.c=
:25:
../../../usr/src/igt-gpu-tools/include/drm-uapi/i915_drm.h:3827:8: note: or=
iginally defined here
 3827 | struct drm_i915_gem_create_ext_set_pat {
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[77/1616] Generating i915-perf-metrics-mtlgt2 with a custom command.
[78/1616] Compiling C object 'lib/76b5a35@@igt_drm_clients@sta/igt_drm_clie=
nts.c.o'.
[79/1616] Compiling C object 'lib/tests/dc197ac@@igt_describe@exe/igt_descr=
ibe.c.o'.
[80/1616] Compiling C object 'lib/tests/dc197ac@@igt_thread@exe/igt_thread.=
c.o'.
[81/1616] Compiling C object 'lib/tests/dc197ac@@igt_nesting@exe/igt_nestin=
g.c.o'.
[82/1616] Generating i915-perf-registers-acmgt1 with a custom command.
[83/1616] Generating i915-perf-metrics-mtlgt3 with a custom command.
[84/1616] Generating i915-perf-metrics-acmgt1 with a custom command.
[85/1616] Generating i915-perf-registers-acmgt2 with a custom command.
[86/1616] Compiling C object 'lib/76b5a35@@igt_device_scan@sta/igt_device_s=
can.c.o'.
[87/1616] Generating i915-perf-metrics-acmgt2 with a custom command.
[88/1616] Generating i915-perf-registers-acmgt3 with a custom command.
[89/1616] Generating i915-perf-metrics-acmgt3 with a custom command.
[90/1616] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.

