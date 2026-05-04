Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D275FF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 20:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DEF10E86B;
	Mon,  4 May 2026 20:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCBqGk3x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF8E10E86B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 20:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777926695; x=1809462695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dbc7lad/kLRAJi+BOaZBOh9iTyvH8M63xmNHh6gz8tY=;
 b=kCBqGk3xBLSV5Z2WH9NZthj1claV86Xngmw8lP4zSaZRj2iTZVRsLVFA
 0GiwjzVVs+nKPZG/kELff1yiBQ1Jf0VaT7MT9BJ5pRxck083VwfcXfthA
 aZ3ZuRuteVY3U8bGWPFIlYtyJ4/ExsOtEbEADwZopYVs6nm3VUuEjYfHk
 1Y0IxZPFm4tbW1yuySpV4b9a7ytUzdLrN2FHPPNtNYT/sv9xGMq8rwnFQ
 HGJk4ZpTsdjYBXqDgdHFLvLZLobwiMs1idYf0jaqCDIc7wMP6WphnNTD6
 MpK+0vsS1dhxA4MBWK9NgQ+zGojVZDtcmDOX/3y2aNXsuzPnNes7H+OMU w==;
X-CSE-ConnectionGUID: v5nUlOBFSpyOUT1nkT/xZg==
X-CSE-MsgGUID: pOkBR9X6QzCKWxs8Yr8Gqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66322991"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="66322991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 13:31:34 -0700
X-CSE-ConnectionGUID: M+J7HKPrQWu16hcyKRfyqw==
X-CSE-MsgGUID: dN9rKM1YRaa0BaeA3G5QVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="259280964"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 13:31:31 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/xe_pm_residency: skip cpg-gt-toggle if GT not in
 C6
Date: Tue,  5 May 2026 01:58:41 +0530
Message-ID: <20260504202840.2572025-2-sk.anirban@intel.com>
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

The test assumes GTs are idle before forcewake is acquired and power-gate
status is validated. If a prior subtest leaves a GT in C0 (GT stays active
for any reason), the final power-gate checks can fail for the wrong reason.
Add an skip so that inability to enter C6 is treated as a missing
prerequisite.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm_residency.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 1eeabd509..bfae1f844 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -392,8 +392,8 @@ static void cpg_gt_toggle(int fd)
 	int gt;
 
 	xe_for_each_gt(fd, gt)
-		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
-			     "GT %d should be in C6\n", gt);
+		igt_skip_on_f(!igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
+			      "GT %d is not in C6\n", gt);
 
 	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
 	igt_assert_lte(0, fw_handle);
-- 
2.43.0

