Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F16C5DF87
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 12:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D38E10E2A0;
	Fri, 21 Aug 2026 12:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCq+33Vj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCEC10E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316520; x=1818852520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A4ezVAYFcNIGNODeEoZYn34e0MWddIaDiEMfNH6brnI=;
 b=PCq+33VjvHHdhLU9pD7fUE2Grlg/KVChQrHUPR8GHVDF9gm57jt2sk49
 UwMVl5hOXPm7nQAEhlAcdjvTvGRM1J9L3uyP8lBMNfNrfBtAlVknikzLG
 S2rlgyPPvIac0Olk2CaGxEKzGRuz81lu9fP91AGySiAJ2Gy5IXLZi36Ex
 QFZaHbXhnPwkPL57pFVEmBEfx4t1AeiEkDSTCZQcxIrfq63IVp7t6xdhk
 lmacOlK8HbY2Ji/XyRgWRXDtAQwKMIW8NccTQ9a7o8IErz5KQYf8Xj6UV
 JOQztubriAWdJuUTJac/t+fVk2RTsDjH0SCsiwq958A9xPz2Vpe7/XCos Q==;
X-CSE-ConnectionGUID: ku+4Tm8gSPa4VbxGxhHYkA==
X-CSE-MsgGUID: mLeqI8unSNKP1nFNO89sYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632904"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632904"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:48:40 -0700
X-CSE-ConnectionGUID: E9se0daXSgKtZ6fg3ML/2w==
X-CSE-MsgGUID: coJ5u2R/RqeevNWUA3nA6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188335"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:48:38 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 01/17] lib/igt_aux: remove typos
Date: Fri, 21 Aug 2026 14:48:18 +0200
Message-ID: <20260821124834.1974029-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821124834.1974029-1-michal.grzelak@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
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
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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
index 4dd2f4e70f..dd7d3188fe 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3844,7 +3844,7 @@ static void suspend_subtest(const struct test_mode *t)
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

