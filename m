Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308C9C021A1
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 12:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B540A10E0BA;
	Tue, 11 Feb 2025 12:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvUm57po";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BDE10E0BA
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739276552; x=1770812552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2/oTW8D7L1W6kN9HD09NvAcrd1PTjTSWgqiwbJdBbv4=;
 b=TvUm57poiRDfPNbV1LLO1oTdQYZxC9R/pxiWfIqkwryI0zZIqUF9MBcP
 ZGraojYJIcJUPFZF63Z56SL96Uj08LsPMKX2aWA6LWRaDxcMamuU1hj/n
 ToTIWZyJMFKGACeGOVPrt+8iiPIy/iBrc0Acr/Z3wo3x+qig1rjJ9pYTM
 PwZOaa5iqt0f+55PbxubALxknDVUuJvQBgisoWZmGPijaBLtFmp4hyBrU
 1PcHqUQ7rhE88MJ5ueMQIW2+WtJduGaIb7lwJYDW5aeIqj8TLc9Bw1xlD
 GOQmt084UYcXfIwb4J4jFgnIUmxL0OAU2Al7VIAWiiCVXY8YktmzDlY6N A==;
X-CSE-ConnectionGUID: Wmjv2w8tRXC219vP6hFffg==
X-CSE-MsgGUID: 97XzccmSS4qFQpn+cWJXZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57429347"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="57429347"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:22:31 -0800
X-CSE-ConnectionGUID: y5SFJICgSQiqYO17HrfzBA==
X-CSE-MsgGUID: eZwFW3INRciMnJBXV3V8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112350957"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:22:30 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/i915_pipe_stress: Add XE support
Date: Tue, 11 Feb 2025 17:57:41 +0530
Message-Id: <20250211122743.329838-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250211122743.329838-1-swati2.sharma@intel.com>
References: <20250211122743.329838-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add XE driver support for kms tests. This patch will add a support
to call the corresponding apis based on the driver (i915/xe)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/i915_pipe_stress.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/intel/i915_pipe_stress.c b/tests/intel/i915_pipe_stress.c
index 203eb46a3..78cffe707 100644
--- a/tests/intel/i915_pipe_stress.c
+++ b/tests/intel/i915_pipe_stress.c
@@ -18,6 +18,7 @@
 #include <pthread.h>
 #include <semaphore.h>
 #include "i915/gem.h"
+#include "xe/xe_query.h"
 /**
  * TEST: i915 pipe stress
  * Description: Stress test how gpu and cpu behaves if maximum amount of
@@ -245,6 +246,7 @@ static void *gpu_load(void *ptr)
 	int frame = 0;
 	int rect = 0, total_rects = 0;
 	int pixels = 0;
+	uint32_t region;
 
 	mode = data->highest_mode[pipe];
 	if (!mode)
@@ -255,9 +257,13 @@ static void *gpu_load(void *ptr)
 
 	igt_info("GPU thread pipe %d start\n", pipe);
 
+	if (is_i915_device(data->drm_fd))
+		region = INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0);
+	else
+		region = vram_if_possible(data->drm_fd, 0);
+
 	context->buf = create_buf(data, data->highest_mode[pipe]->hdisplay,
-				  data->highest_mode[pipe]->vdisplay,
-				  INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
+				  data->highest_mode[pipe]->vdisplay, region);
 
 	while (data->gpu_thread_state[pipe] != STOPPED) {
 
@@ -846,7 +852,7 @@ igt_main {
 	uint8_t format_idx = 0, tiling_idx = 0;
 
 	igt_fixture {
-		data.drm_fd = data.display.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = data.display.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		kmstest_set_vt_graphics_mode();
 
@@ -854,7 +860,8 @@ igt_main {
 		igt_require(data.display.is_atomic);
 		igt_display_require_output(&data.display);
 		data.devid = intel_get_drm_devid(data.drm_fd);
-		igt_require_gem(data.drm_fd);
+		if (is_i915_device(data.drm_fd))
+			igt_require_gem(data.drm_fd);
 	}
 
 	for (format_idx = 0; format_idx < N_FORMATS; format_idx++) {
-- 
2.25.1

