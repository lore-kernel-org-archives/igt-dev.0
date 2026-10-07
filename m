Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A83CA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 14:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C15A10E605;
	Wed,  7 Oct 2026 14:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MRIgh+b5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB0810E29C
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791382652; x=1822918652;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=msyxsvsF+0DWI5F7f6qJLXlt6MreDsz7Mnh+sO0R3fw=;
 b=MRIgh+b5Jgk6L/zgXr++jR9uZQv8GyqwPEvioQ31VJKUueELNDIRqhMk
 rGYM1rHlxjZYKE/ckD8KEYIZMC6PzqkTAAke1IZ56TAPepD3UJ0gNifsO
 SXUVVxdVhQCgfg7VFUI+VidYlIbFP0cnF7m2PR72N+ouYil6DeUK52CQc
 bnUUZoZN7EjZZC9FBCHtCGT35wPnYkNLWdYjOuI4pFuswOoyiivSao09h
 Qw+vM2i+1sBgDeIqP45OjLBJQGajrNylsz6jyjXAYVcRNPRYVAB1qPsoq
 Cj7zRZN+r3ARuWKLA0JcBDktO0XekjIXf23c8iylHkYQbgQvM+OAAwWRm g==;
X-CSE-ConnectionGUID: pJKhM4cwTZuJG9wgNPL9tw==
X-CSE-MsgGUID: /d2bCp91T7OmONSqCWx66Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="32049"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="32049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:17:31 -0700
X-CSE-ConnectionGUID: bQtznatbSQqmbstSSYeJrg==
X-CSE-MsgGUID: /LUY9i5NRFexcDni9Hlu7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="275233289"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 07:17:30 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 07 Oct 2026 11:16:26 -0300
Subject: [PATCH i-g-t 1/2] lib/igt_core: Check if helper proc was alive
 before kill()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-stop-pw-reserve-v1-1-abbd3b879612@intel.com>
References: <20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com>
In-Reply-To: <20261007-stop-pw-reserve-v1-0-abbd3b879612@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The function igt_stop_helper() does a sanity check by verifying if the
helper process died "too early", however it does that by checking if
it was terminated due to not handling the signal used in the kill()
call.

That logic has a flaw though: it the helper process gracefully handles
the signal sent by kill() and exits normally, igt_stop_helper() will
mistakenly take that as dying too early, because WIFSIGNALED(status)
will be false.

That's the case with the pw-reserve process: in an upcoming change we
will change pipewire_reserve_wait() to call it with execlp().  Because
it handles SIGTERM and exits normally, a warning and assertion failure
would happen with the current logic.

Fix that by checking if the process was alive before calling kill().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/igt_core.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 8ee9432923e6..d9949ea131f8 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2652,13 +2652,6 @@ int igt_wait_helper(struct igt_helper_process *proc)
 	return status;
 }
 
-static bool helper_was_alive(struct igt_helper_process *proc,
-			     int status)
-{
-	return (WIFSIGNALED(status) &&
-		WTERMSIG(status) == (proc->use_SIGKILL ? SIGKILL : SIGTERM));
-}
-
 /**
  * igt_stop_helper:
  * @proc: #igt_helper_process structure
@@ -2670,17 +2663,22 @@ static bool helper_was_alive(struct igt_helper_process *proc,
 void igt_stop_helper(struct igt_helper_process *proc)
 {
 	int status;
+	int ret;
 
 	if (!proc->running) /* never even started */
 		return;
 
+	ret = waitpid(proc->pid, &status, WNOHANG);
+
+	if (ret == proc->pid)
+		igt_debug("Helper died too early with status=%d\n", status);
+
 	/* failure here means the pid is already dead and so waiting is safe */
 	kill(proc->pid, proc->use_SIGKILL ? SIGKILL : SIGTERM);
 
-	status = igt_wait_helper(proc);
-	if (!helper_was_alive(proc, status))
-		igt_debug("Helper died too early with status=%d\n", status);
-	assert(helper_was_alive(proc, status));
+	assert(ret == 0);
+
+	igt_wait_helper(proc);
 }
 
 static void children_exit_handler(int sig)

-- 
2.55.0

