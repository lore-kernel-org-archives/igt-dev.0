Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 26 Aug 2022 03:59:18 -0000
Message-ID: <166148635822.30042.15259880357896549707@emeril.freedesktop.org>
References: <20220826034114.30096-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220826034114.30096-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/i915/kms=5Fbusy=3A_Test_Cleanup_=28rev2=29?=
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

Series: tests/i915/kms_busy: Test Cleanup (rev2)
URL   : https://patchwork.freedesktop.org/series/107774/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
1298b5f0e1b3e010657ffba41d2e775fab028e08 igt: Allow overriding the commit h=
ash in the version string

[476/663] Linking target tests/gem_render_tiled_blits
[477/663] Linking target tests/gem_ringfill
[478/663] Linking target tests/gem_reset_stats
[479/663] Linking target tests/gem_set_tiling_vs_blt
[480/663] Linking target tests/gem_set_tiling_vs_gtt
[481/663] Linking target tests/gem_set_tiling_vs_pwrite
[482/663] Linking target tests/gem_shrink
[483/663] Linking target tests/gem_softpin
[484/663] Linking target tests/gem_spin_batch
[485/663] Linking target tests/gem_streaming_writes
[486/663] Linking target tests/gem_sync
[487/663] Linking target tests/gem_tiled_blits
[488/663] Linking target tests/gem_tiled_fence_blits
[489/663] Linking target tests/gem_tiled_partial_pwrite_pread
[490/663] Linking target tests/gem_tiled_pread_basic
[491/663] Linking target tests/gem_tiled_pread_pwrite
[492/663] Linking target tests/gem_tiled_swapping
[493/663] Linking target tests/gem_tiled_wb
[494/663] Linking target tests/gem_tiled_wc
[495/663] Linking target tests/gem_tiling_max_stride
[496/663] Linking target tests/gem_unfence_active_buffers
[497/663] Linking target tests/gem_unref_active_buffers
[498/663] Linking target tests/gem_userptr_blits
[499/663] Linking target tests/gem_vm_create
[500/663] Linking target tests/gem_wait
[501/663] Linking target tests/gem_watchdog
[502/663] Linking target tests/gem_workarounds
[503/663] Linking target tests/i915_fb_tiling
[504/663] Linking target tests/i915_getparams_basic
[505/663] Linking target tests/i915_hangman
[506/663] Linking target tests/i915_module_load
[507/663] Linking target tests/i915_pciid
[508/663] Linking target tests/i915_pm_backlight
[509/663] Linking target tests/i915_pm_rpm
[510/663] Linking target tests/i915_pm_lpsp
[511/663] Linking target tests/i915_pm_dc
[512/663] Linking target tests/i915_pm_rps
[513/663] Linking target tests/i915_pm_sseu
[514/663] Linking target tests/i915_query
[515/663] Linking target tests/i915_selftest
[516/663] Compiling C object tests/kms_busy.p/i915_kms_busy.c.o
FAILED: tests/kms_busy.p/i915_kms_busy.c.o=20
ccache cc -Itests/kms_busy.p -Itests -I../tests -I../include/drm-uapi -I../=
include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.. -I/usr/i=
nclude/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/i=
nclude -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libp=
ng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/libdrm/no=
uveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/include -I=
/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways -D_FILE_OFF=
SET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE=
 -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-=
after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmiss=
ing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-pr=
ototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredundan=
t-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobbere=
d -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-ari=
th -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-res=
ult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Di=
nit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-bra=
ces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -=
Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-bu=
iltin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ tests/kms_busy.p=
/i915_kms_busy.c.o -MF tests/kms_busy.p/i915_kms_busy.c.o.d -o tests/kms_bu=
sy.p/i915_kms_busy.c.o -c ../tests/i915/kms_busy.c
../tests/i915/kms_busy.c: In function =E2=80=98__igt_unique____real_main318=
=E2=80=99:
../tests/i915/kms_busy.c:348:22: error: =E2=80=98data=E2=80=99 undeclared (=
first use in this function); did you mean =E2=80=98atan=E2=80=99?
   igt_display_reset(&data.master.display);
                      ^~~~
                      atan
../tests/i915/kms_busy.c:348:22: note: each undeclared identifier is report=
ed only once for each function it appears in
ninja: build stopped: subcommand failed.

