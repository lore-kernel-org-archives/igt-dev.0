Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701ADC44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 11:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D07D10E8C7;
	Mon, 20 Jul 2026 11:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vv+fe5VG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BF810E8C7
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 11:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784548121; x=1816084121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SWokB5JLCDxNmzRp9rvINE2K9WZ+xSoVnstT9EyoaSQ=;
 b=Vv+fe5VGBDNw70j8jllLHlG1CPa9oUDe5+knz0v/o8Bz9Le4w005/870
 wGFcp49sVpQJGe8URGjYiWrMUUNUt7b2eYU9cP6cmeFvmqNifS+9YwYv1
 /uqB/p9FY56QjuPXw4CUOcnKBoZyAWDVhQxmZwIb1s12ChvYITqIGEOqv
 zODiGNd+y4kPlIQOo4eCDC6DFhDbKL38KGR0HpM+RKL6hlUDF9tkeM+P8
 8N/yYmobGOsvjjD7v+1Lg9Rv585YgTG8ArAYu+rgyZGOQz/sm1TfhdvaH
 VEa8UhSZOCIIRnK5IGRXse7eY0cpsG0Yennza1sCLRLWF0x3IZC72aX4s A==;
X-CSE-ConnectionGUID: GnPbXz7cTKa4LlSBcEkIuw==
X-CSE-MsgGUID: UcbeyqGNQeeIqwxpC1MKMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="84250788"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="84250788"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 04:48:41 -0700
X-CSE-ConnectionGUID: lSWA4sIcRHyX+PKK97N7vQ==
X-CSE-MsgGUID: lgmWAlxMQZ+DRNWTndZ5TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="261717041"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 04:48:39 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevan B <jeevan.b@intel.com>,
 Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Fix compilation on arm64
Date: Mon, 20 Jul 2026 13:48:35 +0200
Message-ID: <20260720114835.35398-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Fix compilation on arm64, where following error occurs:

../tests/intel/kms_pm_dc.c:428:16: error: implicit declaration of function ‘poll’; did you mean ‘powl’? [-Werror=implicit-function-declaration]
  428 |   igt_assert_f(poll(&pfd, 1, timeout_ms) > 0,
      |                ^~~~

Also while at this add a newline to separate system includes
from igt ones and a compilation warning in other place:

../tests/intel/kms_pm_dc.c:322:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  322 |         color_t red_green_blue[] = {
      |         ^~~~~~~

Fixes: e4a428ca3a46 ("tests/intel/kms_pm_dc: Detect frame drops via page-flip events")
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/kms_pm_dc.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 37c795ca8..29cfa847e 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -32,9 +32,11 @@
 
 #include <errno.h>
 #include <fcntl.h>
+#include <poll.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
+
 #include "igt.h"
 #include "igt_kmod.h"
 #include "igt_psr.h"
@@ -309,14 +311,6 @@ static void assert_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_
 static void setup_videoplayback(data_t *data)
 {
 	igt_plane_t *primary;
-
-	primary = igt_output_get_plane_type(data->output,
-					    DRM_PLANE_TYPE_PRIMARY);
-	igt_require_f(igt_plane_has_format_mod(primary, data->dc3co_fb_format,
-					       DRM_FORMAT_MOD_LINEAR),
-					       "Primary plane does not support format %s\n",
-					       igt_format_str(data->dc3co_fb_format));
-
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -328,6 +322,13 @@ static void setup_videoplayback(data_t *data)
 		{ 1.0, 0.0, 0.0 },
 	};
 
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_require_f(igt_plane_has_format_mod(primary, data->dc3co_fb_format,
+					       DRM_FORMAT_MOD_LINEAR),
+					       "Primary plane does not support format %s\n",
+					       igt_format_str(data->dc3co_fb_format));
+
 	create_color_fb(data, &data->fb_rgb, red_green_blue);
 	create_color_fb(data, &data->fb_rgr, red_green_red);
 }
-- 
2.54.0

