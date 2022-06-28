Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Tue, 28 Jun 2022 16:50:48 -0000
Message-ID: <165643504846.14502.3249502939435082817@emeril.freedesktop.org>
References: <20220628130412.1723424-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20220628130412.1723424-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/i915/i915=5Fmodule=5Fload=3A_Test_resizable_bar_support_=28re?=
 =?utf-8?b?djMp?=
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

Series: tests/i915/i915_module_load: Test resizable bar support (rev3)
URL   : https://patchwork.freedesktop.org/series/105141/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
9b9371c8da32533022ad700a7c023b4c3a085fbc tests/i915: adapt __copy_ccs for d=
iscrete

[459/660] Linking target tests/gem_partial_pwrite_pread
[460/660] Linking target tests/gem_pipe_control_store_loop
[461/660] Linking target tests/gem_ppgtt
[462/660] Linking target tests/gem_pread
[463/660] Linking target tests/gem_pread_after_blit
[464/660] Linking target tests/gem_pwrite
[465/660] Linking target tests/gem_pwrite_snooped
[466/660] Linking target tests/gem_pxp
[467/660] Linking target tests/gem_read_read_speed
[468/660] Linking target tests/gem_readwrite
[469/660] Linking target tests/gem_render_tiled_blits
[470/660] Linking target tests/gem_reg_read
[471/660] Linking target tests/gem_render_copy
[472/660] Linking target tests/gem_render_copy_redux
[473/660] Linking target tests/gem_render_linear_blits
[474/660] Linking target tests/gem_set_tiling_vs_blt
[475/660] Linking target tests/gem_request_retire
[476/660] Linking target tests/gem_reset_stats
[477/660] Linking target tests/gem_ringfill
[478/660] Linking target tests/gem_set_tiling_vs_gtt
[479/660] Linking target tests/gem_set_tiling_vs_pwrite
[480/660] Linking target tests/gem_streaming_writes
[481/660] Linking target tests/gem_shrink
[482/660] Linking target tests/gem_softpin
[483/660] Linking target tests/gem_spin_batch
[484/660] Linking target tests/gem_sync
[485/660] Linking target tests/gem_tiled_blits
[486/660] Linking target tests/gem_tiled_fence_blits
[487/660] Linking target tests/gem_tiled_partial_pwrite_pread
[488/660] Linking target tests/gem_tiled_pread_basic
[489/660] Linking target tests/gem_tiled_pread_pwrite
[490/660] Linking target tests/gem_tiled_swapping
[491/660] Linking target tests/gem_unfence_active_buffers
[492/660] Linking target tests/gem_tiled_wb
[493/660] Linking target tests/gem_tiled_wc
[494/660] Linking target tests/gem_tiling_max_stride
[495/660] Linking target tests/gem_unref_active_buffers
[496/660] Linking target tests/gem_userptr_blits
[497/660] Linking target tests/gem_vm_create
[498/660] Linking target tests/gem_wait
[499/660] Linking target tests/gem_watchdog
[500/660] Compiling C object tests/i915_module_load.p/i915_i915_module_load=
.c.o
FAILED: tests/i915_module_load.p/i915_i915_module_load.c.o=20
ccache cc -Itests/i915_module_load.p -Itests -I../tests -I../include/drm-ua=
pi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. -I.. =
-I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/gl=
ib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/incl=
ude/libpng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/include/l=
ibdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/usr/in=
clude -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalways -D_=
FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g -D_GN=
U_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast -Wdecl=
aration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlogical-o=
p -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn -Wmi=
ssing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-arith -W=
redundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused -Wno-=
clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-poi=
nter-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-un=
used-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -We=
rror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmis=
sing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dretur=
n-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings=
 -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ tests/i9=
15_module_load.p/i915_i915_module_load.c.o -MF tests/i915_module_load.p/i91=
5_i915_module_load.c.o.d -o tests/i915_module_load.p/i915_i915_module_load.=
c.o -c ../tests/i915/i915_module_load.c
../tests/i915/i915_module_load.c: In function =E2=80=98driver_load_with_lme=
m_bar_size=E2=80=99:
../tests/i915/i915_module_load.c:295:24: error: =E2=80=98struct gem_memory_=
region=E2=80=99 has no member named =E2=80=98cpu_size=E2=80=99; did you mea=
n =E2=80=98size=E2=80=99?
    lmem_bar_size =3D (r->cpu_size >> BAR_SIZE_SHIFT);
                        ^~~~~~~~
                        size
ninja: build stopped: subcommand failed.

