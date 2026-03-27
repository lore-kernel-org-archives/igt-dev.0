Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E681010ED65C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 12:15:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7AF10EDF8;
	Fri, 27 Mar 2026 12:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+1vQt5/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CCD10EDE9
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 12:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774613716; x=1806149716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3tZca2Ntj6mDfUmiP0xExmtppFDkyqtoN8WYsInyFZU=;
 b=i+1vQt5/qERIvK/DZQRq55Rg2Nvf6SeIuwTX5L+C1NxkL0aS9l3ko4AI
 Fy+ua4Sve4g69+HLNBsLwm0275VoJS4iEUbSZfu68FjASANq6qdrjOt6h
 E5CI9UWIIMblh6JATI5lVTMDGOpydKExAccIeWx/hQOjt5iDUN4bFWsAb
 vBvgPl+ogQrjJIqUDuPo1OkUV7apNNOqHyvEaLLCEmt8Ovq4ggXvEJkm6
 i1aTYbG0xr7tlx3mtKvbVlHDxnPj6Z0+0IAF3RjYl7vEO/Ojk+AIw7yrJ
 j/V/pp+YS2/kBIZuJJfQzSQa1ug3SY9AP7gh5RcMJAvvLxZJ3OoVrZ7PH Q==;
X-CSE-ConnectionGUID: /VjvwZRhTl66NxwcAaa19Q==
X-CSE-MsgGUID: j9zmg187SrSjsZban7WsWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75752682"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75752682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 05:15:16 -0700
X-CSE-ConnectionGUID: MoT6m3DlTHyn1L7kBonDjQ==
X-CSE-MsgGUID: +UtxOvGGTBCX8HG7KTnZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="255794154"
Received: from intel.igk.intel.com ([10.211.135.221])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 05:15:15 -0700
From: Piotr Rudnicki <piotr.rudnicki@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Piotr Rudnicki <piotr.rudnicki@intel.com>
Subject: [PATCH i-g-t 2/2] lib/xe/eudebug: pass debugger log into client
 wait-done path
Date: Fri, 27 Mar 2026 13:10:42 +0100
Message-ID: <20260327121042.1133617-3-piotr.rudnicki@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327121042.1133617-1-piotr.rudnicki@intel.com>
References: <20260327121042.1133617-1-piotr.rudnicki@intel.com>
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

Refactor xe_eudebug_client_wait_done() to allow passing the debugger
event log, enabling dead-peer context logging (added in previous commit)
to report debugger state when client termination fails. Use the internal
variant in xe_eudebug_session_run() where debugger context is available.

Signed-off-by: Piotr Rudnicki <piotr.rudnicki@intel.com>
---
 lib/xe/xe_eudebug.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index b80d9bebd..bbd1c99bf 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -1764,6 +1764,16 @@ void xe_eudebug_client_start(struct xe_eudebug_client *c)
 	token_signal(c->p_in, CLIENT_RUN, c->pid);
 }
 
+static void __xe_eudebug_client_wait_done(struct xe_eudebug_client *c,
+					  struct xe_eudebug_event_log *debugger_log)
+{
+	if (!c->done) {
+		c->seqno = wait_from_client(c, debugger_log, CLIENT_FINI);
+		event_log_read_from_fd(c->log, c->p_out[0]);
+		c->done = 1;
+	}
+}
+
 /**
  * xe_eudebug_client_wait_done:
  * @c: pointer to xe_eudebug_client structure
@@ -1773,11 +1783,7 @@ void xe_eudebug_client_start(struct xe_eudebug_client *c)
  */
 void xe_eudebug_client_wait_done(struct xe_eudebug_client *c)
 {
-	if (!c->done) {
-		c->seqno = wait_from_client(c, NULL, CLIENT_FINI);
-		event_log_read_from_fd(c->log, c->p_out[0]);
-		c->done = 1;
-	}
+	__xe_eudebug_client_wait_done(c, NULL);
 }
 
 /**
@@ -1867,7 +1873,7 @@ void xe_eudebug_session_run(struct xe_eudebug_session *s)
 	xe_eudebug_debugger_start_worker(debugger);
 
 	xe_eudebug_client_start(client);
-	xe_eudebug_client_wait_done(client);
+	__xe_eudebug_client_wait_done(client, debugger->log);
 
 	xe_eudebug_debugger_stop_worker(debugger);
 
-- 
2.43.0

