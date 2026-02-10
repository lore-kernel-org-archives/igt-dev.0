Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B01E94623
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 00:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4884F10E497;
	Tue, 10 Feb 2026 00:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+qsZB6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003EA10E497
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 00:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770682253; x=1802218253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/EaakMHwIOzuLPNeC5vS8xt4Ng0/xrDftkQB1HYtpg=;
 b=R+qsZB6IStsT3Ksmkw/ysvgCvpABqst7/TDFxQn8/ax2a3JRcKAzFYt3
 73/JLJpy1U77YvLrT/S6VmjwKMxv854THmDlN26mvWUA2HUBUtAcdStwd
 YPTw4h99sSm+mUcnkeFUY6lNjl2MzsoxEmIyEWR+AvF8V04ZDeJ3jHwZh
 nRr0rVkUt86O+eK+/W5J1yhJpyvWVtUAxKlMhQlt3SnB2/ejpUO7wDbTM
 PVUBjsQNkihl8lUB2em2k91efbfLvaSmI0HGhoRUt/PMF0P3RO6B5MF+N
 MOxZb6qOAojtvF21TN9+nWP9i0c/nFXFEQx0j2UFc3uq/dEvHtwMgQ0V9 A==;
X-CSE-ConnectionGUID: uur5XHjFSI+Sk3LZFCOzhw==
X-CSE-MsgGUID: qt/GnsK4RuGmQ1wFsvKf2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89218514"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89218514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 16:10:53 -0800
X-CSE-ConnectionGUID: OdjswUuVSUmY2RMhgg9GVw==
X-CSE-MsgGUID: B6R2HZ1fS7m3UJDA0ojuJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211762862"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 16:10:52 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/kms_flip: limit output pairs when testing
 suspend
Date: Tue, 10 Feb 2026 01:10:26 +0100
Message-ID: <20260210001026.3923885-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260210001026.3923885-1-michal.grzelak@intel.com>
References: <20260210001026.3923885-1-michal.grzelak@intel.com>
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
 tests/kms_flip.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index c32d8c60b..ab27c23a1 100755
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
@@ -1944,7 +1947,8 @@ static void run_pair(int duration, int flags)
 
 					connector_find_compatible_mode(n, m, &o);
 					if (o.mode_valid)
-						modes++;
+						if (all_pairs || (!all_pairs && modes < PAIR_LIMIT))
+							modes++;
 
 					free_test_output(&o);
 				}
@@ -1985,6 +1989,12 @@ static void run_pair(int duration, int flags)
 					    m != resources->count_crtcs - 1))
 						continue;
 
+					/* Limit number of suspend tests */
+					if (!all_pairs && modes == 0)
+						continue;
+
+					modes--;
+
 					run_test_on_crtc_set(&o, crtc_idxs,
 							     RUN_PAIR,
 							     resources->count_crtcs,
@@ -2046,6 +2056,9 @@ static int opt_handler(int opt, int opt_index, void *data)
 		case 'e':
 			all_pipes = true;
 			break;
+		case 'p':
+			all_pairs = true;
+			break;
 		default:
 			return IGT_OPT_HANDLER_ERROR;
 	}
@@ -2054,9 +2067,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 }
 
 const char *help_str =
-	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n";
+	"  -e \tRun on all pipes. (By default subtests will run on two pipes)\n"
+	"  -p \tRun on all connector pairs. (By default will test 3 pairs)\n";
 
-int igt_main_args("e", NULL, help_str, opt_handler, NULL)
+int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
 {
 	struct {
 		int duration;
-- 
2.45.2

