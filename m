Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8942D3DEA9
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 19:03:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DC410E974;
	Fri, 18 Oct 2024 19:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBeCZXRv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A83910E972
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 19:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729278227; x=1760814227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oVHfWKl3WfJ4kcKv+pN2hffhQkiqGcoD1w65p7MRq/0=;
 b=DBeCZXRvUqaHovPnhvgFMjwgKdCsKj9Qyhrg4KJRvONWr/v9Ygm/Y/8B
 fWcYFuZkzJkYDE4pe6fyY7BYiHAxd1SkQEfoKd/VFDyVl2ideBHJiaehP
 /15hQf5fFrBtoNO0ZCaw6Qxj9PZ5y07tTnPoVSgA9Ee3ZC73aniUw7OH/
 zxHSgEWVg2ykxkZ+Gxzyx2fcYKrdDrnVzSWMhPA0PIaJZz/44LsXU8UuE
 mVfqqmoVe3uwvf7V9gtiAUJC645rozEAR9Yt35uWAdgkzr0AkoDsDwuko
 OwW2QxvF+SVom0VJq9k16SZuDUtX+ER9ud92jGOmKCri0iuimYyc3ebjF w==;
X-CSE-ConnectionGUID: s9fS3xyHR2WJH7Mnb9iaGQ==
X-CSE-MsgGUID: KjL4wBQ9TJ6TnpAJlVaCgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40218782"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="40218782"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 12:03:47 -0700
X-CSE-ConnectionGUID: 3QUER8TASP+3+V2byFen6w==
X-CSE-MsgGUID: 7i/J14QmQo24p5zw5FcbVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="102247819"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 12:03:46 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/4] lib/igt_kms: Added func() to return scaling mode
 name string
Date: Sat, 19 Oct 2024 00:36:25 +0530
Message-Id: <20241018190627.1367970-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018190627.1367970-1-swati2.sharma@intel.com>
References: <20241018190627.1367970-1-swati2.sharma@intel.com>
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
index 73b024e0b..08ad96d2d 100644
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

