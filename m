Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Sep 2021 05:28:41 -0000
Message-ID: <163289332125.27099.7862197244130402757@emeril.freedesktop.org>
References: <20210929052214.437157-1-stylon.wang@amd.com>
In-Reply-To: <20210929052214.437157-1-stylon.wang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?/amdgpu=3A_Test_max-bpc_fallback_for_4K_modes_on_HDMI?=
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
To: Stylon Wang <stylon.wang@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: test/amdgpu: Test max-bpc fallback for 4K modes on HDMI
URL   : https://patchwork.freedesktop.org/series/95188/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
6ac2da7fd6b13f04f9aa0ec10f86b831d2756946 lib/intel_batchbuffer: Remove dupl=
icated assignment

[303/433] Linking target tests/kms_busy.
[304/433] Linking target tests/kms_ccs.
[305/433] Linking target tests/kms_cdclk.
[306/433] Linking target tests/kms_dsc.
[307/433] Linking target tests/kms_fbcon_fbt.
[308/433] Linking target tests/kms_fence_pin_leak.
[309/433] Linking target tests/kms_flip_scaled_crc.
[310/433] Linking target tests/kms_flip_tiling.
[311/433] Linking target tests/kms_frontbuffer_tracking.
[312/433] Linking target tests/kms_mmap_write_crc.
[313/433] Linking target tests/kms_legacy_colorkey.
[314/433] Linking target tests/kms_pipe_b_c_ivb.
[315/433] Linking target tests/kms_psr2_su.
[316/433] Linking target tests/kms_psr2_sf.
[317/433] Linking target tests/kms_pwrite_crc.
[318/433] Linking target tests/sysfs_clients.
[319/433] Linking target tests/sysfs_defaults.
[320/433] Linking target tests/sysfs_preempt_timeout.
[321/433] Linking target tests/sysfs_heartbeat_interval.
[322/433] Linking target tests/dumb_buffer.
[323/433] Linking target tests/sysfs_timeslice_duration.
[324/433] Linking target tests/gem_ctx_sseu.
[325/433] Linking target tests/gem_create.
[326/433] Linking target tests/gem_ctx_freq.
[327/433] Linking target tests/gem_eio.
[328/433] Linking target tests/gem_mmap_offset.
[329/433] Linking target tests/gem_exec_balancer.
[330/433] Linking target tests/kms_color_chamelium.
[331/433] Linking target tests/i915_pm_rc6_residency.
[332/433] Linking target tests/core_hotunplug.
[333/433] Linking target tests/perf_pmu.
[334/433] Linking target tests/perf.
[335/433] Linking target tests/testdisplay.
[336/433] Linking target tests/kms_color.
[337/433] Linking target tests/sw_sync.
[338/433] Linking target tests/amdgpu/amd_assr.
[339/433] Linking target tests/amdgpu/amd_abm.
[340/433] Linking target tests/amdgpu/amd_color.
[341/433] Linking target tests/amdgpu/amd_basic.
[342/433] Linking target tests/amdgpu/amd_bypass.
[343/433] Linking target tests/amdgpu/amd_cs_nop.
[344/433] Linking target tests/amdgpu/amd_info.
[345/433] Linking target tests/amdgpu/amd_hotplug.
[346/433] Compiling C object 'tests/amdgpu/tests@amdgpu@@amd_max_bpc@exe/am=
d_max_bpc.c.o'.
FAILED: tests/amdgpu/tests@amdgpu@@amd_max_bpc@exe/amd_max_bpc.c.o=20
ccache cc -Itests/amdgpu/tests@amdgpu@@amd_max_bpc@exe -Itests/amdgpu -I../=
tests/amdgpu -I../include/drm-uapi -Ilib -I../lib -I../lib/stubs/syscalls -=
I. -I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-lin=
ux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/libpng16 -I/=
usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/=
include/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa =
-I/usr/include -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Da=
lways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu=
11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-funct=
ion-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=
=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissi=
ng-noreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -W=
pointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialize=
d -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initi=
alizers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-p=
arameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werro=
r=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dma=
in -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast=
 -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=
=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread =
 -MD -MQ 'tests/amdgpu/tests@amdgpu@@amd_max_bpc@exe/amd_max_bpc.c.o' -MF '=
tests/amdgpu/tests@amdgpu@@amd_max_bpc@exe/amd_max_bpc.c.o.d' -o 'tests/amd=
gpu/tests@amdgpu@@amd_max_bpc@exe/amd_max_bpc.c.o' -c ../tests/amdgpu/amd_m=
ax_bpc.c
../tests/amdgpu/amd_max_bpc.c:26:19: error: expected declaration specifiers=
 or =E2=80=98...=E2=80=99 before string constant
 IGT_TEST_DESCRIPT("Test 4K HDMI regression if max bpc is too high");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

