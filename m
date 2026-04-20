Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7DCF588E5
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 15:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC7A10E69D;
	Mon, 20 Apr 2026 15:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cT/3D9pa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295F310E69B
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776698030; x=1808234030;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MY7MWsNk3ZU5yq1wniz8+hrWhQmDPv27y3ZT4U1ccNg=;
 b=cT/3D9paGVfGrr25rrNUmWkjWok/k/qbFSnX7g3YgihASYiXMwajykFb
 PmsCKG+I4OtVLTtGrjs+pE0jI+9LkDc4eyzwgnu7e3PDhbW0Foi+Vet2S
 2UhH9sh4hBh7JxupeufkoumxZz5ESqeuo9U83j7G8QgotxK+VOI6ebwGt
 DcopPXNV5icYuulH4rGeCHlKlLxzZzjeVGJMf0N8P7XdeTFk95rNBBk96
 znPoWpIyVkrWEyPdt+8V1EplHobLZ6h2cqJRn0UZAtPKHQYPHKoU/OtKR
 K2Xyr2jKh/ec5cCF7QHO7fVqdfnPsxgCQDz5NQOUmphHcICBuYFyUgai0 A==;
X-CSE-ConnectionGUID: wiPi8xx9TfSdv9fZ/FAhTw==
X-CSE-MsgGUID: jSd/IvkWT5WxVKXXdz/lnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88315960"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="88315960"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 08:08:00 -0700
X-CSE-ConnectionGUID: B1ckUjFsRBitM5wxEthBBA==
X-CSE-MsgGUID: XzjLJZijSv243K0PSIjoHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="236723049"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.202])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 08:07:57 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pwrite_crc: Create basic subtest
Date: Mon, 20 Apr 2026 17:07:52 +0200
Message-ID: <20260420150753.96250-1-kamil.konieczny@linux.intel.com>
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
---
 tests/intel/kms_pwrite_crc.c | 39 +++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/tests/intel/kms_pwrite_crc.c b/tests/intel/kms_pwrite_crc.c
index bd536007c..92f5292dd 100644
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
@@ -192,22 +193,32 @@ static void run_test(data_t *data)
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
+		data.drm_fd = -1;
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
+		if (data.drm_fd != -1) {
+			igt_display_fini(&data.display);
+			drm_close_driver(data.drm_fd);
+		}
+	}
 }
-- 
2.53.0

