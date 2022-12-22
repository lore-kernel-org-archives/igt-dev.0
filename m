Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 22 Dec 2022 23:21:04 -0000
Message-ID: <167175126494.14835.965667619640758494@emeril.freedesktop.org>
References: <20221222224747.34894-1-matthew.brost@intel.com>
In-Reply-To: <20221222224747.34894-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBJbml0?=
 =?utf-8?q?ial_Xe_test_suite?=
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

Series: Initial Xe test suite
URL   : https://patchwork.freedesktop.org/series/112191/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
bacfdc84a9c02556c5441deb21e3a3f18a07347d tests/gem_ctx_shared: Release offs=
et after use

[314/598] Linking target tests/kms_frontbuffer_tracking.
[315/598] Linking target tests/kms_legacy_colorkey.
[316/598] Linking target tests/kms_mmap_write_crc.
[317/598] Linking target tests/kms_psr2_sf.
[318/598] Linking target tests/kms_pipe_b_c_ivb.
[319/598] Linking target tests/kms_psr_stress_test.
[320/598] Linking target tests/kms_pwrite_crc.
[321/598] Linking target tests/sysfs_clients.
[322/598] Linking target tests/sysfs_heartbeat_interval.
[323/598] Linking target tests/sysfs_defaults.
[324/598] Linking target tests/sysfs_preempt_timeout.
[325/598] Linking target tests/msm_mapping.
[326/598] Linking target tests/sysfs_timeslice_duration.
[327/598] Linking target tests/msm_recovery.
[328/598] Linking target tests/msm_submit.
[329/598] Linking target tests/drm_fdinfo.
[330/598] Linking target tests/kms_chamelium.
[331/598] Linking target tests/dumb_buffer.
[332/598] Linking target tests/gem_create.
[333/598] Linking target tests/gem_ctx_freq.
[334/598] Linking target tests/gem_ctx_sseu.
[335/598] Linking target tests/gem_eio.
[336/598] Linking target tests/gem_exec_balancer.
[337/598] Linking target tests/gem_mmap_offset.
[338/598] Linking target tests/i915_pm_freq_mult.
[339/598] Linking target tests/i915_pm_rc6_residency.
[340/598] Linking target tests/core_hotunplug.
[341/598] Linking target tests/perf_pmu.
[342/598] Linking target tests/perf.
[343/598] Linking target tests/testdisplay.
[344/598] Linking target tests/kms_color.
[345/598] Linking target tests/sw_sync.
[346/598] Linking target tests/kms_color_chamelium.
[347/598] Linking target tests/xe/xe_compute.
[348/598] Linking target tests/xe/xe_dma_buf_sync.
[349/598] Linking target tests/xe/xe_evict.
[350/598] Linking target tests/xe/xe_exec_balancer.
[351/598] Linking target tests/xe/xe_exec_basic.
[352/598] Linking target tests/xe/xe_exec_reset.
[353/598] Compiling C object 'tests/xe/2e9594b@@xe_live_ktest@exe/xe_live_k=
test.c.o'.
FAILED: tests/xe/2e9594b@@xe_live_ktest@exe/xe_live_ktest.c.o=20
cc -Itests/xe/2e9594b@@xe_live_ktest@exe -Itests/xe -I../../../usr/src/igt-=
gpu-tools/tests/xe -I../../../usr/src/igt-gpu-tools/include/drm-uapi -I../.=
./../usr/src/igt-gpu-tools/include/linux-uapi -Ilib -I../../../usr/src/igt-=
gpu-tools/lib -I../../../usr/src/igt-gpu-tools/lib/stubs/syscalls -I. -I../=
../../usr/src/igt-gpu-tools/ -I/usr/include/cairo -I/usr/include/glib-2.0 -=
I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/=
include/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/includ=
e/libdrm -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/inc=
lude -fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Win=
valid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FO=
RTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=
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
fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/xe/=
2e9594b@@xe_live_ktest@exe/xe_live_ktest.c.o' -MF 'tests/xe/2e9594b@@xe_liv=
e_ktest@exe/xe_live_ktest.c.o.d' -o 'tests/xe/2e9594b@@xe_live_ktest@exe/xe=
_live_ktest.c.o' -c ../../../usr/src/igt-gpu-tools/tests/xe/xe_live_ktest.c
../../../usr/src/igt-gpu-tools/tests/xe/xe_live_ktest.c: In function =E2=80=
=98__igt_unique____real_main6=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/xe/xe_live_ktest.c:9:3: error: implici=
t declaration of function =E2=80=98igt_kunit=E2=80=99; did you mean =E2=80=
=98igt_exit=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    9 |   igt_kunit("xe_dma_buf_test", NULL);
      |   ^~~~~~~~~
      |   igt_exit
../../../usr/src/igt-gpu-tools/tests/xe/xe_live_ktest.c:9:3: warning: neste=
d extern declaration of =E2=80=98igt_kunit=E2=80=99 [-Wnested-externs]
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

