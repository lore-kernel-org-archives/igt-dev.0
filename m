Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B97CA1009
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 12:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C364210E6AE;
	Tue,  2 Sep 2025 12:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JruNKCCe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346B010E6B0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756816357; x=1788352357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mktUa3Go4j8aGc9Tvewdr9ZGyfJGPLPxMwibrPrHTEo=;
 b=JruNKCCe+hz6N7O5AE+OS3yhJcJQfCZXuyxaq56QRwxt70oy5nmm1kHz
 3Lr/UKNzjJNTTQm2obAkgBMCYLwfKs8S4Wk5jArvihWhoQGAa9ATRJePC
 WeutapZDe3kOvgdKiivy+Vm440XN4+8z5iygQRuCSHWheWh/sCD0nYx0C
 jDQjXlVDk9JESHnOa+KKqGFW3mT5UTbiuLwSkVJ9NJzyuY3nlQMRtc10u
 pphgmsBJPBVbReXnWul6tJUKqz/xzXrCT6FcpUdy24KK3NsFCergFeW1W
 WF0Vmhj+NBqPl47b0/Oq9mDP7l2K3w5btn9xBZIaKJxmVM9zkzK9thwLd g==;
X-CSE-ConnectionGUID: 1nR4Z7DpSgyXpMPLDZgSgQ==
X-CSE-MsgGUID: q0m06SgGSXKaJYt8IBbl1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="70517415"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="70517415"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:37 -0700
X-CSE-ConnectionGUID: 2spO8ftvRCSR2BhV4Mpyog==
X-CSE-MsgGUID: qfreBmVWRmWSSAZAm3h2CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="171153324"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 05:32:33 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 3/7] tests/xe_eudebug_online: Add startup delay for
 set-breakpoint-sigint-debugger
Date: Tue,  2 Sep 2025 14:31:59 +0200
Message-Id: <20250902123203.4907-4-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
References: <20250902123203.4907-1-dominik.karol.piatkowski@intel.com>
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

