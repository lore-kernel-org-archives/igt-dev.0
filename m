Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Tue, 08 Nov 2022 09:17:00 -0000
Message-ID: <166789902081.2236.13196822402072929898@emeril.freedesktop.org>
References: <20221108085620.708785-1-vikas.srivastava@intel.com>
In-Reply-To: <20221108085620.708785-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBpOTE1?=
 =?utf-8?q?/gem=5Fexec=5Ffence=3A_Replace_customer_spinner_with_igt=5Fspin?=
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

Series: i915/gem_exec_fence: Replace customer spinner with igt_spin
URL   : https://patchwork.freedesktop.org/series/110655/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
9cea1d05f492429a6d793995b87081e87a94b492 tests/prime_vgem: Fix timeout/inco=
mplete issue in MTL simulation

[180/706] Linking target tests/api_intel_allocator.
[181/706] Linking target tests/api_intel_bb.
[182/706] Linking target tests/gem_bad_reloc.
[183/706] Linking target tests/gen3_mixed_blits.
[184/706] Linking target tests/gen3_render_linear_blits.
[185/706] Linking target tests/gen3_render_mixed_blits.
[186/706] Linking target tests/gen3_render_tiledx_blits.
[187/706] Linking target tests/gen3_render_tiledy_blits.
[188/706] Linking target tests/gem_basic.
[189/706] Linking target tests/gem_blits.
[190/706] Linking target tests/gem_ccs.
[191/706] Linking target tests/gem_busy.
[192/706] Linking target tests/gem_caching.
[193/706] Linking target tests/gem_close.
[194/706] Linking target tests/gem_close_race.
[195/706] Linking target tests/gem_cs_tlb.
[196/706] Linking target tests/gem_concurrent_blit.
[197/706] Linking target tests/gem_ctx_bad_destroy.
[198/706] Linking target tests/gem_ctx_exec.
[199/706] Linking target tests/gem_ctx_create.
[200/706] Linking target tests/gem_ctx_engines.
[201/706] Linking target tests/gem_ctx_isolation.
[202/706] Linking target tests/gem_ctx_param.
[203/706] Linking target tests/gem_ctx_persistence.
[204/706] Linking target tests/gem_ctx_shared.
[205/706] Linking target tests/gem_ctx_switch.
[206/706] Linking target tests/gem_evict_alignment.
[207/706] Linking target tests/gem_evict_everything.
[208/706] Linking target tests/gem_exec_alignment.
[209/706] Linking target tests/gem_exec_async.
[210/706] Linking target tests/gem_exec_await.
[211/706] Linking target tests/gem_exec_basic.
[212/706] Linking target tests/gem_exec_big.
[213/706] Linking target tests/gem_exec_endless.
[214/706] Linking target tests/gem_exec_capture.
[215/706] Linking target tests/gem_exec_create.
[216/706] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/i915_gem_ex=
ec_fence.c.o'.
FAILED: tests/59830eb@@gem_exec_fence@exe/i915_gem_exec_fence.c.o=20
cc -Itests/59830eb@@gem_exec_fence@exe -Itests -I../../../usr/src/igt-gpu-t=
ools/tests -I../../../usr/src/igt-gpu-tools/include/drm-uapi -I../../../usr=
/src/igt-gpu-tools/include/linux-uapi -Ilib -I../../../usr/src/igt-gpu-tool=
s/lib -I../../../usr/src/igt-gpu-tools/lib/stubs/syscalls -I. -I../../../us=
r/src/igt-gpu-tools/ -I/usr/include/cairo -I/usr/include/glib-2.0 -I/usr/li=
b/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/=
uuid -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/libdrm=
 -I/usr/include/x86_64-linux-gnu -I/usr/include/valgrind -I/usr/include -fd=
iagnostics-color=3Dalways -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pc=
h -Wextra -std=3Dgnu11 -O2 -g -D_GNU_SOURCE -include config.h -D_FORTIFY_SO=
URCE=3D2 -Wbad-function-cast -Wdeclaration-after-statement -Wformat=3D2 -Wi=
mplicit-fallthrough=3D0 -Wlogical-op -Wmissing-declarations -Wmissing-forma=
t-attribute -Wmissing-noreturn -Wmissing-prototypes -Wnested-externs -Wold-=
style-definition -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-protot=
ypes -Wuninitialized -Wunused -Wno-clobbered -Wno-maybe-uninitialized -Wno-=
missing-field-initializers -Wno-pointer-arith -Wno-address-of-packed-member=
 -Wno-sign-compare -Wno-type-limits -Wno-unused-parameter -Wno-unused-resul=
t -Werror=3Daddress -Werror=3Darray-bounds -Werror=3Dimplicit -Werror=3Dini=
t-self -Werror=3Dint-to-pointer-cast -Werror=3Dmain -Werror=3Dmissing-brace=
s -Werror=3Dnonnull -Werror=3Dpointer-to-int-cast -Werror=3Dreturn-type -We=
rror=3Dsequence-point -Werror=3Dtrigraphs -Werror=3Dwrite-strings -fno-buil=
tin-malloc -fno-builtin-calloc -fcommon -pthread -MD -MQ 'tests/59830eb@@ge=
m_exec_fence@exe/i915_gem_exec_fence.c.o' -MF 'tests/59830eb@@gem_exec_fenc=
e@exe/i915_gem_exec_fence.c.o.d' -o 'tests/59830eb@@gem_exec_fence@exe/i915=
_gem_exec_fence.c.o' -c ../../../usr/src/igt-gpu-tools/tests/i915/gem_exec_=
fence.c
../../../usr/src/igt-gpu-tools/tests/i915/gem_exec_fence.c: In function =E2=
=80=98test_fence_busy=E2=80=99:
../../../usr/src/igt-gpu-tools/tests/i915/gem_exec_fence.c:95:21: error: im=
plicit declaration of function =E2=80=98is_sriov_enabled=E2=80=99 [-Werror=
=3Dimplicit-function-declaration]
   95 |                 if (is_sriov_enabled(fd)) timeout *=3D 4;
      |                     ^~~~~~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/gem_exec_fence.c:95:21: warning: =
nested extern declaration of =E2=80=98is_sriov_enabled=E2=80=99 [-Wnested-e=
xterns]
../../../usr/src/igt-gpu-tools/tests/i915/gem_exec_fence.c:104:25: error: =
=E2=80=98elapsed_time=E2=80=99 undeclared (first use in this function)
  104 |                         elapsed_time =3D igt_seconds_elapsed(&tv);
      |                         ^~~~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/i915/gem_exec_fence.c:104:25: note: ea=
ch undeclared identifier is reported only once for each function it appears=
 in
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

