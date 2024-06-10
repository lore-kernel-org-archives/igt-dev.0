Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8822C27C55
	for <igt-dev@archiver.kernel.org>; Mon, 10 Jun 2024 12:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D9410E43B;
	Mon, 10 Jun 2024 12:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EF9y2BBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502AC10E345
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2024 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718020803; x=1749556803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g71HNcvJEKVzQcCT6PoDKlBUaRfct5ikzyPFwsx6GuU=;
 b=EF9y2BBkfsU4/6cmO4JRN046NoEdEkpAbbIkWtB3FPZVLmTmsnKxp926
 iRb3KaQlOlR+XIM+TugQtPwg97t6ttE0tvkGJkpK4r9FKPjpq0YzeOF8v
 qM5Tlug3NPGjbL3gqcMDigfBdCwr15i+2ljU2UD+jehn2yRBppCqSAHJB
 cGtssU6OzyD7SAYyUdvXvnoQ4P9OU6Y0/VXVTIWuaEz1iLm5jvKN26hxF
 5euTKfqwxevnYmxafaty3L2uQmbsxYBzVsufyABFbPWCpRut/F46hMs6N
 6A81pkIBzm+/lGM5brqbLZSj93eX1pr+f92AmxOum+4ec6IAws78s8vjW Q==;
X-CSE-ConnectionGUID: hBfs/YpURpGuvd9GMm8mAg==
X-CSE-MsgGUID: uWxyTeD8STKj4Owh55l8pw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14626147"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14626147"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:00:02 -0700
X-CSE-ConnectionGUID: JfSSxnncSGqbmGNujtiZAQ==
X-CSE-MsgGUID: LpEprvxaQKOysgP9awlLNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43472047"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.54])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 05:00:00 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v2 2/5] lib/i915/fbc: add fbc frame size check helper
 functions
Date: Mon, 10 Jun 2024 14:59:38 +0300
Message-Id: <20240610115941.35279-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610115941.35279-1-vinod.govindapillai@intel.com>
References: <20240610115941.35279-1-vinod.govindapillai@intel.com>
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

Add helper functions to check maximum plane size fbc can be
supported in a display version.

v2: Add function to get max plane size for FBC (Jonathan Cavitt)

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 55 ++++++++++++++++++++++++++++++++++++++++++++
 lib/i915/intel_fbc.h |  2 ++
 2 files changed, 57 insertions(+)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 07ed7f469..2096bd996 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -99,3 +99,58 @@ bool intel_fbc_wait_until_enabled(int device, enum pipe pipe)
 
 	return enabled;
 }
+
+/**
+ * intel_fbc_max_plane_size
+ *
+ * @fd: fd of the device
+ * @width: To get the max supported width
+ * @height: To get the max supported height
+ *
+ * Function to update maximum plane size supported by FBC per platform
+ *
+ * Returns:
+ * None
+ */
+void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height)
+{
+	const uint32_t dev_id = intel_get_drm_devid(fd);
+	const struct intel_device_info *info = intel_get_device_info(dev_id);
+	int ver = info->graphics_ver;
+
+	if (ver >= 10) {
+		*width = 5120;
+		*height = 4096;
+	} else if (ver >= 8 || IS_HASWELL(fd)) {
+		*width = 4096;
+		*height = 4096;
+	} else if (IS_G4X(fd) || ver >= 5) {
+		*width = 4096;
+		*height = 2048;
+	} else {
+		*width = 2048;
+		*height = 1536;
+	}
+}
+
+
+/**
+ * intel_fbc_plane_size_supported
+ *
+ * @fd: fd of the device
+ * @width: width of the plane to be checked
+ * @height: height of the plane to be checked
+ *
+ * Checks if the plane size is supported for FBC
+ *
+ * Returns:
+ * true if plane size is within the range as per the FBC supported size restrictions per platform
+ */
+bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t height)
+{
+	unsigned int max_w, max_h;
+
+	intel_fbc_max_plane_size(fd, &max_w, &max_h);
+
+	return width <= max_w && height <= max_h;
+}
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index 995dc7f1e..5cca5dfd9 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -14,5 +14,7 @@
 bool intel_fbc_supported_on_chipset(int device, enum pipe pipe);
 bool intel_fbc_wait_until_enabled(int device, enum pipe pipe);
 bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
+void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
+bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
 
 #endif
-- 
2.34.1

