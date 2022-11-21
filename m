Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Mon, 21 Nov 2022 18:07:59 -0000
Message-ID: <166905407987.22096.18002566907111709400@emeril.freedesktop.org>
References: <20221121170257.2022727-1-vikas.srivastava@intel.com>
In-Reply-To: <20221121170257.2022727-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/i915/gem=5Fuserptr=5Fblits=3A_Added_XY=5FFAST=5FCOPY=5FBLT_Co?=
 =?utf-8?q?mmand_for_MTL_=28rev3=29?=
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

Series: tests/i915/gem_userptr_blits: Added XY_FAST_COPY_BLT Command for MT=
L (rev3)
URL   : https://patchwork.freedesktop.org/series/111133/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
40a2de5cc6a6b43af7da7905bfe1ede9d9a3200c tests/i915/gem_exec_fence: Replaci=
ng custom spinner with igt_spin

[242/616] Linking target tests/gem_huc_copy.
[243/616] Linking target tests/gem_linear_blits.
[244/616] Linking target tests/gem_lmem_swapping.
[245/616] Linking target tests/gem_lut_handle.
[246/616] Linking target tests/gem_madvise.
[247/616] Linking target tests/gem_media_fill.
[248/616] Linking target tests/gem_media_vme.
[249/616] Linking target tests/gem_mmap.
[250/616] Linking target tests/gem_mmap_gtt.
[251/616] Linking target tests/gem_partial_pwrite_pread.
[252/616] Linking target tests/gem_ppgtt.
[253/616] Linking target tests/gem_pread.
[254/616] Linking target tests/gem_pread_after_blit.
[255/616] Linking target tests/gem_pwrite.
[256/616] Linking target tests/gem_pwrite_snooped.
[257/616] Linking target tests/gem_pxp.
[258/616] Linking target tests/gem_read_read_speed.
[259/616] Linking target tests/gem_readwrite.
[260/616] Linking target tests/gem_reg_read.
[261/616] Linking target tests/gem_render_copy.
[262/616] Linking target tests/gem_render_copy_redux.
[263/616] Linking target tests/gem_request_retire.
[264/616] Linking target tests/gem_render_tiled_blits.
[265/616] Linking target tests/gem_render_linear_blits.
[266/616] Linking target tests/gem_ringfill.
[267/616] Linking target tests/gem_reset_stats.
[268/616] Linking target tests/gem_set_tiling_vs_blt.
[269/616] Linking target tests/gem_set_tiling_vs_gtt.
[270/616] Linking target tests/gem_set_tiling_vs_pwrite.
[271/616] Linking target tests/gem_shrink.
[272/616] Linking target tests/gem_softpin.
[273/616] Linking target tests/gem_spin_batch.
[274/616] Linking target tests/gem_streaming_writes.
[275/616] Linking target tests/gem_sync.
[276/616] Linking target tests/gem_tiled_blits.
[277/616] Linking target tests/gem_tiled_partial_pwrite_pread.
[278/616] Linking target tests/gem_tiled_fence_blits.
[279/616] Linking target tests/gem_tiled_pread_basic.
[280/616] Linking target tests/gem_tiled_pread_pwrite.
[281/616] Linking target tests/gem_tiled_swapping.
[282/616] Linking target tests/gem_tiled_wb.
[283/616] Linking target tests/gem_tiled_wc.
[284/616] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/i915_gem=
_userptr_blits.c.o'.
FAILED: tests/59830eb@@gem_userptr_blits@exe/i915_gem_userptr_blits.c.o=20
cc -Itests/59830eb@@gem_userptr_blits@exe -Itests -I../../../usr/src/igt-gp=
u-tools/tests -I../../../usr/src/igt-gpu-tools/include/drm-uapi -I../../../=
usr/src/igt-gpu-tools/include/linux-uapi -Ilib -I../../../usr/src/igt-gpu-t=
ools/lib -I../../../usr/src/igt-gpu-tools/lib/stubs/syscalls -I. -I../../..=
/usr/src/igt-gpu-tools/ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr=
/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/inclu=
de/uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/lib=
drm -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/include =
-fdiagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid=
-pch -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY=
_SOURCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 =
-Wimplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-fo=
rmat-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wo=
ld-style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-pro=
totypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -W=
no-missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-mem=
ber -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-re=
sult -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3D=
init-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-br=
aces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type =
-Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-b=
uiltin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/59830eb@=
@gem_userptr_blits@exe/i915_gem_userptr_blits.c.o' -MF 'tests/59830eb@@gem_=
userptr_blits@exe/i915_gem_userptr_blits.c.o.d' -o 'tests/59830eb@@gem_user=
ptr_blits@exe/i915_gem_userptr_blits.c.o' -c ../../../usr/src/igt-gpu-tools=
/tests/i915/gem_userptr_blits.c
../../../usr/src/igt-gpu-tools/tests/i915/gem_userptr_blits.c: In function =
=E2=80=98blit=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/i915/gem_userptr_blits.c:235:16: error=
: expected expression before =E2=80=98;=E2=80=99 token
  235 |   batch[i++] =3D ;/* dst address */
      |                ^
ninja: build stopped: subcommand failed.

