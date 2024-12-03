Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AEEE6C60C
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 06:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0835F10E911;
	Tue,  3 Dec 2024 06:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScJ0culn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0889E10E25A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733208554; x=1764744554;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ihwQgotn0zdC9T8z8daZuGnzVdHSwA6TfRKQAvqERPI=;
 b=ScJ0culn29qNJDRHFe18DQk6Z25X9ADbKyUliWL1cHJuNwQbLkq7aRwM
 f5SflWs+eaA6SKeFD+Er7V2/QgnKNlEE5wZ7wkUwPyhBEf+MIKY2cQXq/
 PMNeYzGqGr824fBEltE8nQOEhM2B1pdjnYZjY/dFKNWWrr1aFQlXGsMRG
 h1UKppkqxV82m3dNc9Ihn3mf2aQ7LRIwAD1bd3OGCdSkExBW/6fprXCOj
 44QO3R6yvGidxu+7fywgJfLeFZfAzzEffekXVVoVyRfjrZJ4zP8HrHOJE
 86bvlx8pn7WrUASjHd0wd2p9z7uPwAMjEOTuY2CbvEejnggJ+u2wI0LMC w==;
X-CSE-ConnectionGUID: 9J6EcRgyQFuI929GyvnFyA==
X-CSE-MsgGUID: 99HMks7jQ366NRc/DaR2WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33537963"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="33537963"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 22:49:14 -0800
X-CSE-ConnectionGUID: jEFQpxsAQ8KrjgltQ7jrfg==
X-CSE-MsgGUID: x0XYUVcDTSW54aMNtv45RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="98426759"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 22:49:12 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 1/1] tests/kms_invalid_mode: Add ultrajoiner support
 to adjust_mode_clock_too_high
Date: Tue,  3 Dec 2024 12:14:01 +0530
Message-Id: <20241203064401.366661-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203064401.366661-1-santhosh.reddy.guddati@intel.com>
References: <20241203064401.366661-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_invalid_mode.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 4fd644594..5f13efddb 100644
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
+	if ((is_dgfx && display_ver == 14) || (display_ver > 14))
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
+				 data->output->name);
+		max_dotclock *= 4;
+	}
+
 	mode->clock = max_dotclock + 1;
 
 	return true;
-- 
2.34.1

