Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F9AC3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 04:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8466810E2D2;
	Thu, 11 Jul 2024 04:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEAZIVCb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15E910E2D8
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 04:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720671237; x=1752207237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uLvEdGHtleiLnj/BXdSTot01c7/eVRyzu3ay/LC2kAk=;
 b=KEAZIVCbmYTGnnfnfWxtpc7sPIE12YBM+MAS+R4oZTf7/ivdkP7G8RdK
 1mhmtwUkO1vn7UjDekhIrgRi3XZrMoiB4JGQu/BVErWhiKWU6IUXwWTNo
 JEMYItkV+rIbvhv9EWhXTNfiGYZVWJYXV4XSjJTl7Y+QzcRzqcbAFAGMz
 57n/YCxxkd7wSyIT72jmR7U3FOtevyphewMmyJMH/mNEHSAsbWnECNger
 P5ounbXxvXv6VXk4WmDZCk/ZhHFG1WuLm/gkmPUhqKzxDXnKbDej89Y77
 8fp9Bnx3wpufPJsdw3LIfgb7xbbCeKVwj0KnAE03WollDR0Q5UKM0vq2r Q==;
X-CSE-ConnectionGUID: AV25irWxQkSaFzndBcrCdQ==
X-CSE-MsgGUID: KbJDYuxoSzKg6Saz0xxKXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17645492"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="17645492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 21:13:57 -0700
X-CSE-ConnectionGUID: wX4NbNHESaOv0WqwrMfaBw==
X-CSE-MsgGUID: kYLlmc/HQkyyOs9rjQt6/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48404925"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2024 21:13:55 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 bhanuprakash.modem@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 2/3] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
Date: Thu, 11 Jul 2024 09:43:54 +0530
Message-Id: <20240711041355.749937-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711041355.749937-1-pranay.samala@intel.com>
References: <20240711041355.749937-1-pranay.samala@intel.com>
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

v3:
- Calling loglevel init functionality in lib file (Bhanu)
- Here 2 means the log level will be reduced by 2 (Bhanu)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 29dd8ac4e..f89cd0814 100644
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
@@ -1176,6 +1177,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+		igt_drm_debug_level_update(2);
+
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
-- 
2.34.1

