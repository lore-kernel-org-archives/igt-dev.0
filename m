Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3FCC021B6
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:52:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A441710EAFF;
	Fri, 21 Feb 2025 16:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4JF2XPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B67410EAFF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740156759; x=1771692759;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvgI64mC8hyvI/tFMoBq/4s+TvkKSmur5uky2o8LWbY=;
 b=J4JF2XPjy74d6sf91tMTMQzs229Fdiv49wfPc7VPutKKTLI/DuN7C1Fs
 Ch8Cj0+b/TGwQFKQ5h73kbTpISWdjgTxhrTix0RjvzGjtgF4q8ETTczdE
 3kZqU87RXSLeBM70/OcjWZbMaHzLQkl+/Ips8exOxY56l7fOeL0UAhshp
 /6lgOBUqkQtXqYD0dZauatZx2sxXKv7TyJyCQ2Fx5YQVQftir+2zllVAP
 3iymgBoMYU2C9J/WhakdKffDLRZEsB4moUadPUlarBflVvFkwP/RswZ3e
 w7bKotFWuv7ar1dDjuQEhiYCM8CbAFf8AV+4ToX92Zv3trq4a5wWyVhjM g==;
X-CSE-ConnectionGUID: JMIBzFCKT0i/vmAG87t7Pg==
X-CSE-MsgGUID: zX/zvzzdSq6S6qd82vCmSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41186730"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41186730"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:39 -0800
X-CSE-ConnectionGUID: 48r2WgXuQJK78pTAVk1V7g==
X-CSE-MsgGUID: tAc9Wzc3SlKyo0+EiJvolg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120517565"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:38 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t,
 v5 01/11] lib/igt_kms: Add "sharpness strength" as crtc property
Date: Fri, 21 Feb 2025 22:27:39 +0530
Message-Id: <20250221165749.460347-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221165749.460347-1-swati2.sharma@intel.com>
References: <20250221165749.460347-1-swati2.sharma@intel.com>
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
index bc46487c5..dac818c71 100644
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
index 31b9820cb..6a1925d9d 100644
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

