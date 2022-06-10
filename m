Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 10 Jun 2022 04:40:24 -0000
Message-ID: <165483602409.16747.7433557662174212770@emeril.freedesktop.org>
References: <20220610043131.3452-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220610043131.3452-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=3A_IGT_test_cleanup?=
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

Series: tests/kms: IGT test cleanup
URL   : https://patchwork.freedesktop.org/series/104958/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
0189ca288f7188e60f5eda356b190040bf8ec704 i915/gem_pipe_control_store_loop: =
Adopt to softpin

[468/656] Linking target tests/gem_request_retire
[469/656] Linking target tests/gem_ringfill
[470/656] Linking target tests/gem_set_tiling_vs_blt
[471/656] Linking target tests/gem_set_tiling_vs_gtt
[472/656] Linking target tests/gem_set_tiling_vs_pwrite
[473/656] Linking target tests/gem_spin_batch
[474/656] Linking target tests/gem_shrink
[475/656] Linking target tests/gem_softpin
[476/656] Linking target tests/gem_tiled_partial_pwrite_pread
[477/656] Linking target tests/gem_streaming_writes
[478/656] Linking target tests/gem_sync
[479/656] Linking target tests/gem_tiled_blits
[480/656] Linking target tests/gem_tiled_fence_blits
[481/656] Linking target tests/gem_tiled_pread_basic
[482/656] Linking target tests/gem_tiled_pread_pwrite
[483/656] Linking target tests/gem_tiled_swapping
[484/656] Linking target tests/gem_tiled_wb
[485/656] Linking target tests/gem_tiled_wc
[486/656] Linking target tests/gem_tiling_max_stride
[487/656] Linking target tests/gem_unfence_active_buffers
[488/656] Linking target tests/gem_userptr_blits
[489/656] Linking target tests/gem_unref_active_buffers
[490/656] Linking target tests/gem_watchdog
[491/656] Linking target tests/gem_vm_create
[492/656] Linking target tests/gem_wait
[493/656] Linking target tests/gem_workarounds
[494/656] Linking target tests/i915_fb_tiling
[495/656] Linking target tests/i915_getparams_basic
[496/656] Linking target tests/i915_hangman
[497/656] Linking target tests/i915_module_load
[498/656] Linking target tests/i915_pciid
[499/656] Linking target tests/i915_pm_backlight
[500/656] Linking target tests/i915_pm_rpm
[501/656] Linking target tests/i915_pm_lpsp
[502/656] Linking target tests/i915_pm_dc
[503/656] Linking target tests/i915_pm_rps
[504/656] Linking target tests/i915_pm_sseu
[505/656] Linking target tests/i915_query
[506/656] Linking target tests/i915_selftest
[507/656] Linking target tests/kms_big_joiner
[508/656] Linking target tests/i915_suspend
[509/656] Compiling C object tests/kms_draw_crc.p/i915_kms_draw_crc.c.o
FAILED: tests/kms_draw_crc.p/i915_kms_draw_crc.c.o=20
ccache cc -Itests/kms_draw_crc.p -Itests -I../tests -I../include/drm-uapi -=
I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.. -I/u=
sr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2=
.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/=
libpng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/libdr=
m/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/includ=
e -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways -D_FILE=
_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SO=
URCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclarat=
ion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -W=
missing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissin=
g-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredu=
ndant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clob=
bered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer=
-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused=
-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=
=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing=
-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-ty=
pe -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fn=
o-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ tests/kms_dr=
aw_crc.p/i915_kms_draw_crc.c.o -MF tests/kms_draw_crc.p/i915_kms_draw_crc.c=
.o.d -o tests/kms_draw_crc.p/i915_kms_draw_crc.c.o -c ../tests/i915/kms_dra=
w_crc.c
../tests/i915/kms_draw_crc.c: In function =E2=80=98setup_environment=E2=80=
=99:
../tests/i915/kms_draw_crc.c:268:20: error: =E2=80=98display=E2=80=99 undec=
lared (first use in this function)
  igt_display_reset(display);
                    ^~~~~~~
../tests/i915/kms_draw_crc.c:268:20: note: each undeclared identifier is re=
ported only once for each function it appears in
ninja: build stopped: subcommand failed.

