Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDDBFF8855
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 14:48:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB9210E443;
	Tue,  5 May 2026 14:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ld7vMr2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CAA10E443
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777992467; x=1809528467;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=GXSDNKo0GicKSFgplASXafaigU3areX+9DSDH/BXIXw=;
 b=Ld7vMr2sJa4QYFZbYHuX2tDUp+f/Eq7A5yWzFa8g/gyhMlkWYFx7vmc7
 0jSB1WhWzj8gD2+qe/U3H4v6o31n9MvSP2IMQBGqtgKuIa0p4HGi2idps
 oIrRwTBsd0wSfBDokSs2254Hzc7yoSLjtVFD7N/2ZXUGEbJtMkiY5XbUh
 9y64/XI0BsfVAK+gp2lWH/NUu2KOvrif7kfuR0KP1elw+NJXCYsb+HpNi
 zcZikpVlDNMJwe4izL584HX23oecMwxUFWIVXqh0RdBUQzCe1XLiTV0mI
 9xIAXQgPK5OYpxyvoy0w60zrfmO3+BT5zC0ggyOhsTeODntHxXtsuhAjX A==;
X-CSE-ConnectionGUID: Ut9ykQ4xRzmE3iZn2s1p9A==
X-CSE-MsgGUID: QbrPfgOaQvue6bXhbD9gPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78020056"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="78020056"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 07:47:46 -0700
X-CSE-ConnectionGUID: 5cGS47XrQOqzsIxmjiCEgQ==
X-CSE-MsgGUID: Q9eN60+bQ9OWNW+u7DY2fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="266176224"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 07:47:45 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 05 May 2026 16:46:27 +0200
Subject: [PATCH] core: add timestamps to logs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-add_timestamps_to_logs-v1-1-2d95f499fdfb@intel.com>
X-B4-Tracking: v=1; b=H4sIAMIC+mkC/yWM2wrCMBAFf6Xss8Fai4q/IiVskk27Yi5kUxFK/
 91WH+dwZhYQKkwC92aBQm8WTnGD06EBO2EcSbHbGLq2u7T9uVXonK4cSCqGLLom/UqjKHfrvfP
 uSr63sMm5kOfPL/wY/iyzeZKte21/GBRSpmC00z7NWWohDMeAUqnAun4BoQkGqJwAAAA=
X-Change-ID: 20260430-add_timestamps_to_logs-d84fdfd7ef4c
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=GXSDNKo0GicKSFgplASXafaigU3areX+9DSDH/BXIXw=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBp+gLInHI1kZnKFNw8ErU+tRbLroCFW4tNPUk9G
 WxRq4fpSwCJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCafoCyAAKCRAjYrKT3hD9
 18S5C/9BrVLOXvR9oDBnMcYRdxK16jWSuJFVuN6g0lwA55tu+dZ1I/lAOQtpSZ04k2HprqNFtMP
 WNtTD1WheGwQP22p1RwOG7henZVWuiudihzuLKN2os8WXS5cnuJK+JQe3wX2vCqrPMYZsTm2teG
 6kvVfCVvRjYEJUhjyfj+ZgJz45ssjxbRZlNXOWQWa1N+L8lSL9E2hFgWkiyvUP2LkBTy9SNtA5R
 e8pYxMQIvv7QzBB4J5+VGG41yPF366cac9AbI6F3UT1192dpoCbGbx/YzcQcE4SZjme+VSHB1fE
 yNtkvOO+XTEx+czGlWa+ajOP0JqE47n66Q7rl8LmzrMqeJ4yB1CsTIi6FUlYoBXwrWRFnF3BCT3
 hNT2vcx2zScoVBmzQT0fpgThCK5AddoTvgTsXzkpGUtCqZImdwp2vug1OM8i+1FvltoaUIW+7c0
 xmac4bSYdsMrFdKHw3qAv3c1tyeoZcFjyqULkEwc5dBDWfFY3ywXI0OvwIpbtpIEL04sQ=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/igt_core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 4f79c02948ab..e11b181e7a82 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3227,10 +3227,15 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
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
+		if (asprintf(&formatted_line, "[%5ld.%06ld] (%s:%d) %s%s%s%s: %s", (long)ts.tv_sec,
+			     ts.tv_nsec / 1000, program_name, getpid(), thread_id,
+			     (domain) ? domain : "", (domain) ? "-" : "", igt_log_level_str[level],
+			     line) == -1)
+			goto out;
 	}
 
 	if (line[strlen(line) - 1] == '\n')

---
base-commit: 8eb6e58f00d39b3bb79ffc501eb020b36c8f8c31
change-id: 20260430-add_timestamps_to_logs-d84fdfd7ef4c

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

