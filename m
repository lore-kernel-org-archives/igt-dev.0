Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A86BC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 10:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4620D10EA1F;
	Thu, 11 Jul 2024 10:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fuKdjijp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A5A10EA29
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720693122; x=1752229122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EifF1XCSP29ZseEm1IsnO7/K88PrlMHjbgZ+7EPJMKs=;
 b=fuKdjijpNqFCRa5dIT9FC5l77rIyOjsE9hHz/D6eIWUuNRjskBtAqEH9
 1woxF4dvMCtOK6iAR6lvGx2H67r/dZuBfmUmiL0KVTzRJMIeMMMreRTig
 DLQ5yiqICT5oJE3BdjFdcOzrBs/g7k7XeorfXksIS7ZexXzYwrKcfio2K
 WvWktNwd9OKB2BUjMVoC+5APRvUqO77YEElb217gsbpEu2dsV644vHIU7
 RosOA65NMxJE5Otr9aY85GVIClVqBXXYkFxKI6YcOzf8GrA1aQ0m9WVwR
 8kwHPeMsQNblJ52AhcHcPfRlDR7WX8DU/3+GJ0+yvPzhsOFRlKZyMiOeI g==;
X-CSE-ConnectionGUID: a+f2PF1SQ0uf7Sw5Cbe70A==
X-CSE-MsgGUID: Uxrp9CDeR26zfUQ6hUWVYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18009676"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="18009676"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 03:18:42 -0700
X-CSE-ConnectionGUID: LxscVEJDRFyUKXAahCB/EA==
X-CSE-MsgGUID: DLeiafs7Q3a68UKnOQ9LCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="53325843"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa003.jf.intel.com with ESMTP; 11 Jul 2024 03:18:39 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v4 2/2] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
Date: Thu, 11 Jul 2024 15:48:43 +0530
Message-Id: <20240711101843.760796-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711101843.760796-1-pranay.samala@intel.com>
References: <20240711101843.760796-1-pranay.samala@intel.com>
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

This test is debug logs are too much and was killed
due to exceeding disk usage limit on the less disk
space machines.

So dynamically reducing the debug log level to 13.

v2:
- Using "" for the defined header file (Bhanu)
- Not using exit handler in this file (Bhanu)
- Not using any magic number (Bhanu)

v3:
- Calling loglevel init functionality in lib file (Bhanu)
- Here 2 means the log level will be reduced by 2 (Bhanu)

v4:
- Send the required debuglevel to directly to api only if debug
  log level is greater than 10 (Bhanu)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 29dd8ac4e..618fef8dc 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -34,6 +34,7 @@
 #include "igt_rand.h"
 #include "drmtest.h"
 #include "sw_sync.h"
+#include "igt_sysfs.h"
 #include <errno.h>
 #include <pthread.h>
 #include <stdbool.h>
@@ -1174,6 +1175,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	int pipe_count = 0;
 
 	igt_fixture {
+		int dir, current_log_level;
+
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -1185,6 +1188,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		for_each_connected_output(&data.display, output)
 			count++;
+
+		dir = igt_sysfs_drm_module_params_open();
+		current_log_level = igt_drm_debug_level_get(dir);
+		close(dir);
+
+		if (current_log_level > 10)
+			igt_drm_debug_level_update(10);
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
-- 
2.34.1

