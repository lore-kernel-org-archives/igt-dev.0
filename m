Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA9BEBFD16
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 08:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1482010E37E;
	Mon, 13 Apr 2026 08:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bb3qNwqD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF9D10E37E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776069951; x=1807605951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/1NknvllpG8YvR/j+0muB0NB6qLS/nmxlpj/T+DlLrU=;
 b=Bb3qNwqD/fvBCWuSfrHDoKrw5ZxyJoPqFfCO8a6Xd3jWAfKu++PzXK2G
 mNejvEqeMiGWsATfRI0qF2N+yz1F1tOkWMRTfWIwNp0if3r69REsxHOfB
 A+ya4eJGu1S69iyI+vBOjyNT5Yu2EXKpAQb8WClq8hvCM0QG6yvIB7cUh
 uSwTvg+vRx0tKNFbUSBwotRS4CYNCQg6xeIeCX66VHb/lu48kXGR/9P2r
 NYE6c4ootUZqDNvvuC+ozLOZMCPRwOUTGdXkpjK1lXFsgLPmdfPibRXLK
 epCS0yP7GZXfXSBYBWWHazaaMyjagR+hgH2yo7Xv4foXhqMCiKkcLNiqY A==;
X-CSE-ConnectionGUID: k7tlCsvmQimWaHvwBUe6oA==
X-CSE-MsgGUID: kpd9MbI0T56+TltPx5IsGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76961620"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="76961620"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 01:45:50 -0700
X-CSE-ConnectionGUID: qcWgp13OTeCkoKIc7iNe5g==
X-CSE-MsgGUID: L2td+0+bSumPOplLqpwsxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="260170900"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 01:45:49 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/kms_busy: Verify display reset happened
Date: Mon, 13 Apr 2026 11:45:45 +0300
Message-ID: <20260413084545.2491-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260409200924.5409-1-ville.syrjala@linux.intel.com>
References: <20260409200924.5409-1-ville.syrjala@linux.intel.com>
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

Use the new "intel_display_reset_count" debugfs file to confirm that the
kernel did in fact perform the display reset.

v2: Give the file an "intel_" namespace (Jani)
    Don't leak the debugfs dirfd

Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_busy.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index e82380276666..039cc6ae8dab 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -35,6 +35,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_sysfs.h"
 
 /**
  * SUBTEST: basic
@@ -413,6 +414,18 @@ static void gpu_engines_restore_timeouts(int fd, int num_engines, const struct g
 		gem_engine_properties_restore(fd, &props[i]);
 }
 
+static uint32_t display_reset_count(int drm_fd)
+{
+	uint32_t count;
+	int dir;
+
+	dir = igt_debugfs_dir(drm_fd);
+	count = igt_sysfs_get_u32(dir, "intel_display_reset_count");
+	close(dir);
+
+	return count;
+}
+
 const char *help_str =
 	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
 
@@ -549,16 +562,22 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
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

