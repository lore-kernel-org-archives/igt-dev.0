Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EE8C3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 03:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A601E10E870;
	Fri, 12 Jul 2024 03:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnDyuz88";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7DD10E870
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2024 03:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720754056; x=1752290056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XRqcpXt8P5lypJvgvK8FnY8+Mp1h8vZsMPq1qErubZo=;
 b=lnDyuz88q8tRsLhRWVpzBKRytopH6rd08m3LMH+G2n/A/IEf+dJqxh3z
 xMePWUgt5k2sSWD1+H9iXg+lybcIL5U3rk/JFZ7x406W1tonka4jvSzEi
 Uy+I2UYLCIjkFNIQudzBJj7xLHGww7Xd86c2JCe5dZQo3HBVcz+GkX/ND
 fVVqhK6VGMlh6ee49MqdG4FtiYqfzw7GAHdrNlB827xVmHP1OjMASLSxH
 RP21Orcsd7KwVHZkrECCNd/XYgZM1LoHY79mpk+NEiUB9HkvfT2P85sj/
 fTf2TJpVkwKvbQnR/wFuYSkwBtXwYN1G9n6kuYzJ/FrckHs5i9bMSGsFL g==;
X-CSE-ConnectionGUID: y2eaI61sTJiw3YUWHYZzEg==
X-CSE-MsgGUID: wi1kmD4VRfKKb0d4GfwoEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29574145"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="29574145"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 20:14:16 -0700
X-CSE-ConnectionGUID: GABHTlrVR6C23YzrSnuBrA==
X-CSE-MsgGUID: lHhZxoDSRYiUDWHipfcCug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48665377"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 11 Jul 2024 20:14:13 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v5 2/2] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
Date: Fri, 12 Jul 2024 08:44:18 +0530
Message-Id: <20240712031418.762175-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712031418.762175-1-pranay.samala@intel.com>
References: <20240712031418.762175-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 29dd8ac4e..f7f1edd31 100644
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
@@ -1185,6 +1188,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		for_each_connected_output(&data.display, output)
 			count++;
+
+		dir = igt_sysfs_drm_module_params_open();
+		if (dir < 0)
+			return;
+
+		current_log_level = igt_drm_debug_level_get(dir);
+		close(dir);
+
+		if (current_log_level > 10)
+			igt_drm_debug_level_update(10);
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
-- 
2.34.1

