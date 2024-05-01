Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F34C10F1A
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 17:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC8510EF57;
	Wed,  1 May 2024 17:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U34mmztL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5126510EF57
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714584791; x=1746120791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=23cqEnlQh0hP4FKPghEF44ZQHGe0/Lc6CB0lmnSYvGU=;
 b=U34mmztLuYLKgkQf6XSdLY3Xz8JJdgDOfe5vPQWXjaaTt86R3oDSn2Pw
 lajgNmO+2z8bITNg3UwJtUmsSQlbus/BtTjcurZ/nMw49NzPzCKn+yXSD
 376LJJapRxiNcooMhK7KYo/CJt2l7CwlaZ/B4R+5fCBgclsOJpgHZu310
 23QrfxZ/uoLyjl2H+feGboRA96By4y1s/rnbuC4UZAWQ0sPCSPHxwLiht
 Pdskf+t1BZFKtxMmp99zf28PqUp45YKv+o1OertWag+AIsXR7GnccrlWj
 cAIc2fKYFrnGhPq6IxAGguHszFIKLOCqIAPiNzL/qA8WSJS9FgIQgpoSn A==;
X-CSE-ConnectionGUID: Ejlfi2c6T9qms3csipqeiA==
X-CSE-MsgGUID: gt2Z/BZRS2qPy2c3Lbos0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10497100"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10497100"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:11 -0700
X-CSE-ConnectionGUID: k7ElQNXkTUCE/b8pC8a+Bg==
X-CSE-MsgGUID: gCUMXX+mRVqEm0yo9v6PVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="26721813"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.109.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/4] gputop: print percentage number
Date: Wed,  1 May 2024 12:33:00 -0500
Message-ID: <20240501173303.115737-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240501173303.115737-1-lucas.demarchi@intel.com>
References: <20240501173303.115737-1-lucas.demarchi@intel.com>
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

Besides printing the bar, also print the raw number for easy
visualization of small quantities. While at it, make sure gputop still
works with small console widths.

v2: Use %5.1f instead of %.1f so it also aligns the non-decimal part

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 8cec951b4..7fd9e9790 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -42,17 +42,19 @@ static void n_spaces(const unsigned int n)
 
 static void print_percentage_bar(double percent, int max_len)
 {
-	int bar_len, i, len = max_len - 2;
+	int bar_len, i, len = max_len - 1;
 	const int w = 8;
 
-	assert(max_len > 0);
+	len -= printf("|%5.1f%% ", percent);
+
+	/* no space left for bars, do what we can */
+	if (len < 0)
+		len = 0;
 
 	bar_len = ceil(w * percent * len / 100.0);
 	if (bar_len > w * len)
 		bar_len = w * len;
 
-	putchar('|');
-
 	for (i = bar_len; i >= w; i -= w)
 		printf("%s", bars[w]);
 	if (i)
-- 
2.45.0

