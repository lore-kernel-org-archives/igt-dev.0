Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B316D167F2
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 10:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD3110E870;
	Fri,  9 Jan 2026 10:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPYGttEn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F138F10E870
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767952899; x=1799488899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a8Wh9uGIJMDBr0aUuNrcnPmiKfJe919yVuW+g2jnZCw=;
 b=mPYGttEntY8AOAmFmnGn+wumpJdFuSs1jLHnGneTzNkPRf6yf2oKWEtc
 lX9jxi3IxrRMIItchcn14R8x/ineX5u/O8DhsEF0fpoAhOWPWEH8wWxlQ
 xrgTeRznHMyjvvw68RgSPHVdq1BdTiGFZoPjNtT5a9KoLS1G0bMb63GZa
 eP3djUKhrzxDb/Rq9fIazTqDgOM7GaatttletAcU52eb5CTVXy3IpwXNx
 Ot/39oUZVLaApaOpDIxl5R3jLaKaDmmV9FKsJ5+Z7bVgGO012MVVee5La
 LsnTN0oA5FWbb2l3DB19NQNenrlP3cHfyBugvQOE8DJFRYG/sDfSnuROg Q==;
X-CSE-ConnectionGUID: XcVR5/qgQe+ySDSS1GFbpw==
X-CSE-MsgGUID: +OLlxOvsQjqtaeo3f6D6lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79631243"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="79631243"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 02:01:39 -0800
X-CSE-ConnectionGUID: udMI6DfeSdKlxwPW1CypyA==
X-CSE-MsgGUID: chc8ReK9SZyX0NtEDJS9bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="207583730"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa003.jf.intel.com with ESMTP; 09 Jan 2026 02:01:38 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com
Subject: [PATCH i-g-t] tests/kms_color_pipeline: Restore plane color pipeline
 to Bypass on cleanup
Date: Fri,  9 Jan 2026 15:06:13 +0530
Message-Id: <20260109093613.538804-1-chaitanya.kumar.borah@intel.com>
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

The plane color pipeline subtest exits without restoring the plane color
pipeline to the default Bypass pipeline, leaving the last selected pipeline
active.

Reset the plane color pipeline to Bypass during per-test cleanup.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color_pipeline.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 9f34db738..3c9a2cdee 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -143,6 +143,7 @@ static bool test_plane_colorops(data_t *data,
 	ret = igt_check_crc_equal(&crc_ref, &crc_pipe);
 
 	/* Cleanup per-test state */
+	set_color_pipeline_bypass(plane);
 	reset_colorops(colorops);
 	igt_plane_set_fb(plane, NULL);
 	igt_display_commit2(display, COMMIT_ATOMIC);
-- 
2.25.1

