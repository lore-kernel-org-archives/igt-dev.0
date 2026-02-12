Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFAAEB4905
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 11:10:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8F510E725;
	Thu, 12 Feb 2026 11:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxMJHwFj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA5E10E724
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 11:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770894640; x=1802430640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BOiz1/rDRslJoSJ2BzRzuqNjOpvhOiE0VqO9wFs2xTM=;
 b=NxMJHwFjPXE0ZGAgHZO+pUVqe8wn+VtyD6MwEqxzwzGlkKMOLCdOTCwV
 vyktXDgqDHnfZTrr61yaPI55zNlV2WpdRblqJehVxRNepF34pFKj5hGZf
 ogAvAeJiGM0qawGHiA29co9j/M3bwWTwCi6DK58nP9s61CFh+XLiXuf3K
 3DnAOQalEIUspzBQKR+QefX+YZImWMbtEpAmTmdZQrGyczRJgVxNQCFAp
 LlfCKH+l2383yK58Qp0dBqqS6BC7+NKyOPeVdLfsB61Zxmhk/Yjx4T6/C
 xLiwIoKCqvSVuK6RE5VX14PJ7U9aSkWmj/dG9kduQern0FfsXpk31Vx7I w==;
X-CSE-ConnectionGUID: xlSRUMJbRA2ld5LF7NxwAA==
X-CSE-MsgGUID: RZYNxwB+SeeOZb0A7bWHKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="75907662"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="75907662"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 03:10:40 -0800
X-CSE-ConnectionGUID: KarJZS+QSLC9s+GT/bQMjw==
X-CSE-MsgGUID: iFS8WX0xQkyZocOM1KLjTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="212674318"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP; 12 Feb 2026 03:10:39 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 2/4] tests/kms_flip: run suspend tests on one pipe
 per output
Date: Thu, 12 Feb 2026 12:10:20 +0100
Message-ID: <20260212111023.189261-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260212111023.189261-1-michal.grzelak@intel.com>
References: <20260212111023.189261-1-michal.grzelak@intel.com>
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

