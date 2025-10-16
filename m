Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC93CCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 06:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577DA10E949;
	Thu, 16 Oct 2025 06:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nICDyb2d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3672110E949
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 06:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760595251; x=1792131251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xz4n9D35MTMX3af/2vDQjcO8H2Hr2bzuWvT/oNdh/S0=;
 b=nICDyb2dYu+thleBlEXAqIqNqUoRA7R2BjCs4RcwcdV/+cFWJqqYOdRE
 /SR274n/rDg5Ocr0F6mcLkeLkBcal9gccTNd9LmcLdSxT+KVyYP5lY5m8
 XFHil6DhFYEbPNKroq5rqJnrSWxxNSHHMrL/Ce5H9z9WGLq3hOtGVGHsG
 N3jay6jK3uP/Yw75jsdDFXwVpce0HF2QMSmMnCmqWtSV8Ccrx+XvOkcQs
 t1v4+qKicP6rxH33cDPqUJ8EymWA9rO2NY7iDzdsx7p8owyKp9l+OVcR8
 x5QPoFtG7BgOeKDTC+k5yomQTlNsVpNmPGNvMTrtv7OOxrdKzuQXOn82l w==;
X-CSE-ConnectionGUID: F/H8TrrHTyOwJO8LSJZO0Q==
X-CSE-MsgGUID: NeN6IpUZQ8a/pURrzOMasw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85398012"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="85398012"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:14:11 -0700
X-CSE-ConnectionGUID: b+Q36YpPRU27z3hjc4KYbw==
X-CSE-MsgGUID: 3YVy9EZDS1G0ByYCVzGcXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="187461838"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:14:09 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, pranay.samala@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_cursor_legacy: Change debug mask to
 reduce log
Date: Thu, 16 Oct 2025 12:01:37 +0530
Message-ID: <20251016063138.2955320-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016063138.2955320-1-sowmiya.s@intel.com>
References: <20251016063138.2955320-1-sowmiya.s@intel.com>
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

Set log level to low for subtests that fail due to
disk limit exceeded

v2: Remove the reset debug mask, as CI will handle this
with exit handler (pranay)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_cursor_legacy.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index ed1c77d55..e066eeed5 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -2069,9 +2069,15 @@ igt_main
 				flip_vs_cursor(&display, i, 150);
 
 			for (j = 0; j < ARRAY_SIZE(tests); j++) {
-				igt_subtest_f("%s-%s", tests[j].name, modes[i])
+				igt_subtest_f("%s-%s", tests[j].name, modes[i]) {
+					if (strstr(tests[j].name, "flipA") &&
+					    strstr(modes[i], "atomic-transitions") &&
+						igt_get_connected_output_count(&display) > 2)
+						update_debug_mask_if_ci(DRM_UT_DRIVER);
+
 					flip(&display, tests[j].cursor_pipe,
 					     tests[j].flip_pipe, tests[j].timeout, i);
+				}
 			}
 		}
 	}
-- 
2.43.0

