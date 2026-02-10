Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC80E94626
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 00:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0418310E39D;
	Tue, 10 Feb 2026 00:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNX7jJit";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1F810E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 00:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770682251; x=1802218251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BOiz1/rDRslJoSJ2BzRzuqNjOpvhOiE0VqO9wFs2xTM=;
 b=cNX7jJit2ioUYHuY8sSnfEdBaJwMlRzkMuoFsujDYkge1JzaJsTE2Bqo
 lpNeGQGcFD5/261UTHWao1qh617XWf7u4uKtIlWXRCqM+lwmwTWkeHQuB
 OXAgZVhKMbBAc3AC0bBLQWy608dWXWYCl379/dq1F8eHT8Umv1HHkXJ6m
 X1VhqOTbi6E1hNPuUsZgJhRn7epEmMyR9wisgAR9YC+ZAP4lwrak9Enx7
 IMYmKy62gllNi2F9S4vhF/LIy7KhT5SsMHVVUyKPZTR4QXcAODY+bxBDK
 lNLoq4kZ+9H1epOCeYvRLuNZB6ZhJj7kBcD01jxsadRSrtsIRVefYLSuD w==;
X-CSE-ConnectionGUID: lTDeupL9Q/CPSSRTQWHFUg==
X-CSE-MsgGUID: BX6rnykMQhm8wlD+Ki7Dng==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89218513"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89218513"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 16:10:51 -0800
X-CSE-ConnectionGUID: QxWlIB41Tp2v+B9VUCc4kg==
X-CSE-MsgGUID: b+E/mwkaSFCtDLHJO3ppSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211762855"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 16:10:51 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/kms_flip: run suspend tests on one pipe
 per output
Date: Tue, 10 Feb 2026 01:10:25 +0100
Message-ID: <20260210001026.3923885-3-michal.grzelak@intel.com>
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

It is not necessary to test suspend on same output but different pipe.
In case of suspend tests, limit number of dynamic subtests run per
output when any pipe has already been tested.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 82d000fe5..c32d8c60b 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1846,6 +1846,10 @@ static void run_test(int duration, int flags)
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
+			/* Limit the execution to 1 CRTC (first) for suspend tests */
+			if ((flags & TEST_SUSPEND) && !all_pipes && n != 0)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
@@ -1878,6 +1882,10 @@ static void run_test(int duration, int flags)
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
+			/* Limit the execution to 1 CRTC (first) for suspend tests */
+			if ((flags & TEST_SUSPEND) && !all_pipes && n != 0)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
-- 
2.45.2

