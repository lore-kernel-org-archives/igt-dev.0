Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE291C10F15
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0267510F32D;
	Tue, 23 Apr 2024 23:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBzVTx1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABD910F32D
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915830; x=1745451830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9Btx0LuSnkSY25Wff9vjfKiekXDI6jlQT2l2cekvUc=;
 b=ZBzVTx1jKxDOKzM1fltAn2yaNLBn51NBMz8VIFDF0deONdwuBrWvYpm6
 ck6BC8n8dvyHH6XSVXzxkZ0wUko7yCGgK+2eQfCd+Ev7XI9K6+MZe0rXX
 7Xg2YUXOmdj6jQ0E7Qc3AZ2HYXgDb1VwEvJZICvglonl5nzTwKSSBQfd+
 jQa11+MpeVe9jSYgxd3Io1b+yzzg648s4yIUTkHSwHaaJho7vVJTNTFf+
 MNB5RRt2NP3RAnfi+0y5t4WkOzMnNsULw5bSryqb251eOqnoxhNGFuZoZ
 7yG1J38JoOI51f1GQ4QCV6iJUuvQU40Fd7WltnZ/gJYJLnSre3yyqt2sL w==;
X-CSE-ConnectionGUID: N9zL2lu6Tlmiwr1FnsxvXg==
X-CSE-MsgGUID: duBFreS9RjKL8zxoVcUl5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362017"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362017"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:50 -0700
X-CSE-ConnectionGUID: QdDinUZMTk+70h6f9zzOJw==
X-CSE-MsgGUID: qQRn0tIoR5ig9IuHT+q4CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180948"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 17/21] gputop: print percentage number
Date: Tue, 23 Apr 2024 16:44:27 -0700
Message-ID: <20240423234431.1959354-18-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423234431.1959354-1-lucas.demarchi@intel.com>
References: <20240423234431.1959354-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tools/gputop.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 9edb76acc..820a1b553 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -42,17 +42,19 @@ static void n_spaces(const unsigned int n)
 
 static void print_percentage_bar(double percent, int max_len)
 {
-	int bar_len, i, len = max_len - 2;
+	int bar_len, i, len = max_len - 1;
 	const int w = 8;
 
-	assert(max_len > 0);
+	len -= printf("|%.1f%% ", percent);
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
2.43.0

