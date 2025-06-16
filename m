Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB58EC71135
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 08:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9051410E2EB;
	Mon, 16 Jun 2025 08:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiccVniV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81DF10E2EA
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750064077; x=1781600077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ytkfgJ2dJ76ThpcAYRdhSfFp3YsTxvwG6wtHthyg8vg=;
 b=SiccVniV6zsc9ACTMkQnPsc4SCl+h6q7tqmqwx17A+83byj26Aze0QTZ
 1RbDnZzyiOHVENDpJYQPIBn0QWAIrdYvZn3SzD59oPpwPNjPWVZFDo5yz
 X/S/9ygNqTetUIg1QBaUgcoQapAGTZLIes19pWrbYcKYy6sr8Mc0VAQ8s
 6wN2c5VtVLuEAn8jpt2/ysaUfXR8crHoHvggXGs1wsGV26mtfi8RWIq0p
 IwzVDuzzpf+QsIp/kqWsyAqrHueiyknqg6UahLk8FK0qb53XAz1Kjmw9Y
 +89nI74hc834iroWB4MeIvcXPDTpdC3c0zhPQINQNlJvzjNl+xqmrXMBo g==;
X-CSE-ConnectionGUID: Xy6M4rHXTfS3MLfcnUoIhQ==
X-CSE-MsgGUID: lWYEa1AgS6eV1ZtAQNDcZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63615230"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="63615230"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:54:37 -0700
X-CSE-ConnectionGUID: gpEDaeFEQHaiB7KqtdEtQA==
X-CSE-MsgGUID: cFQogDrmQ1KcjWz7+W+/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153285699"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:54:35 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, kamil.konieczny@intel.com, lukasz.laguna@intel.com
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag
 where it's missing
Date: Mon, 16 Jun 2025 10:54:16 +0200
Message-Id: <20250616085417.20178-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250616085417.20178-1-lukasz.laguna@intel.com>
References: <20250616085417.20178-1-lukasz.laguna@intel.com>
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
 tests/intel/xe_pat.c        | 3 ++-
 tests/intel/xe_spin_batch.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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

