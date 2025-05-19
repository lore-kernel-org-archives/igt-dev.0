Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CC8C54799
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 15:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEFB10E361;
	Mon, 19 May 2025 15:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXLoH6Rr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF9310E361
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747667534; x=1779203534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oVC2UT7QE91r3flyWGx/tVRR2DtEDprDIfy/Kx5YvMM=;
 b=hXLoH6RrUco0wrkjePt0UD3dBhgzwd60E56AT++kxZU/QLV630pq+STU
 blUz3rt8wSQBBT6kn3auB/aXaJCT2D5jg3wCog9o5I26V4Lsx3nm8Bfsz
 HV2dVEqQrbQExKgj69kD9DbR4TIaX1PESDRUNut9h2HO4x8Di+0Jx6YBL
 ed538vNjVqJjhZ6aWFlSTmV38EB2J1nZzCeH1BC9ns+kU8pH1rfHmlgO7
 OZOgqm2A3ysuz/IS4YE3CFLV0+syZljley2z7rPHflrA0x4cnO0T4gzv/
 ajy+vLFPjY7Qnf5LKfZgPl2SokEjIV70F4HbefgaL6YGM68iBFBahO8Wo w==;
X-CSE-ConnectionGUID: lNh4KFQmTz2/Q91DI8aMeA==
X-CSE-MsgGUID: UGbFhUSXSFG7lMsan+MxyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49710551"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="49710551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 08:12:14 -0700
X-CSE-ConnectionGUID: cPW7rWFeQry7mQ7nIElwTg==
X-CSE-MsgGUID: xqjDjgNEQoWiIT58Jhn23Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="139287948"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa006.jf.intel.com with ESMTP; 19 May 2025 08:12:11 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v9 06/14] tools/gputop: find program name from command
 line
Date: Mon, 19 May 2025 15:11:27 +0000
Message-ID: <20250519151135.43874-7-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
References: <20250519151135.43874-1-jeevaka.badrappan@intel.com>
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

