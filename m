Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Mon, 31 Oct 2022 19:14:10 -0000
Message-ID: <166724365041.2016.1915869622123168736@emeril.freedesktop.org>
References: <20221031181746.4143408-1-vikas.srivastava@intel.com>
In-Reply-To: <20221031181746.4143408-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?/i915/gem=5Flinear=5Fblits=3A_Added_COPY_Commands_modification_?=
 =?utf-8?q?for_MTL?=
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

Series: test/i915/gem_linear_blits: Added COPY Commands modification for MTL
URL   : https://patchwork.freedesktop.org/series/110337/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
372c56225e12578a7a4a6bcc5b79eb40b643fcde runner: Disable socket communicati=
ons for now

[249/617] Linking target tests/gem_media_fill.
[250/617] Linking target tests/gem_media_vme.
[251/617] Linking target tests/gem_mmap.
[252/617] Linking target tests/gem_mmap_gtt.
[253/617] Linking target tests/gem_mmap_wc.
[254/617] Linking target tests/gem_partial_pwrite_pread.
[255/617] Linking target tests/gem_pipe_control_store_loop.
[256/617] Linking target tests/gem_pread_after_blit.
[257/617] Linking target tests/gem_pwrite.
[258/617] Linking target tests/gem_pxp.
[259/617] Linking target tests/gem_read_read_speed.
[260/617] Linking target tests/gem_readwrite.
[261/617] Linking target tests/gem_reg_read.
[262/617] Linking target tests/gem_render_copy_redux.
[263/617] Linking target tests/gem_render_copy.
[264/617] Linking target tests/gem_render_linear_blits.
[265/617] Linking target tests/gem_render_tiled_blits.
[266/617] Linking target tests/gem_request_retire.
[267/617] Linking target tests/gem_reset_stats.
[268/617] Linking target tests/gem_ringfill.
[269/617] Linking target tests/gem_set_tiling_vs_blt.
[270/617] Linking target tests/gem_set_tiling_vs_gtt.
[271/617] Linking target tests/gem_set_tiling_vs_pwrite.
[272/617] Linking target tests/gem_shrink.
[273/617] Linking target tests/gem_softpin.
[274/617] Linking target tests/gem_spin_batch.
[275/617] Linking target tests/gem_streaming_writes.
[276/617] Linking target tests/gem_sync.
[277/617] Linking target tests/gem_tiled_fence_blits.
[278/617] Linking target tests/gem_tiled_blits.
[279/617] Linking target tests/gem_tiled_partial_pwrite_pread.
[280/617] Linking target tests/gem_tiled_pread_basic.
[281/617] Linking target tests/gem_tiled_pread_pwrite.
[282/617] Linking target tests/gem_tiled_swapping.
[283/617] Linking target tests/gem_tiled_wb.
[284/617] Linking target tests/gem_tiled_wc.
[285/617] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/i915_gem=
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
../../../usr/src/igt-gpu-tools/tests/i915/gem_userptr_blits.c:260:30: error=
: =E2=80=98dst_offset=E2=80=99 undeclared (first use in this function); did=
 you mean =E2=80=98put_offset=E2=80=99?
  260 |                 batch[i++] =3D dst_offset; /* dst reloc */
      |                              ^~~~~~~~~~
      |                              put_offset
../../../usr/src/igt-gpu-tools/tests/i915/gem_userptr_blits.c:260:30: note:=
 each undeclared identifier is reported only once for each function it appe=
ars in
../../../usr/src/igt-gpu-tools/tests/i915/gem_userptr_blits.c:265:30: error=
: =E2=80=98src_offset=E2=80=99 undeclared (first use in this function); did=
 you mean =E2=80=98put_offset=E2=80=99?
  265 |                 batch[i++] =3D src_offset; /* src reloc */
      |                              ^~~~~~~~~~
      |                              put_offset
ninja: build stopped: subcommand failed.

