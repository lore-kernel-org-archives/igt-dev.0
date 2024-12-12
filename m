Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9C7E77182
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 04:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B05A10ECB3;
	Thu, 12 Dec 2024 04:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GBD9fDDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDC610E18F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 04:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733978691; x=1765514691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sVEw5GZhbkNul0lOmtph8iPoyHjH+G4tvxxIPWAnedU=;
 b=GBD9fDDJfcxX+CNICUXLA0NsH0LX4p3SOmXoEVLQd1UX5ayVYawZ7XPf
 GO5IvUYfhOxuomfLAtwT7Td1MRr+waG6vepJU6eFBVZwfBx399N1o46Qo
 eZf0VoIe3HhOMt9m7QzOjZYJKG7RRzNZZD3hWRU9Y/uDcLtDzVsM9rxOR
 HmPX5WTPy66UZD2tM7+FaNf2Fhq9Nw8SALT1tsC7Ff01ZvdUtq5bkIe0w
 eLsbNK+oyWVoWo9hScKcItLmuEKO3lG2vKbMyYFSZOUkhWueLaiC4bblC
 QRSl0e2edR5AfXSgUeT5SfX9SnFyfuG4sq8jtse8FlH4Jtc3NRxujY9EH g==;
X-CSE-ConnectionGUID: pm5EJ0RYTqWB3Dm10tCioQ==
X-CSE-MsgGUID: 1W+mnchCQmmk1IarUN6vVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="56855887"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="56855887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 20:44:51 -0800
X-CSE-ConnectionGUID: VKFgmdM7RzW3CsMrLEg4Vg==
X-CSE-MsgGUID: qIOdrPlZScGtL5/oTZq36g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119335815"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:44:49 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/kms_invalid_mode: Add ultrajoiner support
 to adjust_mode_clock_too_high
Date: Thu, 12 Dec 2024 10:09:03 +0530
Message-Id: <20241212043903.2255318-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212043903.2255318-1-santhosh.reddy.guddati@intel.com>
References: <20241212043903.2255318-1-santhosh.reddy.guddati@intel.com>
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

Check ultrajoiner support on the output and
adjust `max_dotclock` accordingly.

v2: remove extra parenthesis, indentation (Pranay)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_invalid_mode.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 4fd644594..0c0765ec0 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -34,6 +34,7 @@
  */
 
 #include "igt.h"
+#include "xe/xe_query.h"
 #include <limits.h>
 #include <stdbool.h>
 
@@ -99,6 +100,28 @@ can_bigjoiner(data_t *data)
 	return false;
 }
 
+static bool
+can_ultrajoiner(data_t *data)
+{
+	bool ultra_joiner_supported = false;
+	bool is_dgfx;
+	int display_ver;
+
+	is_dgfx = is_xe_device(data->drm_fd) ? xe_has_vram(data->drm_fd) :
+					       gem_has_lmem(data->drm_fd);
+	display_ver = intel_display_ver(intel_get_drm_devid(data->drm_fd));
+
+	if ((is_dgfx && display_ver == 14) || display_ver > 14)
+		ultra_joiner_supported = true;
+
+	if (ultra_joiner_supported) {
+		igt_debug("Platform supports ultrajoiner\n");
+		return true;
+	}
+
+	return false;
+}
+
 static bool
 adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 {
@@ -128,6 +151,12 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 		max_dotclock *= 2;
 	}
 
+	if (can_ultrajoiner(data)) {
+		igt_info("Platform supports ultrajoiner with %s\n",
+			 data->output->name);
+		max_dotclock *= 4;
+	}
+
 	mode->clock = max_dotclock + 1;
 
 	return true;
-- 
2.34.1

