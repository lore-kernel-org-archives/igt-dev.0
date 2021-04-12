Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 12 Apr 2021 14:41:31 -0000
Message-ID: <161823849126.8702.15015532596359200094@emeril.freedesktop.org>
References: <20210412111808.137038-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210412111808.137038-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_I?=
 =?utf-8?q?ntroduce_IGT_allocator_=28rev35=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Introduce IGT allocator (rev35)
URL   : https://patchwork.freedesktop.org/series/82954/
State : warning

== Summary ==

Pipeline status: FAILED.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/299602 for the overview.

build:tests-debian-meson-mips has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/8768232):
  ninja: build stopped: subcommand failed.
  ninja: Entering directory `build'
  [1/563] Generating version.h with a custom command.
  [2/559] Linking target lib/libigt.so.0.
  FAILED: lib/libigt.so.0 
  /usr/bin/mips-linux-gnu-gcc  -o lib/libigt.so.0 'lib/76b5a35@@igt@sha/dummy.c.o' -Wl,--no-undefined -Wl,--as-needed -shared -fPIC -Wl,--start-group -Wl,-soname,libigt.so.0 -Wl,--whole-archive lib/libigt-drmtest_c.a lib/libigt-huc_copy_c.a lib/libigt-i915_gem_c.a lib/libigt-i915_gem_context_c.a lib/libigt-i915_gem_create_c.a lib/libigt-i915_gem_engine_topology_c.a lib/libigt-i915_gem_scheduler_c.a lib/libigt-i915_gem_submission_c.a lib/libigt-i915_gem_ring_c.a lib/libigt-i915_gem_mman_c.a lib/libigt-i915_gem_vm_c.a lib/libigt-igt_collection_c.a lib/libigt-igt_color_encoding_c.a lib/libigt-igt_debugfs_c.a lib/libigt-igt_device_c.a lib/libigt-igt_device_scan_c.a lib/libigt-igt_aux_c.a lib/libigt-igt_gt_c.a lib/libigt-igt_halffloat_c.a lib/libigt-igt_matrix_c.a lib/libigt-igt_params_c.a lib/libigt-igt_perf_c.a lib/libigt-igt_primes_c.a lib/libigt-igt_rand_c.a lib/libigt-igt_rapl_c.a lib/libigt-igt_stats_c.a lib/libigt-igt_syncobj_c.a lib/libigt-igt_sysfs_c.a lib/libigt-igt_sysrq_c.a li
 b/libigt-igt_taints_c.a lib/libigt-igt_thread_c.a lib/libigt-igt_vec_c.a lib/libigt-igt_vgem_c.a lib/libigt-igt_x86_c.a lib/libigt-instdone_c.a lib/libigt-intel_allocator_c.a lib/libigt-intel_allocator_msgchannel_c.a lib/libigt-intel_allocator_random_c.a lib/libigt-intel_allocator_reloc_c.a lib/libigt-intel_allocator_simple_c.a lib/libigt-intel_batchbuffer_c.a lib/libigt-intel_bufops_c.a lib/libigt-intel_chipset_c.a lib/libigt-intel_device_info_c.a lib/libigt-intel_os_c.a lib/libigt-intel_mmio_c.a lib/libigt-ioctl_wrappers_c.a lib/libigt-media_spin_c.a lib/libigt-media_fill_c.a lib/libigt-gpgpu_fill_c.a lib/libigt-gpu_cmds_c.a lib/libigt-rendercopy_i915_c.a lib/libigt-rendercopy_i830_c.a lib/libigt-rendercopy_gen4_c.a lib/libigt-rendercopy_gen6_c.a lib/libigt-rendercopy_gen7_c.a lib/libigt-rendercopy_gen8_c.a lib/libigt-rendercopy_gen9_c.a lib/libigt-sw_sync_c.a lib/libigt-intel_aux_pgtable_c.a lib/libigt-intel_reg_map_c.a lib/libigt-intel_iosf_c.a lib/libigt-igt_kms_c.a lib/libigt-
 igt_fb_c.a lib/libigt-igt_core_c.a lib/libigt-igt_draw_c.a lib/libigt-igt_list_c.a lib/libigt-igt_map_c.a lib/libigt-igt_pm_c.a lib/libigt-igt_dummyload_c.a lib/libigt-uwildmat_uwildmat_c.a lib/libigt-igt_kmod_c.a lib/libigt-igt_panfrost_c.a lib/libigt-igt_v3d_c.a lib/libigt-igt_vc4_c.a lib/libigt-igt_psr_c.a lib/libigt-igt_amd_c.a lib/libigt-igt_edid_c.a lib/libigt-igt_eld_c.a lib/libigt-igt_infoframe_c.a lib/libigt-veboxcopy_gen12_c.a lib/libigt-stubs_drm_intel_bufmgr_c.a lib/libigt-igt_nouveau_c.a lib/libigt-nouveau_cea0b5_c.a lib/libigt-igt_frame_c.a lib/libigt-igt_audio_c.a lib/libigt-igt_alsa_c.a -Wl,--no-whole-archive /usr/lib/mips-linux-gnu/libcairo.so /usr/lib/mips-linux-gnu/libglib-2.0.so /usr/lib/mips-linux-gnu/libdrm.so /usr/lib/mips-linux-gnu/libdw.so /usr/lib/mips-linux-gnu/libelf.so /usr/lib/mips-linux-gnu/libkmod.so /usr/lib/mips-linux-gnu/libprocps.so /lib/mips-linux-gnu/libudev.so -lm /usr/lib/mips-linux-gnu/libpciaccess.so /usr/lib/mips-linux-gnu/libpixman-1.so -l
 rt -lz /usr/lib/mips-linux-gnu/libdrm_nouveau.so /usr/lib/mips-linux-gnu/libunwind.so /usr/lib/mips-linux-gnu/libgsl.so /usr/lib/mips-linux-gnu/libgslcblas.so -lm /usr/lib/mips-linux-gnu/libasound.so -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -l
 m -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -lm -lrt -lz -lm -Wl,--end-group -pthread  
  /usr/lib/gcc-cross/mips-linux-gnu/8/../../../../mips-linux-gnu/bin/ld: lib/libigt-intel_allocator_c.a(intel_allocator.c.o): in function `__handle_create':
  /builds/gfx-ci/igt-ci-tags/build/../lib/intel_allocator.c:174: undefined reference to `__atomic_fetch_add_8'
  /usr/lib/gcc-cross/mips-linux-gnu/8/../../../../mips-linux-gnu/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/intel_allocator.c:174: undefined reference to `__atomic_fetch_add_8'
  /usr/lib/gcc-cross/mips-linux-gnu/8/../../../../mips-linux-gnu/bin/ld: lib/libigt-intel_allocator_c.a(intel_allocator.c.o): in function `intel_allocator_init':
  /builds/gfx-ci/igt-ci-tags/build/../lib/intel_allocator.c:1411: undefined reference to `__atomic_store_8'
  /usr/lib/gcc-cross/mips-linux-gnu/8/../../../../mips-linux-gnu/bin/ld: /builds/gfx-ci/igt-ci-tags/build/../lib/intel_allocator.c:1411: undefined reference to `__atomic_store_8'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.
  section_end:1618238193:step_script
  section_start:1618238193:cleanup_file_variables
  Cleaning up file based variables
  section_end:1618238194:cleanup_file_variables
  ERROR: Job failed: exit code 1

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/299602
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
