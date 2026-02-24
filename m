Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E43EE9B258
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65910E585;
	Tue, 24 Feb 2026 13:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1+xLkUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0589B10E585
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771939984; x=1803475984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VhPWtLX2OPLYmmFI0TUYu/vKLf1uUnuf3gT8MgZeP4k=;
 b=B1+xLkUVWWEgDGVykeSD6T5LzbX/ThSbtvtMFOAnSNyozGeefOmEaM1e
 i3EwmyXofGD6eQ5a98vl0fHx1d8bT32Q9RFwpahogzx1kqqmHCbAbypyK
 ThkNNl7VzqIw8R3uOtmw1tVgWa7pu+q5kUloLI//737JVCwsQ7PoeVm8i
 swpPNzAfpUzUjklhJU6iJJXbr1CpvEg6V/Cc5DP+TPBO4YPOjZg8Ws0yB
 i+sSC4ejP0JG2LQJWL6nny7Vszd7D3zBsTejShUrcdgQp+d60Wr7CYsjX
 je/h9yE67OhFiBQ9VjfsseBtbs57HPD5NLQbBBowhLFfaxY/JPv+QpN31 A==;
X-CSE-ConnectionGUID: HPOprnVuSCSDL8hC+cdJuA==
X-CSE-MsgGUID: 6EQHaYuQQc2ewNdFsA8bFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84410063"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84410063"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:33:04 -0800
X-CSE-ConnectionGUID: hg6jx4XjT9+yzWysxeyGQg==
X-CSE-MsgGUID: LZoM/kW1Tiq7sFXXSNJuUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246476852"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 05:33:04 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t 6/6] tests/kms_flip: test suspend at most twice on SNB
Date: Tue, 24 Feb 2026 14:32:42 +0100
Message-ID: <20260224133242.1678232-7-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260224133242.1678232-1-michal.grzelak@intel.com>
References: <20260224133242.1678232-1-michal.grzelak@intel.com>
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
 tests/kms_flip.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 5b3c31ff5..b07113586 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1346,6 +1346,9 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 		if (count && (gettime_us() - start) / 1000 >= duration_ms)
 			break;
 
+		if (count && IS_SANDYBRIDGE(devid) && o->flags & TEST_SUSPEND)
+			break;
+
 		count++;
 	}
 
-- 
2.45.2

