Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A17CCDD552
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 12:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1145910E6D3;
	Thu, 19 Sep 2024 12:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6b+wM1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F4310E6D3
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726750018; x=1758286018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qDn2utei80dXy3ddPZeZNXtJj1f7/eDAjPlVBHxyE9g=;
 b=F6b+wM1nqFAzVLls06O4V34CbqK0V6n9gxPSMit7x1XR8ZLgMGqfVTvL
 lJrPuNY66W8PDYqk4c557MFqwHnG5rSagoMOB0yflTvyM5DBsgbPBecb6
 PDo22230niresU/SrPGSi+orrxadGY/75XmfWVJyeGYy3zFSGUQdlr9Au
 qc0hfSWdpSeBSqkryNMnR1OpLoY9OlO4EMlYit9U4f/a4UOb+8DVisVdg
 NyscQTepjqxpUwJqgjqAmhI/Jkuibh+PITq5u/WD7/Q/HUwGJ5OxkYlvi
 3lM8ZdAMykRpLKuBW1a+BwFAA5n6OSVcyFFxi47Wos0Ecyle3r3W9ZFQi Q==;
X-CSE-ConnectionGUID: 7gBT1Sk8SsWbcdyTfnJRfQ==
X-CSE-MsgGUID: sRc1pJ/7RF6tNNMr6EyMBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25900225"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25900225"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 05:46:58 -0700
X-CSE-ConnectionGUID: KoH39LMBTu2D9XaqGhYmBA==
X-CSE-MsgGUID: mme4ec/WRLG21RU8Fy3UQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="93215696"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 05:46:56 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, nemesa.garg@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [igt-dev][PATCH i-g-t v5 2/3] lib/igt_kms: Added func() to return
 scaling mode name string
Date: Thu, 19 Sep 2024 18:19:26 +0530
Message-Id: <20240919124927.1142249-3-swati2.sharma@intel.com>
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

Added func() to print scaling mode name string.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 19 +++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 33d38b30c..7d50fc700 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1040,6 +1040,25 @@ const char *kmstest_scaling_filter_str(int filter)
 	return find_type_name(scaling_filter_names, filter);
 }
 
+static const struct type_name scaling_modes_names[] = {
+	{ DRM_MODE_SCALE_FULLSCREEN, "fullscreen" },
+	{ DRM_MODE_SCALE_CENTER, "center" },
+	{ DRM_MODE_SCALE_ASPECT, "aspect" },
+	{ DRM_MODE_SCALE_NONE, "none" },
+	{}
+};
+
+/**
+ * kmstest_scaling_mode_str:
+ * @mode: SCALING_MODE_* mode value
+ *
+ * Returns: A string representing the scaling mode @mode.
+ */
+const char *kmstest_scaling_mode_str(uint32_t mode)
+{
+	return find_type_name(scaling_modes_names, mode);
+}
+
 static const struct type_name dsc_output_format_names[] = {
 	{ DSC_FORMAT_RGB, "RGB" },
 	{ DSC_FORMAT_YCBCR420, "YCBCR420" },
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9bba0924d..cc705763f 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -142,6 +142,7 @@ const char *kmstest_encoder_type_str(int type);
 const char *kmstest_connector_status_str(int status);
 const char *kmstest_connector_type_str(int type);
 const char *kmstest_scaling_filter_str(int filter);
+const char *kmstest_scaling_mode_str(uint32_t mode);
 const char *kmstest_dsc_output_format_str(int output_format);
 
 void kmstest_dump_mode(drmModeModeInfo *mode);
-- 
2.25.1

