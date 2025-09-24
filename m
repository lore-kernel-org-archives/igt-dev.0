Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696F9CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E822210E727;
	Wed, 24 Sep 2025 12:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nf8ML8H9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1F110E721
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717706; x=1790253706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vdMQgtAU+K6ge8YoNzDeSKmxon07UEM6Wip5li+wjuQ=;
 b=Nf8ML8H9B2xO8xp9E8nBrOsqVctXxtyLz1mXhJEOqLdb9r4M7Uf2Sv+R
 +RzvgDKMti/ZHvSZ6izbATfBUFAMawl0CswIHymzCMttNmtqahfsWEUxu
 iferoQZ8sDesPX3RX06oMUQkg3pOEJPw9FtxkgNeobuPxx5Mi2XRioeAq
 y3FrvYhMUnj5Y2d3VKCNB7+dS334WxdO5X7kL/dW9YhtrNnhgq/2kymM1
 VWGeYi7q7Grj+5RmMv/pefltNfvYRDwfERhqIw2yQmMBFMPkw+V6Mk9ns
 pll9/hOiOqAz5xFiYk6LUGGnbIppj/iAdFYRTzAbK2EAUxjHPsNPBCxSc w==;
X-CSE-ConnectionGUID: ay+ukV5DQO+ROwkZGq8uFQ==
X-CSE-MsgGUID: CK4nFwF5Qq+dr2OLdFhZTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61182092"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61182092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:46 -0700
X-CSE-ConnectionGUID: yYxOjm4mRTi6tLDH2J/n0A==
X-CSE-MsgGUID: nYhSZQx9SyWOVTtKy+jVJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="177459882"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.245.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:41:43 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 2/6] lib/xe_eudebug: Don't fail in __wait_token if
 pipe was broken
Date: Wed, 24 Sep 2025 14:41:19 +0200
Message-Id: <20250924124123.14792-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
References: <20250924124123.14792-1-dominik.karol.piatkowski@intel.com>
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

