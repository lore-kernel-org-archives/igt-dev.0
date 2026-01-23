Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2780BD778AF
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 20:34:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF72510E0BC;
	Fri, 23 Jan 2026 20:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XY6WSANE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B0310E0BC
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 20:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769200460; x=1800736460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BSD9QCjz7oTDwmKvpAyHCFzz3CtGBDrjEaG7uhAKRhA=;
 b=XY6WSANEEMCo3O1B+/rf9NZb5qTeJvhZtIth40Lt3RNNw/IPrDLDxdyJ
 Is7FOSyiaaf/SfZrRA2wkBc3wMmLvUO7brtq0il1Q2ZJUrxrhPH+NxhtH
 8RiZTgoh3x8NKMdA5JRnwK+E83dgxtBruEzk8TSkPKKMo4tud9TcUdP08
 g4UMmlLe8/FLrWsVWNIEZHuApbntU05fwMKJTo29HSWD6DeJ7o2p/of6z
 1M8wymnSoRKu88eYGM3D6vYUXwMv+KuBPy+jVadJsJp8Hlqh/P5i1D5yF
 4spTdcdtOK41nJLC3MEW7eLJ+WOaCB0ME/URKY+Hp7/fhPe8HoT2fGX4S Q==;
X-CSE-ConnectionGUID: kajqDfnuS0aTAz7ZP7eC/w==
X-CSE-MsgGUID: AOCx7su9Sl2jg0I0Q3dRDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70546332"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="70546332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 12:34:19 -0800
X-CSE-ConnectionGUID: KlcUhJ+aRbaUJEpA9Jme0Q==
X-CSE-MsgGUID: 918m69C4T6C5owDPi5m2Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211621334"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP; 23 Jan 2026 12:34:18 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_flip: test suspend on one pair of pipes
Date: Fri, 23 Jan 2026 21:34:11 +0100
Message-ID: <20260123203411.689766-1-michal.grzelak@intel.com>
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

Currently, every pair of ({pipe1, pipe2}, {output1, output2}) is being
tested in 2x-* subtests. Since suspend shouldn't be tested per pipe, it
causes unnecessary overhead: with 4 pipes & 4 displays it runs in total
36 tests. Given that each suspend's dynamic subtest can take up to tens
of seconds, total duration of the test easily exceeds timeout.

When testing suspend, for each pair of outputs test only first and last
pipe unless it is said to run on all pipes.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index a74e69c6f..dd110aecf 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1841,8 +1841,8 @@ static void run_test(int duration, int flags)
 	/* Count output configurations to scale test runtime. */
 	for (i = 0; i < resources->count_connectors; i++) {
 		for (n = 0; n < resources->count_crtcs; n++) {
-			/* Limit the execution to 2 CRTCs (first & last) for hang tests */
-			if ((flags & TEST_HANG) && !all_pipes &&
+			/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
+			if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_pipes &&
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
@@ -1873,8 +1873,8 @@ static void run_test(int duration, int flags)
 		for (n = 0; n < resources->count_crtcs; n++) {
 			int crtc_idx;
 
-			/* Limit the execution to 2 CRTCs (first & last) for hang tests */
-			if ((flags & TEST_HANG) && !all_pipes &&
+			/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
+			if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_pipes &&
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
@@ -1920,6 +1920,12 @@ static void run_pair(int duration, int flags)
 		for (n = 0; n < resources->count_crtcs; n++) {
 			for (j = i + 1; j < resources->count_connectors; j++) {
 				for (m = n + 1; m < resources->count_crtcs; m++) {
+					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
+					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_pipes &&
+					    ((n != 0 && n != resources->count_crtcs) ||
+					    m != resources->count_crtcs - 1))
+						continue;
+
 					memset(&o, 0, sizeof(o));
 					o.count = 2;
 					o._connector[0] = resources->connectors[i];
@@ -1965,8 +1971,8 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[0] = n;
 					crtc_idxs[1] = m;
 
-					/* Limit the execution to 2 CRTCs (first & last) for hang tests */
-					if ((flags & TEST_HANG) && !all_pipes &&
+					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
+					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_pipes &&
 					    ((n != 0 && n != resources->count_crtcs) ||
 					    m != resources->count_crtcs - 1))
 						continue;
-- 
2.45.2

