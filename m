Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BF2CAC586
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 12:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE2610E512;
	Mon,  8 Sep 2025 12:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vxo6J0d4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEB110E20F
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757336103; x=1788872103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mktUa3Go4j8aGc9Tvewdr9ZGyfJGPLPxMwibrPrHTEo=;
 b=Vxo6J0d4MYtqp+VYQCveimSEx9fV77mPr6FfLMtmnXHJ2/c9edwHQ016
 XyiYSrRY7TgUlaM66xdMH1ujsJIjoa1Z3ypOqEoZG4D7/g5L4rlrfpxIn
 1o+t6HXbZAP7T5UHqPNDP3mXd0/JIs/XvrRRzhh4sz9xfBGWIcx2ZoR3c
 mp5zEFyqnIJfvBn2JpYaw2xKdv8XHF7BIgnf13hl79i2U/P/ygUrHxoqh
 U4p57ejKMXUSBAmhEawgMnKLKTJeItECoH3CzoVVtnNR5hQWVdkwBKlA9
 fXaYkvzvXvVRF1gk9ha+g+OPqPq3e1Jm5h7wVcaypZGFlk4YT+pjsWcJj w==;
X-CSE-ConnectionGUID: klz5LkRcT26F0NDzaTE5yw==
X-CSE-MsgGUID: EAfrPoA5TP6qrcmpJUzk1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70688724"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70688724"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:03 -0700
X-CSE-ConnectionGUID: MRTeY1IrSmGOVoO942Ui7A==
X-CSE-MsgGUID: RW7fbjETQ5mar5U/F9k9nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="177101501"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.208])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:55:03 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 1/4] tests/xe_eudebug_online: Add startup delay for
 set-breakpoint-sigint-debugger
Date: Mon,  8 Sep 2025 14:54:45 +0200
Message-Id: <20250908125448.13420-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add arbitrary delay to allow for uninterrupted startup before issuing
SIGINT.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 535f00818..6a7b8d8d7 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1564,7 +1564,8 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 	while (igt_seconds_elapsed(&ts) < 60) {
 		uint64_t event_count;
 
-		sleep_time = rand() % max_sleep_time;
+		/* XXX: Add arbitrary delay to allow for uninterrupted startup */
+		sleep_time = 20000 + rand() % (max_sleep_time - 20000);
 		igt_debug("Loop %d: SIGINT after %" PRIu64 " us\n", loop_count, sleep_time);
 
 		data = online_debug_data_create(hwe);
-- 
2.34.1

