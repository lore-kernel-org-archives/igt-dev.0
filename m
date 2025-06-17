Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933D1C71136
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 19:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBBD10E12D;
	Tue, 17 Jun 2025 19:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKhAxGmp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC77910E15F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750188414; x=1781724414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y9P2cHnT4nBXytz8iCHbtvfJJM4xtPnhzq0LEimCCTM=;
 b=nKhAxGmpy5BynuQWtmB2H7hAtYmcn9ebP8k+7MI4gRISSJAWaACO7lb9
 xwU4ARt5gWjJAH06JE2K4MMrgHM0pLO+4HUbiv/KdEAY4C585WpmQa1jR
 3sMamq2Tb3sa2BdL7YxH3tejH8iSArxAh8HQbsVST6/gwqppfDcObZS6g
 9F1pfX+yg9ppPfAKDZgYqIWRClviMGAkGtll706p0XwHjKXIYe2IJ+HhB
 1T8HbKKZZf7pGssjPOxmTxQh6ccXjzUlDYAGsaxJGnfpeQkqVq61vq/sF
 X5A2W4G2ba7qRSiGQkCLYn8BAvTq0J8cQ2mhaHF+hwFmzkZZ8azvSi3BU A==;
X-CSE-ConnectionGUID: vnyuvi7IR2GrehCH7SdFtQ==
X-CSE-MsgGUID: V+/3fi3rR0ydsq1I99OZMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52524000"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52524000"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 12:26:54 -0700
X-CSE-ConnectionGUID: bStxSsH+Qf+2s8YnSS4dMQ==
X-CSE-MsgGUID: KYDx+H75ToyJ+eCcESWUPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148807916"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 12:26:53 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 5/7] tests/intel/kms_fbcon_fbt: Enable the tests support
 variations based on the WAs
Date: Wed, 18 Jun 2025 01:00:26 +0530
Message-Id: <20250617193028.107483-6-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617193028.107483-1-mohammed.thasleem@intel.com>
References: <20250617193028.107483-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index fedacec94..542efa759 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -40,6 +40,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
+#include "i915/intel_fbc.h"
 
 /**
  * SUBTEST: fbc
@@ -65,6 +66,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure.");
 
 #define MAX_CONNECTORS 32
+#define WA_FBC_DISABLED "16023588340"
 
 struct drm_info {
 	int fd, debugfs_fd, crtc_id, devid;
@@ -455,7 +457,7 @@ igt_main
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc") {
 		/* FBC disabled: Wa_16023588340 */
-		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
+		igt_skip_on_f(!intel_is_fbc_supported(drm.fd, WA_FBC_DISABLED), "WA has disabled FBC on BMG\n");
 		subtest(&drm, &fbc, false);
 	}
 
@@ -468,7 +470,7 @@ igt_main
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc-suspend") {
 		/* FBC disabled: Wa_16023588340 */
-		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
+		igt_skip_on_f(!intel_is_fbc_supported(drm.fd, WA_FBC_DISABLED), "WA has disabled FBC on BMG\n");
 		subtest(&drm, &fbc, true);
 	}
 
-- 
2.34.1

