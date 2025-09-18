Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47858CA1013
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 19:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DF010E8E5;
	Thu, 18 Sep 2025 19:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TTEa0Ofp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAA510E8E6
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 19:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758222069; x=1789758069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D9Opq1PwXpXSw/No1Lz12Aopxkxh393RYRushhedp2s=;
 b=TTEa0OfpmRvb0Q00eZw7hFSDolidqFOT9Dgva0OyR0DMLt6sNvj+rJRC
 K3Ba4sxjrL6Bb2p8KtY1RukrG6GIyIFUCX8mdQnYkG5CTdfgE5lZzevpI
 UkArroWvxjnOqDbIpkjzIl8GFQvxISla9TdlVF7onMr2NV6ei45xF83en
 ygHPWDOXpLaaC2vN3nkrkwccyi8f5kHouS+RlBF9TFEgjvwjdPI4Y4Fbg
 bqcvRNL9/NJZ/MDh0KmhWjWoCA+KU7aVCwlGRpN856zpKvulGkwClm8DO
 kjpsiPwldfxgGEzuUY1yD8tcqPmTDZUzre6d+IVmMeDz9Ek4zcug3MJNk A==;
X-CSE-ConnectionGUID: GRAEUXR/TEmIiwmuw79GBA==
X-CSE-MsgGUID: tcxqyk/5Q0uTZL1z54mKSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="48139701"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="48139701"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 12:01:09 -0700
X-CSE-ConnectionGUID: OAm8bhwbRDutwN0imSmU9A==
X-CSE-MsgGUID: If0qehiOQ+mI0BruyKo3AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="179906495"
Received: from unknown (HELO linux-Raptor-Lake-Client-Platform.iind.intel.com)
 ([10.227.90.114])
 by orviesa004.jf.intel.com with ESMTP; 18 Sep 2025 12:01:08 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend idle
 test case
Date: Fri, 19 Sep 2025 00:31:05 +0530
Message-ID: <20250918190105.37420-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918105709.25093-2-mohammed.thasleem@intel.com>
References: <20250918105709.25093-2-mohammed.thasleem@intel.com>
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

v2: Update subtest name with system-suspend-idle. (Kamil)
    Update the subject title.

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
2.43.0

