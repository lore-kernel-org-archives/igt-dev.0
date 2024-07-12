Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCCEC2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 08:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F133110EC4C;
	Fri, 12 Jul 2024 08:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iv/bGRhU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C25710EC4C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 08:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720772964; x=1752308964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FoOfOiQmjr6eZisUiXpJrPo0t+kHUKvS1xBs6ZPdxOw=;
 b=iv/bGRhUEybjtTSyWNmVZUE5dK4mQIKcfImKyvTpQ5bZpHdkQnnWtMbc
 51nIWf6/onlYt4ezTELtBoRn//Vmhsn+nqI/aFnKGzR5X71gpocgWoeJP
 yoSO1zuLg9vkq2RVTvp/nDif2E3M6HUmM6URyf9PhuRx12LQnxiroiEnh
 7hZcLRiNbdgBpvTBLDZ0JIG7CjR+Qtoaa/vk1f4el/TbTdFkiQNw+PrBx
 3XKY1A2voRhzxT9ZZK8SUe5TBc34ooFTlnQrnt2HDsKcq754ng1G8zBX3
 0XzvhZCOYk+9kcOF2dmz1rNqnOuqoqlXGV4Co2Nbca+CQAi1j300zTIXo w==;
X-CSE-ConnectionGUID: hMrtcr7UQXGOZtodIkRSMQ==
X-CSE-MsgGUID: 7m92OJmtT1yBOsbEQpmJoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18337368"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18337368"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 01:29:24 -0700
X-CSE-ConnectionGUID: JW3uFxv+QnOgXz4B8iivGw==
X-CSE-MsgGUID: 3Dgq8L+fTGOeiVnpSV78dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="49607979"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa008.jf.intel.com with ESMTP; 12 Jul 2024 01:29:22 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v6 2/2] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
Date: Fri, 12 Jul 2024 13:59:28 +0530
Message-Id: <20240712082928.762514-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712082928.762514-1-pranay.samala@intel.com>
References: <20240712082928.762514-1-pranay.samala@intel.com>
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

v5:
- Add a check to open_params function as it may return -1
  on failure (Bhanu)

v6:
- Editing the check added in v5 (Bhanu)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 29dd8ac4e..89348f435 100644
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
@@ -1185,6 +1188,15 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		for_each_connected_output(&data.display, output)
 			count++;
+
+		dir = igt_sysfs_drm_module_params_open();
+		if (dir >= 0) {
+			current_log_level = igt_drm_debug_level_get(dir);
+			close(dir);
+
+			if (current_log_level > 10)
+				igt_drm_debug_level_update(10);
+		}
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
-- 
2.34.1

