Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DCDCAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 10:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA2110E7BD;
	Thu,  2 Oct 2025 10:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="loMaPvE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7391410E7BD
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759401906; x=1790937906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJwxJilkvsVMgj/Kv7JFzbP7DDN1KuQ6LSyfmNrdvPc=;
 b=loMaPvE0CM4xKztboZBi84EkkSR+d5cPmTvNqiiRs1dTNH9I/fCaf9S9
 cyYOxw1usfQNPaAPPlBmrSrucTGdZ7l3FhP2sUzUhCeS7YmFNS+w/uhZq
 bDTZG73cmzmagEEo+hccJ9XtUba0LAn0MhXalEd2Pgn6oCulnchLoNRZz
 Qd3+4GXDzgXME2Q3uYPbGRp/ShcvM20H2agksc0PpSTZZ3P/0xCw4Nfs4
 JbfToGFLSPW/dKtNUp0mINRr3FIysdZArzjJfLCsJVLsp860abZ1FmApO
 65O47WocgfZl0lmU4qR8Xrxf8o+pOA1tA+SbmoiUouDk7OZoYI5wb2Ful w==;
X-CSE-ConnectionGUID: awF9FwC0R8G+NrAIPtTaPg==
X-CSE-MsgGUID: 2PQVCiptRiirj7sJ6DbyUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60895249"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60895249"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:06 -0700
X-CSE-ConnectionGUID: Hmoroku+RaKsCH5MNv+aFg==
X-CSE-MsgGUID: rPiUaz7HSQWIBe2tXW8Ctw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="184213211"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.176])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 03:45:05 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v10 i-g-t 05/10] tests/xe_eudebug_online: Improve issuing
 SIGINT in set-breakpoint-sigint-debugger
Date: Thu,  2 Oct 2025 12:44:38 +0200
Message-Id: <20251002104443.7021-6-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
References: <20251002104443.7021-1-dominik.karol.piatkowski@intel.com>
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

