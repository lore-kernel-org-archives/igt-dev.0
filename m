Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Date: Tue, 06 Jun 2023 11:54:39 -0000
Message-ID: <168605247950.22674.2970421210420747944@emeril.freedesktop.org>
References: <20230606100501.2990928-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230606100501.2990928-1-himal.prasad.ghimiray@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBzZXJp?=
 =?utf-8?q?es_starting_with_=5Bi-g-t=2CRFC=2C1/1=5D_Support_querying_numbe?=
 =?utf-8?q?r_of_tiles_for_xe_device=2E?=
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

Series: series starting with [i-g-t,RFC,1/1] Support querying number of til=
es for xe device.
URL   : https://patchwork.freedesktop.org/series/118926/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
1c96b08a4cde6f2d49824a8cc3303bd860617b52 tests/xe: add functionality to sev=
eral tests

[308/661] Linking target tests/i915_suspend.
[309/661] Linking target tests/kms_big_fb.
[310/661] Linking target tests/kms_busy.
[311/661] Linking target tests/kms_big_joiner.
[312/661] Linking target tests/kms_ccs.
[313/661] Linking target tests/kms_cdclk.
[314/661] Linking target tests/kms_draw_crc.
[315/661] Linking target tests/kms_fb_coherency.
[316/661] Linking target tests/kms_fbcon_fbt.
[317/661] Linking target tests/kms_flip_scaled_crc.
[318/661] Linking target tests/kms_fence_pin_leak.
[319/661] Linking target tests/kms_flip_tiling.
[320/661] Linking target tests/kms_frontbuffer_tracking.
[321/661] Linking target tests/kms_mmap_write_crc.
[322/661] Linking target tests/kms_pipe_b_c_ivb.
[323/661] Linking target tests/kms_psr2_su.
[324/661] Linking target tests/kms_psr_stress_test.
[325/661] Linking target tests/kms_pwrite_crc.
[326/661] Linking target tests/sysfs_defaults.
[327/661] Linking target tests/sysfs_heartbeat_interval.
[328/661] Linking target tests/sysfs_preempt_timeout.
[329/661] Linking target tests/sysfs_timeslice_duration.
[330/661] Linking target tests/xe_create.
[331/661] Linking target tests/xe_compute.
[332/661] Linking target tests/xe_dma_buf_sync.
[333/661] Linking target tests/xe_debugfs.
[334/661] Linking target tests/xe_evict.
[335/661] Linking target tests/xe_exec_compute_mode.
[336/661] Linking target tests/xe_exec_balancer.
[337/661] Linking target tests/xe_exec_basic.
[338/661] Linking target tests/xe_exec_fault_mode.
[339/661] Linking target tests/xe_exec_reset.
[340/661] Linking target tests/xe_exec_threads.
[341/661] Linking target tests/xe_gpgpu_fill.
[342/661] Linking target tests/xe_guc_pc.
[343/661] Linking target tests/xe_huc_copy.
[344/661] Linking target tests/xe_intel_bb.
[345/661] Linking target tests/xe_mmap.
[346/661] Linking target tests/xe_mmio.
[347/661] Linking target tests/xe_module_load.
[348/661] Linking target tests/xe_noexec_ping_pong.
[349/661] Linking target tests/xe_pm.
[350/661] Compiling C object 'tests/59830eb@@xe_vm@exe/xe_xe_vm.c.o'.
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
bind_array=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/xe/xe_vm.c:907:14: error: =E2=80=98str=
uct drm_xe_vm_bind_op=E2=80=99 has no member named =E2=80=98gt_mask=E2=80=99
  907 |   bind_ops[i].gt_mask =3D 0x1 << eci->gt_id;
      |              ^
ninja: build stopped: subcommand failed.

