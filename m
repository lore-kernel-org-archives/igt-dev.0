Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD7AFC72A8
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 07:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F24610E2D0;
	Mon, 23 Mar 2026 07:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hw2DcUOl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8618710E2D0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 07:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774249360; x=1805785360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZUrC9wE/YxNq3gmh2N2wwXABIIczLeKqPm5t7Z40p8Y=;
 b=hw2DcUOlYEhqSqY6TH89jP7ehQfHkI0ADiRWGlSxbxasvneIGeqlNuiD
 PK4RzrY7IvfQIz+JKgntOTjYpHVQ79378MPLyDWy4mRXwhObY0qkWZV03
 6QstZs++6qM1ULIKqOB61TheXEZp4UWjD6ciXTQTL9ua9KQMkGtalpbGb
 4P/2mg5+AAWdOloRk+N0DIjuhi//7FDQ2Xv9mHoNfKKy7bsza/KMuqUPY
 DHJ/MU9OJQSbWkWUR83SPojlC5gwU9L5zMF3GBgmbQCyzSyogEyA7BYls
 mlJrrF5si7KKWvFL02SclHIqwPvdtKWdbxDrc1jaU1tTpTfHg3dnsrDFi Q==;
X-CSE-ConnectionGUID: jNk73HwNTWOFh3gSQA983w==
X-CSE-MsgGUID: e2ZlMPsSQcmvuKV/eUgHCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="97862269"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="97862269"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:02:39 -0700
X-CSE-ConnectionGUID: d1sFEyS4SJS2s3ySoP/nEA==
X-CSE-MsgGUID: WGYRZW2cS0e013KxcoZZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="223958938"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 00:02:37 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/xe_pm_residency: Fix suspend duration calculation
Date: Mon, 23 Mar 2026 12:32:29 +0530
Message-ID: <20260323070228.1383377-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Fix the unit mismatch caused by interpreting seconds as milliseconds
during suspend duration calculations. Apply MSEC_PER_SEC multiplier
to ensure correct unit handling.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm_residency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 61b63ed4f..46718a444 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -223,7 +223,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 		 * elapsed time during suspend is approximately equal to autoresume delay
 		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
 		 */
-		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
+		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE) * MSEC_PER_SEC;
 		residency_start = read_idle_residency(fd, gt);
 		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
 		residency_end = read_idle_residency(fd, gt);
-- 
2.43.0

