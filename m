Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E771C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 16 May 2024 10:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFEA10EC56;
	Thu, 16 May 2024 10:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GeezI7lL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3740410EC53
 for <igt-dev@lists.freedesktop.org>; Thu, 16 May 2024 10:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715856250; x=1747392250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3zDeWOyefFi5TDHVXa1MA5sOAhwk0jz9RcIkbw8G9z0=;
 b=GeezI7lLiaisMVEggiJ25P11yL+zPpWm8UC1UkMBBmyGdI2Yz5zthgsI
 mW2ixlGA/Z4DgQ7C4aFF1cGwdfcUlwEG1SnxTupsuTSsQZiyOTVCjlWeO
 QHhFyJjS2erOD0uMxNQFFP21L5qtnn5SKpzu0+DAX+PxT5YoLDJjB12um
 0aFvI8hz9Xa5Qv0bjx5qz5zqzOheLwgjB+CG6EtzZ9DPfpqGeCqnPDnqT
 tGdik4ktZNQTHF+Zw2LelTNa2uEvQCx4eXk0aJy1oWKJRC7VGjdgVfx/2
 dEyYud6bI5nHyvjqCor4GAxqBlNEMtMchaOvGbzVzCIx5sU4dugLR5B/i w==;
X-CSE-ConnectionGUID: QjE2vpaNQBmlpdLBGet+Og==
X-CSE-MsgGUID: 3vcRmzCJTGCliOLILcdr9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11902377"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="11902377"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 03:44:09 -0700
X-CSE-ConnectionGUID: Zj8iCB/DSG+WumlEpkcazQ==
X-CSE-MsgGUID: LT+VN8QNRneW8kB0Hjubkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="31390043"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa008.fm.intel.com with ESMTP; 16 May 2024 03:44:07 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: lucas.demarchi@intel.com,
	badal.nilawar@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_pm: Disable display for mocs-rpm test
Date: Thu, 16 May 2024 16:15:13 +0530
Message-Id: <20240516104513.2685597-1-janga.rahul.kumar@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

If display is enabled, the always-on components will always keeps
runtime pm references, unless you put DPMS_OFF.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_pm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 9cb00c7f1..b4a8c4d15 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -835,8 +835,11 @@ igt_main
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
 
-		igt_subtest("mocs-rpm")
+		igt_subtest("mocs-rpm") {
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
 			test_mocs_suspend_resume(device, NO_SUSPEND);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

