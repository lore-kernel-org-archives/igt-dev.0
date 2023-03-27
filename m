Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Mon, 27 Mar 2023 19:57:21 -0000
Message-ID: <167994704106.32632.12466686986775767895@emeril.freedesktop.org>
References: <20230315210147.19557-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230315210147.19557-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/i915/i915=5Fpm=5Fdc=3A_Add_DC6_test_for_mtl_=28rev3=29?=
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

Series: tests/i915/i915_pm_dc: Add DC6 test for mtl (rev3)
URL   : https://patchwork.freedesktop.org/series/112918/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
4b77c6d85024d22ca521d510f8eee574128fe04f lib/xe_query: Prevent cache corrup=
tion on multiple access

[254/649] Linking target tests/gem_pwrite.
[255/649] Linking target tests/gem_pwrite_snooped.
[256/649] Linking target tests/gem_pxp.
[257/649] Linking target tests/gem_read_read_speed.
[258/649] Linking target tests/gem_readwrite.
[259/649] Linking target tests/gem_render_copy_redux.
[260/649] Linking target tests/gem_reg_read.
[261/649] Linking target tests/gem_render_copy.
[262/649] Linking target tests/gem_render_linear_blits.
[263/649] Linking target tests/gem_render_tiled_blits.
[264/649] Linking target tests/gem_request_retire.
[265/649] Linking target tests/gem_reset_stats.
[266/649] Linking target tests/gem_ringfill.
[267/649] Linking target tests/gem_set_tiling_vs_blt.
[268/649] Linking target tests/gem_set_tiling_vs_gtt.
[269/649] Linking target tests/gem_shrink.
[270/649] Linking target tests/gem_set_tiling_vs_pwrite.
[271/649] Linking target tests/gem_softpin.
[272/649] Linking target tests/gem_sync.
[273/649] Linking target tests/gem_spin_batch.
[274/649] Linking target tests/gem_streaming_writes.
[275/649] Linking target tests/gem_tiled_blits.
[276/649] Linking target tests/gem_tiled_fence_blits.
[277/649] Linking target tests/gem_tiled_partial_pwrite_pread.
[278/649] Linking target tests/gem_tiled_pread_pwrite.
[279/649] Linking target tests/gem_tiled_pread_basic.
[280/649] Linking target tests/gem_tiled_swapping.
[281/649] Linking target tests/gem_tiled_wb.
[282/649] Linking target tests/gem_tiled_wc.
[283/649] Linking target tests/gem_tiling_max_stride.
[284/649] Linking target tests/gem_unfence_active_buffers.
[285/649] Linking target tests/gem_userptr_blits.
[286/649] Linking target tests/gem_unref_active_buffers.
[287/649] Linking target tests/gem_vm_create.
[288/649] Linking target tests/gem_wait.
[289/649] Linking target tests/gem_watchdog.
[290/649] Linking target tests/gem_workarounds.
[291/649] Linking target tests/i915_fb_tiling.
[292/649] Linking target tests/i915_getparams_basic.
[293/649] Linking target tests/i915_hangman.
[294/649] Compiling C object 'tests/59830eb@@i915_pm_dc@exe/i915_i915_pm_dc=
.c.o'.
FAILED: tests/59830eb@@i915_pm_dc@exe/i915_i915_pm_dc.c.o=20
cc -Itests/59830eb@@i915_pm_dc@exe -Itests -I../../../usr/src/igt-gpu-tools=
/tests -I../../../usr/src/igt-gpu-tools/include -I../../../usr/src/igt-gpu-=
tools/include/drm-uapi -I../../../usr/src/igt-gpu-tools/include/linux-uapi =
-Ilib -I../../../usr/src/igt-gpu-tools/lib -I../../../usr/src/igt-gpu-tools=
/lib/stubs/syscalls -I. -I../../../usr/src/igt-gpu-tools/ -I/usr/include/ca=
iro -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I=
/usr/include/pixman-1 -I/usr/include/uuid -I/usr/include/freetype2 -I/usr/i=
nclude/libpng16 -I/usr/include/libdrm -I/usr/include/x86_64-linux-gnu -I/us=
r/include/valgrind -I/usr/include -fdiagnostics-color=3Dalways -pipe -D_FIL=
E_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_S=
OURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdeclara=
tion-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-op -=
Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmissi=
ng-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -Wred=
undant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-clo=
bbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-pointe=
r-arith -Wno-address-of-packed-member -Wno-sign-compare -Wno-type-limits -W=
no-unused-parameter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bo=
unds -Werror=3Dimplicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -=
Werror=3Dmain -Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-=
to-int-cast -Werror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigra=
phs -Werror=3Dwrite-strings -fno-builtin-malloc -fno-builtin-calloc -pthrea=
d -MD -MQ 'tests/59830eb@@i915_pm_dc@exe/i915_i915_pm_dc.c.o' -MF 'tests/59=
830eb@@i915_pm_dc@exe/i915_i915_pm_dc.c.o.d' -o 'tests/59830eb@@i915_pm_dc@=
exe/i915_i915_pm_dc.c.o' -c ../../../usr/src/igt-gpu-tools/tests/i915/i915_=
pm_dc.c
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_dc.c: In function =E2=80=
=98test_pkc_state_psr=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_dc.c:589:15: error: impli=
cit declaration of function =E2=80=98read_pkc_state_value=E2=80=99 [-Werror=
=3Dimplicit-function-declaration]
  589 |  prev_value =3D read_pkc_state_value(data->pmc_fd);
      |               ^~~~~~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/i915_pm_dc.c:589:15: warning: nes=
ted extern declaration of =E2=80=98read_pkc_state_value=E2=80=99 [-Wnested-=
externs]
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

