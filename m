Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EC8C3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 17:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF9010EB4A;
	Fri, 16 May 2025 17:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AeySibRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADE410EB51
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747415547; x=1778951547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oVC2UT7QE91r3flyWGx/tVRR2DtEDprDIfy/Kx5YvMM=;
 b=AeySibRp57UkxPzxdV7U3Bstcq0Z0yo5vs3uNeOKtirqfI9yrZJCBe3j
 tcnsbz13V091T87relXwvaVzq2vKvwUlAz0pVbERNt+e0RqSk5DeI/CW4
 BZ5htvW7YJKyJZgHkNypfzJ1AsvjTdWCBFa7GyEdk1rCgoXaP+uzxexaK
 0Lj0GlnYNSZLAboAB7R1dc0FR1odIRrVh/bfKMj2z7kUGdtMILG3xQ+HX
 n91wCAE1U5uEXnhGahX/CnwaGzI52XnlkVB/qIG2mZ2N3NIwccrqOLyoV
 xQ+zPHUKQdU/mDxyVrP7Ez01OcvvoTSPuj568pAiG0qaJkfsbFlx/GWcg Q==;
X-CSE-ConnectionGUID: mDzSeUqDT2OaBEsIOH+vug==
X-CSE-MsgGUID: 2PBOj/1JS3akjwJzC7el7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49297095"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49297095"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 10:12:27 -0700
X-CSE-ConnectionGUID: j9PatA40ReGAJ6C59p/TfQ==
X-CSE-MsgGUID: EjWR1aS6RXG27dUk+V+Uug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="138793497"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2025 10:12:25 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v7 06/14] tools/gputop: find program name from command
 line
Date: Fri, 16 May 2025 17:11:45 +0000
Message-ID: <20250516171153.74079-7-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
References: <20250516171153.74079-1-jeevaka.badrappan@intel.com>
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

program_invocation_short_name is global variable provided by glibc.

Inorder to get the igt built for Android(without glibc), find the
program from command line without using program_invocation_short_name.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tools/gputop.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 43b01f566..f577a1750 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -335,15 +335,22 @@ struct gputop_args {
 	unsigned long delay_usec;
 };
 
-static void help(void)
+static void help(char *full_path)
 {
+	const char *short_program_name = strrchr(full_path, '/');
+
+	if (short_program_name)
+		short_program_name++;
+	else
+		short_program_name = full_path;
+
 	printf("Usage:\n"
 	       "\t%s [options]\n\n"
 	       "Options:\n"
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
 	       "\t-n, --iterations =NUMBER  number of executions\n"
-	       , program_invocation_short_name);
+	       , short_program_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
@@ -384,7 +391,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 			}
 			break;
 		case 'h':
-			help();
+			help(argv[0]);
 			return 0;
 		default:
 			fprintf(stderr, "Unkonwn option '%c'.\n", c);
-- 
2.49.0

