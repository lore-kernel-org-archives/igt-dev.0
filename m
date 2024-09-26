Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC81CCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 10:50:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D94910E050;
	Thu, 26 Sep 2024 10:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TysPMdot";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CAD10E050
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 10:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727347802; x=1758883802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AKxXK2k8Ghz2IkPCJ4OfotwJMgVjIRchnR98CAEZ7w0=;
 b=TysPMdotXdGcyQEwe/w5Z+xNA/Vc0r/aVGiHnJFyrbNxaW5AB9U80je4
 BBsz4yEhBoFCwQKV88nePxfEchl6F9w7ZHT2wCqHtdTI0AlWhYBhoDaiQ
 6lhHJimc62P0t2MlebIuOb41lIuurR9NY2Mi5cCy5ljy9v8iiXFW5k1I8
 NJldqm0i9fbemPkEwDrqbPD9GMbi79FsuadjwBjxLJieY1eTtNmp2zxWP
 gwx9Tlebv5XX9IZgdAlDeJW1EB+ZVxKI4YltI3ZfHEjIr4a4wIYXQ7pSo
 iFpWrWO5BF/erjtr032UyGIsgdcR/KKEu8rlDFt3rXPmcUYmA0oBKJT6+ w==;
X-CSE-ConnectionGUID: /nbD0XNJTayR7iMSdsm7jQ==
X-CSE-MsgGUID: hMdsWBEBQSeidfXTP2uRaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48963136"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="48963136"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:50:02 -0700
X-CSE-ConnectionGUID: oWw6cSUrSmePk+TvG8TEZg==
X-CSE-MsgGUID: OKN0iQg+T9e/4icO09St1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="72909312"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 03:50:01 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 2/3] tests/xe_eudebug: Detect thread starvation on
 discovery
Date: Thu, 26 Sep 2024 13:39:38 +0300
Message-Id: <20240926103939.550907-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926103939.550907-1-mika.kuoppala@linux.intel.com>
References: <20240926103939.550907-1-mika.kuoppala@linux.intel.com>
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
---
 tests/intel/xe_eudebug.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index a2b2f3596..bf560462e 100644
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
+			 * sure we get atleast one event before stopping.
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

