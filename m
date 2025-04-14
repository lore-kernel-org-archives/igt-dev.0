Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D255C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 11:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C0610E571;
	Mon, 14 Apr 2025 11:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMpBYmHc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D2E10E56B
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744629099; x=1776165099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FQSkJmd2GXhI1OHvC6lO+60r9tb4LjHKP6QSg7OEsA4=;
 b=lMpBYmHc0UYR2TMeuTH0Nncfu8gGpq+snilnVjFVhCehPuenGKJRmWYM
 4L5H/fQf9SHzhrT5FRdNRtRalsj2uYaP4O2hf8JB2gBM7Iydb4AUCPEL3
 IdN/SQLdseZI2wJWk4/OfQavr7oTEPyvaT58lZjCUb1RE5s/YasnHZAPo
 BWDW3qcQZairplC7CmrzodSsNS9tj4OzF+Z32lHFY3Yaem9WzMuZGmab3
 Gjym83C/oqYUQuYRO1hUvBRowsccTeevyZv9z02Gfr+KCfJj4e+F/cfKP
 xx7G3Z2swPpZbBDqpkDWkm1MSYU3XrHLMWOnmutJfa9tTWWJMvTbEZqUe A==;
X-CSE-ConnectionGUID: dJZUxkAqSnuwCc43ksnOlw==
X-CSE-MsgGUID: D/r8GwQWTaGuBaoUC6afSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="33706183"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="33706183"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:11:39 -0700
X-CSE-ConnectionGUID: GvOkTMmMRiO8C9Oti3wRSA==
X-CSE-MsgGUID: Kbn30uwNRCeRPlt3D16KzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134838315"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:11:37 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 02/10] lib/igt_kms: Add func() to return scaling mode name string
Date: Mon, 14 Apr 2025 16:46:49 +0530
Message-Id: <20250414111657.794484-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414111657.794484-1-swati2.sharma@intel.com>
References: <20250414111657.794484-1-swati2.sharma@intel.com>
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
index e63d228dd..de5da841e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1054,6 +1054,25 @@ const char *kmstest_scaling_filter_str(int filter)
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
index 353570ac2..bca950e37 100644
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

