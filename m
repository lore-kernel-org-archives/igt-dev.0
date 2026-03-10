Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB82FCC9DB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 08:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84B910E699;
	Tue, 10 Mar 2026 08:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsnSOGJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A0E10E699
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773133094; x=1804669094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fgfQOxlXqB1rvcRyNOxrxtpfajRscrqWGXdmNqfJWcU=;
 b=QsnSOGJ7tk+wFVf52yYjeA5Oe4xnh9ONSpUJ8LtXsCz4QjqYSTj6yBjN
 m6G2op26dxvEtgqau/684Z/fb1ZwOrJp3JjEcMJ7KpJr1Uv9vctdz7PsT
 lAIPwgsZ8dxRGD6EYeDoMGtypVAXrF2+cNJmhc6rofa0LnO3pSGJDtycJ
 Cm/GZNHunaw46xA13PsaNdWK5wg0czYoN1MWFqFRTJo+Ial9nprLvbutW
 uAGll5tg5LMvjiKU4wRkJzyCrBkAjYi0syI0dVt59P2jnqfBJBKSMX5iM
 NnHA49BYsvjWTyAJmITQmWVJdPock3n0+OjirI0To6qjTiB+bM/gbtAUt A==;
X-CSE-ConnectionGUID: IGT69oIfTISNGBYvTlQTRg==
X-CSE-MsgGUID: VvPqX3hLRFCwaAsBohOnGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74142531"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74142531"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:58:14 -0700
X-CSE-ConnectionGUID: gCqJJLwcQxeIiJLEKi17cA==
X-CSE-MsgGUID: ctv9QPjgQTW9EM2NKWzUag==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO jhogande-mobl3.intel.com)
 ([10.245.245.252])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:58:12 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_async_flips: Do not skip any tests due to
 Selective Fetch
Date: Tue, 10 Mar 2026 10:57:57 +0200
Message-ID: <20260310085757.1314235-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

There are recent changes in driver fixing async flip handling when
selective fetch is enabled. There is no need to skip any async flip tests
due to Selective Fetch anymore. Remove checking Selective Fetch.

v2:
  - dropped unused psr header
  - dropped unused debugfs_fd local variable
  - rebased

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15791
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/kms_async_flips.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a42407363..4a2930968 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -35,7 +35,6 @@
 
 #include "igt.h"
 #include "igt_aux.h"
-#include "igt_psr.h"
 #include "igt_vec.h"
 #include <sys/ioctl.h>
 #include <sys/time.h>
@@ -612,27 +611,13 @@ static void test_timestamp(data_t *data)
 static void test_cursor(data_t *data)
 {
 	int flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
-	int ret, debugfs_fd;
+	int ret;
 	uint64_t width, height;
 	struct igt_fb cursor_fb;
 	struct drm_mode_cursor cur;
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	/*
-	 * Intel's PSR2 selective fetch adds other planes to state when
-	 * necessary, causing the async flip to fail because async flip is not
-	 * supported in cursor plane.
-	 */
-	if (is_intel_device(data->drm_fd)) {
-		debugfs_fd = igt_debugfs_dir(data->drm_fd);
-		igt_skip_on_f(psr_sink_support(data->drm_fd, debugfs_fd,
-					       PSR_MODE_2_SEL_FETCH, data->output),
-			      "PSR2 selective fetch adds cursor to primary plane flips,"
-			      "breaking async flip support\n");
-		close(debugfs_fd);
-	}
-
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
 
-- 
2.43.0

