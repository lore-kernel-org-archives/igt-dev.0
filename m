Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77864CCD192
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 13:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222C410E081;
	Tue, 14 Oct 2025 13:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NFb5lMXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E519A10E081
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760449718; x=1791985718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=spOJKlW21GHvf446nAybV1KV7g187VMhUWZKNClrUyg=;
 b=NFb5lMXlqr1s9dN0q95jwX4iwWc/DdvCWAI/6oeWbYNv5k6g9l5B8N/r
 DU26S/mwd6xjmX0eoKZWqtXcs2SAqfvHV2hdmMIOWy4a8+Ey6h9slN3It
 tmocy+1qd2LThCXDvHGjcL2RbgvSlo2T2KtWGFky9zxC8gi8mlSMTVujd
 PjxmyW8FxnBttQf3hMSYDdu3SgpvazHDoXaM8QPF8iFAum4P25Tr4QTKN
 T/qa9pR7RJ6yXS2x72CcgJ8d1ACai46yBb+qBD2SN2OC2EnYqkFPjlmf1
 KYrEHscszgVvYXEgnXS+mNLL3JGY9IsWG3BuMtDP1hZ6ONPzUpOgKIOUe g==;
X-CSE-ConnectionGUID: /ehiIw3SSYig8zJgCnGNgQ==
X-CSE-MsgGUID: MHiKQ/k3QkS4buycLF7H/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80045846"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="80045846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 06:48:38 -0700
X-CSE-ConnectionGUID: E49r4ar9T6KmZiRVYERKmA==
X-CSE-MsgGUID: jB292KvXSqaUsZYnkviW1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="182351181"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.intel.com) ([10.245.244.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 06:48:36 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 2/7] lib/xe/xe_eudebug: Fix token to str
Date: Tue, 14 Oct 2025 16:48:25 +0300
Message-ID: <20251014134825.2398331-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014093848.2394531-3-mika.kuoppala@linux.intel.com>
References: <20251014093848.2394531-3-mika.kuoppala@linux.intel.com>
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

We print token types to see client/server flow. The printouts were off
by one. Fix array indexing.

v2: remove client_fd (Dominik)

Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 lib/xe/xe_eudebug.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
index 4bf697a45e..f1dffe4ffb 100644
--- a/lib/xe/xe_eudebug.c
+++ b/lib/xe/xe_eudebug.c
@@ -41,6 +41,7 @@ struct match_dto {
 	uint64_t *bind_op_seqno;
 };
 
+#define TOKEN_NONE  0
 #define CLIENT_PID  1
 #define CLIENT_RUN  2
 #define CLIENT_FINI 3
@@ -51,6 +52,7 @@ struct match_dto {
 static const char *token_to_str(uint64_t token)
 {
 	static const char * const s[] = {
+		"none",
 		"client pid",
 		"client run",
 		"client fini",
@@ -59,8 +61,12 @@ static const char *token_to_str(uint64_t token)
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
@@ -334,18 +340,25 @@ static uint64_t __wait_token(int pipe[2], const uint64_t token, int timeout_ms)
 
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
 
@@ -354,6 +367,9 @@ static uint64_t wait_from_client(struct xe_eudebug_client *c, const uint64_t tok
 
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

