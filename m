Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F89105F784
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6672010EB68;
	Fri, 13 Mar 2026 09:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZRS/LLHy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1EA10EB68
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394349; x=1804930349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wj7qZF4pDitkibZvwZe7wduuyFTSCliKO4G1XImSuuU=;
 b=ZRS/LLHyawfkgRoh1O0zwNh+ha8axnNkMMgzfzctXhH3SjfaBIXVbFOo
 1dgzE9526u7PVxRKdNpIIxMewa2JbhzFRe5DPE3PNCK8hcUhrNu5IulQB
 w3jxBSKXLf2zlHh2Mqa1TxcqeBpTm/DPqYI7uLSgY9RHk03q70mQ6WPGM
 YG5XkKNYruCFPe8j9EtX1x4KTk5am1yfd7leX7D9BJOe3Gg2UozUSqFs7
 44UI25AW2lqP9r+wYc8i9nSjfXNh5n/qP0SLc2TnPDmoUih0qnfu/oQuh
 vqDBQZbdlIPxH1EZR/yViNQBT1k1a83UirJ3fBs2fuy+1h+tJQuDZD0t7 Q==;
X-CSE-ConnectionGUID: vb0dOTurRDiUMQ09KFD4Ww==
X-CSE-MsgGUID: YZI68gK9TRGzWDnfnfTORA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74380923"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74380923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:28 -0700
X-CSE-ConnectionGUID: iNttBpFhT26kramYYdyjYA==
X-CSE-MsgGUID: /2YkTaq/Qo68O7buIOO1Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="225801392"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t 4/8] Revert "lib/i915/intel_fbc: Add fbc supported check
 based on wa"
Date: Fri, 13 Mar 2026 11:31:56 +0200
Message-ID: <9d35516d1af991321245c4c4da26959bf4bb6036.1773394225.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773394225.git.jani.nikula@intel.com>
References: <cover.1773394225.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

This reverts commit e226e9ac37b1f0e2de6f683752f64d3a5bffd156.

All the users of intel_is_fbc_disabled_by_wa() have been reverted in
series [1]. Revert the part adding the function too. Since the commit
messages give absolutely zero idea why they've been reverted, there's
nothing much I can add here either. It's unused, and can be removed.

[1] https://lore.kernel.org/r/20251110192454.44385-1-mohammed.thasleem@intel.com

Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/intel_fbc.c | 27 ---------------------------
 lib/i915/intel_fbc.h |  1 -
 2 files changed, 28 deletions(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index b418c95e66bd..d6c34bb80f2d 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -9,7 +9,6 @@
 #include "igt_psr.h"
 
 #include "intel_fbc.h"
-#include "intel_wa.h"
 
 #define FBC_STATUS_BUF_LEN 128
 
@@ -198,29 +197,3 @@ bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode)
 
 	return fbc_supported;
 }
-
-/**
- * intel_is_fbc_disabled_by_wa
- *
- * @fd: fd of the device
- *
- * This function check if WA is present on some GT, which in turn make
- * FBC not possible
- *
- * Returns:
- * true: if WA is applied and FBC id disabled
- * false: otherwise
- */
-bool intel_is_fbc_disabled_by_wa(int fd)
-{
-	int wa;
-	const char *wa_fbc_disabled = "16023588340";
-
-	if (!is_xe_device(fd))
-		return false;
-
-	wa = igt_has_intel_wa(fd, wa_fbc_disabled);
-	igt_assert_f(wa >= 0, "WA path not found on GTs\n");
-
-	return wa == 1;
-}
diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
index 6d188995de3c..0245719dcf33 100644
--- a/lib/i915/intel_fbc.h
+++ b/lib/i915/intel_fbc.h
@@ -19,6 +19,5 @@ bool intel_fbc_is_enabled(igt_crtc_t *crtc, int log_level);
 void intel_fbc_max_plane_size(int fd, uint32_t *width, uint32_t *height);
 bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t height);
 bool intel_fbc_supported_for_psr_mode(int disp_ver, enum psr_mode mode);
-bool intel_is_fbc_disabled_by_wa(int fd);
 
 #endif
-- 
2.47.3

