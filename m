Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A119ACD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 12:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564C110F03A;
	Thu,  7 May 2026 12:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jh9cX80m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F5010F03A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778157349; x=1809693349;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ZjWbo+7x3eoLtcUxrgb7Y4HQzbohvwniicyT7LYolPg=;
 b=jh9cX80m9RPAU7bUM3E3ib1sywyYza+rZbVQHrFZYoCwOytGCuOrgKks
 7KqPjyQidUi8GxMMlvz61jsoMxe4cvOYEzi+22Vyelei+wamKloAsAZeu
 rvSRE68b9GClpGODFXzdsifg4CHsPto7h+bIVnOMtSk48SkEHbZQqFT5Q
 p9xBnfqvuyFlF7TBMTXe8KxcxfCyN8+LfBdaw+2JUfxgdrmHml07SjWA1
 ZDFtH7z6NcwaYsRd1+bTOScAAAUP4JdIodImeQW3CRGsRobLB478Dfu0V
 ouFjnq+Npv/9z3l1H9l8UBA2Q23Uenjji+1hALnwzcr9V6lKxWCU+adsT A==;
X-CSE-ConnectionGUID: 0W4+mQoLRVisbs4vWHLTSw==
X-CSE-MsgGUID: dYxCVIYmRsOZbYpsxI2yPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="81674973"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="81674973"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:35:48 -0700
X-CSE-ConnectionGUID: tomDAJ0TSGu1azFOtnyhpg==
X-CSE-MsgGUID: 8WxyLF9BSRmf8fymmc9npQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="236716838"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:35:47 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 07 May 2026 14:34:19 +0200
Subject: [PATCH v2 3/3] lib/igt_core: add timestamps to error logs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-add_timestamps_to_logs-v2-3-9591e90e0a6a@intel.com>
References: <20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com>
In-Reply-To: <20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com>
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
 bh=ZjWbo+7x3eoLtcUxrgb7Y4HQzbohvwniicyT7LYolPg=;
 b=kA0DAAoBI2Kyk94Q/dcByyZiAGn8htSgZDzCqn+c1xEWD/AbhInpbp+VeqM0Vck7Ztc8GPljI
 okBswQAAQoAHRYhBPyoRDE03b9d4X8DTSNispPeEP3XBQJp/IbUAAoJECNispPeEP3XLvMMALsH
 9IveMLFYUMwvFMiuDMBrcM6Ie5LuyMo6asfcjbFyuKhS3kG19PvFp0SVABVlbPMoqVaCsdYf380
 kb29r9lqj1ER9GAaGZ1ih26/yNYzzpIsabN9TbghfzWHX3uS9J/mRo38IyM571TQc8jKkck7iKK
 3acKB6Radq2f6jD5UO2605bCCL3stORa+MktbbR7B1iFetSg2BJH2PyH4EE81UJ5WpNzMprd15k
 4MPP/wUuI641BRG3eEluD2PvTJ2MfXVA7XQpI0+3VwWLXciGEPvqKwGeYPSDGhuEBNV7RxIUgzT
 jIIWipQ51XJXBWJQmSIEx970W0vACDlFhHlwUrum9bIZFQQwnQeGxZg6jVWLPDfnBnb4yRNL6yk
 og09pUk/DxLRXbvAC4rOXgD1WIEm8R6OIGSShliAyy1upV/idSwOd9gHhalykOvw3L4YqCB49bK
 d0OLzkChjf+BW9EoytMmXzG/fCP5esuteOWHPlus/Fo5fck6wo0/rY6OSfaw==
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
index 4f79c02948ab..201e9eea52e7 100644
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
+		if (asprintf(&formatted_line, "[%ld.%06ld] (%s:%d) %s%s%s%s: %s", (long)ts.tv_sec,
+			     ts.tv_nsec / 1000, program_name, getpid(), thread_id,
+			     (domain) ? domain : "", (domain) ? "-" : "", igt_log_level_str[level],
+			     line) == -1)
+			goto out;
 	}
 
 	if (line[strlen(line) - 1] == '\n')

-- 
2.54.0

