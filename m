Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E300CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 22:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C05F10E15E;
	Tue, 13 Oct 2026 22:26:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E68710E2C0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 22:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791930262; x=1823466262;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Vj9sbYMl/4q59Cqf1fu9Qw1Of9h9BBWg4cat/qc8FH8=;
 b=jC6d2v24GNLVEmqx97uYT7ruZSADyEA1jlQOohNCXl5zgUQlP+fb8Lm9
 uHDVMwzoagocRPZ6svp2D7EPSWG9WUpWtHZPhXFbIQ4eS2s2S5KL7eRNx
 vmYygKPS1Qzxfevmrkrw/6C4ZzpXWFyvLyG0F7v98yz+AzY5wf6ucHac4
 vGzeb3Knf57jYeXqNxkItnrmuEdt8w+LK1jXZ2iEEfHQgzYB8fhcCvksk
 0is5CoO44b/2sh8zd4vtZx+h//z1Yelo9DvgnOnucbgOrK4a/9wIcH2qP
 ChhFbRqZTC0Td5SpjI6ybeAhEIkPkCTwlvkVFyKsF8kXwd4rCttH4v53L w==;
X-CSE-ConnectionGUID: YQd64SKkRFuK145J2vcw9w==
X-CSE-MsgGUID: NwyRpKEfTceApkmVhWbmzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="566019"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="566019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:24:22 -0700
X-CSE-ConnectionGUID: y0SOFxrjTuKDMjRaozN+YQ==
X-CSE-MsgGUID: VVIhANFoS0OzsOAVYeFIIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1713177"
Received: from hanvin-mobl3.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 15:24:21 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 13 Oct 2026 19:23:35 -0300
Subject: [PATCH i-g-t v2 1/2] lib/igt_core: Check if helper proc was alive
 before kill()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-stop-pw-reserve-v2-1-58f268cb4f06@intel.com>
References: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
In-Reply-To: <20261013-stop-pw-reserve-v2-0-58f268cb4f06@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Daniel Charles <daniel.charles@intel.com>
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

v2:
  - Do not call kill() if the process is already dead. (Daniel)

Cc: Daniel Charles <daniel.charles@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 lib/igt_core.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 8ee9432923e6..c02fc5f96b86 100644
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
@@ -2670,17 +2663,21 @@ static bool helper_was_alive(struct igt_helper_process *proc,
 void igt_stop_helper(struct igt_helper_process *proc)
 {
 	int status;
+	int ret;
 
 	if (!proc->running) /* never even started */
 		return;
 
-	/* failure here means the pid is already dead and so waiting is safe */
-	kill(proc->pid, proc->use_SIGKILL ? SIGKILL : SIGTERM);
+	ret = waitpid(proc->pid, &status, WNOHANG);
 
-	status = igt_wait_helper(proc);
-	if (!helper_was_alive(proc, status))
+	if (ret == proc->pid)
 		igt_debug("Helper died too early with status=%d\n", status);
-	assert(helper_was_alive(proc, status));
+	else
+		kill(proc->pid, proc->use_SIGKILL ? SIGKILL : SIGTERM);
+
+	assert(ret == 0);
+
+	igt_wait_helper(proc);
 }
 
 static void children_exit_handler(int sig)

-- 
2.55.0

