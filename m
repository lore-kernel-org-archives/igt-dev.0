Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D65C47DD3
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 20:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A2610E907;
	Thu, 18 Jan 2024 20:13:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2179E10E171
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 20:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705608818; x=1737144818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lsgabItjpfLViay+ZDEPbHVpsEIsUm2xrvox7o0xAaM=;
 b=VOIZgj7sp1/d440foGt4U/lVZ8tOCoTZJHt7Eyooq4QT6jSx1pY42pMm
 ObtjbYvkchnzgAIBPDNgozuFmOK5prmDA5TGKrS31618hwIcRsW52RxUN
 yezyF8RdYHNp26G2ccyNMtVcLdDZAtzhwGCx/76o5rzJHbVcKKwXm3gH2
 j42H3CliVOdPGlEaKU4+JPPa4zyp+aSKD/OKjuT373hSuKTd7vEWZzNWm
 /NNySQ5ARl007qqz+rE5WIfZ79sj0WEYi6R5SWFeFCJc69DqHSDuuDPED
 YPPhXEqsxVVZizvwBiU2WCuzVXsaeef1mHYVZV88W/yOZ5zcZB0gUGRq+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="391009960"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="391009960"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 12:13:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="19199724"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.72])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 12:13:27 -0800
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Subject: [PATCH i-g-t] tests/intel/xe_exec_store: Fix prefetch on Xe2
Date: Thu, 18 Jan 2024 12:13:21 -0800
Message-Id: <20240118201321.961595-2-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118201321.961595-1-jagmeet.randhawa@intel.com>
References: <20240118201321.961595-1-jagmeet.randhawa@intel.com>
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
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Due to batch pre-fetch being quite aggressive on Xe2, we need
an extra 4K page at the end of the batch to ensure HW doesn't
pre-fetch beyond the boundaries of the batch itself, hitting
an invalid ppGTT page, resulting in CAT errors. Fix this by
accounting for the xe_cs_prefetch_size() when calculating
the size of the batch.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_exec_store.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index 2e4f57b47..bed118688 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -201,7 +201,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t *batch_map;
 	size_t bo_size = 4096;
 
-	bo_size = ALIGN(bo_size, xe_get_default_alignment(fd));
+	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 	vm = xe_vm_create(fd, 0, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
-- 
2.25.1

