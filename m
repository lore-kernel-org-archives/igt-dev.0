Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9349DCCA468
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049AF10E564;
	Tue, 30 Sep 2025 10:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5R42YuL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898F910E562
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759228949; x=1790764949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8Jr940HO6y43mcqQsWWOjTHpzW+zTb3gmTorJDZfkfM=;
 b=S5R42YuLvLH4jmHRU31jHBUOhSrRT9U42x58BvRlQZxaa71JiHXEpWaL
 qdzl2RrmXwv/3pirIv0hGFLIpaHgxLPqlekHRbLSrlgA281IbIX7zcfuh
 7xvLEtuIDY3QOwLvk9pGFDYYYOpmY04pC3ZlKe/818Q8hFDZohF9lhhrK
 x+LUYDdy051TYEUY4FGGRbDZCmo7C9wB5qQNxD1Y1owG2ybLRsn004mgY
 t3jlMz4SvKgOF/EPjicSUsE4Ncs0/xpDJtYTfhxSXu6eR9lHkQ79kU0zY
 t5qzMRaeWQhHJ46mkWjNNQyjblYLRI4l3GH8gyrbSEcs1+4bEYXsBJFVe g==;
X-CSE-ConnectionGUID: mhyA6dduR26V8UeFg+o1Ww==
X-CSE-MsgGUID: pvbR0kBXSueudpWnhlpuxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61371472"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="61371472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:25 -0700
X-CSE-ConnectionGUID: EkOqAcSzRBu3vfJo3/GDqQ==
X-CSE-MsgGUID: mB0CDBccTvCdvqFo7mgMmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178446581"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.115])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 03:42:24 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v8 i-g-t 2/9] lib/xe_eudebug: Don't fail in __wait_token if
 pipe was broken
Date: Tue, 30 Sep 2025 12:42:02 +0200
Message-Id: <20250930104209.22462-3-dominik.karol.piatkowski@intel.com>
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

If safe_pipe_read returns -errno, print it and let the upper layer
decide if this is acceptable. This will allow for debugging if something
goes wrong, while reducing the false tripping of tests in which a dead
client can occur.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.c | 39 +++++++++++++++++++++++++++++++--------
 lib/xe/xe_eudebug.h |  2 ++
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 65297d623..e2a8ff559 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -296,34 +296,56 @@ static void pipe_close(int pipe[2])
 		close(pipe[1]);
 }
 
+#define DEAD_CLIENT 0xccccdead
+
 static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 {
 	uint64_t in;
 	int ret;
 
 	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
-	igt_assert_f(ret > 0,
-		     "Pipe read timeout waiting for token '%s:(%" PRId64 ")'\n",
-		     token_to_str(token), token);
+	if (ret < 0) {
+		igt_debug("safe_pipe_read failed with error: %d waiting for token '%s:(%" PRId64 ")'\n",
+			  ret, token_to_str(token), token);
+		return DEAD_CLIENT;
+	} else if (ret == 0) {
+		igt_debug("safe_pipe_read failed: EOF\n");
+		return DEAD_CLIENT;
+	}
 
 	igt_assert_eq(in, token);
 
 	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
-	igt_assert_f(ret > 0,
-		     "Pipe read timeout waiting for token value '%s:(%" PRId64 ")'\n",
-		     token_to_str(token), token);
+	if (ret < 0) {
+		igt_debug("safe_pipe_read failed with error: %d waiting for token '%s:(%" PRId64 ")'\n",
+			  ret, token_to_str(token), token);
+		return DEAD_CLIENT;
+	} else if (ret == 0) {
+		igt_debug("safe_pipe_read failed: EOF\n");
+		return DEAD_CLIENT;
+	}
 
 	return in;
 }
 
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
@@ -1405,6 +1427,7 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
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

