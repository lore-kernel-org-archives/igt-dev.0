Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE00FC590A
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 08:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E8A10E179;
	Thu, 26 Feb 2026 08:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMqt07fb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7864F10E179
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772094718; x=1803630718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIBhf2THKIz41o2e9/NI/ngkOCCjffMcK8eVAoGZ2sk=;
 b=AMqt07fbDmnVYX+59OfiFCh6hZ8ZKn6Ghl9kP5TLadVWE9K6CmD+ackR
 d37J+A6H7mGcEO74/BYn7TcDQMpzUul2VOtJ2Ay41el794JQI27J4bfGn
 EoWOOTHl22YrK2cuoIwf6yCZPphiW43WLMM1P7ndwieZ0z4Ma+fv2KCUm
 dX3FYpelGLTOKBhMZWbYnV5wsgdMiwzgefaS9ef9YZ3IXlvh6MBQsq7sd
 xlsjSs11Hq1zKUx9+xFTqa+PjEnZCZb2hRuzaOublzqV1nlwHnE7JClKg
 1kJSXXwLGhQ960s57sELGboGR39SVz2ZwfcvI4b2f6k+EmCILGtSe4PpQ Q==;
X-CSE-ConnectionGUID: o/Z6M4vIQ26bKccSpnTqdA==
X-CSE-MsgGUID: 1Z4PbKrVTvKHQajJ5pCU/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72849674"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72849674"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:31:58 -0800
X-CSE-ConnectionGUID: MLD/q/EcTwuAtFJbeGhQNw==
X-CSE-MsgGUID: lhxzP5rTTb2bHP5b3VMx2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214740045"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 00:31:53 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v7 6/6] tests/kms_flip: test suspend at most twice on SNB
Date: Thu, 26 Feb 2026 09:31:15 +0100
Message-ID: <20260226083115.1747856-7-michal.grzelak@intel.com>
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

When SNB suspends, so does gettime_us(). This results in too many sleeps
before we hit the duration_ms. Break the loop on second execution.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index f17d027cc..f02e9b7cf 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1322,6 +1322,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 {
 	unsigned long start, end;
 	int count = 0;
+	int devid;
+
+	devid = intel_get_drm_devid(drm_fd);
 
 	start = gettime_us();
 
@@ -1342,6 +1345,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 		if (count && (gettime_us() - start) / 1000 >= duration_ms)
 			break;
 
+		if (count && IS_SANDYBRIDGE(devid) && o->flags & TEST_SUSPEND)
+			break;
+
 		count++;
 	}
 
-- 
2.45.2

