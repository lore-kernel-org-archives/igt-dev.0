Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57678E77172
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 08:23:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CCE10EC46;
	Wed,  4 Dec 2024 08:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZveoPk5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F99310EC46
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 08:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733300618; x=1764836618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cb+OmKZlqiDGQ8hvGG/3kmpSfBSReUeWW6YmH+gcjgk=;
 b=ZveoPk5RiV3C5I2aec9FBtyT6YB8YVSEYCaLoAj7puCjNdgosncK/Egu
 KBN6KcU+DovR+jYVOWUWECrfak4kI70r6NTHacWmFQi0RJT6jifWZsLg7
 rrYfqridf/2e/dRzWDlJlx5WFSdibuhr9XHiNhWl+MJXaZSAsklkWL7YB
 bJPHpMpP1b3vLjjkjDELAP15XwNnVGeZdNuzK6d0fWN1KfCKobhTVMBp5
 e5FCNe4xzARvGqTAMcf3mwE+t8dn25BkLFa93fMM8+nIRdATKfZXgl6bl
 Xr5lTezbzMGsQoyoNvIMyDPy1Xxtpfa4y1Lwzmu8pfplo2oWE/Y1ePvnd Q==;
X-CSE-ConnectionGUID: lMcQiyl0Tg2seg1/Z9gyPg==
X-CSE-MsgGUID: Koe+yXqzR8S1v04grxUIQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44163533"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44163533"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 00:23:38 -0800
X-CSE-ConnectionGUID: 6nsbz9dKQfWvMz6CH6WKlg==
X-CSE-MsgGUID: EH9E24/pQUefQYtxg6GvRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98768705"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 00:23:37 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 2/9] lib/igt_kms: Add func() to return scaling mode name string
Date: Wed,  4 Dec 2024 13:56:20 +0530
Message-Id: <20241204082627.1800617-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204082627.1800617-1-swati2.sharma@intel.com>
References: <20241204082627.1800617-1-swati2.sharma@intel.com>
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
index 557ce04f8..19fa623a4 100644
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
index 287abde19..d00be827a 100644
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

