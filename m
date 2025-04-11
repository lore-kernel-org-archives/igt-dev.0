Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC38CC369A9
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 12:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED2610EB84;
	Fri, 11 Apr 2025 12:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cXIEMwkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8506210EB84
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744373239; x=1775909239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRDOg/CwW2n+VUQAq/7BzBfeO4p+PFXwI89PoDXDybg=;
 b=cXIEMwkmAm1Vw2NLLUaFQiOlvm80YvupkH6KqCamE7h9/tkjCmnrkAOB
 u9D7Svu38s61D8UpC+Zn/TrLvBQtCLoYB6GmM6qkpk84c5oQ8uS59NHyT
 zVxQ3ACIxvSwXMxJb/bzaG4r6nN8SFuFQex7x9Tab0X4csW+u49NWwIgH
 AKRiUvJQH7E8lFtp3YfiFfO12gYsofe7E0NfnIAGF0yZ0wu00vn6aSmtH
 lXRLHCNMkY9Rrfrr9mCl/jpESOcdLKMv/FizXYi0oK82NP5q9FPZ2NZC7
 LAKg5ZzMsXME8uzYrpRru71BXC+ZtKrIg58648bt2D9il/qE2v8Vm2K06 Q==;
X-CSE-ConnectionGUID: GfdzAtLxRZ2o7LGmct6SeA==
X-CSE-MsgGUID: aExaZaCGSnWEiQBouZ3HWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56907811"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="56907811"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:19 -0700
X-CSE-ConnectionGUID: II26PNtGR4aUhtqu6LFmdA==
X-CSE-MsgGUID: wwc1FEJcT8m4Kipws1qNHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134044877"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:18 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t,
 v5 01/10] lib/igt_kms: Add "sharpness strength" as crtc property
Date: Fri, 11 Apr 2025 17:42:29 +0530
Message-Id: <20250411121238.773949-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411121238.773949-1-swati2.sharma@intel.com>
References: <20250411121238.773949-1-swati2.sharma@intel.com>
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
index 99c8707c7..e63d228dd 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -714,6 +714,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2615,6 +2616,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_VRR_ENABLED))
 		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_VRR_ENABLED, 0);
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0381c82ad..353570ac2 100644
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

