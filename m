Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CA3C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34DD10E7D5;
	Mon, 29 Jun 2026 09:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ztc3l6F7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A9D10E7CE
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782724566; x=1814260566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dtCh+ijP8cUWrMXWzOdajawj8xRB+o9KOeeHUkToqZ0=;
 b=Ztc3l6F7recWHb4257N7i3ELDCEgweXMWNvd7MJVJuiwcV7cNHjZ2STW
 DJy5LV6FFZM3qHFAjsFlTUQUIkJZpicOFfoO/yJsakmYCLZ6S+fIeilZ3
 IQx0GgZGcHIwqoF3qijpGtQ/EXixgrTinaHJ/gXOwcdV7NyZKKrJGsb5/
 P1+6EF5645Q/3kPgz152P3snkHOhioEOpvmnzGZp/FL9uHrVIVAbhwcaP
 pzwx6BN0XjA2Xphckyb/tAstb+9I7uwSouIi6iT9FXMmBDXDViUJPXm33
 YHg7essgmDqfr8+sp2fjHxZLDqX7fCKto1C9jOes12Vw4+irNyVqDsrMr g==;
X-CSE-ConnectionGUID: xVjcLgydRBuYPrDcDRXUGQ==
X-CSE-MsgGUID: 8cSNYfLoTUG9M/hmtt1G+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94894165"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94894165"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:16:06 -0700
X-CSE-ConnectionGUID: jvsaOpaHQ8ao/PNsLG7Bkw==
X-CSE-MsgGUID: tWCLakWFRCyh5619HxUr+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="247451962"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 02:16:05 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_frontbuffer_tracking: remove typos
Date: Mon, 29 Jun 2026 11:15:58 +0200
Message-ID: <20260629091559.2706720-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260629091559.2706720-1-michal.grzelak@intel.com>
References: <20260629091559.2706720-1-michal.grzelak@intel.com>
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

Cc: Juha-Pekka Heikkilä <juhapekka.heikkila@gmail.com>
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
index 37706cab58..d38c3969d0 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3845,7 +3845,7 @@ static void suspend_subtest(const struct test_mode *t)
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

