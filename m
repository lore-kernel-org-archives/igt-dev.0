Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2082DCA1002
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 03:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E51210E960;
	Thu,  4 Sep 2025 03:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVQDIVhU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C8110E960
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 03:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756957402; x=1788493402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hwFwGkzRNcfrLXRR6Kq9sstaeh8zzItV9hK+mBuwnU8=;
 b=BVQDIVhU7BRCj9hRSz6HWYyYzyG9b8QuxYvzOA7XGt97q93hJVvy3Xtn
 VItvHGb02VY+wqYqcWYTXXSiI5T27zF3j4Bohw5L8Urbznz6N5EzDz/2K
 tTi2/PVPylaB5ixHJBzUJ0iU5Hq51NjpzHMgIrX7aNu4A7lSDH83fYt6H
 zaF+zKg1gC8DtsYyViyCOBRMCRobl3coJxSIMYU/0QNDp7ledSfjk8pFc
 LKWdPCgXwIELYQHQy5dZ+A0vkrGlte86qP+A2w4j1nibW0JkeKndl6Qj0
 KHM0aeqMBd6NH1OW3PjtSVN/14J9mB5irUvDlfoK3kvdkHE+PS5yZBNeL Q==;
X-CSE-ConnectionGUID: oGrSotbdTwe0BDNWiMyfuA==
X-CSE-MsgGUID: yrqzj5FdRluY502Df+YWWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59352596"
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="59352596"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 20:43:21 -0700
X-CSE-ConnectionGUID: HjJFwqzlQLeaaSlaw+SMrw==
X-CSE-MsgGUID: rnvZhZw5RiCxRaqr+IyJTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; d="scan'208";a="208959916"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 20:43:19 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: reduce exec. time for sim env
Date: Thu,  4 Sep 2025 09:13:12 +0530
Message-ID: <20250904034312.1264838-1-jeevan.b@intel.com>
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

For simulation environment, we can reduce execution time
by running test only with one combination.

v2: Remove redundant simulation check by using flag

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index c93195b3c..e95e334d2 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -180,6 +180,7 @@ static void run_extendedmode_basic(data_t *data,
 
 static void run_extendedmode_test(data_t *data) {
 	enum pipe pipe1, pipe2;
+	bool sim_flag = igt_run_in_simulation();
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
 
@@ -218,9 +219,11 @@ static void run_extendedmode_test(data_t *data) {
 			 * For simulation env, no need to run
 			 * test with each valid output on pipe.
 			 */
-			if (igt_run_in_simulation())
+			if (sim_flag)
 				break;
 		}
+		if (sim_flag)
+			break;
 	}
 }
 
-- 
2.43.0

