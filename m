Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E569DC83035
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 16:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12C710E4A6;
	Mon, 30 Jun 2025 16:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHO6oDtt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA1610E057
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751301348; x=1782837348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VgFTVGpHqsZ3/jnSeoWrdzx4RozbQWWzvLK8HgM9lPY=;
 b=HHO6oDttEebsANDCe0hMbDO3K9rmzFZvJ9FOIil8JM37LH5HwBz2yVeO
 Ec6JFjRk2wtzDaWX39nuqAE7Iv9+YwgGK8t+UHb+zhd04Lho0i60HYEGE
 76qvDmgChjSV0dXOvvHV3hap1BeFIXfKaRwL9ZGT9zIg1WFMbxLtGftbp
 0C1x2wFMD7dfVzV12ZteivTWHwmYa4J0i6k8xpVXWyugu/ZHnOHz8pIOv
 qfz2IicIFKXesZJrTErXZEdLAO3aLa25GxIFM6eKryMhhoVXxG3FXBA+Y
 dVOEO02BcELyI3fsfJEKvkt0jVI//G+GNUVpZtxb+cET7YugRijIdZK97 Q==;
X-CSE-ConnectionGUID: GB8N/evDTtqpM4XpiatPgg==
X-CSE-MsgGUID: FM9NvjyrTn2g0lfsMlmUUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="71101952"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="71101952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
X-CSE-ConnectionGUID: RxTf1yUdRm6ECYT9+9LPwA==
X-CSE-MsgGUID: JIQwNDNOSK+vezY/jGTg8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="159226412"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:35:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 4/7] lib/xe: Ensure GT loops iterate over all GTs
 properly
Date: Mon, 30 Jun 2025 09:35:34 -0700
Message-ID: <20250630163529.2096664-13-matthew.d.roper@intel.com>
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

There's no guarantee that GT IDs will be consecutive on future
platforms.  Ensure that the GT loops visit each GT in the GT ID mask,
rather than [0, num_gt - 1].

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/xe/xe_query.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 9a2ceb4c8..4aeff639a 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -77,8 +77,9 @@ struct xe_device {
 	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
 	     ++__class)
 #define xe_for_each_gt(__fd, __gt) \
-	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
-
+	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
+	     __gt = ffs(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
+	     igt_unique(__mask) &= ~BIT(__gt))
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
 	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
 		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
-- 
2.49.0

