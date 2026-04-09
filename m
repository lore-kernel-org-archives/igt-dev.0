Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF87F364B1
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 20:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5127110E83A;
	Thu,  9 Apr 2026 20:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jz+ZLwb4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D6D10E834
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 20:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775765369; x=1807301369;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0EhBtA5RuacG3jJc1d6b1pmQ2d0rsWl6mXuYdt/P77I=;
 b=Jz+ZLwb4D0tPImy5e32cIVZqeXxMBFLaqUh/jKuDWY7bwC28744SFU6J
 R7TmN7H2SsJHKFf4JJPjpuYRD/H3/NivLITP9geOmw8X1BndFGBnRt4ud
 SYxD9B9pIaaknT90seFd9I1vWl8iFwrVZR1fbJqMUGnLna1haKFhhfZMd
 +Sg4Had5Btv0VEFtPbVPkQ3O0OLSo0wkn6BZIVBKxfHijc8cKm6SDyceQ
 8q56BGP7xM2dtIHO3GNdhU7bj+MceYmLNeBJ32FM6btxRPQ3xGjIYD/42
 K4HIp9XxJxxKVV6dRAHA8ri5RLOZBu0I7EFiFQkdYKt6WXhZB6YxphpeE w==;
X-CSE-ConnectionGUID: IAxuRo8kRj6wnv4K6FyW+A==
X-CSE-MsgGUID: ilM0d9dsSr2yqNeWH8yMyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76499183"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="76499183"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:09:29 -0700
X-CSE-ConnectionGUID: 38HWrLboQECWNnxVQz3aIA==
X-CSE-MsgGUID: laQcnjOPTMuNB13D4FZAnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="259342706"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.216])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:09:28 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/kms_busy: Verify display reset happened
Date: Thu,  9 Apr 2026 23:09:24 +0300
Message-ID: <20260409200924.5409-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use the new "display_reset_count" debugfs file to confirm that the
kernel did in fact perform the display reset.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
This will blow up in CI because the debugs file is not yet there.

 tests/intel/kms_busy.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index e82380276666..066c6d34b8f9 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -35,6 +35,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_sysfs.h"
 
 /**
  * SUBTEST: basic
@@ -413,6 +414,11 @@ static void gpu_engines_restore_timeouts(int fd, int num_engines, const struct g
 		gem_engine_properties_restore(fd, &props[i]);
 }
 
+static uint32_t display_reset_count(int drm_fd)
+{
+	return igt_sysfs_get_u32(igt_debugfs_dir(drm_fd), "display_reset_count");
+}
+
 const char *help_str =
 	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
 
@@ -549,16 +555,22 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 					continue;
 
 				igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-					if (tests[i].reset)
+					uint32_t reset_count_pre = 0;
+
+					if (tests[i].reset) {
 						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 1);
+						reset_count_pre = display_reset_count(display.drm_fd);
+					}
 
 					test_hang(&display,
 						  crtc,
 						  output,
 						  tests[i].modeset, tests[i].hang_newfb);
 
-					if (tests[i].reset)
+					if (tests[i].reset) {
 						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 0);
+						igt_assert_neq(reset_count_pre, display_reset_count(display.drm_fd));
+					}
 				}
 			}
 
-- 
2.52.0

