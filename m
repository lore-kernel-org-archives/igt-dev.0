Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F079CC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 16:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DB410EB1F;
	Fri, 16 May 2025 16:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKsGyCn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6454F10EB1F
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747411592; x=1778947592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oVC2UT7QE91r3flyWGx/tVRR2DtEDprDIfy/Kx5YvMM=;
 b=cKsGyCn/RmqzzwoR9fpIRmNTKPGZXNbyiaOLQwaOFFwLdHi39ifUZ6UA
 Ein1qFW7CgtW+TWTJsLr6+jJE3l0lgRalj4LhlqurbWKcx8Ix6hJJLDH9
 QMlYsTPj5gBgcAs6A8WalvoKJksmBYaDWZQHxIFnfOy8LeB+RHPEcn6Xo
 8h/hXUWT/C2G8mfXf0wbwTNz4R9kxCXKkYtTGRmSEWNeNQBnND4e5EtbE
 DBlKiwSG+th45hpgJWOtl0xcB1Do/67nnM4xtaMvgBZrGzz6apu2+nTCl
 jIxUKaSnvsppaCGXhKNBuFFXgG1cN/tOVav4OePw3j+HaCGww1oQedJhD A==;
X-CSE-ConnectionGUID: yj75o43mSJaKMIQ4J9a7+g==
X-CSE-MsgGUID: nYKG0IOYRtusQ2EVGRYL5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="66941112"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="66941112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 09:06:32 -0700
X-CSE-ConnectionGUID: jQO0uNmsSYS6bhQRpbxasw==
X-CSE-MsgGUID: kCiKWGWCQzKOJvcR9ofilQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="169772554"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 09:06:29 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH i-g-t v6 06/14] tools/gputop: find program name from command
 line
Date: Fri, 16 May 2025 16:05:43 +0000
Message-ID: <20250516160551.58760-7-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
References: <20250516160551.58760-1-jeevaka.badrappan@intel.com>
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

