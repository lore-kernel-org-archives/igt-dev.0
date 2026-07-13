Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A4CC43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 08:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5B010E5B3;
	Mon, 13 Jul 2026 08:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONtnwfBK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE14D10E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932967; x=1815468967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y48gaaVBVqk1vw3DaF/DHqMou4AxFTPYXukBgDfGh3Y=;
 b=ONtnwfBKKtw6lXBLYk7nQ7E1AZ4oQ/XPzdPEKrWPRV/aCgr01CHRadPJ
 1eNTZ/Gr/kapeOY/k0rp3faZ71ky1Uuea/el/AVzwBT2a94UGq0hVg27V
 fb1RBgssjhikoP3LkLt73VVzin8moxJlU9nTofaw9XpagCw9Sc6Xguvkp
 wyzEBjrZEaKzlsJEAHcc8vn3hEa3X14UJblmWsoepQcWGa0gewlX7pCoa
 J8Xhn0cl/fQnxIRCbltwvGQ6XdViEmMa7sQR/Ihyt+oYN40sPJj0jyTrE
 xTZnVLt+9dMiYNG/GplCFYGFGc8uZuYFNUTcUeVd/f5I5r3SthcvMYLg0 w==;
X-CSE-ConnectionGUID: 6pMSRx1yTMGyuir8w/u25w==
X-CSE-MsgGUID: /9hM5fRrQXyA4eDlhk1BTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081318"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081318"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:07 -0700
X-CSE-ConnectionGUID: XVUXCbEHToKBRuzdDH6i7Q==
X-CSE-MsgGUID: glEHBhKHTwOd18u5oFwMmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385836"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:05 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 01/16] lib/igt_aux: remove typos
Date: Mon, 13 Jul 2026 10:55:00 +0200
Message-ID: <20260713085515.463575-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260713085515.463575-1-michal.grzelak@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
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

Fix typos found in comments.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 lib/igt_aux.c                          | 2 +-
 tests/intel/kms_frontbuffer_tracking.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 0d250ae2fe..90efb8a135 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -978,7 +978,7 @@ static void igt_aux_enable_pm_suspend_dbg(int power_dir)
  *	  cycle
  *
  * Execute a system suspend cycle targeting the given @state optionally
- * completing the cycle at the given @test point and automaically wake up
+ * completing the cycle at the given @test point and automatically wake up
  * again. Waking up is either achieved using the RTC wake-up alarm for a full
  * suspend cycle or a kernel timer for a suspend test cycle. The kernel timer
  * delay for a test cycle can be configured by the suspend.pm_test_delay
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 3adf14bd70..f619f77e72 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3853,7 +3853,7 @@ static void suspend_subtest(const struct test_mode *t)
  *   Everything succeeds.
  *
  * FAILURES
- *   If you're getting wrong CRC calulations, then the hardware tracking might
+ *   If you're getting wrong CRC calculations, then the hardware tracking might
  *   be misconfigured and needs to be checked. If we're failing because FBC is
  *   disabled and the reason is that there's not enough stolen memory, then the
  *   Kernel might be calculating the amount of stolen memory needed based on the
-- 
2.45.2

