Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC04FF8875
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 19:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78A710E12B;
	Wed, 29 Apr 2026 19:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTl3hiCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAB710E12B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777491756; x=1809027756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g9VI5XXOx9bPnI3cQGIxUCHeztSHMunqP1rLDdW/yn0=;
 b=PTl3hiCvsqI5ToM36aCGft0AYTb50cEq4zaghNkO2IFUfQWk6JSp4JUz
 /zkHNwFbmACDRq5ywWPMp9e+WOemJIkIdoew+64ST9HJL44y09NZviMFp
 mYYxE5MFs/neoc1in8XGFs8MZc8lfz4KAra81zpb0LzgNkclAlF3EDVO9
 36gNCYxhd66p8cjwu7MI0gkFf4qohcKJbjjnefGzBFH0PBYSf1ftsyAIN
 jnlnE5Nfs2QO3yNVPvATzcdVryuvLqGrS3S9waIwnLJJ2JpRDP1YSTmPp
 Itn70PmLzlNVvoxCx36Xk+UVqsa2gtureS0tzYKKnV7EP9xjvZwSMk8Ze Q==;
X-CSE-ConnectionGUID: oLxsx+VTSd+oIGN1rDgT4Q==
X-CSE-MsgGUID: WVT7qAJlShSS8uMC9lrgKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82295702"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="82295702"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:42:36 -0700
X-CSE-ConnectionGUID: 3PBTvJSLRaKR8ibzUxWo/Q==
X-CSE-MsgGUID: czaElnGXSdujfec+07kfTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="229762002"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:42:34 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,v5 1/4] lib/igt_kms: Add igt_get_joined_pipes_name()
Date: Thu, 30 Apr 2026 01:21:12 +0530
Message-Id: <20260429195115.2332923-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260429195115.2332923-1-swati2.sharma@intel.com>
References: <20260429195115.2332923-1-swati2.sharma@intel.com>
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
v3: -Return names without '-' dash prefix (Santhosh)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 22 ++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2efdfb85f..bece27ff6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1906,6 +1906,28 @@ bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int
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
+		return "none";
+	case JOINED_PIPES_BIG_JOINER:
+		return "bigjoiner";
+	case JOINED_PIPES_ULTRA_JOINER:
+		return "ultrajoiner";
+	default:
+		igt_assert(false);
+	}
+}
+
 /**
  * kmstest_force_edid:
  * @drm_fd: drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index fcbb6a5ad..6898cd981 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1280,6 +1280,7 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 uint32_t igt_get_connected_output_count(igt_display_t *display);
+const char *igt_get_joined_pipes_name(enum joined_pipes val);
 
 drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
-- 
2.25.1

