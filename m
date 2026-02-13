Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5590AEF48F0
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 08:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F4210E7B1;
	Fri, 13 Feb 2026 08:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jqiyqlbb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D905410E0A6
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770972625; x=1802508625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B0B+m8xD7XCOvXM96BBg7b3Ftq0oAXnDTQdxI2qJttM=;
 b=JqiyqlbbnS8tIKVCwlEg6NQ466V4UDLB7+L535wZNLuuBltLdL5nF1vk
 GWGDITS6jyB/drR0dSkWyYcUFVlCvRw9dPzzQroyFK9BiRfBe5uSkqtNt
 TvB+P/ublHyBtIr/sdMTg8Vuy+INjL3hqtZZbdMzxYaFZgmtaCKodQlGf
 k3LiZQnb+E8+q5kzw7PGZDNsfYZr+u2zImOg9Ptjj3CV9TT8b5UbbLoCa
 tUPO4q5OXgTXrPM9iZvg0YeA8Z+Ge2FhhKJD5CMCtQN6Mm8kWiaoVaySb
 mmt2d1si/UV0h7TQeH8CFvQ+Uh7p2PhWaoEifsAGtg31LJzNrhyNt6qVy A==;
X-CSE-ConnectionGUID: ISL0GTEKSMeVB8aZqArI0g==
X-CSE-MsgGUID: PjPrZY+8Rh6jOqkW5IrGeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71181713"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="71181713"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:50:24 -0800
X-CSE-ConnectionGUID: kqMwjKj6RGqHCYEHB7ztNQ==
X-CSE-MsgGUID: XsgNBP86TTeyNX2zJwmeIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211774825"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 00:50:24 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 1/4] tests/kms_flip: test suspend on one pair of pipes
Date: Fri, 13 Feb 2026 09:49:27 +0100
Message-ID: <20260213084930.252273-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260213084930.252273-1-michal.grzelak@intel.com>
References: <20260213084930.252273-1-michal.grzelak@intel.com>
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
index 49a5f4ed1..8bda82627 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1918,6 +1918,12 @@ static void run_pair(int duration, int flags)
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
@@ -1963,8 +1969,8 @@ static void run_pair(int duration, int flags)
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

