Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7BFCDD1B3
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 14:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4350410EC5F;
	Fri, 27 Sep 2024 14:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TePkIn17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24FA10EC53
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727445836; x=1758981836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lNooj2kRl+HglRPcQ7UOqt1AfVJ+aTkKTPOWkZte5e8=;
 b=TePkIn17Lwi4J3c4Kkk/YFUCOboaHAZ6Zq/qSgd6R73LNhkSreKrrq6Q
 lgE4mvBenzT3h/DFPxIdSC3ziO23hKc3GLMfjPkCddGyI54a147rMdLwv
 CxekPYjvK9dX7w+ZY6dmdZ7o6pLdGVZ93jxsqAkUGoOhOBVKY3CIHIBbg
 ZsFY80yTU3sPmrqAU8RrX44SUQhmRIaZ5BjW/W15VjfmNPCX787uVg9HY
 wWrfyormXm0R3MpLX22fP/udqtx7l3v8m2MqNzKxeACvuAIDBYdlrCCvC
 exLvVEQmhP1JO2wpKB1J5sUucxdKBS6UcLeo5LFylR+bmhGZT4UOTLvG0 w==;
X-CSE-ConnectionGUID: tUJsSlKkTaSBwsIDtn07Xg==
X-CSE-MsgGUID: o7coG8v7ST+tKrBtWFrLeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30480486"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="30480486"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:03:56 -0700
X-CSE-ConnectionGUID: FeXKVa/lQ5Sd+E2+5DQNUQ==
X-CSE-MsgGUID: UkbLlLjLTw+heLn8l3zW7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72203112"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 07:03:54 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 2/4] tests/xe_eudebug: Detect thread starvation on
 discovery
Date: Fri, 27 Sep 2024 16:53:33 +0300
Message-Id: <20240927135335.1107326-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240927135335.1107326-1-mika.kuoppala@linux.intel.com>
References: <20240927135335.1107326-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
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

Discovery tests spawns multiple clients and multiple
debuggers and sometimes, especially with kernel debugs on,
some thread really can starve more than one second.

Add a check that we dont start to assert missing
resources if we didn't get any.

Another option would be to just skip starved thread
checks and assert that some of the threads succeeded.
But lets try this as a stopgap measure before giving
up.

Increase worker time until we see an event.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 1c90fd16a..8d45d59f3 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -1107,11 +1107,24 @@ static void *discovery_race_thread(void *data)
 
 		if (random() % 2) {
 			struct drm_xe_eudebug_event *e = NULL;
+			int max_worker_waits = 30;
 			int i = -1;
 
 			xe_eudebug_debugger_start_worker(s->debugger);
-			sleep(1);
+
+			/*
+			 * Thread can starve for more than one second. Make
+			 * sure we get at least one event before stopping.
+			 */
+			do
+				sleep(1);
+			while (!READ_ONCE(s->debugger->event_count) &&
+			       --max_worker_waits);
+
+			igt_assert(READ_ONCE(s->debugger->event_count));
+
 			xe_eudebug_debugger_stop_worker(s->debugger, 1);
+
 			igt_debug("Resources discovered: %lu\n", s->debugger->event_count);
 
 			xe_eudebug_for_each_event(e, s->debugger->log) {
-- 
2.34.1

