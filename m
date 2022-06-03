Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Fri, 03 Jun 2022 16:28:15 -0000
Message-ID: <165427369508.17720.6627303867859218971@emeril.freedesktop.org>
References: <20220603161204.6202-1-swati2.sharma@intel.com>
In-Reply-To: <20220603161204.6202-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/i915/kms=5Fcdclk=3A_Add_new_subtest?=
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

Series: tests/i915/kms_cdclk: Add new subtest
URL   : https://patchwork.freedesktop.org/series/104735/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
edb1a467fb622b23b927e28ff603fa43851fea97 tests/amdgpu: refactoring and upda=
te amd_basic tests

[468/655] Linking target tests/gem_request_retire
[469/655] Linking target tests/gem_reset_stats
[470/655] Linking target tests/gem_ringfill
[471/655] Linking target tests/gem_set_tiling_vs_blt
[472/655] Linking target tests/gem_set_tiling_vs_gtt
[473/655] Linking target tests/gem_set_tiling_vs_pwrite
[474/655] Linking target tests/gem_shrink
[475/655] Linking target tests/gem_softpin
[476/655] Linking target tests/gem_streaming_writes
[477/655] Linking target tests/gem_spin_batch
[478/655] Linking target tests/gem_sync
[479/655] Linking target tests/gem_tiled_blits
[480/655] Linking target tests/gem_tiled_fence_blits
[481/655] Linking target tests/gem_tiled_partial_pwrite_pread
[482/655] Linking target tests/gem_tiled_swapping
[483/655] Linking target tests/gem_tiled_pread_basic
[484/655] Linking target tests/gem_tiled_pread_pwrite
[485/655] Linking target tests/gem_tiling_max_stride
[486/655] Linking target tests/gem_tiled_wb
[487/655] Linking target tests/gem_tiled_wc
[488/655] Linking target tests/gem_unfence_active_buffers
[489/655] Linking target tests/i915_fb_tiling
[490/655] Linking target tests/gem_unref_active_buffers
[491/655] Linking target tests/gem_wait
[492/655] Linking target tests/gem_userptr_blits
[493/655] Linking target tests/gem_vm_create
[494/655] Linking target tests/gem_watchdog
[495/655] Linking target tests/gem_workarounds
[496/655] Linking target tests/i915_getparams_basic
[497/655] Linking target tests/i915_hangman
[498/655] Linking target tests/i915_pciid
[499/655] Linking target tests/i915_module_load
[500/655] Linking target tests/i915_pm_dc
[501/655] Linking target tests/i915_pm_backlight
[502/655] Linking target tests/i915_pm_lpsp
[503/655] Linking target tests/i915_pm_rpm
[504/655] Linking target tests/i915_pm_rps
[505/655] Linking target tests/kms_big_fb
[506/655] Linking target tests/i915_pm_sseu
[507/655] Linking target tests/i915_query
[508/655] Linking target tests/i915_selftest
[509/655] Linking target tests/i915_suspend
[510/655] Compiling C object tests/kms_cdclk.p/i915_kms_cdclk.c.o
FAILED: tests/kms_cdclk.p/i915_kms_cdclk.c.o=20
ccache cc -Itests/kms_cdclk.p -Itests -I../tests -I../include/drm-uapi -I..=
/include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.. -I/usr/=
include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/=
include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/lib=
png16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/libdrm/n=
ouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/include -=
I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways -D_FILE_OF=
FSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURC=
E -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclaration=
-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -Wmis=
sing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-p=
rototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wredunda=
nt-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clobber=
ed -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointer-ar=
ith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-re=
sult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3D=
init-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-br=
aces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type =
-Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-b=
uiltin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ tests/kms_cdclk=
.p/i915_kms_cdclk.c.o -MF tests/kms_cdclk.p/i915_kms_cdclk.c.o.d -o tests/k=
ms_cdclk.p/i915_kms_cdclk.c.o -c ../tests/i915/kms_cdclk.c
../tests/i915/kms_cdclk.c: In function =E2=80=98test_mode_transition_on_all=
_outputs=E2=80=99:
../tests/i915/kms_cdclk.c:311:24: error: =E2=80=98data_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} has no member named =E2=80=98fb=E2=80=99
   igt_fb_set_size(&data->fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
                        ^~
ninja: build stopped: subcommand failed.

