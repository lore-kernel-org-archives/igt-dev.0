Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41B7C3DA45
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jul 2024 08:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DD510E6CD;
	Wed, 10 Jul 2024 08:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeGJd9Cq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE2410E6CD
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jul 2024 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720601254; x=1752137254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CKN5iFNq4TlxSNSxQ5RGFTmPNcdKf5OrKVpKhQKQ2UA=;
 b=PeGJd9CqDG0hSW72CDq2kiRajk8tk3XOPpsYaZQYAicQZY+f0Kaj0K30
 PU82ST3tABFEk53gnittChkb/jSzVZmrvrrqQw9Aarh6/hdb+YjSk9MD2
 7AguZCUKWj5CvBysuXEnemXdPwdxhc7KZh4mSsfVWdbhAyq4NfuIeLNnm
 LN2Il2gxJfW03be/HQ9PLI6Lk6mSsVP+BE/TYlVYKwAL8nyvDUjpnHvvG
 z96EEim8INJOObxi9R6M7R4+Q9ZQWWM90moo4mPytcv63bZzntlKH5hUV
 /3ZTqsKpsZTQbuLTehiZbw59CUjldf0zITsrIan8gFRtdmVxo7gw3fvMC Q==;
X-CSE-ConnectionGUID: ed1eS4N5S1iQ0UJXF4H2tg==
X-CSE-MsgGUID: ShomdderTzS/wDOMWLP0VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35341128"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="35341128"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 01:43:56 -0700
X-CSE-ConnectionGUID: 4u0HvhGaS0aWIlFdwi59cw==
X-CSE-MsgGUID: m3GV1JDQQA2f73cwVijoXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48120822"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2024 01:43:54 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
Date: Wed, 10 Jul 2024 14:13:58 +0530
Message-Id: <20240710084358.744278-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710084358.744278-1-pranay.samala@intel.com>
References: <20240710084358.744278-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 29dd8ac4e..ee3a067b7 100644
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
@@ -1176,6 +1177,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		int current_debug_level = igt_debug_level_init();
+
+		igt_drm_debug_level_decrement(2);
+
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
-- 
2.34.1

