Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C201E77188
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 12:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D536F10E065;
	Tue, 31 Dec 2024 12:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAidI1PO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD2210E035
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735649860; x=1767185860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+NGpEBANo4C89EN138vJE/+OIeVfG4iRgNETrHWjx0g=;
 b=LAidI1PO466zPu3F7YvWabouFqqYtdd9fNFRQGgWAHi1iV+rm8eAp7sD
 LIgzRQMw3cHc7jvzAoa54/p1hQ51JhXvITJOQNk9cgyoRL2WkM4BPSv5W
 hYtcPJuISx0sn++vvDSFeDnA1BR1RNwTMFmD3NMmVqsZASPZBM5RVvtbv
 jCntCb+7jgotZBEgvvTPgkhmALHsrocVDSZoYOLjQq9gjNTX3E37VNl+d
 AyRI+diUcnriTv+cUKr109pflShPLIZc2sR0TBXMvrEscDe4XanaBz0J/
 qP9lU+WyGyoE3mN1tj9DTqLkXqVpNtOqnjPqJS/XnfT8udy6omeDwX81U g==;
X-CSE-ConnectionGUID: aPxAMukJR3qnFikZmQ/OFA==
X-CSE-MsgGUID: N+Nvx5whR02IPxLHa627+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46518393"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="46518393"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 04:57:40 -0800
X-CSE-ConnectionGUID: mHluP4R+RbOK6ZKK8I8eog==
X-CSE-MsgGUID: ucFk3oxjRG+lz1CL/W3JDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100867201"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 04:57:38 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 2/9] lib/igt_kms: Add func() to return scaling mode name string
Date: Tue, 31 Dec 2024 18:32:34 +0530
Message-Id: <20241231130241.69689-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231130241.69689-1-swati2.sharma@intel.com>
References: <20241231130241.69689-1-swati2.sharma@intel.com>
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

Add func() to print scaling mode name string.

v2: -replaced uint32_t with int (Ankit)
    -fixed subject (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 19 +++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2a26c6c0e..43288d519 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1057,6 +1057,25 @@ const char *kmstest_scaling_filter_str(int filter)
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
+const char *kmstest_scaling_mode_str(int mode)
+{
+	return find_type_name(scaling_modes_names, mode);
+}
+
 static const struct type_name dsc_output_format_names[] = {
 	{ DSC_FORMAT_RGB, "RGB" },
 	{ DSC_FORMAT_YCBCR420, "YCBCR420" },
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index bfd297a93..d37c59126 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -143,6 +143,7 @@ const char *kmstest_encoder_type_str(int type);
 const char *kmstest_connector_status_str(int status);
 const char *kmstest_connector_type_str(int type);
 const char *kmstest_scaling_filter_str(int filter);
+const char *kmstest_scaling_mode_str(int mode);
 const char *kmstest_dsc_output_format_str(int output_format);
 
 void kmstest_dump_mode(drmModeModeInfo *mode);
-- 
2.25.1

