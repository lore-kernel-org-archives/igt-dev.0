Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0FF10E34F
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 07:29:53 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B624D5805CB
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 00:29:51 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pesur-007O7N-28
 for igt-dev@lists.freedesktop.org; Wed, 22 Mar 2023 08:29:49 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 08:29:47 +0100
Message-Id: <20230322072947.1760988-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci: update blacklists to work with
 the Xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

It doesn't make sense to run i915 tests with Xe driver and
vice-versa. Update testlists to make it clear.

In order to avoid disrupts at exiting intel-ci tests, keep a
symlink:
	i915-blacklist.txt -> blacklist.txt

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/blacklist.txt      | 130 +----------------------------
 tests/intel-ci/i915-blacklist.txt | 133 ++++++++++++++++++++++++++++++
 tests/intel-ci/xe-blacklist.txt   |  21 +++++
 3 files changed, 155 insertions(+), 129 deletions(-)
 mode change 100644 => 120000 tests/intel-ci/blacklist.txt
 create mode 100644 tests/intel-ci/i915-blacklist.txt
 create mode 100644 tests/intel-ci/xe-blacklist.txt

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
deleted file mode 100644
index 6e5cc43667cf..000000000000
--- a/tests/intel-ci/blacklist.txt
+++ /dev/null
@@ -1,129 +0,0 @@
-igt@meta_test(@.*)?
-###############################################
-# Handle module reloads with great care!
-#
-# Reloading a module is more likely to leave
-# the machine in an unexpected state than other
-# self-contained tests, leading to random
-# failures in tests run afterwards.
-###############################################
-#igt@i915_module_load(@.*)? # danger, danger; hope for taints!
-igt@i915_pm_rpm@module-reload
-igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
-###############################################
-# GEM
-###############################################
-igt@gem_busy@hang.*
-igt@gem_close_race@(?!.*basic).*
-igt@gem_concurrent_blit(@.*)?
-igt@gem_ctx_create@(?!.*basic).*
-igt@gem_ctx_exec@(?!.*basic).*
-igt@gem_ctx_shared@*exhaust*
-igt@gem_ctx_switch(@.*)?
-igt@gem_evict_alignment(@.*)?
-igt@gem_evict_everything(@.*)?
-igt@gem_exec_big@(?!.*single).*
-igt@gem_exec_capture@many-(?!4K-).*
-igt@gem_exec_fair@(?!.*basic).*
-igt@gem_exec_fence@.*hang.*
-igt@gem_exec_flush@(?!.*basic).*
-igt@gem_exec_latency(@.*)?
-igt@gem_exec_lut_handle(@.*)?
-igt@gem_exec_nop@(?!.*basic).*
-igt@gem_exec_reloc@(?!.*basic).*
-igt@gem_exec_suspend@(?!.*basic).*
-igt@gem_exec_whisper@(?!basic).*
-igt@gem_fd_exhaustion(@.*)?
-igt@gem_fence_upload(@.*)?
-igt@gem_gtt_hog(@.*)?
-igt@gem_gtt_speed(@.*)?
-igt@gem_lut_handle(@.*)?
-igt@gem_mmap_gtt@.*(huge|swap|clflush|forked).*
-igt@gem_mmap@.*(swap|huge).*
-igt@gem_pread_after_blit(@.*)?
-igt@gem_pwrite@(?!.*basic).*
-igt@gem_read_read_speed(@.*)?
-igt@gem_render_linear_blits@(?!.*basic).*
-igt@gem_render_tiled_blits@(?!.*basic).*
-igt@gem_reset_stats(@.*)?
-igt@gem_ringfill@(?!.*basic).*
-igt@gem_shrink@(?!reclaim$).*
-igt@gem_softpin@.*(hang|S4).*
-igt@gem_streaming_writes(@.*)?
-igt@gem_sync@(?!.*basic).*
-igt@gem_tiled_swapping@(?!non-threaded).*
-igt@gem_userptr_blits@(major|minor|forked|mlocked|swapping).*
-igt@gem_wait@hang.*
-igt@gem_watchdog@far-fence
-igt@sysfs_heartbeat_interval@(long|off)
-igt@sysfs_preempt_timeout@off
-igt@sysfs_timeslice_duration@off
-###############################################
-# GEM: Not worth fixing
-###############################################
-igt@gen7_exec_parse@.*lri.*
-igt@gem_exec_alignment@pi-shared
-###############################################
-# There are no DRRS capable displays in CI lab
-###############################################
-igt@kms_frontbuffer_tracking@.*drrs.*
-###############################################
-# Tends to generate invalid configurations
-# using CCS planes or configurations that
-# exceed HW capabilities resulting in sporadic
-# failure with -EINVAL.
-#
-# Maintaining extra constraints for Intel's HW
-# is too costly in comparison to the value
-# provided.
-###############################################
-igt@kms_chamelium_frames@hdmi-.*-planes-random
-###############################################
-# Broadcom
-###############################################
-igt@vc4_.*
-igt@v3d_.*
-###############################################
-# AMD
-###############################################
-igt@amdgpu/.*
-###############################################
-# Panfrost
-###############################################
-igt@panfrost_.*
-###############################################
-# Qualcomm
-###############################################
-igt@msm_.*
-###############################################
-# Hibernate: not configured correctly on CI
-###############################################
-igt@.*@.*-hibernate
-igt@gem_softpin@noreloc-s4
-igt@gem_workarounds@hibernate-.*
-igt@gem_exec_suspend@basic-s4$
-igt@gem_ctx_isolation@.*-s4
-###############################################
-# Out-of-memory: spammy and often broken
-###############################################
-igt@i915_suspend@shrink
-###############################################
-# pipe-e, pipe-f no current HW support
-###############################################
-igt@.*@.*pipe-e($|-.*)
-igt@.*@.*pipe-f($|-.*)
-
-###############################################
-# Temporary workarounds for CI-impacting bugs
-###############################################
-
-# Currently fails and leaves the machine in a very bad state, and
-# causes coverage loss for other tests. IOMMU related.
-# https://gitlab.freedesktop.org/drm/intel/-/issues/2644
-igt@core_hotunplug@.*(hot|plug).*
-
-# hangs several gens of hosts, and has no immediate fix
-igt@device_reset@reset-bound
-
-# not working for i915
-igt@kms_bw@.*
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
new file mode 120000
index 000000000000..e48e29e27f4e
--- /dev/null
+++ b/tests/intel-ci/blacklist.txt
@@ -0,0 +1 @@
+i915-blacklist.txt
\ No newline at end of file
diff --git a/tests/intel-ci/i915-blacklist.txt b/tests/intel-ci/i915-blacklist.txt
new file mode 100644
index 000000000000..389a2acb7f44
--- /dev/null
+++ b/tests/intel-ci/i915-blacklist.txt
@@ -0,0 +1,133 @@
+igt@meta_test(@.*)?
+###############################################
+# Handle module reloads with great care!
+#
+# Reloading a module is more likely to leave
+# the machine in an unexpected state than other
+# self-contained tests, leading to random
+# failures in tests run afterwards.
+###############################################
+#igt@i915_module_load(@.*)? # danger, danger; hope for taints!
+igt@i915_pm_rpm@module-reload
+igt@i915_pm_rpm@gem-execbuf-stress-extra-wait
+###############################################
+# GEM
+###############################################
+igt@gem_busy@hang.*
+igt@gem_close_race@(?!.*basic).*
+igt@gem_concurrent_blit(@.*)?
+igt@gem_ctx_create@(?!.*basic).*
+igt@gem_ctx_exec@(?!.*basic).*
+igt@gem_ctx_shared@*exhaust*
+igt@gem_ctx_switch(@.*)?
+igt@gem_evict_alignment(@.*)?
+igt@gem_evict_everything(@.*)?
+igt@gem_exec_big@(?!.*single).*
+igt@gem_exec_capture@many-(?!4K-).*
+igt@gem_exec_fair@(?!.*basic).*
+igt@gem_exec_fence@.*hang.*
+igt@gem_exec_flush@(?!.*basic).*
+igt@gem_exec_latency(@.*)?
+igt@gem_exec_lut_handle(@.*)?
+igt@gem_exec_nop@(?!.*basic).*
+igt@gem_exec_reloc@(?!.*basic).*
+igt@gem_exec_suspend@(?!.*basic).*
+igt@gem_exec_whisper@(?!basic).*
+igt@gem_fd_exhaustion(@.*)?
+igt@gem_fence_upload(@.*)?
+igt@gem_gtt_hog(@.*)?
+igt@gem_gtt_speed(@.*)?
+igt@gem_lut_handle(@.*)?
+igt@gem_mmap_gtt@.*(huge|swap|clflush|forked).*
+igt@gem_mmap@.*(swap|huge).*
+igt@gem_pread_after_blit(@.*)?
+igt@gem_pwrite@(?!.*basic).*
+igt@gem_read_read_speed(@.*)?
+igt@gem_render_linear_blits@(?!.*basic).*
+igt@gem_render_tiled_blits@(?!.*basic).*
+igt@gem_reset_stats(@.*)?
+igt@gem_ringfill@(?!.*basic).*
+igt@gem_shrink@(?!reclaim$).*
+igt@gem_softpin@.*(hang|S4).*
+igt@gem_streaming_writes(@.*)?
+igt@gem_sync@(?!.*basic).*
+igt@gem_tiled_swapping@(?!non-threaded).*
+igt@gem_userptr_blits@(major|minor|forked|mlocked|swapping).*
+igt@gem_wait@hang.*
+igt@gem_watchdog@far-fence
+igt@sysfs_heartbeat_interval@(long|off)
+igt@sysfs_preempt_timeout@off
+igt@sysfs_timeslice_duration@off
+###############################################
+# GEM: Not worth fixing
+###############################################
+igt@gen7_exec_parse@.*lri.*
+igt@gem_exec_alignment@pi-shared
+###############################################
+# There are no DRRS capable displays in CI lab
+###############################################
+igt@kms_frontbuffer_tracking@.*drrs.*
+###############################################
+# Tends to generate invalid configurations
+# using CCS planes or configurations that
+# exceed HW capabilities resulting in sporadic
+# failure with -EINVAL.
+#
+# Maintaining extra constraints for Intel's HW
+# is too costly in comparison to the value
+# provided.
+###############################################
+igt@kms_chamelium_frames@hdmi-.*-planes-random
+###############################################
+# Broadcom
+###############################################
+igt@vc4_.*
+igt@v3d_.*
+###############################################
+# Intel Xe
+###############################################
+igt@xe/.*
+###############################################
+# AMD
+###############################################
+igt@amdgpu/.*
+###############################################
+# Panfrost
+###############################################
+igt@panfrost_.*
+###############################################
+# Qualcomm
+###############################################
+igt@msm_.*
+###############################################
+# Hibernate: not configured correctly on CI
+###############################################
+igt@.*@.*-hibernate
+igt@gem_softpin@noreloc-s4
+igt@gem_workarounds@hibernate-.*
+igt@gem_exec_suspend@basic-s4$
+igt@gem_ctx_isolation@.*-s4
+###############################################
+# Out-of-memory: spammy and often broken
+###############################################
+igt@i915_suspend@shrink
+###############################################
+# pipe-e, pipe-f no current HW support
+###############################################
+igt@.*@.*pipe-e($|-.*)
+igt@.*@.*pipe-f($|-.*)
+
+###############################################
+# Temporary workarounds for CI-impacting bugs
+###############################################
+
+# Currently fails and leaves the machine in a very bad state, and
+# causes coverage loss for other tests. IOMMU related.
+# https://gitlab.freedesktop.org/drm/intel/-/issues/2644
+igt@core_hotunplug@.*(hot|plug).*
+
+# hangs several gens of hosts, and has no immediate fix
+igt@device_reset@reset-bound
+
+# not working for i915
+igt@kms_bw@.*
diff --git a/tests/intel-ci/xe-blacklist.txt b/tests/intel-ci/xe-blacklist.txt
new file mode 100644
index 000000000000..986e91a67069
--- /dev/null
+++ b/tests/intel-ci/xe-blacklist.txt
@@ -0,0 +1,21 @@
+###############################################
+# Broadcom
+###############################################
+igt@vc4_.*
+igt@v3d_.*
+###############################################
+# Intel i915
+###############################################
+igt@i915/.*
+###############################################
+# AMD
+###############################################
+igt@amdgpu/.*
+###############################################
+# Panfrost
+###############################################
+igt@panfrost_.*
+###############################################
+# Qualcomm
+###############################################
+igt@msm_.*
-- 
2.39.2
