Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE03C30653
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 09:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8A810EA76;
	Thu,  4 Jul 2024 09:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1Eb/Nwg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4699510EA76
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720086544; x=1751622544;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wr9wM4eJgkVonsEySoRpAKHyV61JDZa1WcqbLaz+JsM=;
 b=F1Eb/NwgO6f0E/1QOTz+xQVcejnPfwKzDXoql40XR8mT7D5VDmGRHdZT
 4VeHrVHXBdYY39ulFrGFLwG52nBnEIalaoOMEhOm5h1EU/BZkgMfX61V8
 sh9pd3xJ2gUN4woeSj8X3HsGJbF6FV8tiMGr98IMBRhfEROcKOjw0abjk
 SRT+QjnFn6m5syYaROfeJ+CVgSZhFcCXOiJ9ZC3IandDoby45zmJOZpMa
 OHF4stquOsASK/6ek5O5tQ9wXKp92MmnUENyWn8SfiVAXnYhJtEcrZaos
 RSLSb7W5KbFWKmMrr4iRyUu4hhLWUrMnttmSVbBWsHYRJ/MGbvMlIyQWG g==;
X-CSE-ConnectionGUID: oivLAVMtSsWZZNGHAHPEdA==
X-CSE-MsgGUID: 71OMsfbCSr23ISLLqcH6Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17491622"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17491622"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 02:49:03 -0700
X-CSE-ConnectionGUID: v4QpPmZJQj2CrBx+t1FF9g==
X-CSE-MsgGUID: g2PG9cNaT2m3IukaSq6u4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46510972"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa008.fm.intel.com with ESMTP; 04 Jul 2024 02:49:01 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_atomic_transition: Reducing debug loglevel
 dynamically
Date: Thu,  4 Jul 2024 15:19:11 +0530
Message-Id: <20240704094911.679105-1-pranay.samala@intel.com>
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

This test is debug logs are too much and was killed
due to exceeding disk usage limit on the less disk
space machines.

So dynamically reducing the debug log level to 13.

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

