Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1127ACD6E79
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 20:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926A210F9B1;
	Mon,  8 Jun 2026 20:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lUTkYCTj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E0010F9B1
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 20:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780950688; x=1812486688;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iMrQ9CgCNLqBjU7xpcOW8/3RCb9v8j4hXMIoRH9kZUg=;
 b=lUTkYCTj5vasdVT+ire52Eolg1LLdzwX/34L8N/3R9wKZizL5a/qtQok
 BjqIAnpKJX5GVeQhoO2ErEEonwqqanFDz3fl4aWM0wEguy+S4eSSlc1yL
 BBvPyI/ixIWYMyH7yEbWEQc6HaFnUPTxrVVoGhgueKrhzbrkRZuK7jl6X
 dpHYW4/Ows7RW2A4aGpKAcvxasH7l1jiGYdEPSQnphJQQHIX7mQ3EfIQI
 R+Js6i9mKZSZxtPsgJ0+vUYGY78x7X+nfpR1WohVgORFbu+kXfoqGrdwi
 aZrXIITLTIZmLbQdjwH/G0oLCo90vW0v1tdEZXp3N5KC/pIcMdbpoVmsx Q==;
X-CSE-ConnectionGUID: jdqDaZ8qSyO/j4K78SHDWQ==
X-CSE-MsgGUID: NmvVm/8cQ1yaFcm0Pwz9rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81552100"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81552100"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 13:31:28 -0700
X-CSE-ConnectionGUID: ySwqZb7KSX6H57bpffmgeg==
X-CSE-MsgGUID: Yi/3FyUASoWqpPS/FpoEGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="245518082"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 13:31:26 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_hdr: Enable DRM KMS debug mask for
 invalid-hdr subtest
Date: Tue,  9 Jun 2026 02:10:19 +0530
Message-Id: <20260608204019.2618145-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

The invalid-hdr subtest validates that HDR is not enabled on
non-HDR panels by checking for "Unknown EOTF" messages in
dmesg. These messages are emitted via drm_dbg_kms() which
requires DRM_UT_KMS to be set in the debug mask.

Ensure DRM_UT_KMS is enabled at test startup so the subtest
does not silently fail when the debug level is not already
configured. Install an exit handler to restore the original
debug mask on test completion.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index affd38887..07e93270b 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -34,6 +34,7 @@
 #include <unistd.h>
 #include "igt_edid.h"
 #include "igt_hdr.h"
+#include "igt_sysfs.h"
 
 /**
  * SUBTEST: bpc-switch
@@ -647,6 +648,9 @@ int igt_main()
 		igt_require(data.display.is_atomic);
 
 		igt_display_require_output(&data.display);
+
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		igt_drm_debug_mask_update(DRM_UT_KMS);
 	}
 
 	igt_describe("Tests switching between different display output bpc modes");
-- 
2.25.1

