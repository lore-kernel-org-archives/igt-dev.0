Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9296CAC5B8
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 07:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD3E10E9F1;
	Fri, 26 Sep 2025 07:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGoB6AyO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2791D10E9E9
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Sep 2025 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872900; x=1790408900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vdMQgtAU+K6ge8YoNzDeSKmxon07UEM6Wip5li+wjuQ=;
 b=mGoB6AyOZgFj6hNPn5FOg04Z85/mjc7QawbXdOyKUA6seP4QUum7/Mor
 7I9T5JHEILVjJ2emoa861oU4fg7r1Vf6tq1nTkYuGLvJAz0pZzFm/kh1e
 7NkAWW8H9GcMrVXPD1DGkwmXtmNoVulTcOe1sReY6Y+uhwo0oGIMRQSI/
 Y/BLa13wo4U0yCGxkwh1At0tsDXF4xOL3AW6e9olLt1/toMSGBZsHfKyh
 dudrDXxGhujkeoggk8iPLsYskD7EXWwXf8bRarUO7gzkhs4QnqiZdwR6D
 Bfq9v3oliQVGywiyzGjfd+pguO8NIU0J4zQOAkOzmQ2seTPDMA5G6xrp9 w==;
X-CSE-ConnectionGUID: dJc6qH36TrqrhkcZpu+oZA==
X-CSE-MsgGUID: VHi/MeArS8WNsH4MsDI91g==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61372370"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61372370"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:20 -0700
X-CSE-ConnectionGUID: CfMOkWdkROaqgupL96tXnQ==
X-CSE-MsgGUID: oMopaa08St2cwmYE2NUlLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="208474208"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.244.216])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:48:18 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v7 i-g-t 2/9] lib/xe_eudebug: Don't fail in __wait_token if
 pipe was broken
Date: Fri, 26 Sep 2025 09:47:54 +0200
Message-Id: <20250926074801.9031-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
References: <20250926074801.9031-1-dominik.karol.piatkowski@intel.com>
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
---
 lib/xe/xe_eudebug.c | 39 +++++++++++++++++++++++++++++++--------
 lib/xe/xe_eudebug.h |  2 ++
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index d29c82857..0c3262c41 100644
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
+		igt_info("Pipe read failed with error: %d waiting for token '%s:(%" PRId64 ")'\n",
+			 ret, token_to_str(token), token);
+		return DEAD_CLIENT;
+	} else if (ret == 0) {
+		igt_info("Pipe read failed: EOF\n");
+		return DEAD_CLIENT;
+	}
 
 	igt_assert_eq(in, token);
 
 	ret = safe_pipe_read(pipe, &in, sizeof(in), timeout_ms);
-	igt_assert_f(ret > 0,
-		     "Pipe read timeout waiting for token value '%s:(%" PRId64 ")'\n",
-		     token_to_str(token), token);
+	if (ret < 0) {
+		igt_info("Pipe read failed with error: %d waiting for token '%s:(%" PRId64 ")'\n",
+			 ret, token_to_str(token), token);
+		return DEAD_CLIENT;
+	} else if (ret == 0) {
+		igt_info("Pipe read failed: EOF\n");
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
@@ -1402,6 +1424,7 @@ struct xe_eudebug_client *xe_eudebug_client_create(int master_fd, xe_eudebug_cli
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

