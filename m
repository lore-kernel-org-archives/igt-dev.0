Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1834CCAC5B1
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 13:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697D210E128;
	Tue, 23 Sep 2025 13:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWpeK0ie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1069610E127
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758633019; x=1790169019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bD/G0VIGbKp/oWwEBYQlGsjowAQuts4HuI16oR9p34c=;
 b=BWpeK0ie8gDgFZNFNBdEfoklu0qWnwXu1j8KGG5SAkX9pnX/uU8V9bsh
 WQWJ4US9SDx3/GRCFl2Bl/rTBUnZF8fRrvSY7oH5HJu17ZFGytVzWxJ6h
 B0XcIKf6E33BbvnglKasVdBYxTklcm+UQ3eKn7UkUEh1qHfuHLa8Ru//A
 a30Ib+itGtP3D28TfS1rf3rH5YLYF9dk2S/cCIjYadolvQ5KQgZts1lqm
 IodHlVS5x1aDhZLa+SDbGT+6FyImfqSk9oDykxjvOR6ShOGOiHe5ESbsL
 f4EOZ/VAC/ZGnlYMx1/0/Rr7j7stWJGcTIbJt5qCWrg119nPg56acMNoT Q==;
X-CSE-ConnectionGUID: osdAlnnsTyO5Ho1KGUVqkA==
X-CSE-MsgGUID: tW458vVqQlqVOSfn91IOYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61026859"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="61026859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:19 -0700
X-CSE-ConnectionGUID: fRSXB/LLQUWmJh+5NEq1CQ==
X-CSE-MsgGUID: ymqBMs/9SWa6Cr5WJTRpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="200461876"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.237])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 06:10:17 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v4 i-g-t 2/6] lib/xe_eudebug: Don't fail in __wait_token if
 pipe was broken
Date: Tue, 23 Sep 2025 15:09:58 +0200
Message-Id: <20250923131002.24708-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
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

