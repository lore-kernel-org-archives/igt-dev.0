Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_Test_for_Engine_busyness?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Fri, 08 Dec 2023 09:01:26 -0000
Message-ID: <170202608639.7326.3117658965715524466@emeril.freedesktop.org>
References: <20231208085251.3798137-1-riana.tauro@intel.com>
In-Reply-To: <20231208085251.3798137-1-riana.tauro@intel.com>
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

Series: Test for Engine busyness
URL   : https://patchwork.freedesktop.org/series/127557/
State : failure

=3D=3D Summary =3D=3D

IGT patchset build failed on latest successful build
431c2d2dd5828b25fcbe1c82afbac865f4771aee tests/intel/xe_create: create-big-=
vram subtest

Tail of build.log:
[849/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_chv.c.o'.
[850/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_icl.c.o'.
[851/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_cnl.c.o'.
[852/1662] Compiling C object 'overlay/b4b33d2@@intel-gpu-overlay@exe/overl=
ay.c.o'.
[853/1662] Compiling C object 'runner/527aa9f@@igt_runner@sta/resultgen.c.o=
'.
[854/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_bxt.c.o'.
[855/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_glk.c.o'.
[856/1662] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/main.c.=
o'.
[857/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_cflgt3.c.o'.
[858/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_tglgt2.c.o'.
[859/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_registers_mtlgt3.c.o'.
[860/1662] Compiling C object 'tests/59830eb@@gem_concurrent_all@exe/intel_=
gem_concurrent_all.c.o'.
[861/1662] Linking target overlay/intel-gpu-overlay.
FAILED: overlay/intel-gpu-overlay=20
cc  -o overlay/intel-gpu-overlay 'overlay/b4b33d2@@intel-gpu-overlay@exe/ch=
art.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/config.c.o' 'overlay/b4b33=
d2@@intel-gpu-overlay@exe/cpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@=
exe/debugfs.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-interrupts.c.o=
' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gem-objects.c.o' 'overlay/b4b33d2=
@@intel-gpu-overlay@exe/gpu-top.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@ex=
e/gpu-perf.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/gpu-freq.c.o' 'over=
lay/b4b33d2@@intel-gpu-overlay@exe/overlay.c.o' 'overlay/b4b33d2@@intel-gpu=
-overlay@exe/power.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/rc6.c.o' 'o=
verlay/b4b33d2@@intel-gpu-overlay@exe/x11_dri2.c.o' 'overlay/b4b33d2@@intel=
-gpu-overlay@exe/x11_rgb2yuv.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x=
11_x11-overlay.c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_x11-window.=
c.o' 'overlay/b4b33d2@@intel-gpu-overlay@exe/x11_position.c.o' 'overlay/b4b=
33d2@@intel-gpu-overlay@exe/kms_kms-overlay.c.o' -Wl,--as-needed -Wl,--no-u=
ndefined -Wl,--start-group lib/libigt_perf.a -lrt -lm /usr/lib/x86_64-linux=
-gnu/libcairo.so /usr/lib/x86_64-linux-gnu/libpciaccess.so /usr/lib/x86_64-=
linux-gnu/libdrm.so /usr/lib/x86_64-linux-gnu/libdrm_intel.so /usr/lib/x86_=
64-linux-gnu/libXv.so /usr/lib/x86_64-linux-gnu/libX11.so /usr/lib/x86_64-l=
inux-gnu/libXext.so -Wl,--end-group '-Wl,-rpath,$ORIGIN/../lib' -Wl,-rpath-=
link,/opt/igt/build/lib
/usr/bin/ld: lib/libigt_perf.a(igt_perf.c.o): in function `igt_perf_event_f=
ound':
/opt/igt/build/../../../usr/src/igt-gpu-tools/lib/igt_perf.c:154: undefined=
 reference to `__igt_fail_assert'
collect2: error: ld returned 1 exit status
[862/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_kblgt2.c.o'.
[863/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_cflgt2.c.o'.
[864/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_sklgt2.c.o'.
[865/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_kblgt3.c.o'.
[866/1662] Compiling C object 'tools/f9d35d4@@intel_vbt_decode@exe/intel_vb=
t_decode.c.o'.
[867/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_ehl.c.o'.
[868/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_bdw.c.o'.
[869/1662] Compiling C object 'tools/f9d35d4@@intel_audio_dump@exe/intel_au=
dio_dump.c.o'.
[870/1662] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c=
.o'.
[871/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_adl.c.o'.
[872/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_dg1.c.o'.
[873/1662] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/=
intel_kms_frontbuffer_tracking.c.o'.
[874/1662] Compiling C object 'runner/527aa9f@@igt_runner@sta/executor.c.o'.
[875/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_registers_acmgt1.c.o'.
[876/1662] Compiling C object 'benchmarks/cb1d2fd@@gem_wsim@exe/gem_wsim.c.=
o'.
[877/1662] Compiling C object 'assembler/1ca89e8@@brw@sta/brw_eu_emit.c.o'.
[878/1662] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meson-g=
enerated_lex.c.o'.
[879/1662] Compiling C object 'tools/f9d35d4@@intel_gpu_top@exe/intel_gpu_t=
op.c.o'.
[880/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_registers_acmgt2.c.o'.
[881/1662] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[882/1662] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_g=
em_exec_schedule.c.o'.
[883/1662] Linking target lib/libigt.so.0.
[884/1662] Compiling C object 'assembler/1ca89e8@@intel-gen4asm@exe/meson-g=
enerated_gram.c.o'.
[885/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_registers_acmgt3.c.o'.
[886/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_equations.c.o'.
[887/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_mtlgt2.c.o'.
[888/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_mtlgt3.c.o'.
[889/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_acmgt1.c.o'.
[890/1662] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests=
.c.o'.
[891/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_acmgt2.c.o'.
[892/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.=
._i915_perf_metrics_acmgt3.c.o'.
ninja: build stopped: subcommand failed.

