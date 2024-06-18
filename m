Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79959C2BA18
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 14:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C2A10E6B7;
	Tue, 18 Jun 2024 14:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dd6yhGSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB2B10E6B7
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718720843; x=1750256843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZaMdRUEkVaR+VEmICgS2p721HlXPKKdF12E/sHEf/Jc=;
 b=dd6yhGSCM8O01NrWZfppEzn/BJJ390fF8sFa7BHcOANy+XFJENbIXfSM
 2JKBZd3mjvh4cTCaXZ+ye721YxLzmbetcXo33AnD8dEE99n+nVaY+vyqa
 jD+9m+D6f6NWXKtzgupW6V2n0ZTOw23txaDMF6AvEOE7UHiwx8xImxzQQ
 1VCCDdHWV9g5WoPVkVFxWGn76huH4jFomK6RPOQkme7slA75T9NJHluV+
 jvm4wN/uGz0MghMGFcz3QXk49+V8dOBO7sg5YehykPLHjYlo3l6IMZwrB
 49MQ76IvYNaC5J9YS06TJJnkecRvaYuFqdUgJYKtmIbmNDtTV4055w7Tw w==;
X-CSE-ConnectionGUID: FjS3TLFETj6jn1CsT9takA==
X-CSE-MsgGUID: +akVCgRBRn+4L1UtHCr3Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33073942"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="33073942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:22 -0700
X-CSE-ConnectionGUID: kXygfNxlS/uXyPLrOaayCA==
X-CSE-MsgGUID: yvAk2z/gQ66Z1wfs6mFC9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41676314"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 07:27:20 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <me@petersenna.com>,
 Gandi Ramadevi <ramadevi.gandi@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t 2/4] tests: Unify 'Test category' in Core tests for i915
 and Xe
Date: Tue, 18 Jun 2024 14:26:48 +0000
Message-Id: <20240618142650.1991834-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618142650.1991834-1-katarzyna.piecielska@intel.com>
References: <20240618142650.1991834-1-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Change 'Test category' documentation field from:
 Compositor, uapi, Media & Compute, Compute, i915, pm_rpm, pm_rps,
 suspend, Perf, SysMan, xe
to one of values: functionality test, stress test, negative test.

Test category should reflect main test purpose:
 * functionality test - all testing for driver, HW or uapi that are not
a stress or negative testing
 * stress test - stress cases to reveal corner cases, e.g. huge memory
usage, many parallel operations, races etc.
 * negative test - check that invalid behaviors will not break anything

In some please there was a need to change s/functionality test/negative test/.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Peter Senna Tschudin <me@petersenna.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
---
 tests/core_hotunplug.c                 | 2 +-
 tests/dumb_buffer.c                    | 4 +++-
 tests/intel/debugfs_test.c             | 2 +-
 tests/intel/gem_exec_balancer.c        | 2 +-
 tests/intel/gem_exec_endless.c         | 2 +-
 tests/intel/i915_pm_freq_mult.c        | 2 +-
 tests/intel/i915_pm_rpm.c              | 2 +-
 tests/intel/i915_pm_rps.c              | 2 +-
 tests/intel/i915_suspend.c             | 2 +-
 tests/intel/intel_hwmon.c              | 2 +-
 tests/intel/perf.c                     | 2 +-
 tests/intel/perf_pmu.c                 | 2 +-
 tests/intel/sysfs_heartbeat_interval.c | 3 ++-
 tests/intel/sysfs_preempt_timeout.c    | 2 +-
 tests/intel/sysfs_timeslice_duration.c | 2 +-
 tests/intel/xe_drm_fdinfo.c            | 2 +-
 tests/intel/xe_exec_compute_mode.c     | 2 +-
 tests/intel/xe_exec_fault_mode.c       | 4 ++--
 tests/intel/xe_exec_queue_property.c   | 4 ++--
 tests/intel/xe_peer2peer.c             | 2 +-
 20 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index db7a5c5e8..b13088976 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -47,7 +47,7 @@
  * Sub-category: driver
  * Functionality: device hotplug
  * Feature: SMI, core
- * Test category: functionality test
+ * Test category: stress test
  *
  * SUBTEST: hotrebind
  * Description: Check if the driver can be cleanly rebound to a device with a
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 1d4bf296c..b3c4882e6 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -57,15 +57,17 @@
  * Sub-category: uapi
  * Functionality: ioctl
  * Feature: prime
- * Test category: Compositor
+ * Test category: functionality test
  *
  * SUBTEST: create-clear
  *
  * SUBTEST: create-valid-dumb
  *
  * SUBTEST: invalid-bpp
+ * Test category: negative test
  *
  * SUBTEST: map-invalid-size
+ * Test category: negative test
  *
  * SUBTEST: map-uaf
  *
diff --git a/tests/intel/debugfs_test.c b/tests/intel/debugfs_test.c
index f2b6fb334..b71ffad7d 100644
--- a/tests/intel/debugfs_test.c
+++ b/tests/intel/debugfs_test.c
@@ -37,7 +37,7 @@
  * Sub-category: uapi
  * Functionality: debugfs
  * Feature: core
- * Test category: uapi
+ * Test category: functionality test
  *
  * SUBTEST: basic-hwmon
  * Description: Read all entries from hwmon path validating debugfs entries
diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balancer.c
index 20e31baf0..209c54e7a 100644
--- a/tests/intel/gem_exec_balancer.c
+++ b/tests/intel/gem_exec_balancer.c
@@ -46,7 +46,7 @@
  * Sub-category: CMD submission
  * Functionality: load balancing
  * Feature: cmd_submission, media_scalability
- * Test category: Media & Compute
+ * Test category: functionality test
  *
  * SUBTEST: bonded-chain
  *
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index 6b2c56382..9bae9bcc2 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -36,7 +36,7 @@
  * Mega feature: General Core features
  * Sub-category: CMD submission
  * Functionality: compute test
- * Test category: Compute
+ * Test category: functionality test
  * Feature: cmd_submission
  *
  * SUBTEST: dispatch
diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
index fa68be220..7e77fd1df 100644
--- a/tests/intel/i915_pm_freq_mult.c
+++ b/tests/intel/i915_pm_freq_mult.c
@@ -18,7 +18,7 @@
  * Mega feature: Power management
  * Sub-category: Power management tests
  * Functionality: freg multipliers
- * Test category: i915
+ * Test category: functionality test
  *
  * SUBTEST: media-freq
  * Description: Tests for media frequency factor sysfs
diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
index 31758b1a5..709eb1dbc 100644
--- a/tests/intel/i915_pm_rpm.c
+++ b/tests/intel/i915_pm_rpm.c
@@ -46,7 +46,7 @@
  * Mega feature: Power management
  * Sub-category: Power management tests
  * Functionality: D3 state entry-exit
- * Test category: pm_rpm
+ * Test category: functionality test
  * Feature: pm_rpm
  *
  * SUBTEST: debugfs-forcewake-user
diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
index 99b83f315..f9788f9a9 100644
--- a/tests/intel/i915_pm_rps.c
+++ b/tests/intel/i915_pm_rps.c
@@ -52,7 +52,7 @@
  * Sub-category: Power management tests
  * Functionality: pm_rps
  * Feature: pm_rps
- * Test category: pm_rps
+ * Test category: functionality test
  *
  * SUBTEST: basic-api
  *
diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index 3398b372b..337f121e1 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -50,7 +50,7 @@
  * Mega feature: Power management
  * Sub-category: Power management tests
  * Functionality: s2idle w/o i915
- * Test category: suspend
+ * Test category: functionality test
  * Feature: suspend
  *
  * SUBTEST: basic-s2idle-without-i915
diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index e4272e0a0..299efcf1c 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -15,7 +15,7 @@
  * Mega feature: RAS
  * Sub-category: RAS tests
  * Functionality: hwmon
- * Test category: functionality
+ * Test category: functionality test
  *
  * SUBTEST: hwmon-read
  * Description: Verify we can read all hwmon attributes
diff --git a/tests/intel/perf.c b/tests/intel/perf.c
index 95b17f522..5b579f9b1 100644
--- a/tests/intel/perf.c
+++ b/tests/intel/perf.c
@@ -53,7 +53,7 @@
  * Sub-category: Performance tests
  * Functionality: oa
  * Feature: i915 streaming interface, oa
- * Test category: Perf
+ * Test category: functionality test
  *
  * SUBTEST: blocking
  * Description: Test blocking read with default hrtimer frequency
diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index e3f51d0c7..ebefa3eef 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -57,7 +57,7 @@
  * Sub-category: Performance tests
  * Functionality: pmu
  * Feature: i915 pmu perf interface, pmu
- * Test category: Perf
+ * Test category: functionality test
  *
  * SUBTEST: all-busy-check-all
  * Description: Test the i915 pmu perf interface
diff --git a/tests/intel/sysfs_heartbeat_interval.c b/tests/intel/sysfs_heartbeat_interval.c
index 486a1514d..87102a253 100644
--- a/tests/intel/sysfs_heartbeat_interval.c
+++ b/tests/intel/sysfs_heartbeat_interval.c
@@ -48,13 +48,14 @@
  * Sub-category: SysMan tests
  * Functionality: sysfs heartbeat
  * Feature: SMI, cmd_submission
- * Test category: SysMan
+ * Test category: functionality test
  *
  * SUBTEST: idempotent
  * Description: Test to check whether the heartbeat parameter reports the values set.
  *
  * SUBTEST: invalid
  * Description: Test to check if heartbeat parameter rejects any unrepresentable intervals.
+ * Test category: negative test
  *
  * SUBTEST: long
  *
diff --git a/tests/intel/sysfs_preempt_timeout.c b/tests/intel/sysfs_preempt_timeout.c
index 18e000405..51dac116a 100644
--- a/tests/intel/sysfs_preempt_timeout.c
+++ b/tests/intel/sysfs_preempt_timeout.c
@@ -47,7 +47,7 @@
  * Sub-category: SysMan tests
  * Functionality: sysfs preempt timeout
  * Feature: SMI, context
- * Test category: SysMan
+ * Test category: functionality test
  *
  * SUBTEST: idempotent
  * Description: Test to check whether the preempt_timeout parameter reports the
diff --git a/tests/intel/sysfs_timeslice_duration.c b/tests/intel/sysfs_timeslice_duration.c
index 026d12b85..dcc231465 100644
--- a/tests/intel/sysfs_timeslice_duration.c
+++ b/tests/intel/sysfs_timeslice_duration.c
@@ -50,7 +50,7 @@
  * Sub-category: SysMan tests
  * Functionality: timeslise sysfs
  * Feature: SMI, cmd_submission
- * Test category: SysMan
+ * Test category: functionality test
  *
  * SUBTEST: duration
  * Description: Test to measure the timeslice duration by watching the
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 2ceafba24..0d4d37f51 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -20,7 +20,7 @@
  * Sub-category: driver
  * Functionality: Per client memory statistics
  * Feature: SMI, core
- * Test category: SysMan
+ * Test category: functionality test
  *
  * SUBTEST: basic
  * Description: Check if basic fdinfo content is present
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 389de7ca4..539e2ed8a 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -405,7 +405,7 @@ static void non_block(int fd, int expect)
 /**
  * SUBTEST: lr-mode-workload
  * Description: Stress LR mode workload for 30s.
- * Test category: functionality test
+ * Test category: stress test
  */
 static void lr_mode_workload(int fd)
 {
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index b022f97d3..8f412779f 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -39,11 +39,11 @@
 /**
  * SUBTEST: invalid-va
  * Description: Access invalid va and check for EIO through user fence.
- * Test category: functionality test
+ * Test category: negative test
  *
  * SUBTEST: invalid-va-scratch-nopagefault
  * Description: Access invalid va without pageafault with scratch page enabled.
- * Test category: functionality test
+ * Test category: negative test
  *
  * SUBTEST: once-%s
  * Description: Run %arg[1] fault mode test only once
diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 3edab0af5..908a4c7fd 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -94,7 +94,7 @@ static void test_property_min_max(int xe, int engine, const char **property)
 /**
  * SUBTEST: Invalid-exec-queue
  * Description: Negative test to check the expected behaviour with invalid exec_queue_id.
- * Test category: functionality test
+ * Test category: negative test
  */
 static void Invalid_exec_queue_id(int xe)
 {
@@ -109,7 +109,7 @@ static void Invalid_exec_queue_id(int xe)
 /**
  * SUBTEST: non-zero-reserved
  * Description: Negative test to check the expected behaviour with non-zero reserved.
- * Test category: functionality test
+ * Test category: negative test
  */
 static void non_zero_reserved(int xe)
 {
diff --git a/tests/intel/xe_peer2peer.c b/tests/intel/xe_peer2peer.c
index 6ff4774bb..00aee010b 100644
--- a/tests/intel/xe_peer2peer.c
+++ b/tests/intel/xe_peer2peer.c
@@ -22,7 +22,7 @@
  * Mega feature: General Core features
  * Sub-category: MultiGPU
  * Functionality: dma buf copy
- * Test category: xe
+ * Test category: functionality test
  *
  * SUBTEST: read
  * Description:
-- 
2.34.1

