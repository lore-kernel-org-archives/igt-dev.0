Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C62CCF9EE
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 07:58:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3FF10EABE;
	Fri, 31 Oct 2025 07:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V67Ou+bH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7554010EABE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897529; x=1793433529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ylCMCaYJvKMiWcMPhZ6mT6qz1bYdvEhzFi0qA1pZCU=;
 b=V67Ou+bHTyUrnZr+F307yylk78kkY5whZl0WTRJe+Bz+FkdA5J1bCMAA
 gXdRxDnGC5BEjCmkqvt67jdHkHbWQyZbxdPHr+6hYABxXyJk/ffXj3199
 N9akGQ5E8ui+jVUIhfvDdhfSVpBultalKIYPFWftzN+NV9gTFt3/IONvZ
 7z+9Zoro9Pu3k1DVbVi6fzvtMIFsMIArzTbGObgzpqV+MZP0PNCXFog4A
 gIEdlG1L5HZ/JlKrArHvVWv4VdRHU0uGxFmbk4IulN4MsSvw9K+pdgU2e
 FbD78fxqibPGTWNRTIHSNXzL7bcO5ZQ4JopcJ9HgnsCzOBQmbr4n71XWp A==;
X-CSE-ConnectionGUID: oXNjmxWlT1a4TrpVEFKUKg==
X-CSE-MsgGUID: 1kT5xuJdRJapUIFwxpI2oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75502598"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75502598"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 00:58:49 -0700
X-CSE-ConnectionGUID: f198HTakTaGfyLS4oyAI9A==
X-CSE-MsgGUID: hM8Oouy+RLOQFVK3cuELlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186287290"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:58:48 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,
 v5 01/10] lib/igt_kms: Add "sharpness strength" as crtc property
Date: Fri, 31 Oct 2025 13:35:25 +0530
Message-Id: <20251031080534.880321-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251031080534.880321-1-swati2.sharma@intel.com>
References: <20251031080534.880321-1-swati2.sharma@intel.com>
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
v3: Rebase
v4: Rebase
v5: Rebase

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 4 ++++
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2eaf483d4..87f949150 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -715,6 +715,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2616,6 +2617,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_VRR_ENABLED))
 		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_VRR_ENABLED, 0);
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7121ab985..f59806b42 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -165,6 +165,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_OUT_FENCE_PTR,
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
+       IGT_CRTC_SHARPNESS_STRENGTH,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.25.1

