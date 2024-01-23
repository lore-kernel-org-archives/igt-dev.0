Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26108C47258
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 14:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3239210E812;
	Tue, 23 Jan 2024 14:09:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2983810E812
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706018946; x=1737554946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DEl8dmVM8D7F+8RVPR5nn9oyAH7lquJkSebS9aPcaGg=;
 b=JmF/7dEo7jkzkeCT7WetuuX2P5PpZQr5hMi7BmEV+ITn9LuQWrQ95qjq
 o45Aib/9OPGDAwFTfZIiE2joIwFm+/RodMRNk+xsXsL6JpEIzF+ftQefL
 Czw406YlwDjyAxzMtXuekLTuVRkUA29UXi8Mpewylieo8y/4B1mn1XsDW
 f24fhul6JvDPPG7IeusuCKOJpXUP31BpWr6i5BAIetN6Ge/n4KExjPeW+
 PtMs4BAVhq4U9ISRKumXU7zl87dbFzRayR0BXCb0vdh9VUT645CXVDYfK
 qTaut7O2ns4ogAIyXZjC7dZuqVVoY0J9Q5KNv/rViCnPScV0GOe7b/5qy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="15047227"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="15047227"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 06:09:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1559004"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 06:09:04 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] lib/igt_psr: add helper to check of given psr mode
 can be enabled
Date: Tue, 23 Jan 2024 19:48:34 +0530
Message-Id: <20240123141835.1211107-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123141835.1211107-1-kunal1.joshi@intel.com>
References: <20240123141835.1211107-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Check if given psr mode can be enabled by reading enable_psr
modparam

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_psr.c | 23 +++++++++++++++++++++++
 lib/igt_psr.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 663bac163..181499cf7 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -394,3 +394,26 @@ enum psr_mode psr_get_mode(int debugfs_fd)
 
 	return PSR_DISABLED;
 }
+
+/**
+ * is_psr_enable_possible
+ * Check if given psr mode can be enabled by reading enable_psr
+ * modparam
+ *
+ * Returns:
+ * True if given psr mode can be enabled, false otherwise.
+ */
+bool is_psr_enable_possible(int drm_fd, enum psr_mode mode)
+{
+	char *param_value;
+	int enable_psr;
+
+	param_value = __igt_params_get(drm_fd, "enable_psr");
+	if (!is_i915_device(drm_fd) && !param_value) {
+		igt_info("Failed to retrieve module parameter enable_psr\n");
+		return false;
+	}
+	enable_psr = atoi(param_value);
+	free(param_value);
+	return enable_psr > mode;
+}
diff --git a/lib/igt_psr.h b/lib/igt_psr.h
index 36711c0d4..82a4e8c5e 100644
--- a/lib/igt_psr.h
+++ b/lib/igt_psr.h
@@ -61,5 +61,6 @@ bool i915_psr2_selective_fetch_check(int drm_fd);
 
 bool i915_psr2_sel_fetch_to_psr1(int drm_fd);
 void i915_psr2_sel_fetch_restore(int drm_fd);
+bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
 
 #endif
-- 
2.25.1

