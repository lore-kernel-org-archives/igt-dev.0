Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 08 Jun 2023 13:32:00 -0000
Message-ID: <168623112084.18387.930083314700541635@emeril.freedesktop.org>
References: <20230608132859.3358248-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230608132859.3358248-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/xe=3A_Add_a_test_that_launches_the_xe_driver_live_kunit_tests?=
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
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: tests/xe: Add a test that launches the xe driver live kunit tests
URL   : https://patchwork.freedesktop.org/series/119074/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
2dd77d6d827a308caae49ce3eba759c2bab394ed tests/xe/intel_bb: remove full-bat=
ch

[303/695] Linking target tests/i915_pm_rps.
[304/695] Linking target tests/i915_pm_sseu.
[305/695] Linking target tests/i915_power.
[306/695] Linking target tests/i915_selftest.
[307/695] Linking target tests/i915_query.
[308/695] Linking target tests/i915_suspend.
[309/695] Linking target tests/kms_big_fb.
[310/695] Linking target tests/kms_busy.
[311/695] Linking target tests/kms_big_joiner.
[312/695] Linking target tests/kms_ccs.
[313/695] Linking target tests/kms_cdclk.
[314/695] Linking target tests/kms_draw_crc.
[315/695] Linking target tests/kms_fb_coherency.
[316/695] Linking target tests/kms_fbcon_fbt.
[317/695] Linking target tests/kms_flip_scaled_crc.
[318/695] Linking target tests/kms_fence_pin_leak.
[319/695] Linking target tests/kms_flip_tiling.
[320/695] Linking target tests/kms_frontbuffer_tracking.
[321/695] Linking target tests/kms_mmap_write_crc.
[322/695] Linking target tests/kms_pipe_b_c_ivb.
[323/695] Linking target tests/kms_psr2_su.
[324/695] Linking target tests/kms_psr_stress_test.
[325/695] Linking target tests/kms_pwrite_crc.
[326/695] Linking target tests/sysfs_defaults.
[327/695] Linking target tests/sysfs_heartbeat_interval.
[328/695] Linking target tests/sysfs_preempt_timeout.
[329/695] Linking target tests/sysfs_timeslice_duration.
[330/695] Linking target tests/xe_create.
[331/695] Linking target tests/xe_compute.
[332/695] Linking target tests/xe_dma_buf_sync.
[333/695] Linking target tests/xe_debugfs.
[334/695] Linking target tests/xe_evict.
[335/695] Linking target tests/xe_exec_compute_mode.
[336/695] Linking target tests/xe_exec_balancer.
[337/695] Linking target tests/xe_exec_basic.
[338/695] Linking target tests/xe_exec_fault_mode.
[339/695] Linking target tests/xe_exec_reset.
[340/695] Linking target tests/xe_exec_threads.
[341/695] Linking target tests/xe_gpgpu_fill.
[342/695] Compiling C object 'tests/59830eb@@xe_live_ktest@exe/xe_xe_live_k=
test.c.o'.
FAILED: tests/59830eb@@xe_live_ktest@exe/xe_xe_live_ktest.c.o=20
cc -Itests/59830eb@@xe_live_ktest@exe -Itests -I../../../usr/src/igt-gpu-to=
ols/tests -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-g=
pu-tools/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-ua=
pi -Ilib -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-to=
ols/lib/stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include=
/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include=
 -I/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/us=
r/include/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I=
/usr/include/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_=
FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GN=
U_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdecl=
aration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-o=
p -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmi=
ssing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -W=
redundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-=
clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-poi=
nter-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits=
 -Wno-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray=
-bounds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cas=
t -Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpoint=
er-to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtri=
graphs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pth=
read -MD -MQ 'tests/59830eb@@xe_live_ktest@exe/xe_xe_live_ktest.c.o' -MF 't=
ests/59830eb@@xe_live_ktest@exe/xe_xe_live_ktest.c.o.d' -o 'tests/59830eb@@=
xe_live_ktest@exe/xe_xe_live_ktest.c.o' -c ../../../usr/src/igt-gpu-tools/t=
ests/xe/xe_live_ktest.c
../../../usr/src/igt-gpu-tools/tests/xe/xe_live_ktest.c: In function =E2=80=
=98__igt_unique____real_main46=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/xe/xe_live_ktest.c:51:3: error: implic=
it declaration of function =E2=80=98igt_kunit=E2=80=99; did you mean =E2=80=
=98igt_exit=E2=80=99? [-Werror=3Dimplicit-function-declaration]
   51 |   igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
      |   ^~~~~~~~~
      |   igt_exit
../../../usr/src/igt-gpu-tools/tests/xe/xe_live_ktest.c:51:3: warning: nest=
ed extern declaration of =E2=80=98igt_kunit=E2=80=99 [-Wnested-externs]
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.



