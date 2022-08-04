Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Thu, 04 Aug 2022 08:32:06 -0000
Message-ID: <165960192646.14888.6488843592934929807@emeril.freedesktop.org>
References: <20220804081840.21048-1-swati2.sharma@intel.com>
In-Reply-To: <20220804081840.21048-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/testdisplay=3A_Skip_modeset_if_no_display_is_connected?=
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

Series: tests/testdisplay: Skip modeset if no display is connected
URL   : https://patchwork.freedesktop.org/series/106957/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
209230467200f2fa63a6f71fe6299996470dd813 test/i915/i915_suspend: Use SUSPEN=
D_STATE_S3 to enforce S3.

[313/458] Linking target tests/i915_pm_dc
[314/458] Linking target tests/i915_pm_rps
[315/458] Linking target tests/i915_pm_sseu
[316/458] Linking target tests/i915_query
[317/458] Linking target tests/i915_selftest
[318/458] Linking target tests/kms_big_fb
[319/458] Linking target tests/i915_suspend
[320/458] Linking target tests/kms_ccs
[321/458] Linking target tests/kms_big_joiner
[322/458] Linking target tests/kms_busy
[323/458] Linking target tests/kms_dsc
[324/458] Linking target tests/kms_fbcon_fbt
[325/458] Linking target tests/kms_fence_pin_leak
[326/458] Linking target tests/kms_flip_scaled_crc
[327/458] Linking target tests/kms_flip_tiling
[328/458] Linking target tests/kms_frontbuffer_tracking
[329/458] Linking target tests/kms_legacy_colorkey
[330/458] Linking target tests/sysfs_heartbeat_interval
[331/458] Linking target tests/kms_mmap_write_crc
[332/458] Linking target tests/kms_pipe_b_c_ivb
[333/458] Linking target tests/kms_psr
[334/458] Linking target tests/kms_psr2_su
[335/458] Linking target tests/kms_psr2_sf
[336/458] Linking target tests/kms_psr_stress_test
[337/458] Linking target tests/kms_pwrite_crc
[338/458] Linking target tests/sysfs_clients
[339/458] Linking target tests/sysfs_defaults
[340/458] Linking target tests/sysfs_preempt_timeout
[341/458] Linking target tests/sysfs_timeslice_duration
[342/458] Linking target tests/msm_mapping
[343/458] Linking target tests/msm_recovery
[344/458] Linking target tests/msm_submit
[345/458] Linking target tests/drm_fdinfo
[346/458] Linking target tests/gem_ctx_sseu
[347/458] Linking target tests/dumb_buffer
[348/458] Linking target tests/gem_create
[349/458] Linking target tests/gem_ctx_freq
[350/458] Linking target tests/perf
[351/458] Linking target tests/gem_eio
[352/458] Linking target tests/gem_exec_balancer
[353/458] Linking target tests/gem_mmap_offset
[354/458] Compiling C object tests/testdisplay.p/testdisplay.c.o
FAILED: tests/testdisplay.p/testdisplay.c.o=20
ccache cc -Itests/testdisplay.p -Itests -I../tests -I../include/drm-uapi -I=
../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.. -I/us=
r/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.=
0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/l=
ibpng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/libdrm=
/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/include=
 -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways -D_FILE_=
OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOU=
RCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarati=
on-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing=
-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredun=
dant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobb=
ered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-=
arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-=
result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing=
-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-ty=
pe -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fn=
o-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ tests/testdi=
splay.p/testdisplay.c.o -MF tests/testdisplay.p/testdisplay.c.o.d -o tests/=
testdisplay.p/testdisplay.c.o -c ../tests/testdisplay.c
../tests/testdisplay.c: In function =E2=80=98update_display=E2=80=99:
../tests/testdisplay.c:481:23: error: =E2=80=98display=E2=80=99 undeclared =
(first use in this function)
  igt_display_require(&display, drm_fd);
                       ^~~~~~~
../tests/testdisplay.c:481:23: note: each undeclared identifier is reported=
 only once for each function it appears in
ninja: build stopped: subcommand failed.

