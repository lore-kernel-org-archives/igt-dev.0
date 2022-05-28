Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: janga.rahul.kumar@intel.com
Date: Sat, 28 May 2022 15:01:14 -0000
Message-ID: <165375007495.24491.8517609776052850909@emeril.freedesktop.org>
References: <20220527121207.766721-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20220527121207.766721-1-janga.rahul.kumar@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBIQVgg?=
 =?utf-8?q?add_test_description_to_gem=5Frender=5Ftiled=5Fblits?=
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

Series: HAX add test description to gem_render_tiled_blits
URL   : https://patchwork.freedesktop.org/series/104470/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
58a5a2d5be19b916311541401aaa48b787f9a185 lib/igt_kms: Set pipe->plane_prima=
ry to driver-assigned primary plane when there are multiple possible primar=
y planes

[422/645] Linking target tests/gem_exec_store
[423/645] Linking target tests/gem_exec_suspend
[424/645] Linking target tests/gem_fenced_exec_thrash
[425/645] Linking target tests/gem_fd_exhaustion
[426/645] Linking target tests/gem_fence_thrash
[427/645] Linking target tests/gem_fence_upload
[428/645] Linking target tests/gem_flink_basic
[429/645] Linking target tests/gem_flink_race
[430/645] Linking target tests/gem_gpgpu_fill
[431/645] Linking target tests/gem_gtt_cpu_tlb
[432/645] Linking target tests/gem_gtt_hog
[433/645] Linking target tests/gem_gtt_speed
[434/645] Linking target tests/gem_huc_copy
[435/645] Linking target tests/gem_linear_blits
[436/645] Linking target tests/gem_lmem_swapping
[437/645] Linking target tests/gem_lut_handle
[438/645] Linking target tests/gem_madvise
[439/645] Linking target tests/gem_media_fill
[440/645] Linking target tests/gem_media_vme
[441/645] Linking target tests/gem_partial_pwrite_pread
[442/645] Linking target tests/gem_mmap_gtt
[443/645] Linking target tests/gem_mmap
[444/645] Linking target tests/gem_mmap_wc
[445/645] Linking target tests/gem_pipe_control_store_loop
[446/645] Linking target tests/gem_ppgtt
[447/645] Linking target tests/gem_pread
[448/645] Linking target tests/gem_pread_after_blit
[449/645] Linking target tests/gem_pwrite
[450/645] Linking target tests/gem_pwrite_snooped
[451/645] Linking target tests/gem_pxp
[452/645] Linking target tests/gem_read_read_speed
[453/645] Linking target tests/gem_readwrite
[454/645] Compiling C object tests/gem_render_tiled_blits.p/i915_gem_render=
_tiled_blits.c.o
FAILED: tests/gem_render_tiled_blits.p/i915_gem_render_tiled_blits.c.o=20
ccache cc -Itests/gem_render_tiled_blits.p -Itests -I../tests -I../include/=
drm-uapi -I../include/linux-uapi -Ilib -I../lib -I../lib/stubs/syscalls -I.=
 -I.. -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-=
gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/us=
r/include/libpng16 -I/usr/include/libpng12 -I/usr/include/libdrm -I/usr/inc=
lude/libdrm/nouveau -I/usr/include/x86_64-linux-gnu -I/usr/include/alsa -I/=
usr/include -I/home/cidrm/kernel_headers/include -fdiagnostics-color=3Dalwa=
ys -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -std=3Dgnu11 -O2 -g=
 -D_GNU_SOURCE -include config.h -D_FORTIFY_SOURCE=3D2 -Wbad-function-cast =
-Wdeclaration-after-statement -Wformat=3D2 -Wimplicit-fallthrough=3D0 -Wlog=
ical-op -Wmissing-declarations -Wmissing-format-attribute -Wmissing-noretur=
n -Wmissing-prototypes -Wnested-externs -Wold-style-definition -Wpointer-ar=
ith -Wredundant-decls -Wshadow -Wstrict-prototypes -Wuninitialized -Wunused=
 -Wno-clobbered -Wno-maybe-uninitialized -Wno-missing-field-initializers -W=
no-pointer-arith -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -=
Wno-unused-result -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplic=
it -Werror=3Dinit-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=
=3Dmissing-braces -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=
=3Dreturn-type -Werror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite=
-strings -fno-builtin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ =
tests/gem_render_tiled_blits.p/i915_gem_render_tiled_blits.c.o -MF tests/ge=
m_render_tiled_blits.p/i915_gem_render_tiled_blits.c.o.d -o tests/gem_rende=
r_tiled_blits.p/i915_gem_render_tiled_blits.c.o -c ../tests/i915/gem_render=
_tiled_blits.c
../tests/i915/gem_render_tiled_blits.c:61:1: error: expected =E2=80=98,=E2=
=80=99 or =E2=80=98;=E2=80=99 before =E2=80=98static=E2=80=99
 static igt_render_copyfunc_t render_copy;
 ^~~~~~
../tests/i915/gem_render_tiled_blits.c: In function =E2=80=98check_buf=E2=
=80=99:
../tests/i915/gem_render_tiled_blits.c:73:2: error: implicit declaration of=
 function =E2=80=98render_copy=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
  render_copy(ibb, buf, 0, 0, WIDTH, HEIGHT, &linear, 0, 0);
  ^~~~~~~~~~~
../tests/i915/gem_render_tiled_blits.c:73:2: warning: nested extern declara=
tion of =E2=80=98render_copy=E2=80=99 [-Wnested-externs]
../tests/i915/gem_render_tiled_blits.c: In function =E2=80=98run_test=E2=80=
=99:
../tests/i915/gem_render_tiled_blits.c:106:2: error: =E2=80=98render_copy=
=E2=80=99 undeclared (first use in this function)
  render_copy =3D igt_get_render_copyfunc(devid);
  ^~~~~~~~~~~
../tests/i915/gem_render_tiled_blits.c:106:2: note: each undeclared identif=
ier is reported only once for each function it appears in
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

