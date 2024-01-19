Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E6CC47DD3
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 16:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E7910EA49;
	Fri, 19 Jan 2024 16:53:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C3E10EA16
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 16:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705683179; x=1737219179;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C4/9qwbuOYTqacs4aS5i0I8HJhLx9m1k8jwg8ZLMC0I=;
 b=hCQmnWh2jHHRe3f3QI0RKUvA08IW8mIcXIlzGEjhZWwfAYixTDBe1/5n
 +ryOE42aWB44ts5+0yTJgtY9sYscXlhiPKKmLOrLJzl5c2nvCsOYSSWRp
 oPtLKJzX4U2vEECKlKEO/SN042+kWIJzio25Vp8VkYXTc9WiCzKHAjzOD
 K9hwnPTSSo+f+5E6T+AMCBvyuJlRAWXDJg8PKAvhYKirHUH1RWuqJbZdl
 SQD7juz5KBNS5mf5I+qUq0GQnDxmc3NOkHKaShLANi2QzClcGmwqn9ti0
 BPOWIDFR2G3M/LZY1X2HrP+ZXjVV76NB3lF5Lbzy+UignT5QEqRTzS09u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="671987"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="671987"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:52:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="819113432"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="819113432"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:52:55 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] tests/intel/xe_gt_freq: Skip GuC PC tests if GuC PC
 not supported
Date: Fri, 19 Jan 2024 22:34:48 +0530
Message-Id: <20240119170448.1889777-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119170448.1889777-1-badal.nilawar@intel.com>
References: <20240119170448.1889777-1-badal.nilawar@intel.com>
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
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Skip GuC PC tests if platform does not support SLPC.

v2: Use scalable approach (Anshuman)

Fixes: acaaca0bf317 ("tests/xe: Add Xe IGT tests")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_gt_freq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index bf63e4298..6c4fc81ae 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -319,6 +319,11 @@ static void test_reset(int fd, int gt_id, int cycles)
 	}
 }
 
+static bool xe_is_slpc_enabled(int drm_fd)
+{
+	return igt_debugfs_search(drm_fd, "info", "skip_guc_pc yes");
+}
+
 igt_main
 {
 	int fd;
@@ -329,6 +334,9 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
+		igt_skip_on_f(!xe_is_slpc_enabled(fd),
+			      "GuC PC tests are not supported when SLPC is disabled\n");
+
 		/* The defaults are the same. Stashing the gt0 is enough */
 		stash_min = get_freq(fd, 0, "min");
 		stash_max = get_freq(fd, 0, "max");
-- 
2.25.1

