Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C969EB4906
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 11:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25C410E726;
	Thu, 12 Feb 2026 11:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neKPvrX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACED810E726
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770894641; x=1802430641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xS2i0RW0B5hLZxsHAFCnukaLLhwpWaYucWFouDmHTQw=;
 b=neKPvrX6LxAxi7GMaf5DzIs0yZcc15eALnB5apwxCmOb8b5pFQMIBW7k
 45Am7efdSBtW+CAYK/WD2Jjz27XU+8oqcyJIbFiIVd2C0uzu56y44gtN3
 kXcQTZ1HGKaAbB09kmnfwSNhYT7ZGOKhF1uFVhaRKPAlLwBxj2YuoGhoP
 Unh6qIm43S/PHH1tK6wz6zWUrLxw4iOH0BYn0qU5mbeFQpinuaGIwPMmQ
 Rnmakfc+JIPkUcwiEHHI8UU6jkucRe+9G6Pyd1AV9iIhbIy/394O5EC8n
 DQhYL/SQlmGB1lu2mfOfHbcBg0rI6w1PUeLPc4nZbIckIQQCjb7sTFjgN A==;
X-CSE-ConnectionGUID: qoznliPzSPaafTFs7uj2RA==
X-CSE-MsgGUID: wGEMHFwUTPeMP3KJIu/mHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75907664"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="75907664"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 03:10:41 -0800
X-CSE-ConnectionGUID: MrAT+1z4TeCzKg15rKtHdQ==
X-CSE-MsgGUID: J5XZ5zB7Sly+0Kl8oflX8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212674321"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP; 12 Feb 2026 03:10:40 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 3/4] tests/kms_flip: limit output pairs when testing
 suspend
Date: Thu, 12 Feb 2026 12:10:21 +0100
Message-ID: <20260212111023.189261-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260212111023.189261-1-michal.grzelak@intel.com>
References: <20260212111023.189261-1-michal.grzelak@intel.com>
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

Currently 2x- subtests can still exceed timeout, even with limited
number of pipes pair. It can be seen when number of outputs is greater
than 3.

Default to testing at max 3 pairs of outputs. Add a commandline
parameter enabling suspend testing on all possible output pairs. Add a
LIMIT_PAIR macro which controls maximum number of output pairs to test.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 41 ++++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index c32d8c60b..232b6fbbe 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -263,11 +263,14 @@
 #define RUN_TEST		1
 #define RUN_PAIR		2
 
+#define PAIR_LIMIT 		3
+
 #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
 
 static bool all_pipes = false;
+static bool all_pairs = false;
 
 drmModeRes *resources;
 int drm_fd;
@@ -1906,6 +1909,7 @@ static void run_pair(int duration, int flags)
 {
 	struct test_output o;
 	int i, j, m, n, modes = 0;
+	int pair_count = 0;
 
 	/* No tiling support in XE. */
 	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
@@ -1968,6 +1972,16 @@ static void run_pair(int duration, int flags)
 				for (m = n + 1; m < resources->count_crtcs; m++) {
 					int crtc_idxs[2];
 
+					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
+					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_pipes &&
+					    ((n != 0 && n != resources->count_crtcs) ||
+					    m != resources->count_crtcs - 1))
+						continue;
+
+					/* Limit number of suspend tests */
+					if ((flags & TEST_SUSPEND) && !all_pairs && pair_count >= PAIR_LIMIT)
+						continue;
+
 					memset(&o, 0, sizeof(o));
 					o.count = 2;
 					o._connector[0] = resources->connectors[i];
@@ -1979,16 +1993,17 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[0] = n;
 					crtc_idxs[1] = m;
 
-					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
-					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_pipes &&
-					    ((n != 0 && n != resources->count_crtcs) ||
-					    m != resources->count_crtcs - 1))
-						continue;
+					connector_find_compatible_mode(n, m, &o);
 
-					run_test_on_crtc_set(&o, crtc_idxs,
-							     RUN_PAIR,
-							     resources->count_crtcs,
-							     duration);
+					if (o.mode_valid) {
+						run_test_on_crtc_set(&o, crtc_idxs,
+								     RUN_PAIR,
+								     resources->count_crtcs,
+								     duration);
+						pair_count++;
+					} else {
+						free_test_output(&o);
+					}
 				}
 			}
 		}
@@ -2046,6 +2061,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 		case 'e':
 			all_pipes = true;
 			break;
+		case 'p':
+			all_pairs = true;
+			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
 	}
@@ -2054,9 +2072,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
+	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n"
+	"  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n";
 
-int igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
 {
 	struct {
 		int duration;
-- 
2.45.2

