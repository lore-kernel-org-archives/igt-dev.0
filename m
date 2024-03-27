Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CFEC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C6B10FCC7;
	Wed, 27 Mar 2024 12:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SwkNH3HM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7AA10FCC7
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542480; x=1743078480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=60h/8QEHSqhfXxZIemALOZBEB1tVhFIuU1/iDFp2CGE=;
 b=SwkNH3HMJJGGrpRz54fWtkjG3AUsgJZ/RckkDlHcXDMnQJY0llQkn/6H
 ghp9AetI5muPI4ZOV7b4vcDDxI/ESvFvx+VGAMA80aNqa9mBzmXpvkYtJ
 FsDfswl7SX7GYO+SXPlPQqzR7ZNSb0CKZ3ChvxypyQVSti+eIIKtmA+4h
 Jk7iTkM4Zxy/zIsJ7D8TscBmYKmNJEB7frI3eIEidZdDgRXkkpK5f3Xuf
 ScjKWWUf0SMYQB9bMnJVbi5SltXBlnS5Qa/pAQGO+NuuLxEwGJiA0N1Ch
 gbevzFITBCOPlBky2IEf5UZ9EUTwzX3kfF5WiSUZ/4YAA+7pV/c0AJCJ/ w==;
X-CSE-ConnectionGUID: 8or15x8MRxOBrONDmeOm+g==
X-CSE-MsgGUID: 89sDIdDiSHybDEzZUq2NEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6530833"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; 
   d="scan'208";a="6530833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16932800"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:27:58 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Girotra Himanshu <himanshu.girotra@intel.com>,
 Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
Subject: [PATCH i-g-t 02/16] tests: Introduce Memory management mega feature
Date: Wed, 27 Mar 2024 12:27:17 +0000
Message-Id: <20240327122731.2104614-3-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
References: <20240327122731.2104614-1-katarzyna.piecielska@intel.com>
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

Add mega feature to Memory management tests
Group:
	SUBTEST
	Description
	Category
	Mega feature
	Sub-category
	Functionality
	Feature

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Girotra Himanshu <himanshu.girotra@intel.com>
CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
---
 tests/dmabuf.c                               |  7 ++-
 tests/drm_mm.c                               |  5 +-
 tests/intel/gem_close.c                      |  5 +-
 tests/intel/gem_cs_tlb.c                     |  7 ++-
 tests/intel/gem_gtt_cpu_tlb.c                |  8 ++-
 tests/intel/gem_gtt_hog.c                    |  3 +-
 tests/intel/gem_gtt_speed.c                  |  3 +-
 tests/intel/gem_lmem_evict.c                 |  5 +-
 tests/intel/gem_lmem_swapping.c              |  7 ++-
 tests/intel/gem_madvise.c                    |  7 ++-
 tests/intel/gem_mmap.c                       |  7 ++-
 tests/intel/gem_mmap_gtt.c                   |  5 +-
 tests/intel/gem_mmap_offset.c                |  5 +-
 tests/intel/gem_mmap_wc.c                    |  5 +-
 tests/intel/gem_ppgtt.c                      |  5 +-
 tests/intel/gem_read_read_speed.c            |  3 +-
 tests/intel/gem_readwrite.c                  |  5 +-
 tests/intel/gem_set_tiling_vs_gtt.c          |  5 +-
 tests/intel/gem_set_tiling_vs_pwrite.c       |  5 +-
 tests/intel/gem_streaming_writes.c           |  3 +-
 tests/intel/gem_tiled_blits.c                |  5 +-
 tests/intel/gem_tiled_fence_blits.c          |  5 +-
 tests/intel/gem_tiled_partial_pwrite_pread.c |  5 +-
 tests/intel/gem_tiled_pread_basic.c          |  5 +-
 tests/intel/gem_tiled_pread_pwrite.c         |  5 +-
 tests/intel/gem_tiled_swapping.c             |  5 +-
 tests/intel/gem_tiled_wb.c                   |  5 +-
 tests/intel/gem_tiled_wc.c                   |  5 +-
 tests/intel/gem_tiling_max_stride.c          |  5 +-
 tests/intel/gem_unfence_active_buffers.c     |  5 +-
 tests/intel/i915_fb_tiling.c                 |  5 +-
 tests/intel/i915_selftest.c                  | 65 ++++++++++++--------
 tests/intel/prime_busy.c                     |  7 ++-
 tests/intel/prime_mmap.c                     |  7 ++-
 tests/intel/prime_mmap_coherency.c           |  7 ++-
 tests/intel/prime_self_import.c              |  7 ++-
 tests/intel/xe_evict.c                       |  2 +
 tests/intel/xe_mmap.c                        |  3 +-
 tests/intel/xe_pat.c                         |  1 +
 tests/intel/xe_vm.c                          |  1 +
 40 files changed, 157 insertions(+), 103 deletions(-)

diff --git a/tests/dmabuf.c b/tests/dmabuf.c
index 549cfa27e..8bc1a2a56 100644
--- a/tests/dmabuf.c
+++ b/tests/dmabuf.c
@@ -26,11 +26,12 @@
 /**
  * TEST: dmabuf
  * Description: Kernel selftests for the dmabuf API
- * Feature: mapping, prime
  * Category: Infrastructure
- * Description: drm_mm range manager SW validation
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: DRM
- * Sub-category: Memory management
+ * Description: drm_mm range manager SW validation
+ * Feature: mapping, prime
  * Test category: GEM_Legacy
  *
  * SUBTEST: all-tests
diff --git a/tests/drm_mm.c b/tests/drm_mm.c
index b8b72635b..536dcd496 100644
--- a/tests/drm_mm.c
+++ b/tests/drm_mm.c
@@ -26,10 +26,11 @@
 /**
  * TEST: drm mm
  * Description: Basic sanity check of DRM's range manager (struct drm_mm)
- * Feature: mapping
  * Category: Infrastructure
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: DRM
- * Sub-category: Memory management
+ * Feature: mapping
  * Test category: GEM_Legacy
  *
  * SUBTEST: drm_mm
diff --git a/tests/intel/gem_close.c b/tests/intel/gem_close.c
index b3c5cb108..eab98b75a 100644
--- a/tests/intel/gem_close.c
+++ b/tests/intel/gem_close.c
@@ -28,9 +28,10 @@
 /**
  * TEST: gem close
  * Category: Infrastructure
- * Feature: mapping
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: driver handler
- * Sub-category: Memory management
+ * Feature: mapping
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
index f18a8fdaa..6a5becdf3 100644
--- a/tests/intel/gem_cs_tlb.c
+++ b/tests/intel/gem_cs_tlb.c
@@ -54,11 +54,12 @@
 #include "igt.h"
 /**
  * TEST: gem cs tlb
- * Category: Infrastructure
  * Description: Check whether we correctly invalidate the cs tlb.
- * Feature: mapping
+ * Category: Infrastructure
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tlb
- * Sub-category: Memory management
+ * Feature: mapping
  * Test category: GEM_Legacy
  *
  * SUBTEST: engines
diff --git a/tests/intel/gem_gtt_cpu_tlb.c b/tests/intel/gem_gtt_cpu_tlb.c
index c7a1cbe63..2641e05fc 100644
--- a/tests/intel/gem_gtt_cpu_tlb.c
+++ b/tests/intel/gem_gtt_cpu_tlb.c
@@ -46,10 +46,12 @@
 /**
  * TEST: gem gtt cpu tlb
  * Description: Check whether gtt tlbs for cpu access are correctly invalidated.
- * Feature: gtt, mapping
- * Sub-category: Memory management
  * Category: Desktop client
- * Functionality: mmap
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
+ * Functionality: mapping
+ * Feature: gtt, mapping
+ *
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_gtt_hog.c b/tests/intel/gem_gtt_hog.c
index 12f291020..3e2979881 100644
--- a/tests/intel/gem_gtt_hog.c
+++ b/tests/intel/gem_gtt_hog.c
@@ -44,8 +44,9 @@
 #include "igt.h"
 /**
  * TEST: gem gtt hog
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: gtt
  *
  * SUBTEST:
diff --git a/tests/intel/gem_gtt_speed.c b/tests/intel/gem_gtt_speed.c
index 46ebafdd8..46544b791 100644
--- a/tests/intel/gem_gtt_speed.c
+++ b/tests/intel/gem_gtt_speed.c
@@ -44,8 +44,9 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem gtt speed
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: gtt
  *
  * SUBTEST:
diff --git a/tests/intel/gem_lmem_evict.c b/tests/intel/gem_lmem_evict.c
index f756565cb..9e6aadf09 100644
--- a/tests/intel/gem_lmem_evict.c
+++ b/tests/intel/gem_lmem_evict.c
@@ -10,10 +10,11 @@
 /**
  * TEST: gem lmem evict
  * Description: Force tiny lmem size for easily testing eviction scenarios.
- * Feature: local_memory
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: local memory eviction
+ * Feature: local_memory
  * Test category: GEM_Legacy
  *
  * SUBTEST: dontneed-evict-race
diff --git a/tests/intel/gem_lmem_swapping.c b/tests/intel/gem_lmem_swapping.c
index a10a6e96e..b45173878 100644
--- a/tests/intel/gem_lmem_swapping.c
+++ b/tests/intel/gem_lmem_swapping.c
@@ -26,11 +26,12 @@
 #include "intel_mocs.h"
 /**
  * TEST: gem lmem swapping
- * Category: Server
  * Description: Exercise local memory swapping.
- * Feature: local_memory
+ * Category: Server
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: buffer management
- * Sub-category: Memory management
+ * Feature: local_memory
  * Test category: GEM_Legacy
  *
  * SUBTEST: basic
diff --git a/tests/intel/gem_madvise.c b/tests/intel/gem_madvise.c
index da5ac7d6d..f56262296 100644
--- a/tests/intel/gem_madvise.c
+++ b/tests/intel/gem_madvise.c
@@ -40,12 +40,13 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem madvise
- * Category: Desktop client
  * Description: Checks that the kernel reports EFAULT when trying to use purged bo.
- * Feature: caching, mapping
+ * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: buffer management
- * Sub-category: Memory management
  * Test category: GEM_Legacy
+ * Feature: caching, mapping
  *
  * SUBTEST: dontneed-after-mmap
  * Description: Check signal for Segmentation Fault and bus error after
diff --git a/tests/intel/gem_mmap.c b/tests/intel/gem_mmap.c
index 179001a20..e8338a611 100644
--- a/tests/intel/gem_mmap.c
+++ b/tests/intel/gem_mmap.c
@@ -41,10 +41,11 @@
 /**
  * TEST: gem mmap
  * Description: Basic MMAP IOCTL tests for memory regions.
- * Feature: mapping
- * Sub-category: Memory management
  * Category: Desktop client
- * Functionality: mmap
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
+ * Functionality: mapping
+ * Feature: mapping
  *
  * SUBTEST: bad-object
  * Description: Verify mapping to invalid gem objects won't be created.
diff --git a/tests/intel/gem_mmap_gtt.c b/tests/intel/gem_mmap_gtt.c
index 7218ef9bc..1075ffd02 100644
--- a/tests/intel/gem_mmap_gtt.c
+++ b/tests/intel/gem_mmap_gtt.c
@@ -49,10 +49,11 @@
 /**
  * TEST: gem mmap gtt
  * Description: Ensure that all operations around MMAP_GTT ioctl works.
- * Feature: gtt
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: map gtt
+ * Feature: gtt
  *
  * SUBTEST: bad-object
  * Description: Verify mapping to invalid gem objects fails.
diff --git a/tests/intel/gem_mmap_offset.c b/tests/intel/gem_mmap_offset.c
index 95d2158ca..bc953acfe 100644
--- a/tests/intel/gem_mmap_offset.c
+++ b/tests/intel/gem_mmap_offset.c
@@ -41,9 +41,10 @@
  * TEST: gem mmap offset
  * Description: Basic MMAP_OFFSET IOCTL tests for mem regions
  * Category: Infrastructure
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
+ * Functionality: mapping
  * Feature: mapping
- * Functionality: mmap
- * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
  * SUBTEST: bad-extensions
diff --git a/tests/intel/gem_mmap_wc.c b/tests/intel/gem_mmap_wc.c
index 0a1bef7a2..356e77f5e 100644
--- a/tests/intel/gem_mmap_wc.c
+++ b/tests/intel/gem_mmap_wc.c
@@ -41,10 +41,11 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem mmap wc
- * Feature: caching, mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: cache
+ * Feature: caching, mapping
  *
  * SUBTEST: bad-object
  * SUBTEST: bad-offset
diff --git a/tests/intel/gem_ppgtt.c b/tests/intel/gem_ppgtt.c
index 9eb995f20..4cafa620f 100644
--- a/tests/intel/gem_ppgtt.c
+++ b/tests/intel/gem_ppgtt.c
@@ -42,10 +42,11 @@
 /**
  * TEST: gem ppgtt
  * Category: Desktop client
- * Feature: mapping, xorg_dri2
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: buffer management
- * Sub-category: Memory management
  * Test category: GEM_Legacy
+ * Feature: mapping, xorg_dri2
  *
  * SUBTEST: blt-vs-render-ctx0
  *
diff --git a/tests/intel/gem_read_read_speed.c b/tests/intel/gem_read_read_speed.c
index 47c3dfecd..7b7006b44 100644
--- a/tests/intel/gem_read_read_speed.c
+++ b/tests/intel/gem_read_read_speed.c
@@ -45,8 +45,9 @@
 /**
  * TEST: gem read read speed
  * Description: Test speed of concurrent reads between engines.
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: read/write memory
  *
  * SUBTEST: read-read-1024x1024
diff --git a/tests/intel/gem_readwrite.c b/tests/intel/gem_readwrite.c
index 9970c5f33..5e012e6df 100644
--- a/tests/intel/gem_readwrite.c
+++ b/tests/intel/gem_readwrite.c
@@ -40,10 +40,11 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem readwrite
- * Feature: mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: read/write memory
+ * Feature: mapping
  *
  * SUBTEST: beyond-EOB
  *
diff --git a/tests/intel/gem_set_tiling_vs_gtt.c b/tests/intel/gem_set_tiling_vs_gtt.c
index 3305a2297..8ebc74601 100644
--- a/tests/intel/gem_set_tiling_vs_gtt.c
+++ b/tests/intel/gem_set_tiling_vs_gtt.c
@@ -41,10 +41,11 @@
 /**
  * TEST: gem set tiling vs gtt
  * Description: Check set_tiling vs gtt mmap coherency.
- * Feature: gtt
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tiling vs gtt coherency
+ * Feature: gtt
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_set_tiling_vs_pwrite.c b/tests/intel/gem_set_tiling_vs_pwrite.c
index 241e72ab8..f5d9ea699 100644
--- a/tests/intel/gem_set_tiling_vs_pwrite.c
+++ b/tests/intel/gem_set_tiling_vs_pwrite.c
@@ -41,10 +41,11 @@
 /**
  * TEST: gem set tiling vs pwrite
  * Description: Check set_tiling vs pwrite coherency.
- * Feature: gtt
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tiling vs pwrite coherency
+ * Feature: gtt
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_streaming_writes.c b/tests/intel/gem_streaming_writes.c
index d707c703a..f02347996 100644
--- a/tests/intel/gem_streaming_writes.c
+++ b/tests/intel/gem_streaming_writes.c
@@ -43,8 +43,9 @@
 /**
  * TEST: gem streaming writes
  * Description: Test of streaming writes into active GPU sources
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: barrier
  *
  * SUBTEST: batch-cpu
diff --git a/tests/intel/gem_tiled_blits.c b/tests/intel/gem_tiled_blits.c
index 73adadef4..5465933a4 100644
--- a/tests/intel/gem_tiled_blits.c
+++ b/tests/intel/gem_tiled_blits.c
@@ -57,10 +57,11 @@
 /**
  * TEST: gem tiled blits
  * Description: Test doing many tiled blits, with a working set larger than the aperture size.
- * Feature: gtt, mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tiled blits
+ * Feature: gtt, mapping
  *
  * SUBTEST: basic
  * Description: Check basic functionality.
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index faebe0efb..b89d8eece 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -50,10 +50,11 @@
  * Description:
  *   Tests fence management problems related to tiled blits by performing many blits on tiled
  *   buffer objects with fences enabled and with working set larger than the aperture size.
- * Feature: gtt, mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tiled blits
+ * Feature: gtt, mapping
  *
  * SUBTEST: basic
  * Description: Check basic functionality.
diff --git a/tests/intel/gem_tiled_partial_pwrite_pread.c b/tests/intel/gem_tiled_partial_pwrite_pread.c
index 9c24f1901..ca25fb263 100644
--- a/tests/intel/gem_tiled_partial_pwrite_pread.c
+++ b/tests/intel/gem_tiled_partial_pwrite_pread.c
@@ -41,10 +41,11 @@
 /**
  * TEST: gem tiled partial pwrite pread
  * Description: Test pwrite/pread consistency when touching partial cachelines.
- * Feature: gtt, mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tiled pread/pwrite
+ * Feature: gtt, mapping
  *
  * SUBTEST: reads
  *
diff --git a/tests/intel/gem_tiled_pread_basic.c b/tests/intel/gem_tiled_pread_basic.c
index 913800880..8cfe99a58 100644
--- a/tests/intel/gem_tiled_pread_basic.c
+++ b/tests/intel/gem_tiled_pread_basic.c
@@ -51,10 +51,11 @@
 /**
  * TEST: gem tiled pread basic
  * Description: Test pread behavior on tiled objects with respect to the reported swizzling value.
- * Feature: gtt, mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tiled pread/pwrite
+ * Feature: gtt, mapping
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_pread_pwrite.c b/tests/intel/gem_tiled_pread_pwrite.c
index 7ec6a9291..722125301 100644
--- a/tests/intel/gem_tiled_pread_pwrite.c
+++ b/tests/intel/gem_tiled_pread_pwrite.c
@@ -61,10 +61,11 @@
 /**
  * TEST: gem tiled pread pwrite
  * Description: Test swizzling by testing pwrite does the inverse of pread.
- * Feature: gtt, mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tiled pread/pwrite
+ * Feature: gtt, mapping
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_swapping.c b/tests/intel/gem_tiled_swapping.c
index 1b5c4bd14..cf13c229c 100644
--- a/tests/intel/gem_tiled_swapping.c
+++ b/tests/intel/gem_tiled_swapping.c
@@ -61,10 +61,11 @@
 /**
  * TEST: gem tiled swapping
  * Description: Exercise swizzle code for swapping.
- * Feature: gtt, mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: swapping
+ * Feature: gtt, mapping
  *
  * SUBTEST: non-threaded
  *
diff --git a/tests/intel/gem_tiled_wb.c b/tests/intel/gem_tiled_wb.c
index 53c1ea217..f6ceb54ea 100644
--- a/tests/intel/gem_tiled_wb.c
+++ b/tests/intel/gem_tiled_wb.c
@@ -50,10 +50,11 @@
  * Description:
  *   This is a test of write-combining mmap's behavior on tiled objects with respect to the reported
  *   swizzling value.
- * Feature: caching, gtt
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: cache
+ * Feature: caching, gtt
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiled_wc.c b/tests/intel/gem_tiled_wc.c
index 7b8e88427..ce4a26888 100644
--- a/tests/intel/gem_tiled_wc.c
+++ b/tests/intel/gem_tiled_wc.c
@@ -47,10 +47,11 @@
 #include "i915/gem_create.h"
 /**
  * TEST: gem tiled wc
- * Feature: caching, gtt
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: cache
+ * Feature: caching, gtt
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_tiling_max_stride.c b/tests/intel/gem_tiling_max_stride.c
index 5877b887c..795ca6681 100644
--- a/tests/intel/gem_tiling_max_stride.c
+++ b/tests/intel/gem_tiling_max_stride.c
@@ -42,10 +42,11 @@
 /**
  * TEST: gem tiling max stride
  * Description: Check that max fence stride works.
- * Feature: gtt, mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: fences
+ * Feature: gtt, mapping
  *
  * SUBTEST:
  */
diff --git a/tests/intel/gem_unfence_active_buffers.c b/tests/intel/gem_unfence_active_buffers.c
index cde4771c6..0f9821759 100644
--- a/tests/intel/gem_unfence_active_buffers.c
+++ b/tests/intel/gem_unfence_active_buffers.c
@@ -55,10 +55,11 @@
 /**
  * TEST: gem unfence active buffers
  * Description: Check for use-after-free in the fence stealing code.
- * Feature: synchronization feature
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: fences
+ * Feature: synchronization
  *
  * SUBTEST:
  */
diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
index 1e42555b2..907d0b936 100644
--- a/tests/intel/i915_fb_tiling.c
+++ b/tests/intel/i915_fb_tiling.c
@@ -26,10 +26,11 @@
 /**
  * TEST: i915 fb tiling
  * Description: Object tiling must be fixed after framebuffer creation.
- * Feature: mapping
- * Sub-category: Memory management
  * Category: Desktop client
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tiling
+ * Feature: mapping
  *
  * SUBTEST:
  */
diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
index 37ed11818..ae91f852d 100644
--- a/tests/intel/i915_selftest.c
+++ b/tests/intel/i915_selftest.c
@@ -54,11 +54,12 @@
  * Sub-category: uapi
  *
  * SUBTEST: live@coherency
- * Category: Selftest
  * Description: Cache management
+ * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: cache
  * Test category: i915 / HW
- * Sub-category: Memory management
  *
  * SUBTEST: live@debugger
  * Category: Selftest
@@ -74,15 +75,17 @@
  *
  * SUBTEST: live@dmabuf
  * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: buffer management
  * Test category: i915
- * Sub-category: Memory management
  *
  * SUBTEST: live@evict
  * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: GTT eviction
  * Test category: i915
- * Sub-category: Memory management
  *
  * SUBTEST: live@execlists
  * Description: command submission backend
@@ -140,11 +143,12 @@
  * Test category: i915
  *
  * SUBTEST: live@gt_gtt
- * Category: Selftest
  * Description: Validation of virtual address management and execution
+ * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: gtt
  * Test category: HW
- * Sub-category: Memory management
  *
  * SUBTEST: live@gt_heartbeat
  * Category: Selftest
@@ -183,16 +187,18 @@
  *
  * SUBTEST: live@gt_tlb
  * Category: Selftest
- * Test category: Memory Management
- * Sub-category: Memory management
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tlb
+ * Test category: Memory Management
  *
  * SUBTEST: live@gtt
- * Category: Selftest
  * Description: Virtual address management interface validation
+ * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: virtual address
  * Test category: i915
- * Sub-category: Memory management
  *
  * SUBTEST: live@gtt_l4wa
  * Category: Selftest
@@ -237,11 +243,12 @@
  * Sub-category: Reset
  *
  * SUBTEST: live@hugepages
- * Category: Selftest
  * Description: Large page support validation
+ * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: large page
  * Test category: i915
- * Sub-category: Memory management
  *
  * SUBTEST: live@late_gt_pm
  * Category: Selftest
@@ -251,31 +258,34 @@
  * Sub-category: Power management
  *
  * SUBTEST: live@lmem
+ * Description: Basic i915 driver module selftests
  * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Feature: local_memory
- * Description: Basic i915 driver module selftests
  * Functionality: local memory
- * Sub-category: Memory management
  *
  * SUBTEST: live@memory_region
- * Category: Selftest
  * Description: memory topology validation and migration checks
+ * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: memory topology
  * Test category: i915 / HW
- * Sub-category: Memory management
  *
  * SUBTEST: live@memory_region_cross_tile
- * Category: Selftest
  * Description: Multi-tile memory topology validation
- * Functionality: memory topology
+ * Category: Selftest
  * Sub-category: MultiTile
+ * Functionality: memory topology
  *
  * SUBTEST: live@mman
- * Category: Selftest
  * Description: memory management validation
+ * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: mapping
  * Test category: i915
- * Sub-category: Memory management
  *
  * SUBTEST: live@obj_lock
  * Category: Selftest
@@ -356,11 +366,12 @@
  * Sub-category: Power management
  *
  * SUBTEST: live@vma
- * Category: Selftest
  * Description: Per-object virtual address management
+ * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: vma
  * Test category: i915
- * Sub-category: Memory management
  *
  * SUBTEST: live@win_blt_copy
  * Category: Selftest
@@ -383,11 +394,12 @@
  * Functionality: mock selftest
  *
  * SUBTEST: mock@buddy
- * Category: Selftest
  * Description: Buddy allocation
+ * Category: Selftest
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: buddy allocation
  * Test category: DRM
- * Sub-category: Memory management
  *
  * SUBTEST: mock@contexts
  * Category: Selftest
@@ -510,9 +522,10 @@
  *
  * SUBTEST: mock@tlb
  * Category: Selftest
- * Test category: Memory Management
- * Sub-category: Memory management
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: tlb
+ * Test category: Memory Management
  *
  * SUBTEST: mock@uncore
  * Category: Selftest
diff --git a/tests/intel/prime_busy.c b/tests/intel/prime_busy.c
index 66af5f8a3..441b68cee 100644
--- a/tests/intel/prime_busy.c
+++ b/tests/intel/prime_busy.c
@@ -28,12 +28,13 @@
 #include "igt.h"
 /**
  * TEST: prime busy
- * Category: Infrastructure
  * Description: Basic check of polling for prime fences.
- * Feature: prime
+ * Category: Infrastructure
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: buffer management
- * Sub-category: Memory management
  * Test category: GEM_Legacy
+ * Feature: prime
  *
  * SUBTEST: after
  *
diff --git a/tests/intel/prime_mmap.c b/tests/intel/prime_mmap.c
index 3c0a0c0e5..bd449f914 100644
--- a/tests/intel/prime_mmap.c
+++ b/tests/intel/prime_mmap.c
@@ -53,10 +53,11 @@
 /**
  * TEST: prime mmap
  * Category: Infrastructure
- * Feature: prime
- * Functionality: prime mmap
- * Sub-category: Memory management
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
+ * Functionality: prime
  * Test category: GEM_Legacy
+ * Feature: prime
  *
  * SUBTEST: test_aperture_limit
  *
diff --git a/tests/intel/prime_mmap_coherency.c b/tests/intel/prime_mmap_coherency.c
index 3db79156d..3a8d4dfd6 100644
--- a/tests/intel/prime_mmap_coherency.c
+++ b/tests/intel/prime_mmap_coherency.c
@@ -33,13 +33,14 @@
 #include "igt.h"
 /**
  * TEST: prime mmap coherency
- * Category: Infrastructure
  * Description:
  *   Test dma-buf mmap on !llc platforms mostly and provoke coherency bugs so we know for sure where
  *   we need the sync ioctls.
+ * Category: Infrastructure
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
+ * Functionality: prime
  * Feature: prime
- * Functionality: prime mmap
- * Sub-category: Memory management
  * Test category: GEM_Legacy
  *
  * SUBTEST: ioctl-errors
diff --git a/tests/intel/prime_self_import.c b/tests/intel/prime_self_import.c
index 7bf947cf4..32279a96e 100644
--- a/tests/intel/prime_self_import.c
+++ b/tests/intel/prime_self_import.c
@@ -47,12 +47,13 @@
 #include "i915/gem_create.h"
 /**
  * TEST: prime self import
- * Category: Infrastructure
  * Description: Check whether prime import/export works on the same device... but with different fds.
- * Feature: prime
+ * Category: Infrastructure
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: buffer management
- * Sub-category: Memory management
  * Test category: GEM_Legacy
+ * Feature: prime
  *
  * SUBTEST: basic-llseek-bad
  * Description: Check dmabuf llseek support with invalid values.
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 8ef55211f..53814ad42 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Check VMA eviction
  * Category: Software building block
+ * Mega feature: Memory management
  * Sub-category: VMA
  * Functionality: eviction
  * GPU requirements: GPU needs to have dedicated VRAM
@@ -486,6 +487,7 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * @beng-large-multi-vm:	large multi VM bind exec_queue
  */
 /**
+ *
  * SUBTEST: evict-%s
  * Description:  %arg[1] evict test.
  * Feature: compute machine
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index dcd36a50d..f61763cd1 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -6,7 +6,8 @@
 /**
  * TEST: Test if the driver is capable of doing mmap on different memory regions
  * Category: Software building block
- * Sub-category: Memory management
+ * Mega feature: Memory management
+ * Sub-category: Memory management tests
  * Functionality: mmap
  */
 
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index d20100d7e..47a794f96 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Test for selecting per-VMA pat_index
  * Category: Software building block
+ * Mega feature: Memory management
  * Sub-category: VMA
  * Functionality: pat_index
  */
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 00c428bb5..ea4d3fa1c 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -6,6 +6,7 @@
 /**
  * TEST: Check if VMA functionality is working
  * Category: Software building block
+ * Mega feature: Memory management
  * Sub-category: VMA
  */
 
-- 
2.34.1

