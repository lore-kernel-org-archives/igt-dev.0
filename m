Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FDACD1284
	for <igt-dev@archiver.kernel.org>; Tue,  9 Apr 2024 11:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB3D112CCA;
	Tue,  9 Apr 2024 11:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bJxYjXIk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D00112CD6
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2024 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712661624; x=1744197624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S+mef2k9ZnCsdmLXzkCjf3PKQ/I/Xe/hvZ8v3x14ntE=;
 b=bJxYjXIkN3Td43o0nwZ+dlp/KiKS9OJ1Y0cXr65VJ0vUR3t+tchUSiYv
 yz+02RbqaY0OyQwJ73EYnQcuJTUMKtVol9adMR2CYaQ9EvOmSUm1IlT4W
 z0qCXc4Wv7jI88CG9e5fCvpzpAvOBD5KFOSeZrvebARTNKFXLEEBHiLfI
 +H4eBfoUfzTVIPtw7wUz54vHUQyly+1U4zVAfmoVQGmw5yiZunMQqtFJG
 xWuV/fMxRiPO/Jag3n1oF3Iq9/83Km/qLKrC/Yz93xGBk1jXQbPWEMWHt
 3Z/t3wIC3xJ87wBA1GRff79BsO/ZdgBQlOvUznhtGjFLilb1slBrUPKBW A==;
X-CSE-ConnectionGUID: sWstR2hnQ62aJOTT/xDsWQ==
X-CSE-MsgGUID: getLcVHwT/m2nK0zXcfdcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8127089"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8127089"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:20:19 -0700
X-CSE-ConnectionGUID: qtaXXyWaQRyPSECed4yaOg==
X-CSE-MsgGUID: lJnWpuDhQxOnyClHCOWEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24679479"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 04:20:15 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 5/5] tests: Remove collisions with Subcategory and
 Functionality
Date: Tue,  9 Apr 2024 11:19:15 +0000
Message-Id: <20240409111915.2842477-6-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
References: <20240409111915.2842477-1-katarzyna.piecielska@intel.com>
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

Let's remove Sub-category/Functionality name collisions:
- changes in Functionality:
	s/DRM/drm_mm/
	s/dmabuf/dmabuf test/
	s/compute/compute test/
	s/synchronization/fences/
	s/vma/virtual address/
	s/kunit/kunit test/
	s/mocs/mocs configuration/
	s/intel-nouveau/intel-nouveau uapi/

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/dmabuf.c                       | 2 +-
 tests/dmabuf_sync_file.c             | 2 +-
 tests/drm_mm.c                       | 2 +-
 tests/drm_read.c                     | 2 +-
 tests/intel/gem_exec_endless.c       | 4 ++--
 tests/intel/gem_fence_thrash.c       | 2 +-
 tests/intel/gem_fence_upload.c       | 2 +-
 tests/intel/gem_fenced_exec_thrash.c | 6 +++---
 tests/intel/i915_selftest.c          | 4 ++--
 tests/intel/xe_exec_compute_mode.c   | 2 +-
 tests/intel/xe_live_ktest.c          | 6 +++---
 tests/prime_nv_api.c                 | 2 +-
 12 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/tests/dmabuf.c b/tests/dmabuf.c
index 549cfa27e..71285ff0b 100644
--- a/tests/dmabuf.c
+++ b/tests/dmabuf.c
@@ -29,7 +29,7 @@
  * Feature: mapping, prime
  * Category: Infrastructure
  * Description: drm_mm range manager SW validation
- * Functionality: DRM
+ * Functionality: drm_mm
  * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
index f4eb2e63f..402816afc 100644
--- a/tests/dmabuf_sync_file.c
+++ b/tests/dmabuf_sync_file.c
@@ -14,7 +14,7 @@ IGT_TEST_DESCRIPTION("Tests for sync_file support in dma-buf");
  * TEST: dmabuf_sync_file
  * Category: Infrastructure
  * Description: Tests for sync_file support in dma-buf
- * Functionality: dmabuf
+ * Functionality: dmabuf test
  * Sub-category: Core
  *
  * SUBTEST: export-basic
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index b8b72635b..dcd4c7676 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -28,7 +28,7 @@
  * Description: Basic sanity check of DRM's range manager (struct drm_mm)
  * Feature: mapping
  * Category: Infrastructure
- * Functionality: DRM
+ * Functionality: drm_mm
  * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
diff --git a/tests/drm_read.c b/tests/drm_read.c
index a976a59a2..94c53fded 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -54,7 +54,7 @@ IGT_TEST_DESCRIPTION("Call read(drm) and see if it behaves.");
  * TEST: drm read
  * Description: boundary testing of read(drm_fd)
  * Category: Infrastructure
- * Functionality: DRM memory managemnt
+ * Functionality: drm_mm
  * Sub-category: uapi
  *
  * SUBTEST: invalid-buffer
diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index 5bec7adee..f0bf82b54 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -33,10 +33,10 @@
 /**
  * TEST: gem exec endless
  * Category: Server
- * Feature: cmd_submission
- * Functionality: compute
  * Sub-category: CMD submission
+ * Functionality: compute test
  * Test category: Compute
+ * Feature: cmd_submission
  *
  * SUBTEST: dispatch
  */
diff --git a/tests/intel/gem_fence_thrash.c b/tests/intel/gem_fence_thrash.c
index 0df7319fc..aac2a667b 100644
--- a/tests/intel/gem_fence_thrash.c
+++ b/tests/intel/gem_fence_thrash.c
@@ -48,7 +48,7 @@
  * Feature: gtt, synchronization feature
  * Sub-category: CMD submission
  * Category: Desktop client
- * Functionality: synchronization
+ * Functionality: fences
  *
  * SUBTEST: bo-copy
  *
diff --git a/tests/intel/gem_fence_upload.c b/tests/intel/gem_fence_upload.c
index b80d53a25..8b92d3976 100644
--- a/tests/intel/gem_fence_upload.c
+++ b/tests/intel/gem_fence_upload.c
@@ -45,7 +45,7 @@
  * TEST: gem fence upload
  * Sub-category: CMD submission
  * Category: Desktop client
- * Functionality: synchronization
+ * Functionality: fences
  *
  * SUBTEST: performance
  *
diff --git a/tests/intel/gem_fenced_exec_thrash.c b/tests/intel/gem_fenced_exec_thrash.c
index d0055dfb5..614967615 100644
--- a/tests/intel/gem_fenced_exec_thrash.c
+++ b/tests/intel/gem_fenced_exec_thrash.c
@@ -36,10 +36,10 @@
 /**
  * TEST: gem fenced exec thrash
  * Description: Test execbuf fence accounting.
- * Feature: gtt, synchronization feature
- * Sub-category: CMD submission
  * Category: Desktop client
- * Functionality: synchronization
+ * Sub-category: CMD submission
+ * Functionality: fences
+ * Feature: gtt, synchronization feature
  *
  * SUBTEST: 2-spare-fences
  *
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 1d03fb388..21420f133 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -349,7 +349,7 @@
  * SUBTEST: live@vma
  * Category: Selftest
  * Description: Per-object virtual address management
- * Functionality: vma
+ * Functionality: virtual address
  * Test category: i915
  * Sub-category: Memory management
  *
@@ -516,7 +516,7 @@
  * SUBTEST: mock@vma
  * Category: Selftest
  * Description: API checks for virtual address management
- * Functionality: vma
+ * Functionality: virtual address
  * Test category: i915
  * Sub-category: uapi
  *
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 3ec848164..a73a7343c 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -7,7 +7,7 @@
  * TEST: Basic tests for execbuf compute machine functionality
  * Category: Hardware building block
  * Sub-category: CMD submission
- * Functionality: compute
+ * Functionality: compute test
  */
 
 #include <fcntl.h>
diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index c50aefea8..a894c6257 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -6,7 +6,7 @@
  * Description: Xe driver live dmabuf unit tests
  * Category: Software building block
  * Sub-category: kunit
- * Functionality: kunit
+ * Functionality: kunit test
  * Test category: functionality test
  *
  * SUBTEST: xe_bo
@@ -17,7 +17,7 @@
  *
  * SUBTEST: xe_dma_buf
  * Description: Kernel dynamic selftests for dmabuf functionality.
- * Functionality: dmabuf
+ * Functionality: dmabuf test
  *
  * SUBTEST: xe_migrate
  * Description:
@@ -28,7 +28,7 @@
  * SUBTEST: xe_mocs
  * Description:
  *	Kernel dynamic selftests to check mocs configuration.
- * Functionality: mocs
+ * Functionality: mocs configuration
  */
 
 static const char *live_tests[] = {
diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
index 29cc9a8a7..d9c1849cf 100644
--- a/tests/prime_nv_api.c
+++ b/tests/prime_nv_api.c
@@ -12,7 +12,7 @@
  * TEST: prime_nv_api
  * Description: Basic api tests between intel and nouveau
  * Sub-category: uapi
- * Functionality: intel-nouveau
+ * Functionality: intel-nouveau uapi
  *
  * SUBTEST: i915_nv_import_twice
  * SUBTEST: i915_nv_import_twice_check_flink_name
-- 
2.34.1

