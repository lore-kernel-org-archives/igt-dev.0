Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0B8E73141
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 08:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BCE10E28C;
	Mon,  2 Feb 2026 08:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkp4Ck99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FAC10E28C
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770021003; x=1801557003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BSD9QCjz7oTDwmKvpAyHCFzz3CtGBDrjEaG7uhAKRhA=;
 b=jkp4Ck99an6r4IIgbwoK+o1LG26USM+3Of74LWmpVxtcvewhauWl/ahg
 sgslRvYsqjClBxR44gEjdoLyX1AsBNdp6LwzwhVz7egTKzKIbC54vwNs0
 JZKt6f2TjfotCLMCX9pDDQCf/ZaC5t7qvs6tU6+kzK4wpzxhlXatUpR7Q
 hPb/ZEq+XIDrgHAvuRBEOyOEgP9kMoA486jF2lIisDqUsvb4yn2XJWMIm
 d6X1nN4L3YBMaMkzE+ifeNBRty7oKoymwtA7lH/b/7sj33lSN0N5rqyAF
 SNr8EsDaRSasl3AQvWxBuDv2NpsI1bHEVo8m9hRQGmucTF/G0XA7aoya9 g==;
X-CSE-ConnectionGUID: TAF2Q35yRNe0rN1amMAVAw==
X-CSE-MsgGUID: IqONLLC1QpOuVMNfrlQXBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="88753685"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="88753685"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 00:30:03 -0800
X-CSE-ConnectionGUID: CuP/7e6CSq+lIPp4jNcTqQ==
X-CSE-MsgGUID: z0m3JKk9TuWL4a/1GiL0gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213922718"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2026 00:30:01 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [RESEND i-g-t v1] tests/kms_flip: test suspend on one pair of pipes
Date: Mon,  2 Feb 2026 09:27:00 +0100
Message-ID: <20260202082700.3194987-1-michal.grzelak@intel.com>
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

