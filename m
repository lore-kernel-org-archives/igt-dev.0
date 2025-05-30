Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735A6C54FB3
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 00:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FF110E7C3;
	Fri, 30 May 2025 00:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCBS5pIR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0E010E7C4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 00:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748564383; x=1780100383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q11sm+M8jmAhIvKz82Q8Lp9lKkpWzo1LZqBK1k1uHP4=;
 b=WCBS5pIRmTuoAPtMYrNdm9cP6nQCkLPT/rTEq4d3/zyOXzU5Ay3EJ+hk
 mMIvScbTfwqDk/uiQJsULn6ELWBtQn2l3zAxxgOKvH1f2eB3el5EWCIvC
 nqi4iM4PKxLwIkhxi/V3MUZBYiCNFKV4wgRedoDQNdw+7Q3kKEZG98D+/
 5eCWP0tGrOZxgDGIFD95JGUme8oBoRPkQuhTf4Jl33WpaqC+BjStGAfo0
 Eq8S978QoreIr/k+vNnAzfbQfco8lp72zZShwZzCy7/pjV3TgDVp57ALj
 FXxYJj2THPwbfOZd66Ie+9UHbfBUaxWH3N3O4WOASZE3XG1xzwY847WHs Q==;
X-CSE-ConnectionGUID: RKlxKkjLTiC8b6DqO2zs/Q==
X-CSE-MsgGUID: 3PHm0hdnRHGoPln5V77nyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50652406"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="50652406"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 17:19:31 -0700
X-CSE-ConnectionGUID: indXuq4YRQeOZjeLZiYCNQ==
X-CSE-MsgGUID: 370vEuCTTPeHMyjHx7e2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="148872406"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa004.fm.intel.com with ESMTP; 29 May 2025 17:19:29 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Zuo <alex.zuo@intel.com>, Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH] tests/intel/xe_vm: Fix assertion of batch buffer size
Date: Fri, 30 May 2025 00:18:44 +0000
Message-Id: <20250530001844.703844-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

The batch buffer pointer is data not data[i]. Correct it in the assertion.
Fix a word typo error.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Zuo <alex.zuo@intel.com>
Cc: Zongyao Bai <zongyao.bai@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_vm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index b5bba7b7e..94cca13ba 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1719,7 +1719,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 	addr = base_addr;
 
 	/*
-	 * Kick a thread to write the first page continously to ensure we can't
+	 * Kick a thread to write the first page continuously to ensure we can't
 	 * cause a fault if a rebind occurs during munmap style VM unbind
 	 * (partial VMAs unbound).
 	 */
@@ -1750,7 +1750,7 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 		data->batch[b++] = sdi_addr >> 32;
 		data->batch[b++] = 0xc0ffee;
 		data->batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+		igt_assert(b <= ARRAY_SIZE(data->batch));
 
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		if (i)
@@ -1807,7 +1807,7 @@ try_again_after_invalidate:
 			data->batch[b++] = sdi_addr >> 32;
 			data->batch[b++] = 0xc0ffee;
 			data->batch[b++] = MI_BATCH_BUFFER_END;
-			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+			igt_assert(b <= ARRAY_SIZE(data->batch));
 
 			sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 			syncobj_reset(fd, &sync[1].handle, 1);
@@ -1878,7 +1878,7 @@ try_again_after_invalidate:
 		data->batch[b++] = sdi_addr >> 32;
 		data->batch[b++] = 0xc0ffee;
 		data->batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+		igt_assert(b <= ARRAY_SIZE(data->batch));
 
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		syncobj_reset(fd, &sync[1].handle, 1);
@@ -2056,7 +2056,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		data->batch[b++] = sdi_addr >> 32;
 		data->batch[b++] = 0xc0ffee;
 		data->batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+		igt_assert(b <= ARRAY_SIZE(data->batch));
 
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		if (i)
@@ -2115,7 +2115,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		data->batch[b++] = sdi_addr >> 32;
 		data->batch[b++] = 0xc0ffee;
 		data->batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+		igt_assert(b <= ARRAY_SIZE(data->batch));
 
 		data = map1 + i * page_size;
 		b = 0;
@@ -2124,7 +2124,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 		data->batch[b++] = sdi_addr >> 32;
 		data->batch[b++] = 0xc0ffee;
 		data->batch[b++] = MI_BATCH_BUFFER_END;
-		igt_assert(b <= ARRAY_SIZE(data[i].batch));
+		igt_assert(b <= ARRAY_SIZE(data->batch));
 
 		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
 		if (i)
-- 
2.25.1

