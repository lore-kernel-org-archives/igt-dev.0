Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88029C021A5
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 11:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458D210EA5B;
	Thu, 13 Feb 2025 11:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEeSqD8y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EE610EA5B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739444636; x=1770980636;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e0zfHbSFYNC5PeqBgd1ca08k8byERIsBIujsktepwXI=;
 b=JEeSqD8yAiBhRoEp7A2/U/7WrWueFAGMosOLSlkmMyVY/lL+FC5jVfMu
 ve0LK/tW7Al0K+DioCHCE3L8bjDWdYN0GxjYt91S9WSyHjZNTZb3ygOtT
 hqMxg2YctMYc9mV8oRkNMbupFLx9Mk1Kka4q6Mrl5vnxSd1RT0JjHnwgV
 Dav4E+yn2ebSONbhU9XiDnXYs3s38qbiUnUMGa695sLVkTFm2CrpunmGN
 OBLr3QcDKzWyng4qv7Lcb0U4ApVZL41k0VCQ36TMQ8kwL4qqcdBvNbfZr
 Fh1eeIM+RCP75fFkFDqsI2qKLImNdiw/2uZX40Zup3cRH17GNskJ97Cx3 A==;
X-CSE-ConnectionGUID: UsO8FG5BTCa4ufFoSwR0Ag==
X-CSE-MsgGUID: p1+MnL/MRDqodvFT9f2zDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62609491"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62609491"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:55 -0800
X-CSE-ConnectionGUID: oJbCI/RjR/2TLdPv/mV5bw==
X-CSE-MsgGUID: QeGhYxt0TFyJJif2zBlABw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113094065"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:53 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/5] lib/igt_kms: Add igt_get_max_cdclk()
Date: Thu, 13 Feb 2025 16:38:13 +0530
Message-Id: <20250213110814.351186-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213110814.351186-1-swati2.sharma@intel.com>
References: <20250213110814.351186-1-swati2.sharma@intel.com>
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

Add igt_get_max_cdclk() to return max cdclk frequency.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 50 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8220cc0eb..aa5dfa8ce 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6390,6 +6390,55 @@ int igt_get_max_dotclock(int fd)
 	return max_dotclock;
 }
 
+/**
+ * igt_get_max_cdclk:
+ * @fd: A drm file descriptor
+ *
+ * Get the Max CD clock frequency from intel specific debugfs
+ * "i915_frequency_info" (or) "i915_cdclk_info".
+ *
+ * Returns: Max supported CD clock frequency.
+ */
+int igt_get_max_cdclk(int fd)
+{
+	char buf[4096];
+	char *s;
+	int dir, res, max_cdclk = 0;
+	drmModeRes *resources;
+
+	if (!is_intel_device(fd))
+		return max_cdclk;
+
+	/* If there is no display, then no point to check for cdclk. */
+	resources = drmModeGetResources(fd);
+	if (!resources)
+		return max_cdclk;
+
+	drmModeFreeResources(resources);
+
+	dir = igt_debugfs_dir(fd);
+	igt_require(dir != -1);
+
+	/*
+	 * Display specific clock frequency info is moved to i915_cdclk_info,
+	 * On older kernels if this debugfs is not found, fallback to read from
+	 * i915_frequency_info.
+	 */
+	res = igt_debugfs_simple_read(dir, "i915_cdclk_info",
+				      buf, sizeof(buf));
+	if (res <= 0)
+		res = igt_debugfs_simple_read(dir, "i915_frequency_info",
+					      buf, sizeof(buf));
+	close(dir);
+
+	igt_require(res > 0);
+
+	igt_assert(s = strstr(buf, "Max CD clock frequency:"));
+	igt_assert_eq(sscanf(s, "Max CD clock frequency: %d kHz", &max_cdclk), 1);
+
+	return max_cdclk;
+}
+
 /**
  * igt_bigjoiner_possible:
  * @drm_fd: drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5cf0b89d3..e6665abdd 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1244,6 +1244,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
+int igt_get_max_cdclk(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
-- 
2.25.1

