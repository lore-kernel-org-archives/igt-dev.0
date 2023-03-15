Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 15 Mar 2023 21:33:32 -0000
Message-ID: <167891601252.19840.9859045515681528161@emeril.freedesktop.org>
References: <20230315205941.4038718-1-matthew.brost@intel.com>
In-Reply-To: <20230315205941.4038718-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBUZXN0?=
 =?utf-8?q?_GPUVA_and_NULL_VM_binds?=
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

Series: Test GPUVA and NULL VM binds
URL   : https://patchwork.freedesktop.org/series/115219/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
9b8c5dbe8cd82163ee198c43b81222d2b9b75fd4 tests/kms: Add missing igt_put_cai=
ro_ctx()

[301/481] Linking target tests/i915_pm_sseu.
[302/481] Linking target tests/i915_power.
[303/481] Linking target tests/i915_query.
[304/481] Linking target tests/i915_selftest.
[305/481] Linking target tests/i915_suspend.
[306/481] Linking target tests/kms_big_fb.
[307/481] Linking target tests/kms_big_joiner.
[308/481] Linking target tests/kms_busy.
[309/481] Linking target tests/kms_ccs.
[310/481] Linking target tests/kms_cdclk.
[311/481] Linking target tests/kms_draw_crc.
[312/481] Linking target tests/kms_fbcon_fbt.
[313/481] Linking target tests/kms_fence_pin_leak.
[314/481] Linking target tests/kms_flip_scaled_crc.
[315/481] Linking target tests/kms_flip_tiling.
[316/481] Linking target tests/kms_frontbuffer_tracking.
[317/481] Linking target tests/kms_legacy_colorkey.
[318/481] Linking target tests/kms_psr2_su.
[319/481] Linking target tests/kms_mmap_write_crc.
[320/481] Linking target tests/kms_psr_stress_test.
[321/481] Linking target tests/kms_pwrite_crc.
[322/481] Linking target tests/sysfs_defaults.
[323/481] Linking target tests/sysfs_heartbeat_interval.
[324/481] Linking target tests/sysfs_preempt_timeout.
[325/481] Linking target tests/sysfs_timeslice_duration.
[326/481] Linking target tests/xe_compute.
[327/481] Linking target tests/xe_dma_buf_sync.
[328/481] Linking target tests/xe_debugfs.
[329/481] Linking target tests/xe_evict.
[330/481] Linking target tests/xe_exec_basic.
[331/481] Linking target tests/xe_exec_balancer.
[332/481] Linking target tests/xe_exec_compute_mode.
[333/481] Linking target tests/xe_exec_fault_mode.
[334/481] Linking target tests/xe_exec_reset.
[335/481] Linking target tests/xe_exec_threads.
[336/481] Linking target tests/xe_guc_pc.
[337/481] Linking target tests/xe_huc_copy.
[338/481] Linking target tests/xe_mmap.
[339/481] Linking target tests/xe_mmio.
[340/481] Linking target tests/xe_pm.
[341/481] Compiling C object 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o'.
FAILED: tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o=20
cc -Itests/59830eb@@xe_vm@exe -Itests -I../../../usr/src/igt-gpu-tools/test=
s -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-tools=
/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi -Ilib=
 -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-tools/lib/=
stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include/cairo -=
I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/=
include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/includ=
e/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/usr/inc=
lude/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_OFF=
SET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE=
 -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-=
after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmiss=
ing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-pr=
ototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundan=
t-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbere=
d -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-ari=
th -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-un=
used-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds =
-Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werro=
r=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-in=
t-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -=
Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -MD=
 -MQ 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o' -MF 'tests/59830eb@@xe_vm@exe/=
xe_xe_vm.c.o.d' -o 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o' -c ../../../usr/=
src/igt-gpu-tools/tests/xe/xe_vm.c
../../../usr/src/igt-gpu-tools/tests/xe/xe_vm.c: In function =E2=80=98test_=
mmap_style_bind=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/xe/xe_vm.c:1641:3: error: implicit dec=
laration of function =E2=80=98__xe_exec_assert=E2=80=99 [-Werror=3Dimplicit=
-function-declaration]
 1641 |   __xe_exec_assert(fd, &exec);
      |   ^~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/xe/xe_vm.c:1641:3: warning: nested ext=
ern declaration of =E2=80=98__xe_exec_assert=E2=80=99 [-Wnested-externs]
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

