Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40C2C61CE7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 09:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F9710E5FE;
	Wed, 11 Jun 2025 09:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="herpHIhL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1126A10E5FE
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749635841; x=1781171841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ctu/M9LmWIdk4SFaC7foVMpP2Pfh/37QCKSTAJa6SsM=;
 b=herpHIhLsOCCmGIHts0IwaqxtMocut9fn6WrQK53O7xXbkuzo++eZ2u5
 spC2zLJdqjkvg0V/AHyYQn/Tp447C07v1x/2C9UDyb1BPJnFrAoalXsGf
 C0Nmq11RFPpqFHAjRXuMIm2SVp7DCamvOZMojisN4N/ZbTKHtg8GhEKNV
 kKKgyefSxWga5em1vfH1K10pvfdh9MohDFa2zHWJbb3a6rnCGd/it8fGD
 5CJK38tKfNzX+BrW+QAHFQ/P7hLUp3VGZMn+KNQ+nWmkEEvo5hQbGSQdC
 mJdiGQqrieOg/qYd/uM1bWWWZfcFk+JxUqsg84WAtAQH9UUj/Dxa0ZXNA g==;
X-CSE-ConnectionGUID: 3DK32GLIQoOH+QMY9eKgpQ==
X-CSE-MsgGUID: F+6fEKvtTp6KQYyOPq9zbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62425682"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62425682"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 02:57:21 -0700
X-CSE-ConnectionGUID: 8rPdhBzSR3C36SvJx3JPuA==
X-CSE-MsgGUID: v/gsFBYmSQSBLw3YctjI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147059321"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 02:57:19 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag where
 it's missing
Date: Wed, 11 Jun 2025 11:57:11 +0200
Message-Id: <20250611095711.14864-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM flag when creating BOs
that will be CPU-mapped, to ensure that the corresponding VRAM
allocation will use the CPU accessible part of VRAM.

This is essential for small-bar systems, where omitting the flag may
cause failures or SIGBUS crashes due to the CPU accessing non-visible
VRAM.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_exec_atomic.c | 2 +-
 tests/intel/xe_pat.c         | 3 ++-
 tests/intel/xe_spin_batch.c  | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 825d7d190..39c739b64 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -85,7 +85,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size, placement,
-			  I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS);
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 88d8de9dd..8bb0ac167 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -582,7 +582,8 @@ static void prime_self_import_coh(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1), 0,
+	dst_handle = xe_bo_create_caching(fd1, 0, size, all_memory_regions(fd1),
+					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
 					  DRM_XE_GEM_CPU_CACHING_WC);
 
 	dma_buf_fd = prime_handle_to_fd(fd1, dst_handle);
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 21b08ba06..48a888e35 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -442,7 +442,8 @@ static void exec_store(int fd, struct drm_xe_engine_class_instance *eci,
 	vm = xe_vm_create(fd, 0, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bb_size = xe_bb_size(fd, sizeof(*data));
-	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id), 0);
+	bb = xe_bo_create(fd, vm, bb_size, vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 	bb_addr = intel_allocator_alloc_with_strategy(ahnd, bb, bb_size, 0,
 						      ALLOC_STRATEGY_LOW_TO_HIGH);
 	data = xe_bo_map(fd, bb, bb_size);
-- 
2.40.0

