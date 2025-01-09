Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD4BE77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 17:02:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D877010EE51;
	Thu,  9 Jan 2025 17:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IbhSd7a3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B624510EE51
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736442139; x=1767978139;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EEjmNRoGswn6qxqnk14lJagyoo/NrjbOWAox2CV/nGk=;
 b=IbhSd7a3Jtx9Z5LmlXAUQM9zpKp9rOxWsSqnW0IUc6Y2P3JMu5iadZle
 hwAQvGqK0nt1Hni+wWSzyQZyhGrjTGl0q37MJcyjOyYoUGY6FThMwuRLr
 +ohY00kY/e0ucNmm7lJz/IWsnqt2Jt2BCEZUsgGIGyXKEkh+v2wa/UM7x
 BN+BBXX/auLds+dJo0AcvS8Fxs1fSNHdu3oQJwXoGW7bgp9lMADPTj0h4
 0iADurXuyki9reL2qe1Etu8BJ53VG0nguoLYWI359Uj0SajvWkVujMO48
 G3zs0iRH7HLe69eCt8CsU4Eub3shI4K7y/6DK71RRPEqpbFZ5Zx4WVfmC Q==;
X-CSE-ConnectionGUID: br1xWkBNTEaZS7yegHyR2w==
X-CSE-MsgGUID: uewXFTPiSyiUIYTO7geX+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48076280"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="48076280"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 09:02:14 -0800
X-CSE-ConnectionGUID: s3tcCUTfRXCqQ+N2xIDSaQ==
X-CSE-MsgGUID: opJlLJG5RxSdNmSAODPSXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="103534538"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa006.jf.intel.com with ESMTP; 09 Jan 2025 09:02:12 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce debug
 loglevel dynamically
Date: Thu,  9 Jan 2025 22:37:29 +0530
Message-Id: <20250109170729.47646-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

This test is getting incomplete on CI environment because
its logging to many logs.

So dynamically reducing the debug log level to 10.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index a05e2015f..415005774 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -14,7 +14,7 @@
  */
 
 #include <sys/types.h>
-
+#include "igt_sysfs.h"
 #include "igt.h"
 
 /**
@@ -391,6 +391,7 @@ igt_main
 	data_t data = {};
 
 	igt_fixture {
+		int dir, current_log_level;
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
 						     DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
@@ -398,6 +399,14 @@ igt_main
 		igt_display_require_output(&data.display);
 		for_each_pipe(&data.display, data.pipe)
 			data.n_pipes++;
+		dir = igt_sysfs_drm_module_params_open();
+		if (dir >= 0) {
+			current_log_level = igt_drm_debug_level_get(dir);
+			close(dir);
+
+			if (current_log_level > 10)
+				igt_drm_debug_level_update(10);
+		}
 	}
 
 	igt_subtest("dp-fallback") {
-- 
2.34.1

