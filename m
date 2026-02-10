Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96571E94627
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 00:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1D310E472;
	Tue, 10 Feb 2026 00:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYfrzUzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEBF10E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 00:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770682250; x=1802218250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/SLC+pDoeklGan/+tzJq37sszBNtrAa6BzZUYG0b93g=;
 b=FYfrzUzzryzzqNOFmzU+2KY07cT1mfCTZ1vZoC89kynyvajI96lYLno1
 moGga1D0i/mh8awM1Myq2a73XpXOt+40DoTXt5k/LhfmHpW6URwHsyRcK
 Gb+haHMOWb0Yxkzve9iWNrP0wQnhgdaJHzyXsa53Z9+ZRQcBjUX8jCnI6
 laRFnZEPx67wEqFlKKA+n8NK2FjAOj6lIyCHKzpETr5iBjSoQLL+rxmlf
 8DHE4fLeRKfp1314f83bVRIZfWoMQ45btcwI5BZI1wl/yU2KSQxRbWdue
 30PH+CYw+wjqfF7oAjOrUp0WngN1ZFxI+IO30XIe1vAHgnelrEsnJtzNz w==;
X-CSE-ConnectionGUID: pgr4ioeqRDmWDQlBX9D6WQ==
X-CSE-MsgGUID: oZecRPbKQg2QRkDmn2+IUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89218511"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89218511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 16:10:50 -0800
X-CSE-ConnectionGUID: 5DxPchI9Tdq0c7cQPaFU+A==
X-CSE-MsgGUID: WxH82iyzT2qXRzT4mQVFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211762846"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 16:10:49 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/kms_flip: test suspend on one pair of pipes
Date: Tue, 10 Feb 2026 01:10:24 +0100
Message-ID: <20260210001026.3923885-2-michal.grzelak@intel.com>
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

Currently, every pair of ({pipe1, pipe2}, {output1, output2}) is being
tested in 2x-* subtests. Since suspend shouldn't be tested per pipe, it
causes unnecessary overhead: with 4 pipes & 4 displays it runs up to 36
tests. Given that each suspend's dynamic subtest can take up to tens of
seconds, total duration of the test easily exceeds timeout.

When testing suspend, for each pair of outputs test only first and last
pipe unless it is said to run on all pipes.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index a74e69c6f..82d000fe5 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
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

