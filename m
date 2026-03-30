Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE57FF4958
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50A510E3EA;
	Mon, 30 Mar 2026 07:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXwnm0aN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC8510E3FC
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774857314; x=1806393314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6tBThaoGxi6ZQ5FS0n0Y0aISSWYW6ZVP980QVjbz50s=;
 b=SXwnm0aNy0/yIVjctFm/T/Rbu9qmGARO3FlaHwLDCK/W3wG2tqgkTI+x
 yq6TFzeD0t2+XTElapk4DCfIzd8D+olxbmGnCxI44l161fehrppsVwPEE
 2GtxhaSmmIK2/Hf5oxyQejjI+qQ4i+oifWKKwn/6ksca0c+2rUj1mmCA8
 xvcYQmW4Cadg/Z1UC9DYfNXcFDbrqNWlAv0Xphcix8Y806hm4ahrv+y8j
 7vdSjC1hVsTc7GjPEJVw6dEFKs2v/5L4TaYJh55J5RIXB7dgwFlCAoTpb
 S+hEymjJaML+CdQJd4fbKl3+xb+8mXzDqTccd+PKaKlqaNCnayot7YZn3 g==;
X-CSE-ConnectionGUID: u3ujpRPPTiqwQuRhA56IKA==
X-CSE-MsgGUID: lXGIwL+HQqWLK9pEnu7r5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75729064"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75729064"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:55:13 -0700
X-CSE-ConnectionGUID: APUddT+xRSyEb0LsBUwMuQ==
X-CSE-MsgGUID: Hwg5jyjgSxCW8JTe6OEoCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="227595609"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 00:55:12 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v9 1/6] tests/kms_flip: test suspend on one pair of pipes
Date: Mon, 30 Mar 2026 09:55:03 +0200
Message-ID: <20260330075508.1003899-2-michal.grzelak@intel.com>
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

Currently, every pair of ({pipe1, pipe2}, {output1, output2}) is being
tested in 2x-* subtests. Since suspend shouldn't be tested per pipe, it
causes unnecessary overhead: with 4 pipes & 4 displays it runs up to 36
tests. Given that each suspend's dynamic subtest can take up to tens of
seconds, total duration of the test easily exceeds timeout.

When testing suspend, for each pair of outputs test only first and last
pipe unless it is said to run on all pipes.

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 518543ce9a..7d2143889e 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1922,6 +1922,12 @@ static void run_pair(int duration, int flags)
 		for (n = 0; n < resources->count_crtcs; n++) {
 			for (j = i + 1; j < resources->count_connectors; j++) {
 				for (m = n + 1; m < resources->count_crtcs; m++) {
+					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
+					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
+					    ((n != 0 && n != resources->count_crtcs) ||
+					    m != resources->count_crtcs - 1))
+						continue;
+
 					memset(&o, 0, sizeof(o));
 					o.count = 2;
 					o._connector[0] = resources->connectors[i];
@@ -1967,8 +1973,8 @@ static void run_pair(int duration, int flags)
 					crtc_idxs[0] = n;
 					crtc_idxs[1] = m;
 
-					/* Limit the execution to 2 CRTCs (first & last) for hang tests */
-					if ((flags & TEST_HANG) && !all_crtcs &&
+					/* Limit the execution to 2 CRTCs (first & last) for hang and suspend tests */
+					if (((flags & TEST_HANG) || (flags & TEST_SUSPEND)) && !all_crtcs &&
 					    ((n != 0 && n != resources->count_crtcs) ||
 					    m != resources->count_crtcs - 1))
 						continue;
-- 
2.45.2

