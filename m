Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43A0C30653
	for <igt-dev@archiver.kernel.org>; Sun,  7 Jul 2024 15:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D3310E097;
	Sun,  7 Jul 2024 15:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgVebsVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D0B10E097
 for <igt-dev@lists.freedesktop.org>; Sun,  7 Jul 2024 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720364697; x=1751900697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DXFKHjeS9gW/2KUKwDAgI8xR5DvKvB4sdQ0g6httOF8=;
 b=WgVebsVJK1qf6ZhX8AIcEDj6bqL/N3pwVsAkyyAQ9nsQHZ3AaiBBsJdB
 tmY/HULLk3cGZBdLdtrFLg3asUb+BCQzYW/umIG6AzT6fKtJXaGjiM17d
 zsYciM4rww4Z8+xgCL3cpiE9YuiR+wH9H1jTFArR6oASNo5vYU/YbdiO2
 xQOSll48yUN9NqPWcgrEUv31C7VJoXiH2vsLa5ixgvXpFtmIDrntWOTen
 Gd986MieDe3pUCE7KxSamPCAg9xS6X1h9I590sISVGwu8iyeUNKs9MSAU
 hvDxLSmrBBKQlcGw8acgFUZ9QsK1orbD0TkFTnBtkhRMvPnFI96jG2n+6 A==;
X-CSE-ConnectionGUID: vI0Dl4qzQsmZ1Tz9WSLQOg==
X-CSE-MsgGUID: UzT9rqegRJu4qP39QCvLWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17703810"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="17703810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2024 08:04:57 -0700
X-CSE-ConnectionGUID: VsPwZyI7SZqFlpQy9hFHJA==
X-CSE-MsgGUID: QXAcwHLfRHyxlGM5MAxkpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; d="scan'208";a="84817587"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 07 Jul 2024 08:04:56 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 2/2] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
Date: Sun,  7 Jul 2024 20:34:57 +0530
Message-Id: <20240707150457.715471-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240707150457.715471-1-pranay.samala@intel.com>
References: <20240707150457.715471-1-pranay.samala@intel.com>
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

So dynamically reducing the debug log level to 
enable on less disk space machines.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 29dd8ac4e..b0339f57d 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -41,6 +41,7 @@
 #include <string.h>
 #include <time.h>
 #include <poll.h>
+#include <igt_sysfs.h>
 
 /**
  * SUBTEST: plane-primary-toggle-with-vblank-wait
@@ -1176,6 +1177,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		igt_set_debug_value(data.drm_fd, 13);
+
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
@@ -1258,6 +1261,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_fixture {
 		igt_display_fini(&data.display);
+		igt_debug_reset(data.drm_fd);
 		drm_close_driver(data.drm_fd);
 	}
 }
-- 
2.34.1

