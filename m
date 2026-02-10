Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03BBEA3F18
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 22:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A9C10E0BD;
	Tue, 10 Feb 2026 22:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcss/bsS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392CF10E0EC
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 22:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770764162; x=1802300162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=upP3Ato7ZQlUPZxGuDUDi0qZeUvH6yXr15U82I4NA0Q=;
 b=lcss/bsS3uz8tBuiqvU2jq2NXRPOlgWR7rPMPSKB9FZojUGRi3OZ2xk+
 DCH4TPr2tswXndaUp+89Ym/MAIUwdI4BxInPmK6jhQgUjWtIWCPTSN8ad
 FgP51iPIG9k+Fc6crgJYzYVMRoCmXlJwmNKB2khOkCn8VJowip0F1tKPA
 QMz0PixEgbVoM2Pt/1i4DHHHvtEkzLONDvjkw2tFI9r1b3rkA7pQfDNhD
 CnudUVH2asY1aMKgEf5/BJEMfdjqwYENu3sXpUwnPRM86vaId9I8GttIM
 4PBYj5LNaDhJEu3L4srXPSHhc+ChiDHruFdB7MXav+JkJ+USg/T3ivvLr g==;
X-CSE-ConnectionGUID: KJko9O9fRGeO7PvG7ptzhQ==
X-CSE-MsgGUID: mlgNQ7b9RQeQ9L7bWrdcnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72094852"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72094852"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 14:56:02 -0800
X-CSE-ConnectionGUID: dfpGZnfbTF+QY1w6H0t8AQ==
X-CSE-MsgGUID: dLHQ2kWZTBKXaUEyfUYknQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211503827"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2026 14:56:01 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 4/4] tests/kms_flip: limit number of outputs wrt
 suspend
Date: Tue, 10 Feb 2026 23:55:46 +0100
Message-ID: <20260210225546.153728-5-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260210225546.153728-1-michal.grzelak@intel.com>
References: <20260210225546.153728-1-michal.grzelak@intel.com>
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

When running suspend subtests on single output, we can still hit the
timeout by testing too much outputs. Default to testing 3 outputs. Add
commandline parameter to run on all outputs.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 90e5b6192..11cb58c00 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -264,12 +264,14 @@
 #define RUN_PAIR		2
 
 #define PAIR_LIMIT 		3
+#define CONN_LIMIT 		3
 
 #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
 
 static bool all_pipes = false;
+static bool all_conns = false;
 static bool all_pairs = false;
 
 drmModeRes *resources;
@@ -1824,6 +1826,7 @@ static void run_test(int duration, int flags)
 {
 	struct test_output o;
 	int i, n, modes = 0;
+	int conn_count = 0;
 
 	/* No tiling support in XE. */
 	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
@@ -1889,6 +1892,10 @@ static void run_test(int duration, int flags)
 			if ((flags & TEST_SUSPEND) && !all_pipes && n != 0)
 				continue;
 
+			/* Limit number of displays run */
+			if ((flags & TEST_SUSPEND) && !all_conns && conn_count > CONN_LIMIT)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
@@ -1897,8 +1904,15 @@ static void run_test(int duration, int flags)
 			o.depth = 24;
 
 			crtc_idx = n;
-			run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
-					     resources->count_crtcs, duration);
+
+			connector_find_preferred_mode(o._connector[0], n, &o);
+			if (o.mode_valid) {
+				run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
+						     resources->count_crtcs, duration);
+				conn_count++;
+			} else {
+				free_test_output(&o);
+			}
 		}
 	}
 
@@ -2072,10 +2086,11 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
+	"  -c \tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
 	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n"
 	"  -p \tRun on all output pairs. (By default 2x-* suspend subtests will run on 3 pairs)\n";
 
-int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
+int igt_main_args("cep", NULL, help_str, opt_handler, NULL)
 {
 	struct {
 		int duration;
-- 
2.45.2

