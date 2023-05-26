Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aravind Iddamsetty" <aravind.iddamsetty@intel.com>
Date: Fri, 26 May 2023 17:49:45 -0000
Message-ID: <168512338536.32383.11054705150716371568@emeril.freedesktop.org>
References: <20230526163008.428809-1-aravind.iddamsetty@intel.com>
In-Reply-To: <20230526163008.428809-1-aravind.iddamsetty@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBBIHRv?=
 =?utf-8?q?ol_to_demonstrate_use_of_netlink_sockets_to_read_RAS_error_coun?=
 =?utf-8?q?ters?=
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

Series: A tool to demonstrate use of netlink sockets to read RAS error coun=
ters
URL   : https://patchwork.freedesktop.org/series/118438/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
f0714273cd896c637759b3790f485308c4c97008 lib/igt_core: add helper for srand=
om seed initialization

[425/555] Linking target tools/cnl_compute_wrpll.
[426/555] Linking target tools/hsw_compute_wrpll.
[427/555] Linking target tools/skl_compute_wrpll.
[428/555] Linking target tools/skl_ddb_allocation.
[429/555] Linking target tools/igt_stats.
[430/555] Linking target tools/intel_audio_dump.
[431/555] Linking target tools/intel_backlight.
[432/555] Linking target tools/intel_bios_dumper.
[433/555] Linking target tools/intel_display_crc.
[434/555] Linking target tools/intel_display_poller.
[435/555] Linking target tools/intel_dump_decode.
[436/555] Linking target tools/intel_error_decode.
[437/555] Linking target tools/intel_forcewaked.
[438/555] Linking target tools/intel_gpu_frequency.
[439/555] Linking target tools/intel_firmware_decode.
[440/555] Linking target tools/intel_framebuffer_dump.
[441/555] Linking target tools/intel_gpu_time.
[442/555] Linking target tools/intel_gtt.
[443/555] Linking target tools/intel_guc_logger.
[444/555] Linking target tools/intel_infoframes.
[445/555] Linking target tools/intel_lid.
[446/555] Linking target tools/intel_panel_fitter.
[447/555] Linking target tools/intel_opregion_decode.
[448/555] Linking target tools/intel_pm_rpm.
[449/555] Linking target tools/intel_perf_counters.
[450/555] Linking target tools/intel_reg_checker.
[451/555] Linking target tools/intel_residency.
[452/555] Linking target tools/intel_stepping.
[453/555] Linking target tools/intel_vbt_decode.
[454/555] Linking target tools/intel_watermark.
[455/555] Linking target tools/intel_gvtg_test.
[456/555] Linking target tools/intel_gem_info.
[457/555] Linking target tools/dpcd_reg.
[458/555] Linking target tools/lsgpu.
[459/555] Linking target tools/xe_reg.
[460/555] Linking target tools/gputop.
[461/555] Linking target tools/intel_dp_compliance.
[462/555] Linking target tools/intel_l3_parity.
[463/555] Linking target tools/intel_gpu_top.
[464/555] Linking target tools/intel_reg.
[465/555] Linking target tools/i915-perf/i915-perf-configs.
[466/555] Linking target tools/amd_hdmi_compliance.
[467/555] Compiling C object 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o'.
FAILED: tools/f9d35d4@@drm_ras@exe/drm_ras.c.o=20
cc -Itools/f9d35d4@@drm_ras@exe -Itools -I../../../usr/src/igt-gpu-tools/to=
ols -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-too=
ls/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi -Il=
ib -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-tools/li=
b/stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include/cairo=
 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/us=
r/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/incl=
ude/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/usr/i=
nclude/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FILE_O=
FFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOUR=
CE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaratio=
n-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmi=
ssing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-=
prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredund=
ant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbe=
red -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-a=
rith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -Wno-=
unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bound=
s -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Wer=
ror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-=
int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs=
 -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthread -=
MD -MQ 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -MF 'tools/f9d35d4@@drm_ras=
@exe/drm_ras.c.o.d' -o 'tools/f9d35d4@@drm_ras@exe/drm_ras.c.o' -c ../../..=
/usr/src/igt-gpu-tools/tools/drm_ras.c
../../../usr/src/igt-gpu-tools/tools/drm_ras.c:11:10: fatal error: netlink/=
cli/utils.h: No such file or directory
   11 | #include <netlink/cli/utils.h>
      |          ^~~~~~~~~~~~~~~~~~~~~
compilation terminated.
ninja: build stopped: subcommand failed.

