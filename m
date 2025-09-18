Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9CFCAC5A0
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 12:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60AC10E899;
	Thu, 18 Sep 2025 12:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gx7ZMdmV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1051810E7CA
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758198856; x=1789734856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bD/G0VIGbKp/oWwEBYQlGsjowAQuts4HuI16oR9p34c=;
 b=gx7ZMdmVJk1kWn/hYEK5hVf4xfwUZJ88ZoPloXxoeXZGb3wyXjU54uT4
 A8ONblkKOpJibR1u96A1qB+qlI7+db6j2hE/45H3u61JSdG053HFizTbE
 dhF2XF1B6bgOGWXtuzHeSfRjAZzwVoFCAaXe0dKG97d8YZ2dSsDtTr+b8
 30uQ2WQsAZHjl3+iKsEzvEecwmGnPyzXhUv+EdapH1NgW2N1SxRTcusWv
 mdbHfo7orTIFzw5kqqDwpIDCjyWO6oVCrnLrHgFu0jRSRFtBOkPwd7fa3
 ZkrVXRDm9nLa6xv39wX3DW+kxfRyKdYDPP0AoXPReIHNNmyG6oHKxu1Zr Q==;
X-CSE-ConnectionGUID: qRypknhGQzGt0AlZR3QDlQ==
X-CSE-MsgGUID: 1s4l3qlNSt26nY35mgWjZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="85966200"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="85966200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:16 -0700
X-CSE-ConnectionGUID: orUloMosSp+4+S9N6NdluQ==
X-CSE-MsgGUID: cQSIjkWjSgy0y7s9lbrVFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="176328162"
Received: from rvuia-mobl.ger.corp.intel.com (HELO dpiatkow-mobl1.mshome.net)
 ([10.245.244.174])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 05:34:14 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v3 i-g-t 2/5] lib/xe_eudebug: Don't fail in __wait_token if
 pipe was broken
Date: Thu, 18 Sep 2025 14:33:58 +0200
Message-Id: <20250918123401.5433-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
References: <20250918123401.5433-1-dominik.karol.piatkowski@intel.com>
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

If safe_pipe_read returns -EPIPE, print it and let the upper layer
decide if this is acceptable. This will allow for debugging if something
goes wrong, while reducing the false tripping of tests in which a dead
client can occur.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/xe/xe_eudebug.c | 25 +++++++++++++++++++++++--
 lib/xe/xe_eudebug.h |  2 ++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 8e5664496..deaea25cd 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -296,12 +296,18 @@ static void pipe_close(int pipe[2])
 		close(pipe[1]);
 }
 
+#define DEAD_CLIENT 0xccccdead
+
 static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 {
 	uint64_t in;
 	int ret;
 
 	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
+	if (ret == -EPIPE) {
+		igt_info("safe_pipe_read returned -EPIPE!\n");
+		return DEAD_CLIENT;
+	}
 	igt_assert_f(ret > 0,
 		     "Pipe read timeout waiting for token '%s:(%" PRId64 ")'\n",
 		     token_to_str(token), token);
@@ -309,6 +315,10 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 	igt_assert_eq(in, token);
 
 	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
+	if (ret == -EPIPE) {
+		igt_info("safe_pipe_read returned -EPIPE!\n");
+		return DEAD_CLIENT;
+	}
 	igt_assert_f(ret > 0,
 		     "Pipe read timeout waiting for token value '%s:(%" PRId64 ")'\n",
 		     token_to_str(token), token);
@@ -318,12 +328,22 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 
 static uint64_t client_wait_token(struct xe_eudebug_client *c, const uint64_t token)
 {
-	return __wait_token(c->p_in, token, c->timeout_ms);
+	uint64_t ret = __wait_token(c->p_in, token, c->timeout_ms);
+
+	if (ret == DEAD_CLIENT)
+		igt_assert(c->allow_dead_client);
+
+	return ret;
 }
 
 static uint64_t wait_from_client(struct xe_eudebug_client *c, const uint64_t token)
 {
-	return __wait_token(c->p_out, token, c->timeout_ms);
+	uint64_t ret = __wait_token(c->p_out, token, c->timeout_ms);
+
+	if (ret == DEAD_CLIENT)
+		igt_assert(c->allow_dead_client);
+
+	return ret;
 }
 
 static void token_signal(int pipe[2], const uint64_t token, const uint64_t value)
@@ -1402,6 +1422,7 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
 	c->ptr = data;
 	c->master_fd = master_fd;
 	c->timeout_ms = XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * MSEC_PER_SEC;
+	c->allow_dead_client = false;
 	pthread_mutex_init(&c->lock, NULL);
 
 	igt_fork(child, 1) {
diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 3adde5f6c..8f7f66220 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -66,6 +66,8 @@ struct xe_eudebug_client {
 
 	int timeout_ms;
 
+	bool allow_dead_client;
+
 	pthread_mutex_t lock;
 };
 
-- 
2.34.1

