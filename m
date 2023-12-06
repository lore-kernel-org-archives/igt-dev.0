Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Wed, 06 Dec 2023 12:27:25 -0000
Message-ID: <170186564527.26426.8505865855517504929@emeril.freedesktop.org>
References: <20231206114733.16121-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206114733.16121-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBSRkM6?=
 =?utf-8?q?_drm-uapi/xe=3A_add_exec=5Fqueue=5Fid_member_to_drm=5Fxe=5Fwait?=
 =?utf-8?q?=5Fuser=5Ffence_structure_=28rev3=29?=
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

== Series Details ==

Series: RFC: drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence structure (rev3)
URL   : https://patchwork.freedesktop.org/series/127364/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
f42cda2a9ad74846fb59eea436cc98c8789849f9 lib/igt_core: initialize srandom seed on startup

Tail of build.log:
      |            void *
In file included from ../../../usr/src/igt-gpu-tools/tests/intel/xe_exec_threads.c:21:
../../../usr/src/igt-gpu-tools/lib/xe/xe_ioctl.h:92:19: note: expected ‘uint32_t’ {aka ‘unsigned int’} but argument is of type ‘void *’
   92 |          uint32_t exec_queue,int64_t timeout);
      |          ~~~~~~~~~^~~~~~~~~~
../../../usr/src/igt-gpu-tools/tests/intel/xe_exec_threads.c:433:57: warning: passing argument 4 of ‘xe_wait_ufence’ makes integer from pointer without a cast [-Wint-conversion]
  433 |  xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, fence_timeout);
      |                                                         ^~~~
      |                                                         |
      |                                                         void *
In file included from ../../../usr/src/igt-gpu-tools/tests/intel/xe_exec_threads.c:21:
../../../usr/src/igt-gpu-tools/lib/xe/xe_ioctl.h:92:19: note: expected ‘uint32_t’ {aka ‘unsigned int’} but argument is of type ‘void *’
   92 |          uint32_t exec_queue,int64_t timeout);
      |          ~~~~~~~~~^~~~~~~~~~
[690/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_dg1.c.o'.
[691/1662] Compiling C object 'tests/59830eb@@kms_chamelium_hpd@exe/chamelium_kms_chamelium_hpd.c.o'.
[692/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_adl.c.o'.
[693/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_chv.c.o'.
[694/1662] Compiling C object 'tests/59830eb@@kms_chamelium_frames@exe/chamelium_kms_chamelium_frames.c.o'.
[695/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_kblgt3.c.o'.
[696/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_cflgt3.c.o'.
[697/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_tglgt1.c.o'.
[698/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_sklgt3.c.o'.
[699/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_sklgt2.c.o'.
[700/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_sklgt4.c.o'.
[701/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_glk.c.o'.
[702/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_cnl.c.o'.
[703/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_bxt.c.o'.
[704/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_cflgt2.c.o'.
[705/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_kblgt2.c.o'.
[706/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_bdw.c.o'.
[707/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_rkl.c.o'.
[708/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_dg1.c.o'.
[709/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_icl.c.o'.
[710/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_tglgt2.c.o'.
[711/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_adl.c.o'.
[712/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_ehl.c.o'.
[713/1662] Compiling C object 'tests/59830eb@@gem_exec_fence@exe/intel_gem_exec_fence.c.o'.
[714/1662] Compiling C object 'tests/59830eb@@xe_vm@exe/intel_xe_vm.c.o'.
[715/1662] Compiling C object 'tests/59830eb@@kms_frontbuffer_tracking@exe/intel_kms_frontbuffer_tracking.c.o'.
[716/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt1.c.o'.
[717/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_registers_acmgt2.c.o'.
[718/1662] Compiling C object 'tests/59830eb@@perf_pmu@exe/intel_perf_pmu.c.o'.
[719/1662] Compiling C object 'tests/59830eb@@perf@exe/intel_perf.c.o'.
[720/1662] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/intel_gem_exec_schedule.c.o'.
[721/1662] Linking target lib/libigt.so.0.
[722/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_equations.c.o'.
[723/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt1.c.o'.
[724/1662] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
ninja: build stopped: subcommand failed.

