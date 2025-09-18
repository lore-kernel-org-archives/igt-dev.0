Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17461CAC59A
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 10:59:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C377510E706;
	Thu, 18 Sep 2025 10:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y35xJ8xx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E164B10E706
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758193174; x=1789729174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aY4jtDPZdfGe94eeM9+V8blQN/nZ1BdJ2JZdYrKawbw=;
 b=Y35xJ8xxxccpLHhOOzLHVGRyTNUFa2eIiUE5Tk6SpiPLmqh2xsn5z1AA
 a7Y/Nrl05gDLMPi7bNx/A+VN1fmzb5OdGGARWHJQInw/lMi5BGAU0rBjK
 +vkAXVqhUyDogpyHPnMoYc5q8TVwYShJ+mmSzi7bg2SEbeZTUGCSvUC6U
 ndKGkEZLSzCpPnwhmztj8IyHsoQB1l8wxuB0pdp9gC/pnC4grotiLY85T
 wt55c6UqHIGj+ej3fuoFSfQtN3MY/FYEAqDNnrE0F7w7HjqeuK+fxe+f/
 +F6eTJuygQEOlVG1b2Zk+WcQVKUjLsc+ix6tC22xGTbpz7aheXaueO0v4 w==;
X-CSE-ConnectionGUID: GnHFxm/ATjOhOX1oxTtvvA==
X-CSE-MsgGUID: iBR4eKnFTYCKVdEqOQYo1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60450825"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60450825"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 03:59:33 -0700
X-CSE-ConnectionGUID: 0R7hB0OTRo2Mi6JEk/lMdA==
X-CSE-MsgGUID: BItN0/RRR4emVgqgAArsxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="176307982"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.223.55.76])
 by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2025 03:59:33 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend freeze
 test case
Date: Thu, 18 Sep 2025 16:27:09 +0530
Message-Id: <20250918105709.25093-2-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250918105709.25093-1-mohammed.thasleem@intel.com>
References: <20250918105709.25093-1-mohammed.thasleem@intel.com>
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

Added a new subtest that tests S0ix (suspend-to-idle/freeze state)
functionality using SUSPEND_STATE_FREEZE.

This expands power management test coverage to include modern low-power
idle states for comprehensive suspend testing.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_rpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 344ef8c94..3a91eda89 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1685,6 +1685,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest("system-suspend-modeset")
 		system_suspend_modeset_subtest(SUSPEND_STATE_MEM,
 					       SUSPEND_TEST_NONE);
+	igt_subtest("system-suspend-freeze")
+		system_suspend_modeset_subtest(SUSPEND_STATE_FREEZE,
+					       SUSPEND_TEST_NONE);
 
 	/* power-wake reference tests */
 	igt_subtest("pm-tiling") {
-- 
2.25.1

