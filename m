Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590B9CD1284
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 05:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1A11392D;
	Fri,  5 Apr 2024 05:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhpjyCsi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D5E11392B
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 05:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712296584; x=1743832584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CXuVSjtwUKDvthWYI6Pd8w+4RAgQvBbKWcxDv7RBw30=;
 b=ZhpjyCsimQLYPcKJVRsawz97piAZA13hyPIdzdgnp/OVoPJip9ZpWYnK
 IFUBj1P5e5iopy3Yx0K4vtkVXYoPeGSmbxuHL5kKBaLIWTxRftSwTuawC
 k+jy7xYxG7ViNiC2bnusFBtJhR7COq+BUQNTAa/BekpNelpjvBjnZYXey
 sG3CF/uPKdIPeycNWYgFCW8Xt7viM3HltErHgmZ42RmZkRpoJktl3EiFy
 /WgcBbWx/hBVSJOERQg5qEaFNuMGD1sfTP+60c+CBRCoba96VpuAuM71N
 GEGwFoq76CBa7WVUrR7MxQhk90KfjDFTE90Sar3E2fMJG4ifSwiZ6n5TZ A==;
X-CSE-ConnectionGUID: Hn4ehh/YTpaTWmAa7VNIIA==
X-CSE-MsgGUID: wGRilPJMT0CHkc+Dw06WxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7514712"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7514712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 22:56:24 -0700
X-CSE-ConnectionGUID: QsBuSE+4RNOHq4BH606OQw==
X-CSE-MsgGUID: mi66jwz9Sr6tIb0Hd9Rg8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="18978519"
Received: from unknown (HELO
 dg2adlp-Alder-Lake-Client-Platform.iind.intel.com) ([10.145.162.161])
 by fmviesa010.fm.intel.com with ESMTP; 04 Apr 2024 22:56:22 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 1/2] lib/igt_kms: Added "sharpness strength" as crtc
 property
Date: Fri,  5 Apr 2024 11:26:01 +0530
Message-Id: <20240405055602.11965-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405055602.11965-1-mohammed.thasleem@intel.com>
References: <20240405055602.11965-1-mohammed.thasleem@intel.com>
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

From: Swati Sharma <swati2.sharma@intel.com>

Added "sharpness strength" as crtc property.

v2: Replace SHARPENESS_STRENGTH with SHARPNESS_STRENGTH. (Nemesa)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c | 4 ++++
 lib/igt_kms.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2a518eb8d..f60e623ed 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -694,6 +694,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2434,6 +2435,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
 		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
+		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
+
 	pipe->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6d13e5851..455ca0d16 100644
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
2.34.1

