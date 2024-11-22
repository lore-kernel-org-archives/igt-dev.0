Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9F9E69188
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 18:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1620C10EC5A;
	Fri, 22 Nov 2024 18:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuSdgZ50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA1010EC58
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 18:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732301660; x=1763837660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=icVCaP2Br/Ph5cYQhy6Ss9TUtdLXoeo9nc9EVn+1tn0=;
 b=NuSdgZ50O3BA/cqFSar1Y+ayVJgDT357lmqjRW3GlNYybKtHWwRR+bjY
 ifJTcd8puPYOZlaH/fb3um+4aMJT0wrGaPV+Bu6HpXha++Gll2qeRTlzE
 WE1MwILRp5l6psOmw8K4a1xv6nZf80/vfsKw+aCujh5PAEQ9ofklsh0B7
 Mg2JGSdU/8QERG38qo9i6hTPwHhW7h5y42BLH3mA0LGi9VSGMgkxl7xv6
 2Bgafn2E2RGSB0pdbHF1eGFmB/a3Nspw/6fp57Xkt/Kw8wUT21sJ3VNNd
 7xYu1xCcvrK4J4CvfxOzRJMplp6p0lt8yWDMoAacMs55Yf6xkl9H0y+Nd A==;
X-CSE-ConnectionGUID: S5bET2bSSWCtMl0DSs1CNg==
X-CSE-MsgGUID: mSzwk6QvSrSBUcAH6YlvpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49987406"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="49987406"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 10:54:20 -0800
X-CSE-ConnectionGUID: 0zHdpPMwSEKPNhM0oeDIAA==
X-CSE-MsgGUID: OazGoPEUReWgdADb9qw+/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="113930281"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 10:54:19 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,
 v2 2/4] lib/igt_kms: Add func() to return scaling mode name string
Date: Sat, 23 Nov 2024 00:27:06 +0530
Message-Id: <20241122185708.1755203-3-swati2.sharma@intel.com>
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
index e5acde438..6c474b8f1 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1042,6 +1042,25 @@ const char *kmstest_scaling_filter_str(int filter)
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
index fbe132577..7fda89117 100644
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

