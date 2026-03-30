Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55206FF4958
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAF610E3FC;
	Mon, 30 Mar 2026 07:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6htWiC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B74810E3EA
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774857316; x=1806393316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hzSyt9ooEetC0kU1K0pZveA53NDOb/EQ0gQyBROfaVo=;
 b=L6htWiC5Wm7X1rifLjtrSDVVVMk6bjFDKYH7c9W/Mq8w0y5vl9cCxy8D
 wDjbgIHkBhaR25r+dkVlc8hgcRH9hcSF0bo5TAJDKhpK0UnodFQ6eqBnM
 AoycGlo8olXKZ0D1aqQwgGzufwU70IONujoRMAHe2bfNpRF5r5uj8utxM
 01wfZEkL6qJiGq/6fAynSSKZq/k3qYSuPwSNtafHzVtFDX65UaZTYO8K5
 Qy2o/+yaWRgvxaZMintxMMTeh/fG0eK3bcQ25+tFPnrwZGaQOusyxHOMS
 nt9FsjwG3Dn00zs6i5VAJRGI8dpsgbkGVU8VJsLzlJ4tFh207ey9pvduI w==;
X-CSE-ConnectionGUID: lcbayfuSQIGzucG6tU3Afw==
X-CSE-MsgGUID: VKXe+ZwNSgG0d8xMz5KSJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75729066"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75729066"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:55:16 -0700
X-CSE-ConnectionGUID: +Br6HsicQkO7OnNVliI9YQ==
X-CSE-MsgGUID: SpjHxmhoQF+3piytMbaTqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227595642"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 00:55:15 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v9 3/6] tests/kms_flip: limit output pairs when testing
 suspend
Date: Mon, 30 Mar 2026 09:55:05 +0200
Message-ID: <20260330075508.1003899-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260330075508.1003899-1-michal.grzelak@intel.com>
References: <20260330075508.1003899-1-michal.grzelak@intel.com>
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
number of pipes used. It can be seen when number of outputs is greater
than 3.

Default to testing at max 3 pairs of outputs. Add a commandline
parameter enabling suspend testing on all possible output pairs. Add a
LIMIT_PAIR macro which controls maximum number of output pairs to test.

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 2a843800b8..9ea5eb0352 100755
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
 
 static bool all_crtcs = false;
+static bool all_pairs = false;
 
 drmModeRes *resources;
 int drm_fd;
@@ -1908,6 +1911,7 @@ static void run_pair(int duration, int flags)
 {
 	struct test_output o;
 	int i, j, m, n, modes = 0;
+	int pair_count = 0;
 
 	/* No tiling support in XE. */
 	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
@@ -1970,6 +1974,16 @@ static void run_pair(int duration, int flags)
 				for (m = n + 1; m < resources->count_crtcs; m++) {
 					int crtc_idxs[2];
 
+					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
+					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
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
@@ -1981,16 +1995,18 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[0] = n;
 					crtc_idxs[1] = m;
 
-					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
-					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
-					    ((n != 0 && n != resources->count_crtcs) ||
-					    m != resources->count_crtcs - 1))
+					connector_find_compatible_mode(n, m, &o);
+
+					if (!o.mode_valid) {
+						free_test_output(&o);
 						continue;
+					}
 
 					run_test_on_crtc_set(&o, crtc_idxs,
 							     RUN_PAIR,
 							     resources->count_crtcs,
 							     duration);
+					pair_count++;
 				}
 			}
 		}
@@ -2048,6 +2064,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 		case 'e':
 			all_crtcs = true;
 			break;
+		case 'p':
+			all_pairs = true;
+			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
 	}
@@ -2056,9 +2075,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n";
+	"  -e \tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
+	"  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n";
 
-int igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
 {
 	struct {
 		int duration;
-- 
2.45.2

