Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9EAE7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 11:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED9F10E4AF;
	Mon,  9 Dec 2024 11:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3j5sWYx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C107610E4A4
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 11:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733744618; x=1765280618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TimcHhM9fim4pMDnWAz2MbFPQOPVgg9XA4B2sAAqbNs=;
 b=c3j5sWYxNHfuxCqjm4zhbL+A3DLaNHlGEy3ROBLecA8ERMnuaDcgKC/I
 5KDchA09k5lfKS+S7GiQHMkg17nbfeUW6B0qLzdi+3qGuGH6fmr2W4/Yk
 ebojuWnfA6wEYo4pChkEzQ6X74I4oTZ6Jw3h6Oa24fErhYpzcIjnh7raJ
 um+g/9PySfPLXXABoZuVCSMmr4Msi62bvcZJG3eKBbNV1X+rPd5NwsPQN
 oGZc1kRQqy1m9vZ7wf/c6uDw3STxRgzVfOlfHnSc6u0Rhu8S6mGi+PX1h
 +pBMaLTO4JNQbJkB37Q+p+OG/RfGA2zKpXNplK/RZfzoSt0IstXNgubA4 g==;
X-CSE-ConnectionGUID: jbysYaNWTVW3Tus9psYQFg==
X-CSE-MsgGUID: noEx01PvRAehP1myAK2y1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34182063"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34182063"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 03:43:38 -0800
X-CSE-ConnectionGUID: /yfFNbeaREuHeSx9y8zpnA==
X-CSE-MsgGUID: g46lfYbKRU++Uu/p0PNw8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99503151"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:43:36 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,
 v3 1/9] lib/igt_kms: Add "sharpness strength" as crtc property
Date: Mon,  9 Dec 2024 17:16:15 +0530
Message-Id: <20241209114623.1843033-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209114623.1843033-1-swati2.sharma@intel.com>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 4 ++++
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 22b6534e6..8bfc00cc7 100644
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
index 301f370df..287abde19 100644
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

