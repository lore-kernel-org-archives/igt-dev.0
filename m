Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1693AC27C5E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 08:04:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949A610E56D;
	Tue, 11 Jun 2024 08:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6F7tkmQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C81E10E56C
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 08:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718093074; x=1749629074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g71HNcvJEKVzQcCT6PoDKlBUaRfct5ikzyPFwsx6GuU=;
 b=E6F7tkmQqFLf5oGVNW26qwGODIrlnULNtH8b3obRgn4aLBO81COEe67G
 6+pc22K/xiIyePfI4M765hnAsqDL4TileeztXDLOySD4KGkoBtrKz/pzU
 ryE0DLV+QQ/jBh2NoBNRuIwVuoGPk88UvCw3HnWXTjxYqHWJ/EiZvrdFH
 CCZKZeGsJcWgP2A/h+V5qghzbsVJS2Q23XEWlQfM2vUlACjHk6nf/YHUj
 0wPZyRH2ZKdTYWUI2Av4TnsfRUZclUrWtx792F8PAPw5FH0zMlwOVKN+b
 NVevHlet8p38gtA2DCs1vnmT8wlhONALUAjTp0PqVNVu608KZEz7wlnM9 w==;
X-CSE-ConnectionGUID: nuT8Q4jLRWmqYICpLRY3eg==
X-CSE-MsgGUID: ze6QCcxHRay1jRCNU/jeXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25907316"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="25907316"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:34 -0700
X-CSE-ConnectionGUID: fz53pmFXQ3KDw6z4wA6qvQ==
X-CSE-MsgGUID: j9XyRdX6SV+OOgYLrfLJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39336141"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.127])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:32 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v3 2/5] lib/i915/fbc: add fbc frame size check helper
 functions
Date: Tue, 11 Jun 2024 11:04:13 +0300
Message-Id: <20240611080416.56878-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611080416.56878-1-vinod.govindapillai@intel.com>
References: <20240611080416.56878-1-vinod.govindapillai@intel.com>
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

