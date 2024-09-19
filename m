Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB167CDD54F
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 12:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C3A10E6BC;
	Thu, 19 Sep 2024 12:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RXdB6UjL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED1510E6BC
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 12:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726750016; x=1758286016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y3eDG31O5dBwVpelL6gjnTqwf0QrelKkthFgfDOjUQU=;
 b=RXdB6UjL1gvj1xONILfgrLTPaF+BfWQ5kiorXYwv5MCpCrb/IVT9kwLo
 42sJ0vbD/IQ96/c5IXaLru6TzBgN6L4StHQjWwdRz7U+R2tEOPN0Mmgln
 HvOBv2vpQyk0sTbdeNE2hZJ2/odLbGG1IgYU2rtfmX3ElW1IlGe4AZ6W5
 8qZSimaDcV3jUULPJ0PYE1ZRLE47HTsqxVhMiElL5OG0O3FL/7ZdcEhGV
 mk7scOXjHYwEaPTgAEA5OTOXTntgDFImCMEYFXS3LfUyzRIJTR2cBFmcZ
 sHZ8fqmquBCjWuMIjFIWVrL15H8GEfrM59c4hyrW6xUEG3YJ/tX3YQ7J2 A==;
X-CSE-ConnectionGUID: Vo2gp7GrQjifrHT98GCRig==
X-CSE-MsgGUID: qotrbUzcRtSbfn/WacLGVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25900215"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25900215"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 05:46:56 -0700
X-CSE-ConnectionGUID: Dk+oaUhbScG3JFCoVMnxcA==
X-CSE-MsgGUID: lLk3l0RTTnysenI/L4Gvmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="93215689"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 05:46:54 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, nemesa.garg@intel.com,
 Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [igt-dev][PATCH i-g-t v5 1/3] lib/igt_kms: Added "sharpness strength"
 as crtc property
Date: Thu, 19 Sep 2024 18:19:25 +0530
Message-Id: <20240919124927.1142249-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240919124927.1142249-1-swati2.sharma@intel.com>
References: <20240919124927.1142249-1-swati2.sharma@intel.com>
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
index dd530dbab..33d38b30c 100644
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

