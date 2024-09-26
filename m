Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6E1CDE00D
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 14:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5712D10E07C;
	Thu, 26 Sep 2024 14:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvhSAL/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EC310E07C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 14:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727361893; x=1758897893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2tUfRKJE0B0JpwhQMfeTaEBJgFvIpOUqNyYTXKzPPCU=;
 b=fvhSAL/wkOXkSDbwL0lnOhXBqvWWxwbN8SVLnrbzlsJ079TZI2T/zLh6
 4BkbdkpxsD1tFlgGrjxBqY2YFsc6OvX9ZaAQD3/jWozoMZzoRH5Ej92wN
 gkFyAFFFM5Mkrj0Qb2jHoRuYQ80sinXg0MdVWMeh0uHOK0pqybKoZnZaw
 W8iGf03F4B+puH4PtwZJwly+xGI+pWNkL447OcqsW8kdh6sC0eojWin5K
 EfRYbIZeUmetB7trGfpaQuDN3+b2ms8GHJYYdAW+khYfTETSVGngdNgSj
 I8/ti7HAiZNH6hYReWy28vSwiHoYalbip5HP+FlWhmxT3pr8kY95OrTs3 A==;
X-CSE-ConnectionGUID: tmcUbhbeRLyZFzZYzV4GvA==
X-CSE-MsgGUID: Cv+ks0c2Qx2p89Vd7hgQGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37046449"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="37046449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:44:53 -0700
X-CSE-ConnectionGUID: UA07XoAAQMOV4fxW3R1g0w==
X-CSE-MsgGUID: YmChII6iQRyMDpYebg8QUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72257265"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 07:44:51 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v6 1/4] lib/igt_kms: Added "sharpness strength" as crtc
 property
Date: Thu, 26 Sep 2024 20:15:57 +0530
Message-Id: <20240926144600.1212192-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240926144600.1212192-1-swati2.sharma@intel.com>
References: <20240926144600.1212192-1-swati2.sharma@intel.com>
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

v2: Replace SHARPENESS_STRENGTH with SHARPNESS_STRENGTH. (Nemesa)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 4 ++++
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b40470c02..73b024e0b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -700,6 +700,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2562,6 +2563,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
 		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 25ba50916..9bba0924d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -163,6 +163,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_OUT_FENCE_PTR,
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
+       IGT_CRTC_SHARPNESS_STRENGTH,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.25.1

