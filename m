Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086ECC7115A
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 11:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E3110E221;
	Thu, 19 Jun 2025 11:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+b3xcvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5CB10E221
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750332224; x=1781868224;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m3rT+OJlI4519OGthlPHvoxscmOQEtkgkumf0xIVXoU=;
 b=R+b3xcvofQ3Ph6uHQRcfb4hKBqKBRS3dbQVUqTT5dSNPvLicNypzDVCQ
 Q9+97qSf0oShaS1Vpdj6uiyT/BVMkmIu9sIImlqj43iWfqzig1/VzU+l2
 ASg2npvbIVCiAUDOpvqXRaLAk/q32omMJhYfvDc06mlnprPNjUwFxiPsc
 1bW5eqKWqeFZTIqxfSM/ME9LaIE+kDoSyx9I4J/WPCRRbBCqtkQS5pJpZ
 Az/Wy5l9nzx9Hpu1rB3KdWKhnKzh0L795qwVzpzqOYHRdtJPl29Jl6Mei
 vKMFFe1BiWtjM08mwHGSGG1icLsx6vMQDLhVD/LTHll1/emcxwZ1gF8hi Q==;
X-CSE-ConnectionGUID: L/IO4K9lQT+fC8yoquQzog==
X-CSE-MsgGUID: 5dlohpEaTHOHVKsj6rPUzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52664805"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="52664805"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 04:23:44 -0700
X-CSE-ConnectionGUID: l2IzM8zaSlG0VWVosajkrA==
X-CSE-MsgGUID: LZfiAaogRkCRqCyfT5Skfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="187829634"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 04:23:42 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 1/3] tests/kms_async_flips: Fix suspend-resume subtest
Date: Thu, 19 Jun 2025 16:53:32 +0530
Message-ID: <20250619112334.744213-1-karthik.b.s@intel.com>
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

Currently suspend-resume subtest is only running on the first pipe as
the variable is set to false in the first iteration.

Add a temp variable to avoid this and actually run the test on all the
pipes as intended.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_async_flips.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 065ac9c49..0f2d932e4 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -377,6 +377,7 @@ static void test_async_flip(data_t *data)
 	long long int fps;
 	struct timeval start, end, diff;
 	int suspend_time = RUN_TIME / 2;
+	bool temp = data->suspend_resume;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -432,8 +433,8 @@ static void test_async_flip(data_t *data)
 				     data->flip_interval, data->refresh_rate, MIN_FLIPS_PER_FRAME);
 		}
 
-		if (data->suspend_resume && diff.tv_sec == suspend_time) {
-			data->suspend_resume = false;
+		if (data->suspend_resume && diff.tv_sec == suspend_time && temp) {
+			temp = false;
 			igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 		}
 		frame++;
@@ -1028,6 +1029,7 @@ igt_main
 		test_init_ops(&data);
 		data.suspend_resume = true;
 		run_test(&data, test_async_flip);
+		data.suspend_resume = false;
 	}
 
 	igt_fixture {
-- 
2.43.0

