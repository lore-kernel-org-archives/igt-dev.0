Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E644FF8FA69
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 12:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943FF10E88E;
	Tue, 21 Apr 2026 12:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TE0sGyae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4485C10E88E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 12:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776773219; x=1808309219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pSQpnrfPJhvz2jgd0/QzyM2jPd07rGoHfR/GDDT0EIg=;
 b=TE0sGyaep0+cloNYWb8PltCFrUMbAqTAc9QRHguBdizHTGrsl1TTJoX8
 X5ysZxy+YDwpk4T/CsEy7+yFVzu11g8hwJJ1P7csyaRWoT+BsrnrDOamq
 PxMolm9d9AKwlgp5ParFcUh75ZoWUg/hlKZxJ7cpAV9BXLhQL1As3oE9z
 SO6DQ9gnR6HCphTA1XfdzvTveQyb/CAFUEBGsxjhbPVM5F+5eMTdCfPDg
 PYSu0mEudnxQ+EblKeMrvNmdpamcSlWuYeOnIATTLSRO5bknCMn5XZln8
 mDILwNMMzswMp/Z1YEudaDaQzFWLTd6DO1yGROJZgallBb6x3+5IJE5bs A==;
X-CSE-ConnectionGUID: 7UC9i5MJTgS8GX7WI/UUkQ==
X-CSE-MsgGUID: GSFhrpu+SsqFuOqrmDx7UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76735052"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="76735052"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:06:58 -0700
X-CSE-ConnectionGUID: iBXX2iVkQE6yKOoFcOFPIw==
X-CSE-MsgGUID: e1CJlHQ0R7+Ujb8GlHEtwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="227385430"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:06:57 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_pwrite_crc: Create basic subtest
Date: Tue, 21 Apr 2026 14:06:52 +0200
Message-ID: <20260421120652.27364-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.53.0
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

Create a basic subtests which allows to properly cleanup after
any failure or a skip. Also while at this, move an igt header
to proper place.

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_pwrite_crc.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index bd536007c..dfbeac9e0 100644
--- a/tests/intel/kms_pwrite_crc.c
+++ b/tests/intel/kms_pwrite_crc.c
@@ -30,15 +30,16 @@
  * Mega feature: General Display Features
  */
 
-#include "igt.h"
 #include <errno.h>
 #include <limits.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
 
+#include "igt.h"
+
 /**
- * SUBTEST:
+ * SUBTEST: basic
  * Description: Use the display CRC support to validate pwrite to an already
  *              uncached future scanout buffer.
  */
@@ -192,22 +193,29 @@ static void run_test(data_t *data)
 	igt_skip("no valid crtc/connector combinations found\n");
 }
 
-static data_t data;
+static data_t data = { };
 
-int igt_simple_main()
+int igt_main()
 {
-	data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
-	kmstest_set_vt_graphics_mode();
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		kmstest_set_vt_graphics_mode();
 
-	igt_display_require(&data.display, data.drm_fd);
-	igt_display_require_output(&data.display);
-	igt_require_pipe_crc(data.drm_fd);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+		igt_require_pipe_crc(data.drm_fd);
 
-	data.devid = intel_get_drm_devid(data.drm_fd);
-	data.pipe_crc = NULL;
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		data.pipe_crc = NULL;
+	}
 
-	run_test(&data);
+	igt_describe("Use the display CRC support to validate pwrite "
+		     "to an already uncached future scanout buffer.");
+	igt_subtest("basic")
+		run_test(&data);
 
-	igt_display_fini(&data.display);
-	drm_close_driver(data.drm_fd);
+	igt_fixture() {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
 }
-- 
2.53.0

