Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DE6C48BEB
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 16:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773410E817;
	Wed, 21 Feb 2024 16:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLEyQPr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83A910E817
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708532548; x=1740068548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZuei9H0m+Kp9VqIdaFKadMnAcJ1Gy/YpFb+voJdcGY=;
 b=bLEyQPr0LK5yBpEKiCsZMS7z0FUBDYqxdUf4x9ZNTjhaJnxc7MMJVuYh
 qlNydqtRJWh1NIqukygaHv0+Z0tFdLacEYoGlztnEBzwsLyAIfBJPTul0
 /GT2gP/4O9ghSzGAItrCmKmtHFLV2D6RQ5OjI/bybcseQ80R1kAkeIBHW
 qhyu7spB34cCDQC1klApNBwY3BJc8F6d5unsR7igHgYvj3HalkyB6J8gU
 9gqdQMgmYBKwzTJ/Ans8zX1wsKnLpv6fqPDBOIrPjc4SWHx4Z7SqG01/i
 I77ilF8o1WLahi8Mn/xpyoss9NzrJiI+XwYi5L+dJoHZWumNo2hSa6Rd+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6531403"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="6531403"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="827374020"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="827374020"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 08:22:16 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC][PATCH i-g-t 1/3] lib/igt_kms: Add sharpness strength property
Date: Wed, 21 Feb 2024 21:53:55 +0530
Message-Id: <20240221162357.394355-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221162357.394355-1-swati2.sharma@intel.com>
References: <20240221162357.394355-1-swati2.sharma@intel.com>
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

Added "sharpness strength" as crtc property.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 4 ++++
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1b4d0d761..0cb7aab48 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -694,6 +694,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_CRTC_SHARPENESS_STRENGTH] = "SHARPENESS_STRENGTH",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2434,6 +2435,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
 		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPENESS_STRENGTH))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_SHARPENESS_STRENGTH, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3882808b..3bf4afff0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -163,6 +163,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_OUT_FENCE_PTR,
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
+       IGT_CRTC_SHARPENESS_STRENGTH,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.25.1

