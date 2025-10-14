Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2589ECCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 09:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D144B10E58B;
	Tue, 14 Oct 2025 09:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuVRSt7n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACFE10E58B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 09:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760434747; x=1791970747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mZgGEOk4vQa7ST0hlSl/8UsYHVHQjOIskaz9mfnJU7M=;
 b=NuVRSt7nmHNe6N3sn7AGgcRigFZPmz3XRiyhzL+cJpvYBZiWD9FagcS9
 B4zDAbHfitGe2Toe6/Wi/us7O7CbY9U4OykBZZ1VnqDPkcC+qjrjvTts9
 Yv15MI86Zv9IPv4ecSylDPwrHS+/f0/3gP0NupFxGdwUcQYs8fdXmy37W
 oFEZHvC55vP4fO/Em6Sqa0xU9udbo+bmBX6AawvXmyRFsNDebF+LcXmlS
 XkGCTVxJ0J9hSBX1Kqr3FLr+jdd5t1LmMdRgfKyPjlyqmkzxJNNk/glO/
 IH0wGIdT8IUFgiQrFd5m4idhaM8gACHt7HPJBN6yhyBFFm/cpg+GhjtbK Q==;
X-CSE-ConnectionGUID: x/07EfQPRsWBGkqA794mLw==
X-CSE-MsgGUID: WviHeGolTcqYEDDzeJRyqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73192500"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73192500"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:07 -0700
X-CSE-ConnectionGUID: 0WkvnB16QyyniFjq2mfpbw==
X-CSE-MsgGUID: CTDPRnMsQNKV5egkY35F8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181066479"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 02:39:05 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 2/7] lib/xe/xe_eudebug: Fix token to str
Date: Tue, 14 Oct 2025 12:38:43 +0300
Message-ID: <20251014093848.2394531-3-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
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

We print token types to see client/server flow. The printouts were off
by one. Fix array indexing.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 4bf697a45e..f43903f5b0 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -41,6 +41,7 @@ struct match_dto {
 	uint64_t *bind_op_seqno;
 };
 
+#define TOKEN_NONE  0
 #define CLIENT_PID  1
 #define CLIENT_RUN  2
 #define CLIENT_FINI 3
@@ -51,7 +52,9 @@ struct match_dto {
 static const char *token_to_str(uint64_t token)
 {
 	static const char * const s[] = {
+		"none",
 		"client pid",
+		"client fd",
 		"client run",
 		"client fini",
 		"client stop",
@@ -59,8 +62,12 @@ static const char *token_to_str(uint64_t token)
 		"debugger stage",
 	};
 
-	if (token >= ARRAY_SIZE(s))
+	igt_assert(token);
+
+	if (token >= ARRAY_SIZE(s)) {
+		igt_warn("token outside of bounds %ld\n", token);
 		return "unknown";
+	}
 
 	return s[token];
 }
@@ -334,18 +341,25 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 
 static uint64_t client_wait_token(struct xe_eudebug_client *c, const uint64_t token)
 {
-	uint64_t ret = __wait_token(c->p_in, token, c->timeout_ms);
+	uint64_t ret = 0;
+
+	igt_debug("client: %d waiting token %s\n", c->pid, token_to_str(token));
 
+	ret = __wait_token(c->p_in, token, c->timeout_ms);
 	if (ret == DEAD_CLIENT)
 		igt_assert(c->allow_dead_client);
 
 	return ret;
+
 }
 
 static uint64_t wait_from_client(struct xe_eudebug_client *c, const uint64_t token)
 {
-	uint64_t ret = __wait_token(c->p_out, token, c->timeout_ms);
+	uint64_t ret = 0;
+
+	igt_debug("debugger: %d waiting token %s\n", getpid(), token_to_str(token));
 
+	ret = __wait_token(c->p_out, token, c->timeout_ms);
 	if (ret == DEAD_CLIENT)
 		igt_assert(c->allow_dead_client);
 
@@ -354,6 +368,9 @@ static uint64_t wait_from_client(struct xe_eudebug_client *c, const uint64_t tok
 
 static void token_signal(int pipe[2], const uint64_t token, const uint64_t value)
 {
+	igt_debug("%d signalling token %s with %ld\n",
+		  getpid(), token_to_str(token), value);
+
 	pipe_signal(pipe, token);
 	pipe_signal(pipe, value);
 }
-- 
2.43.0

