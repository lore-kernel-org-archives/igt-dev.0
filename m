Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22230CCF9EC
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 13:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B663010E485;
	Mon, 27 Oct 2025 13:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcpCA6fy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECB310E482
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 13:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761570029; x=1793106029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hAb0T+JCIyD+2wtc6imJbR8gTwGftezGBJJfnebYLlQ=;
 b=VcpCA6fy8P/ltSBZC+KweYUmugWZ8e6c0vQ6mV+VgrOr0gDIafv/bu54
 yJqJxd/jnCQBAw/m7OmY0tBRc7kvvAHam94EoFSBl82TBuGq/YHHXRuqd
 iNo0On0sP65POQAPolZFJbfU5Sfgy7COOYyp330p36lMea6iMx/6oCYFn
 mGKFyRUaRKqDJP/aWHaXDY219JHvnRAGGJIGSf3KVICaCPmdVxuzcBIZW
 3yfnJ3P3AzVK2/4GgPhcPhJAgv/uCi8x20JnERNiI+4iVZuhdb33lfHrK
 i9KiLLXj/Nz/OiEIJqi8onehEy1q74azVgKuy3RCzZ4NULkJ3tPOj5Ggs Q==;
X-CSE-ConnectionGUID: IZ0+WMOKQyS6/1oD0oVzqA==
X-CSE-MsgGUID: qsrivGpHROemnXpVOkEoxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74990882"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="74990882"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:00:28 -0700
X-CSE-ConnectionGUID: RmN2y8oASHKPRA0VxSaocw==
X-CSE-MsgGUID: 29JpOKBRQQCUaUHnR8lA5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184933511"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP; 27 Oct 2025 06:00:27 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [RFC PATCH v1 1/1] tests/kms_big_fb: Open compatible driver for the
 platform
Date: Mon, 27 Oct 2025 14:00:25 +0100
Message-ID: <20251027130025.1771523-1-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

On platforms older than ADL-P, tests should be executed with i915 loaded
before xe. Currently, when tests are executed and xe is loaded first,
failures are reported in multiple subtests along errors in the dmesg.

Check if i915 has been loaded before xe. If not, open and optionally
reload proper driver according to platform's display version.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_big_fb.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 41fdcacab..5e8fa6112 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -30,6 +30,8 @@
  */
 
 #include "igt.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
 #include <errno.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -967,6 +969,30 @@ static bool test_requirements(data_t *input_data, int l)
 	return true;
 }
 
+static int open_compatible_driver(int drm_fd) {
+	uint32_t devid;
+	bool is_adl, is_xe;
+
+	devid = is_intel_device(drm_fd);
+	is_adl = intel_display_ver(devid) <= 13;
+	is_xe = is_xe_device(drm_fd);
+
+	if (!is_adl || !is_xe) return drm_fd;
+
+	igt_xe_driver_unload();
+	if(igt_kmod_is_loaded("i915")) {
+		igt_kmod_unbind("i915", NULL);
+		igt_kmod_unload("i915");
+	}
+	igt_device_drop_master(drm_fd);
+	drm_close_driver(drm_fd);
+	drm_fd = drm_open_driver_master(DRIVER_INTEL);
+
+	igt_require(is_i915_device(drm_fd));
+
+	return drm_fd;
+}
+
 igt_main
 {
 	igt_fixture {
@@ -976,6 +1002,8 @@ igt_main
 
 		igt_require(is_intel_device(data.drm_fd));
 
+		data.drm_fd = open_compatible_driver(data.drm_fd);
+
 		data.devid = intel_get_drm_devid(data.drm_fd);
 
 		kmstest_set_vt_graphics_mode();
-- 
2.45.2

