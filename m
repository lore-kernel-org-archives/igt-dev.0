Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198B1CA1017
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 21:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C318810EC48;
	Fri,  5 Sep 2025 21:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HeSAtEre";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA39210EC46
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 21:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757106088; x=1788642088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k1Xdbt+N9CQj2Olk6qf3IoYWA/3IYCAi+w9hYX5pRso=;
 b=HeSAtEreCVjQUvbbbjf9FdoZ04x7c45YskfThkTmAFTp++h70HEI4RkF
 H80+ga1yIG6+uNtlmCcrDpuTfxFY84NCN1lmQeETL/DxUY+YCUQ3A9dtL
 xt8iU23uJOKuldSJWLsCYQaJgQeEAxT2IDOcGpARkKqAapZNbVZFHhr4n
 sRMMFKED/DkdiXpbstcpGn+WSX+EQLWpGT8hqt0zjRfGVUR6avlTsO7eE
 ionSp5uJW4/92fRjAexFMundJpK2as/kArZDIaXUXQgKltb4GjcUycKHz
 LmjZT7HFBgN4/AcRp7lrzFp7An3FvxpNkeu6FePcuWZav7xEg0gXc6fYg w==;
X-CSE-ConnectionGUID: SsRpcZRRT0mftm4lUAsxZg==
X-CSE-MsgGUID: XixG/NTbR7m0k+7wxdpzSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59530905"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59530905"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:01:27 -0700
X-CSE-ConnectionGUID: FA231agBSlCo1UagKGZYGA==
X-CSE-MsgGUID: +AyUQmOFSumkezdTnMWivQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="177459196"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 14:01:26 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v4 1/4] lib/igt_kms: Add igt_get_joined_pipes_name()
Date: Sat,  6 Sep 2025 02:38:13 +0530
Message-Id: <20250905210816.319104-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905210816.319104-1-swati2.sharma@intel.com>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
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

Add function to transform the enum into a string.

v2: -Improved func() doc (Jeevan)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d240c7ac5..1d059a8bf 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1801,6 +1801,28 @@ bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int
 	return true;
 }
 
+/**
+ * igt_get_joined_pipes_name:
+ * @val: forced value
+ *
+ * Returns: A joined_pipes enum value into a readable string.
+ */
+const char *igt_get_joined_pipes_name(enum joined_pipes val)
+{
+	switch (val) {
+	case JOINED_PIPES_DEFAULT:
+		return "";
+	case JOINED_PIPES_NONE:
+		return "-none";
+	case JOINED_PIPES_BIG_JOINER:
+		return "-bigjoiner";
+	case JOINED_PIPES_ULTRA_JOINER:
+		return "-ultrajoiner";
+	default:
+		igt_assert(false);
+	}
+}
+
 /**
  * kmstest_force_edid:
  * @drm_fd: drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6ef6871d5..b52429bdc 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1286,6 +1286,7 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 uint32_t igt_get_connected_output_count(igt_display_t *display);
+const char *igt_get_joined_pipes_name(enum joined_pipes val);
 
 drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
-- 
2.25.1

