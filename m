Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCB8EFCD99
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 11:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27FB10E4D1;
	Mon,  9 Mar 2026 11:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1/8rtWW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA6410E4D1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 11:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773054081; x=1804590081;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4P6+WsXvE8PB9GbWs7+q69fkt037jEo622nHUb1ibpU=;
 b=U1/8rtWWA+4rxx/AFvhE9Ov+UgZclFsfwEcAayHbV3nYS7Bga/j+WMGr
 ITMzirBqzIfhqxf2XLZFCvtZKtxWdct5SMjrY5Na12tud9hSn4YF4i00L
 98KcMu3erJpXJXdtdfWHIa3NTLTviuM8rnwN0dboTXSJQH+00Qb55SkHW
 aJ6eRrgAHfYrLhpJn0qI4BNwKxfxfn1c6uexN3YMnugCRYH5cBzge4LUN
 pGXuNAidgkYQ0PG8ZLFFTlwgX32ntMOrYjkro/rf5u0SWEbJHprCSSR19
 P5K+SZnVxXrW855fMEvdJfZajgWtCicUT9RHX8qBJcSMGd0rxkep/UrRA g==;
X-CSE-ConnectionGUID: 1w7gDyhiTIufoe7xg1bvvQ==
X-CSE-MsgGUID: YCBaTepESgShv1yAD1nUHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84708544"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84708544"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:01:19 -0700
X-CSE-ConnectionGUID: HpYmXmZKRGSNKXSMRj/PPw==
X-CSE-MsgGUID: EpVWok6OTc2aOr/w5qjktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="250182016"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 04:01:16 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/xe_pm_residency: ensure C6 GT before cpg-gt-toggle
Date: Mon,  9 Mar 2026 16:27:57 +0530
Message-ID: <20260309105756.110294-2-sk.anirban@intel.com>
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
Add an explicit assert for each GT to reach C6 at the start of the test.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm_residency.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 61b63ed4f..d21878682 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -399,6 +399,10 @@ static void cpg_gt_toggle(int fd)
 {
 	int gt;
 
+	xe_for_each_gt(fd, gt)
+		igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 10),
+			     "GT %d should be in C6\n", gt);
+
 	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
 	igt_assert_lte(0, fw_handle);
 
-- 
2.43.0

