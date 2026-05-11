Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E4CD37BE
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 12:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D4510E74C;
	Mon, 11 May 2026 12:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDep3e1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E86510E6FE
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 12:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778504220; x=1810040220;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=FNsIhLOzrFdcogtsg5mN5G4zmpljfbTqHg+MLV2wRLo=;
 b=TDep3e1U3OCkK2JQi4X1X1n4xZksdJB5xUoFDF6b0mvdFfeX1r5/TTS1
 BEbL9ahAHCir3bSMVLN4LxakKsT/e7SGFlUMvfQaDfZdXwNq8lvwuMVU/
 raS9iwBu3PRYSxQ8+G9hxK07PNsRmsDWme/WlMPtOH2slaxpB3sfxbFYc
 X2XO6/dduTip3371Tlbz8F3WEga+3FC15Jl3D2H6w4HerN6nAkOTaL6Ne
 1N8hEBhhP1FtGKaxseUZ0uz5DXGIvn6Ummm2zlK7PmpZK1WNBYTH6qMbT
 59bLfA2WgoqY9sTSRTgZYLbwXwjBFK2AlBKLqYuttw6moClkVn+M3UA+9 w==;
X-CSE-ConnectionGUID: 1VXZzbPvTyyquC5PiDUASA==
X-CSE-MsgGUID: stNkAfwfTmyOIxJxhoyLeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104847990"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="104847990"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:57:00 -0700
X-CSE-ConnectionGUID: 9qeGIDqtQaqrs4iZnMjZbQ==
X-CSE-MsgGUID: jc1F2EQtRtWVR3AfBxljLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="275575392"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:56:48 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 11 May 2026 14:55:24 +0200
Subject: [PATCH v3 2/2] lib/igt_core: add timestamps to error logs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add_timestamps_to_logs-v3-2-041130e1f7ef@intel.com>
References: <20260511-add_timestamps_to_logs-v3-0-041130e1f7ef@intel.com>
In-Reply-To: <20260511-add_timestamps_to_logs-v3-0-041130e1f7ef@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>, 
 Jari Tahvanainen <jari.tahvanainen@intel.com>, 
 Mateusz Grabski <mateusz.grabski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=FNsIhLOzrFdcogtsg5mN5G4zmpljfbTqHg+MLV2wRLo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqAdHDGwH8ONvYws2LWN5VJl63f0K6wMw6AUHuN
 DnLYBljP5WJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCagHRwwAKCRAjYrKT3hD9
 120bC/9Hx1vnALV3Zj1dKZ6cNrsD3OfNA4o9jDWgTZ/99OvyQZh9jV6DizRbqP/+hGqCdYC29IK
 rKGCBDs85k1zYkGBVjMNhD0r0XHOEt9d7XWUg7XoNckmKwnx/Y+fa0y++KvYAFceBHFwexBqAdT
 Xm8GDVEeBtDW+BQ9oj3yKHnLNLmCizz8pBy/3XZtAXKvTk8P9Rns/cvRNk/DsA67JUqSHGGGREP
 bcqq28q5jPnihTdnP9UZqFOX/kav7C9Lo0lX5H5kdxqmUl6vNg5Ry3aNWEvgNFM3OwFjdREZfXX
 bTp004emMwMAkDCT8ZDEqmUvayd5nAwiqR5gTsB3zzYhJ4dPmz3KY/W3xmOQ93c+asRb2CALwN5
 39l57693wqXYL6sjPtnf4KxOJJR9O90N7IdSmCDCc/rPylxK1mYsZtCCiJ555pF988fVYUwPJyl
 tahjxc+0lfBd+Ln3a23lEDwd6fxiyH6qzlG5XU9rBuIrRbu4sUs3Y8GoC9/KjWZPL/JxA=
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

IGT tests run often time consuming tasks. Timestamps should simplify
time analysis and matching with kernel logs.
Since IGT is closely connected with the kernel let's use the same format.

v2: adjusted string format and commit subject

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/igt_core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 5a0ab4361eaa..72b7d3449888 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3226,10 +3226,15 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
 		formatted_line = strdup(line);
 		if (!formatted_line)
 			goto out;
-	} else if (asprintf(&formatted_line, "(%s:%d) %s%s%s%s: %s", program_name,
-		     getpid(), thread_id, (domain) ? domain : "", (domain) ? "-" : "",
-		     igt_log_level_str[level], line) == -1) {
-		goto out;
+	} else {
+		struct timespec ts;
+
+		igt_gettime(&ts);
+		if (asprintf(&formatted_line, "[%ld.%06ld] (%s:%d) %s%s%s%s: %s", (long)ts.tv_sec,
+			     ts.tv_nsec / 1000, program_name, getpid(), thread_id,
+			     (domain) ? domain : "", (domain) ? "-" : "", igt_log_level_str[level],
+			     line) == -1)
+			goto out;
 	}
 
 	if (line[strlen(line) - 1] == '\n')

-- 
2.54.0

