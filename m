Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527F5C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 14:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57510EC91;
	Fri,  7 Jun 2024 14:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkqStPSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAA610EC91
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717772275; x=1749308275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mTkgcBK8E5B56C7w0DpyUT4vSySm+KqI1t2jHeChxFc=;
 b=lkqStPSVOjQnlZYJeLozLs7s/DLfVe3SBWIWwMp0toiZSIVu8peddwem
 NwzzsoRMHtig2vVVGVq0h88gtj7P/+rIK29CzGxTvJ9CJdzibkc9bQ+gS
 bYS7VVRBhw+innUBScJfR7iMek5juaVRk+fZYWiQMM8KUYiSyzAr1YX0V
 KZDn/RgDNe0eeOOF0s3T6jU1TrTvwUxTjVCM0t3G+/veuBOw+9AYKcKOz
 6z6gXy+BlB/SV8TJR1PS0SOOUBaCp5ZWzJbAEiHaBA9GTIWp47imhBBlL
 FCLQdmhS9K5EHwCmSRCpoqNOcS3maH2XekLzRSrso5aQgdKfOTuQAJee1 Q==;
X-CSE-ConnectionGUID: p+VlUIfVTIugzuF30b+mDA==
X-CSE-MsgGUID: urRyMGFSRVWWBbVz6reYqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14331616"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14331616"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:57:55 -0700
X-CSE-ConnectionGUID: z82FDUkFQS+i4vZ1Dai5fQ==
X-CSE-MsgGUID: F/H0DHI2SI2yQjL1JjOqjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38926797"
Received: from unknown (HELO vgovind2-mobl3..) ([10.245.244.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 07:57:53 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com
Subject: [PATCH i-g-t 2/4] lib/i915/fbc: add fbc frame size check helper
Date: Fri,  7 Jun 2024 17:57:30 +0300
Message-Id: <20240607145732.285557-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607145732.285557-1-vinod.govindapillai@intel.com>
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add a helper function to check maximum plane size fbc can be
supported in a display version.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 36 ++++++++++++++++++++++++++++++++++++
 lib/i915/intel_fbc.h |  1 +
 2 files changed, 37 insertions(+)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 07ed7f469..992e9c4de 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -99,3 +99,39 @@ bool intel_fbc_wait_until_enabled(int device, enum pipe pipe)
 
 	return enabled;
 }
+
+/**
+ * intel_fbc_plane_size_supported
+ *
+ * @fd: fd of the device
+ * @width: width of the plane
+ * @height: height of the plane
+ *
+ * Checks if the plane size supported for FBC
+ *
+ * Returns:
+ * true if plane size is within the range as per the FBC supported size restrictions per platform
+ */
+bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t height)
+{
+	const uint32_t dev_id = intel_get_drm_devid(fd);
+	const struct intel_device_info *info = intel_get_device_info(dev_id);
+	int ver = info->graphics_ver;
+	unsigned int max_w, max_h;
+
+	if (ver >= 10) {
+		max_w = 5120;
+		max_h = 4096;
+	} else if (ver >= 8 || IS_HASWELL(fd)) {
+		max_w = 4096;
+		max_h = 4096;
+	} else if (IS_G4X(fd) || ver >= 5) {
+		max_w = 4096;
+		max_h = 2048;
+	} else {
+		max_w = 2048;
+		max_h = 1536;
+	}
+
+	return width <= max_w && height <= max_h;
+}
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index 995dc7f1e..f05b351f6 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -14,5 +14,6 @@
 bool intel_fbc_supported_on_chipset(int device, enum pipe pipe);
 bool intel_fbc_wait_until_enabled(int device, enum pipe pipe);
 bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
+bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
 
 #endif
-- 
2.34.1

