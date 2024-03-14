Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41728C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 14:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB81210FBA9;
	Thu, 14 Mar 2024 14:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1a3m5pK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1EE10FBA9
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710426917; x=1741962917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=azZFCT2MwabeDCy7txhl6w8c/aGg3J0W0uovglTCSgU=;
 b=Z1a3m5pKHRyEPqSlCVlmulpipuUMtcLsgPxupGJqYCkBXxi3D5iYluAt
 +crKslD+AVzIsSvQFFlSs4U21CsLrjl10Q0jnBZwfTUV9FYMc7mGMw/1x
 RM1G8mwAChdWNMVXEVfJMvyppLD3x6cq5yIPAVPOyd+BEYoarHhE7iP81
 6D3g+CcSqa++2ym+CR6l4lIjWv6TsFsaw2pBVBNK1L7koQdvtKy2njdly
 P0FJR31DS4xA8Iv4NZjAdH93QNiNJop3jcjEHWUE4wKhKAXRBe3VY0j4f
 hewS6FN/UZ5+9ibe9Cim/cooAmGbABAENpKpiLbq+/fQVTDIjLZ3zUR1j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5098464"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5098464"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:35:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12321574"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 07:35:16 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4 01/25] tests: Introduce uapi subcategory
Date: Thu, 14 Mar 2024 14:34:31 +0000
Message-Id: <20240314143455.1436688-2-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
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

Let's introduce uapi subcategory to explicitly show where we are testing
the basics.
Also fix already set values:
- fix subcategory for create-ext-set-pat subtest
- fix functionality for gem_ctx_sseu: s/Sub-slice programming/sseu

v2: Add more tests to uapi from synchronization/semephore features. Make
Sub-category/Functionality/Feature unique. (Kamil)

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/core_getstats.c              |  4 ++--
 tests/drm_read.c                   | 17 +++++++++++++++++
 tests/dumb_buffer.c                |  6 +++---
 tests/intel/gem_create.c           | 15 +++------------
 tests/intel/gem_ctx_param.c        |  2 +-
 tests/intel/gem_ctx_sseu.c         |  3 +++
 tests/intel/gem_eio.c              |  2 +-
 tests/intel/gem_reg_read.c         |  3 +++
 tests/intel/gem_reset_stats.c      |  3 +++
 tests/intel/gem_wait.c             |  6 +++---
 tests/intel/i915_getparams_basic.c |  2 +-
 tests/intel/i915_pm_freq_api.c     |  3 +++
 tests/intel/sysfs_defaults.c       |  6 +++---
 tests/sw_sync.c                    |  7 +++----
 tests/syncobj_timeline.c           |  6 +++---
 tests/syncobj_wait.c               |  6 +++---
 16 files changed, 55 insertions(+), 36 deletions(-)

diff --git a/tests/core_getstats.c b/tests/core_getstats.c
index 8b5655053..1a8ad22c7 100644
--- a/tests/core_getstats.c
+++ b/tests/core_getstats.c
@@ -37,9 +37,9 @@
  * Category: Desktop client
  * Description: Tests the DRM_IOCTL_GET_STATS ioctl.
  * Feature: core
- * Functionality: permission management for clients
+ * Functionality: DRM memory management
  * Run type: FULL
- * Sub-category: DRM
+ * Sub-category: uapi
  * Test category: GEM_Legacy
  *
  * SUBTEST:
diff --git a/tests/drm_read.c b/tests/drm_read.c
index 36dc623ed..f8ef324fa 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -50,6 +50,23 @@
 
 IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
 
+/**
+ * TEST: drm read
+ * Description: boundary testing of read(drm_fd)
+ * Category: Infrastructure
+ * Functionality: DRM memory managemnt
+ * Sub-category: uapi
+ * Run type: FULL
+ *
+ * SUBTEST: invalid-buffer
+ * SUBTEST: fault-buffer
+ * SUBTEST: empty-block
+ * SUBTEST: empty-nonblock
+ * SUBTEST: short-buffer-block
+ * SUBTEST: short-buffer-nonblock
+ * SUBTEST: short-buffer-wakeup
+ */
+
 static void sighandler(int sig, siginfo_t * info, void *context)
 {
 }
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 9db857f9f..d76f0c70f 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -54,10 +54,10 @@
  * Category: Desktop client
  * Description: This is a test for the generic dumb buffer interface.
  * Feature: prime
- * Functionality: IOCTL check for buffer management
+ * Functionality: ioctl
  * Run type: FULL
- * Sub-category: Compositor
- * Test category: GEM_Legacy
+ * Sub-category: uapi
+ * Test category: Compositor
  *
  * SUBTEST: create-clear
  *
diff --git a/tests/intel/gem_create.c b/tests/intel/gem_create.c
index 77ffceda4..ae9575089 100644
--- a/tests/intel/gem_create.c
+++ b/tests/intel/gem_create.c
@@ -98,6 +98,9 @@
  * SUBTEST: create-ext-placement-sanity-check
  * Description: Exercise create_ext placements extension.
  *
+ * SUBTEST: create-ext-set-pat
+ * Description:  Create GEM object with specific PAT index
+ *
  * SUBTEST: create-invalid-size
  * Description: Try to create a gem object of invalid size 0 and check if
  *		ioctl returns error.
@@ -594,18 +597,6 @@ static void create_ext_placement_each(int fd)
 	free(regions);
 }
 
-/**
-  * TEST: GEM create uAPI
-  * Category: Infrastructure
-  * Description: Tests the DRM_IOCTL_I915_GEM_CREATE_EXT ioctl.
-  * Feature: core
-  * Functionality: Create GEM object with specific PAT index
-  * Run type: BAT
-  * Sub-category: i915
-  * Test category: GEM_Legacy
-  *
-  * SUBTEST: create-ext-set-pat
-  */
 static void create_ext_set_pat(int fd)
 {
 	struct drm_i915_gem_create_ext_set_pat setparam_pat = {
diff --git a/tests/intel/gem_ctx_param.c b/tests/intel/gem_ctx_param.c
index c6fa31875..26f2a28f0 100644
--- a/tests/intel/gem_ctx_param.c
+++ b/tests/intel/gem_ctx_param.c
@@ -34,7 +34,7 @@
  * TEST: gem ctx param
  * Description: Basic test for context set/get param input validation.
  * Category: Infrastructure
- * Feature: context
+ * Feature: contexts
  * Functionality: context
  * Sub-category: uapi
  * Test category: GEM_Legacy
diff --git a/tests/intel/gem_ctx_sseu.c b/tests/intel/gem_ctx_sseu.c
index 3a01944e4..a9d400c2d 100644
--- a/tests/intel/gem_ctx_sseu.c
+++ b/tests/intel/gem_ctx_sseu.c
@@ -48,6 +48,9 @@
  * TEST: gem ctx sseu
  * Description: Test context render powergating programming.
  * Feature: pm_sseu
+ * Sub-category: uapi
+ * Category: Desktop client
+ * Functionality: sseu
  * Run type: FULL
  *
  * SUBTEST: engines
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index d6d12bd08..6fa68441f 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -57,7 +57,7 @@
  * TEST: gem eio
  * Description: Test that specific ioctls report a wedged GPU (EIO).
  * Category: Infrastructure
- * Feature: reset
+ * Feature: reset uapi
  * Functionality: reset
  * Sub-category: uapi
  * Test category: GEM_Legacy
diff --git a/tests/intel/gem_reg_read.c b/tests/intel/gem_reg_read.c
index de6788abe..03b12551d 100644
--- a/tests/intel/gem_reg_read.c
+++ b/tests/intel/gem_reg_read.c
@@ -35,6 +35,9 @@
 /**
  * TEST: gem reg read
  * Feature: gem_core
+ * Sub-category: uapi
+ * Category: Desktop client
+ * Functionality: ioctl
  * Run type: FULL
  *
  * SUBTEST: bad-register
diff --git a/tests/intel/gem_reset_stats.c b/tests/intel/gem_reset_stats.c
index 5dfc1fc67..a62c4061a 100644
--- a/tests/intel/gem_reset_stats.c
+++ b/tests/intel/gem_reset_stats.c
@@ -49,6 +49,9 @@
 #include "sw_sync.h"
 /**
  * TEST: gem reset stats
+ * Sub-category: uapi
+ * Category: Desktop client
+ * Functionality: reset
  * Run type: FULL
  *
  * SUBTEST: ban-blt
diff --git a/tests/intel/gem_wait.c b/tests/intel/gem_wait.c
index e2a598c64..abd936cf1 100644
--- a/tests/intel/gem_wait.c
+++ b/tests/intel/gem_wait.c
@@ -35,9 +35,9 @@
  * TEST: gem wait
  * Category: Infrastructure
  * Description: Tests the GEM_WAIT ioctl
- * Feature: synchronization
- * Functionality: semaphore
- * Sub-category: i915
+ * Feature: synchronization uapi
+ * Functionality: GEM_WAIT ioctl
+ * Sub-category: uapi
  * Test category: GEM_Legacy
  * Run type: FULL
  *
diff --git a/tests/intel/i915_getparams_basic.c b/tests/intel/i915_getparams_basic.c
index b22ab5d93..971c35e55 100644
--- a/tests/intel/i915_getparams_basic.c
+++ b/tests/intel/i915_getparams_basic.c
@@ -37,7 +37,7 @@
  * Feature: gem_core
  * Functionality: device topology
  * Run type: BAT
- * Sub-category: i915
+ * Sub-category: uapi
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic-eu-total
diff --git a/tests/intel/i915_pm_freq_api.c b/tests/intel/i915_pm_freq_api.c
index 6018692a2..aa2de74c9 100644
--- a/tests/intel/i915_pm_freq_api.c
+++ b/tests/intel/i915_pm_freq_api.c
@@ -11,6 +11,9 @@
 /**
  * TEST: i915 pm freq api
  * Description: Test SLPC freq API
+ * Category: Infrastructure
+ * Sub-category: uapi
+ * Functionality: slpc
  * Run type: FULL
  *
  * SUBTEST: freq-basic-api
diff --git a/tests/intel/sysfs_defaults.c b/tests/intel/sysfs_defaults.c
index b686c19fc..a80f7126c 100644
--- a/tests/intel/sysfs_defaults.c
+++ b/tests/intel/sysfs_defaults.c
@@ -37,10 +37,10 @@
  * TEST: sysfs defaults
  * Category: Infrastructure
  * Feature: gem_core
- * Functionality: driver handler
- * Run type: FULL
- * Sub-category: i915
+ * Functionality: sysfs
+ * Sub-category: uapi
  * Test category: GEM_Legacy
+ * Run type: FULL
  *
  * SUBTEST: readonly
  */
diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index 6c476ff46..a276c4a22 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -42,10 +42,9 @@
  * TEST: sw sync
  * Category: Infrastructure
  * Description: Test SW Sync Framework
- * Feature: synchronization
- * Functionality: semaphore
- * Run type: FULL
- * Sub-category: DRM
+ * Feature: semaphore
+ * Functionality: sw sync framework
+ * Sub-category: uapi
  * Test category: GEM_Legacy
  *
  * SUBTEST: alloc_fence
diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index ea8341a30..465761d6d 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -34,10 +34,10 @@
  * TEST: syncobj timeline
  * Category: Infrastructure
  * Description: Tests for the drm timeline sync object API
- * Feature: synchronization
- * Functionality: semaphore
  * Run type: FULL
- * Sub-category: DRM
+ * Feature: synchronization uapi
+ * Functionality: sync_object
+ * Sub-category: uapi
  * Test category: GEM_Legacy
  *
  * SUBTEST: 32bits-limit
diff --git a/tests/syncobj_wait.c b/tests/syncobj_wait.c
index e0ff69b79..c8cf4014d 100644
--- a/tests/syncobj_wait.c
+++ b/tests/syncobj_wait.c
@@ -34,10 +34,10 @@
  * TEST: syncobj wait
  * Category: Infrastructure
  * Description: Tests for the drm sync object wait API
- * Feature: synchronization
- * Functionality: semaphore
+ * Feature: synchronization uapi
+ * Functionality: object wait
  * Run type: FULL
- * Sub-category: DRM
+ * Sub-category: uapi
  * Test category: GEM_Legacy
  *
  * SUBTEST: invalid-multi-wait-all-unsubmitted
-- 
2.34.1

