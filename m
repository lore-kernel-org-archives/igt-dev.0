Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762F3C7115A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 14:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B3710E728;
	Tue, 17 Jun 2025 14:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dA3v0hR9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021B210E728
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750169183; x=1781705183;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=HBgxl+QpV6H6MhLlTc9FGmS8km++sF0eHwIjgSE/aQA=;
 b=dA3v0hR9NkYxPpz7nuXonW8YHKUhxrVsfvoxNHwh/XbffwC6uG+twpdT
 7YajXveijA1hyi4AqkWRheekTxmEbiSHClOTuf6jgY6i63P7PCTxsZx//
 LBLrP1nicay7yjGUwo9/fNOd7bnaMhpFtGwJt+68MNAaU2+sAgyEFfRTu
 fVzpUc0lh1TtCjw6WQ7w0PLVIw0f2hF0KPBZrhgz9tRuyHB7ulWoxj4wH
 7TKbAvc3C6hK5NmOHUdNd54zmhHh8Or8ZKrVJhaarYVxDi9uYt0wy8kLh
 PosKrQ3cNflNOoPKJWghtlo/6it4bNZR4Xenevzgo+qpUN0WfEEE+YqN8 A==;
X-CSE-ConnectionGUID: mNNeq8AdRXySc0EmoV9vOA==
X-CSE-MsgGUID: I4kLHZqiR0CIh+4tt1ys4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52431610"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="52431610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:06:23 -0700
X-CSE-ConnectionGUID: oyVXc4ggRLy1blvH7CI6kQ==
X-CSE-MsgGUID: yDLxecbvQemsdhxyWU27yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="172036317"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:06:21 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 17 Jun 2025 16:05:24 +0200
Subject: [PATCH 2/3] lib/tests/igt_assert: use volatile cast in igt_assert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-bump_fedora_to_42-v1-2-d04e6a0455fd@intel.com>
References: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
In-Reply-To: <20250617-bump_fedora_to_42-v1-0-d04e6a0455fd@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Petri Latvala <adrinael@adrinael.net>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=773;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=HBgxl+QpV6H6MhLlTc9FGmS8km++sF0eHwIjgSE/aQA=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBoUXYsC4uBjh1ojebO81ztPQxBJW4bLq1m1C5Tm
 TT8Xx8c3DGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaFF2LAAKCRAjYrKT3hD9
 1yt2C/0ZInR5DxPfPfIeZiws5wh7NWQnMEXJ5KFdefA8GWN0ix8nB9/yQiEDjipJGWQKVdq0MiX
 sqOh4+p2K54TPC2AS865MUF+OdQT/yQLDZM9eBkBK6YZz1a2+XBwYl0cJ2KrTx00qxbHiW84ngN
 45VaAXi/XE3W4O1iMLNRyuNaW9Uxuy4N+RlFqjcpDkzSJDGdfwH0SxgXNomfctvYWviFvpW5Lx1
 GhhuiwT5/AahFHIqMvEQlPwh6SCazv9t8Vuzk3pk314d9eOKjaQG269z0qQW0sUaWTPDB1F8IG6
 LpC9m7ITQa1YF4DKK4qts8zGqmRSW3JE4f8eb9DV32ZuTKHi832shO2dsRP6BnIsxTxC1PU+PUk
 fjEo2kdFCjkh/WaseHrUxdHqPUrQ/cEEWjoVc6zLLievcdAh0dZeM5CPsRoKK4I1ipb/KcQylGh
 n2JdBDTSS0RHbJyt/YMNZ0yMgaQtBI8ikKshbObGPEwzW+ncfigRw4eJkojYDBoai70as=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Newer versions of clang optimize code more aggresively.
As a result change of variable in subtest is observed
by caller only if it is cast to volatile.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/tests/igt_assert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tests/igt_assert.c b/lib/tests/igt_assert.c
index 3523a46494822cd42f63047c0b5bbb5b39343c84..10c08f9860bb77faa35e4dd46e19d69c94897a7f 100644
--- a/lib/tests/igt_assert.c
+++ b/lib/tests/igt_assert.c
@@ -46,7 +46,7 @@ void (*test_to_run)(void) = NULL;
  */
 #define CHECK_NEG(x) { \
 	igt_subtest_f("XFAIL_simple_%d", __LINE__) { \
-		(*exec_before)++; \
+		(*(volatile int *)(exec_before))++; \
 		x; \
 		raise(SIGBUS); \
 	} \

-- 
2.43.0

