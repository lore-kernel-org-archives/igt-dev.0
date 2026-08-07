Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B107C5AD2B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6AE10E463;
	Fri,  7 Aug 2026 22:50:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4z53uzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A7410E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142871; x=1817678871;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0csxGPaRbs3KXgocvlSU4gStK8APVoFHnnaDEUjH3qQ=;
 b=C4z53uzzRgKnRb1na+dD44MIMw6Y8EiA1MmBmDg5nrX2e6HdmcTPalGl
 BlfjaifxQ8vm1rtFGbmG1vRlqjuhPL3hdppZvrJ6Aw6vCBSnl+N7ShdXp
 xZFLWPzskSpwCSKAWn/yv+uk/BZBBANNXuPuxMlykpNiGzvQZBGGQ+i86
 obQINK3yBpk2g7e8Ac7Ktc9yREYTfWpo9QRlHlZKYesyuOrQFk4vZCuM7
 ZHh1mRzPkODq1w98GOMWk4auXUshrIYhuqz/mU9Ca2GxEAdElQtjdhWEh
 DReZtXdorFgut2jtdZxCa5W8z3Shbk8nvdXyY0V4eDRR89OThGMUyXRB+ g==;
X-CSE-ConnectionGUID: aJRE5WfNT2mWkiPANBV+5A==
X-CSE-MsgGUID: wsb1Bt0NSR+YnZIK41b1Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835796"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835796"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:47:51 -0700
X-CSE-ConnectionGUID: jodFAFRVR5ea5OaaO0vilg==
X-CSE-MsgGUID: 6XJMg/NNSySjNCaIZgxZ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655397"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:47:50 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 01/16] lib/igt_aux: remove typos
Date: Sat,  8 Aug 2026 00:47:31 +0200
Message-ID: <20260807224746.3554064-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260807224746.3554064-1-michal.grzelak@intel.com>
References: <20260807224746.3554064-1-michal.grzelak@intel.com>
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
index 5946446320..c2130d76a2 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -3824,7 +3824,7 @@ static void suspend_subtest(const struct test_mode *t)
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

