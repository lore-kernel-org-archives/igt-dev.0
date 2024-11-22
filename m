Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC7CE69189
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 18:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1599410EC58;
	Fri, 22 Nov 2024 18:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IY3FJHw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D87810EC58
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 18:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732301659; x=1763837659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gfRyK10gtIrHhZMtbCp1/xpxpHWS1+CJwTaLpW4dWFw=;
 b=IY3FJHw18t3c81OGWAq6NJnAsMlfoyl/ngPD16eFe82w7xOcPCv9qJlo
 ggve+l7rZMyPs1MS/jH7tUfkSRYdmREP+thLE+xRlkhMv5CRcnYJoGbpl
 K/X4Owh23HBITsUm4mdxczLL8Pfih1auGuAle+FNvD9Pz5CR5IROdoN+j
 26NL/OKU15o/A0BeMK3VpnRJjy1GMUCIWstMidRNH/3Hzf4UoXrfeKXei
 WaG6Ar6lUDJKidm+Zh1qX8l8zYoEdoBpPxw2VA5V1KzOav121PkeVLHGj
 ra0BHtkUk2OUbn1exXCqYkgOBUw3aUS0/pprrlkoQLCv7iqlZSTHBb37h w==;
X-CSE-ConnectionGUID: 4Mrbe3XjS0CWtvUIqF8JlQ==
X-CSE-MsgGUID: bor3RFm8Sm2+lJwLntLM/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49987397"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="49987397"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 10:54:19 -0800
X-CSE-ConnectionGUID: MqomxVVTQlW7R/eKoPYheQ==
X-CSE-MsgGUID: Wwn8ByClR+yxgRDcL7HlUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="113930259"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 10:54:17 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,
 v7 1/4] lib/igt_kms: Add "sharpness strength" as crtc property
Date: Sat, 23 Nov 2024 00:27:05 +0530
Message-Id: <20241122185708.1755203-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241122185708.1755203-1-swati2.sharma@intel.com>
References: <20241122185708.1755203-1-swati2.sharma@intel.com>
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

Add "sharpness strength" as crtc property.

v2: Replace SHARPENESS_STRENGTH with SHARPNESS_STRENGTH. (Nemesa)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 4 ++++
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5d8096a17..e5acde438 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -702,6 +702,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2587,6 +2588,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
 		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index bd154d1c1..fbe132577 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -164,6 +164,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_OUT_FENCE_PTR,
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
+       IGT_CRTC_SHARPNESS_STRENGTH,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.25.1

