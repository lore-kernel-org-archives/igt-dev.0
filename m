Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A70C83037
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 16:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F173310E4A9;
	Mon, 30 Jun 2025 16:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPevsypb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0A310E050
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 16:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301348; x=1782837348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g1K1aM6fX0dmC12swCAop98AYGArTo9kKkcglfWI2GE=;
 b=kPevsypbHKlMFafSild4Ne/WtIAKo9vSAuLlm9QqN2x4PZDkvAWQYhVi
 s/wkomWjRHinZta4giOfB7FIUM04oEgkKGAPU8Vib4dHZaj+QqjzSwjY8
 elLwwFbltFemDW5ZFVn+4Mn3XRyk9oVjVsKPpAkSrdFRTpskg0l9VRMvh
 /Wr+Xc7OVSiEshsOD6mFksjR47GC2newC2/ryj0sbnmtp+ALRTw8kxS4H
 ZP3llIwmNosxKc0PrOvgItxqys0gAPXSt6X4xYrXf4cqGZwfHKISKuQVG
 fdsXILHHjDF9r3lJbqYlTY9PYzgfuG/v25XvLzKRYY54xoa3GO2aJJ2He g==;
X-CSE-ConnectionGUID: /XL9XX31QjapzmntsMUnsQ==
X-CSE-MsgGUID: b062eMyrS364a9ZffL+OpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71101949"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="71101949"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
X-CSE-ConnectionGUID: yPixyQ+9SAiyIpigoyZ4bg==
X-CSE-MsgGUID: niOESLuPSQGEi0m51w0a7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="159226402"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 1/7] lib/xe: Track valid GT IDs
Date: Mon, 30 Jun 2025 09:35:31 -0700
Message-ID: <20250630163529.2096664-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630163529.2096664-9-matthew.d.roper@intel.com>
References: <20250630163529.2096664-9-matthew.d.roper@intel.com>
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

Although current Intel platforms always have GTs with consecutive IDs,
we should rely on this being true in the future.  During initial device
query, build a bitmask of valid GT IDs that userspace may use.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/xe/xe_query.c | 5 +++++
 lib/xe/xe_query.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 0d2e4805c..ac7b3110b 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -346,6 +346,11 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->va_bits = xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 	xe_dev->dev_id = xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
 	xe_dev->gt_list = xe_query_gt_list_new(fd);
+
+	/* GT IDs may be non-consecutive; keep a mask of valid IDs */
+	for (int gt = 0; gt < xe_dev->gt_list->num_gt; gt++)
+		xe_dev->gt_mask |= (1 << xe_dev->gt_list->gt_list[gt].gt_id);
+
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->engines = xe_query_engines(fd);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 1224a723a..37b0cf31e 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -36,6 +36,9 @@ struct xe_device {
 	/** @gt_list: gt info */
 	struct drm_xe_query_gt_list *gt_list;
 
+	/** @gt_mask: bitmask of GT IDs */
+	uint64_t gt_mask;
+
 	/** @memory_regions: bitmask of all memory regions */
 	uint64_t memory_regions;
 
-- 
2.49.0

