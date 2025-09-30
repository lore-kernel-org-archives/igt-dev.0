Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D425DCCA470
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:42:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A04410E563;
	Tue, 30 Sep 2025 10:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HSUGaYgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F09310E563
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759228950; x=1790764950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJwxJilkvsVMgj/Kv7JFzbP7DDN1KuQ6LSyfmNrdvPc=;
 b=HSUGaYggJkHQUoWEeljU88qpN5nm+UgYjEpV+zZi5mvnuciSWyccUYhc
 RIMb/9l5qOud09d0vFg20GFyCRU3PQ+3S6kNMO0r3O8iTY/6yBrfjPb08
 vQZM/RX//8SAXRPxuN3t3DQA41Ob5QCMXLmc3PFwC9/M/MhdL/LuxKRSZ
 XCZTs6TNYY3JxtqRT5sXpyjwz8MQ2QA3/idcg374TcZn929WY9lb0ClXT
 AFtq76V0HIP0SoiSnn2PFuENBUzUJ4KHmmpmvZzHnMbHniEU48yxGBdLN
 XBk17KGHmzkBEgtQIF65/wAKELJgjzTMtTq/B9qYz1gpuEQIvk4+VzOAy g==;
X-CSE-ConnectionGUID: dKaybK8KTBewdvsHPb7lJA==
X-CSE-MsgGUID: KsBBaSBMRKGhonO9ByIpWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61371493"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61371493"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:30 -0700
X-CSE-ConnectionGUID: eVKeMnHQRN+ypUPCGh0K0A==
X-CSE-MsgGUID: /Pm6H7qjT02Y83dvoDxvMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178446593"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:29 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v8 i-g-t 5/9] tests/xe_eudebug_online: Improve issuing SIGINT
 in set-breakpoint-sigint-debugger
Date: Tue, 30 Sep 2025 12:42:05 +0200
Message-Id: <20250930104209.22462-6-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
References: <20250930104209.22462-1-dominik.karol.piatkowski@intel.com>
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

Use xe_eudebug_debugger_kill instead of pthread_kill to allow proper
handling of signals inside debugger thread.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index aa58e5f99..30e661b13 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1600,7 +1600,7 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
 		else if (event_count > 0 && event_count < events_max)
 			sigints_during_test++;
 
-		igt_assert_eq(pthread_kill(s->debugger->worker_thread, SIGINT), 0);
+		xe_eudebug_debugger_kill(s->debugger, SIGINT);
 		close(s->debugger->fd);
 
 		igt_assert_eq(READ_ONCE(s->debugger->worker_state), DEBUGGER_WORKER_ACTIVE);
-- 
2.34.1

