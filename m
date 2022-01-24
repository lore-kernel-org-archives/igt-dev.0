Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Jan 2022 17:37:19 -0000
Message-ID: <164304583996.1340.5330325983322286704@emeril.freedesktop.org>
References: <20220124144213.1900452-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20220124144213.1900452-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/i915/i915=5Fhangman_=3A_Skips_test_for_RCS/CCS_on_DG2?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

=3D=3D Series Details =3D=3D

Series: tests/i915/i915_hangman : Skips test for RCS/CCS on DG2
URL   : https://patchwork.freedesktop.org/series/99259/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
f73008bac9a8db0779264b170f630483e9165764 tests/i915/gem_exec_capture: Fix m=
emory object size in gem_exec_capture

[254/439] Linking target tests/gem_pread.
[255/439] Linking target tests/gem_pread_after_blit.
[256/439] Linking target tests/gem_pxp.
[257/439] Linking target tests/gem_pwrite_snooped.
[258/439] Linking target tests/gem_read_read_speed.
[259/439] Linking target tests/gem_readwrite.
[260/439] Linking target tests/gem_reg_read.
[261/439] Linking target tests/gem_render_copy.
[262/439] Linking target tests/gem_render_copy_redux.
[263/439] Linking target tests/gem_render_linear_blits.
[264/439] Linking target tests/gem_reset_stats.
[265/439] Linking target tests/gem_render_tiled_blits.
[266/439] Linking target tests/gem_request_retire.
[267/439] Linking target tests/gem_ringfill.
[268/439] Linking target tests/gem_set_tiling_vs_gtt.
[269/439] Linking target tests/gem_set_tiling_vs_blt.
[270/439] Linking target tests/gem_set_tiling_vs_pwrite.
[271/439] Linking target tests/gem_shrink.
[272/439] Linking target tests/gem_tiled_pread_pwrite.
[273/439] Linking target tests/gem_sync.
[274/439] Linking target tests/gem_softpin.
[275/439] Linking target tests/gem_spin_batch.
[276/439] Linking target tests/gem_streaming_writes.
[277/439] Linking target tests/gem_tiled_blits.
[278/439] Linking target tests/gem_tiled_fence_blits.
[279/439] Linking target tests/gem_tiled_partial_pwrite_pread.
[280/439] Linking target tests/gem_tiled_pread_basic.
[281/439] Linking target tests/gem_tiled_swapping.
[282/439] Linking target tests/gem_tiled_wc.
[283/439] Linking target tests/gem_tiled_wb.
[284/439] Linking target tests/gem_tiling_max_stride.
[285/439] Linking target tests/gem_unfence_active_buffers.
[286/439] Linking target tests/gem_unref_active_buffers.
[287/439] Linking target tests/gem_userptr_blits.
[288/439] Linking target tests/gem_vm_create.
[289/439] Linking target tests/i915_fb_tiling.
[290/439] Linking target tests/gem_wait.
[291/439] Linking target tests/gem_watchdog.
[292/439] Linking target tests/gem_workarounds.
[293/439] Compiling C object 'tests/tests@@i915_hangman@exe/i915_i915_hangm=
an.c.o'.
FAILED: tests/tests@@i915_hangman@exe/i915_i915_hangman.c.o=20
ccache cc -Itests/tests@@i915_hangman@exe -Itests -I../tests -I../include/d=
rm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I. =
-I../ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-=
gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/libpng16 -I/usr=
/include/freetype2 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/inc=
lude/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/=
usr/include -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalwa=
ys -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 =
-O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function=
-cast -Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0=
 -Wlogical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-n=
oreturn -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpoin=
ter-arith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -W=
unused -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializ=
ers -Wno-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-param=
eter -Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3D=
implicit -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -=
Werror=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -We=
rror=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dw=
rite-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread  -MD=
 -MQ 'tests/tests@@i915_hangman@exe/i915_i915_hangman.c.o' -MF 'tests/tests=
@@i915_hangman@exe/i915_i915_hangman.c.o.d' -o 'tests/tests@@i915_hangman@e=
xe/i915_i915_hangman.c.o' -c ../tests/i915/i915_hangman.c
../tests/i915/i915_hangman.c: In function =E2=80=98do_tests=E2=80=99:
../tests/i915/i915_hangman.c:448:8: error: implicit declaration of function=
 =E2=80=98IS_DG2=E2=80=99; did you mean =E2=80=98IS_DG1=E2=80=99? [-Werror=
=3Dimplicit-function-declaration]
    if (IS_DG2(intel_get_drm_devid(device)) &&
        ^~~~~~
        IS_DG1
../tests/i915/i915_hangman.c:448:8: warning: nested extern declaration of =
=E2=80=98IS_DG2=E2=80=99 [-Wnested-externs]
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

