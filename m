Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F73CC6B12
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE30D10E0C3;
	Tue, 13 Oct 2026 15:19:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2374A10EF01
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791904617; x=1823440617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wd04JOL027SMDd4Q/Aba26HS2Gq2KqM11qRwf1d5Nes=;
 b=XH/j+NWauVGm6YIjO2fJpTz4DnjVGF2BC3irEp9NGbm6M+ftLPE/Opd4
 RM/FkzXz/axePIoRpyClNtHranBR3VAMwLDBM6/8kTXK3RRQxJk7YZXZ+
 QVTx3OYN6N9QMamA5UXaUGk2kZ1xmEZmswywC4fbTfTk9Zls/GZ9HGqWa
 9ryqaxaqnwXd2o+AkI3/A+4sVT75+KYg+dEHz43gpxKkQoy+4nsvSicZb
 xOSy/+w/JLIo+QQDB3zUMq8hRWbBywPQoy8Wk6hxb58zR4mEIEuwE5q+v
 xyvK45uQ2dskOlRSwD16VAQQ1ZVUdqJYu4a9jJPNGQ7D/UBjIrWgZEYY0 Q==;
X-CSE-ConnectionGUID: OSINuqIDQvSr/ScjRDSYDg==
X-CSE-MsgGUID: xktbDBKkTvCpmhkbueXbxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="626603"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="626603"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:16:57 -0700
X-CSE-ConnectionGUID: THqSlqIHQ26xCMnzhVcFCg==
X-CSE-MsgGUID: /9gRtZRUS5OzLmEex442qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1078124"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 08:16:56 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 2/2] runner/resultgen: Fix warn about discarded const
Date: Tue, 13 Oct 2026 17:16:44 +0200
Message-ID: <20261013151644.174387-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013151644.174387-1-kamil.konieczny@linux.intel.com>
References: <20261013151644.174387-1-kamil.konieczny@linux.intel.com>
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

Fix following warning which is observed on Ubuntu 26.04:

../runner/resultgen.c: In function ‘next_line’:
../runner/resultgen.c:144:13: warning: assignment discards
	‘const’ qualifier from pointer target type
	[-Wdiscarded-qualifiers]
  144 |         ret = memchr(line, '\n', bufend - line);

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 127d8a9e8..94cdd0e2e 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -136,7 +136,7 @@ static char *find_line_starting_with(char *haystack, const char *needle, char *e
 
 static const char *next_line(const char *line, const char *bufend)
 {
-	char *ret;
+	const char *ret;
 
 	if (!line)
 		return NULL;
-- 
2.55.0

