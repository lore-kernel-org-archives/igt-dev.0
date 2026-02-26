Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B43FC590A
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 08:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667E810E16D;
	Thu, 26 Feb 2026 08:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0+G39Bx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D27510E0AA
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 08:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772094708; x=1803630708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B0B+m8xD7XCOvXM96BBg7b3Ftq0oAXnDTQdxI2qJttM=;
 b=R0+G39BxkaqO5d1R9CJMLla0JTlejwBtBhXQnI9FrFiqfWDyW/pOcu7Y
 b3J/IxyPVAFwJfQ1UDL865qGNl5XB+S0i0Ncqkh156t3lbrrWs53qPxzy
 0HtIB05ArKmDRVrfq7j/H3v5kax1XCpqkNL7IfRM/+O4XmXDilQ/DkIVc
 9wNIu33ui+CmtqxXyR3jKGitPTGfGv4bVgQ8QypvfFrwLJVI8WF+NQEwU
 k0HwiLQa7jeH4Lv+AiQQL0/JVZ+mNkiVUq/PQfiZj9ibto++RB1qEJRNW
 E4kGWvRXKCr6US399g8fpZ7fnKzDFZl+FUVFRIq05TdhN1Er7W8/cmInJ w==;
X-CSE-ConnectionGUID: l+6M//r7QWqXwk9m28SAcQ==
X-CSE-MsgGUID: qF5cEGCtT12zVzI+7cteCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72849654"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72849654"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:31:48 -0800
X-CSE-ConnectionGUID: 4PnorSQtSTWPxy+t5TZwAQ==
X-CSE-MsgGUID: BtiaRPiPQd+2Sj0eJ7sIhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214739985"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 00:31:47 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v7 1/6] tests/kms_flip: test suspend on one pair of pipes
Date: Thu, 26 Feb 2026 09:31:10 +0100
Message-ID: <20260226083115.1747856-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260226083115.1747856-1-michal.grzelak@intel.com>
References: <20260226083115.1747856-1-michal.grzelak@intel.com>
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

