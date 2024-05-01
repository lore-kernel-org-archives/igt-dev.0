Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDFBC25B4F
	for <igt-dev@archiver.kernel.org>; Wed,  1 May 2024 17:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC0A1123C2;
	Wed,  1 May 2024 17:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWbocKYQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A029D10F1E9
 for <igt-dev@lists.freedesktop.org>; Wed,  1 May 2024 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714584792; x=1746120792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+I3k0uT3Pj+qgXYtl6o7d4zncnqUUfP0UBCdnDyUvyk=;
 b=nWbocKYQM+fR/3f374LvsQOXUxczVgSc53zcYlycjHNs7U4Dz2hPkIXE
 0QvltkuzWDcEoohlUXN5MbLmbgJvB8uoRau9/sSyI46v15+D4UpYGCebC
 N81dOh8CcrRGJz+ZRPSd7/ALw9u5XDJFAxJ1lupID45i68ByPKAScHOAQ
 pSPa6oyrRtq4cBLJupxWWAirw/tyqr212LeEaLtH8DWRPPwe4po54ZyN4
 lUiBpi1ARU14g/L/bfFn6zt7vp7RedRsKMIDHMDuL7AQGZxzLx8PxVJZC
 gGHF8pnvkHvQSAx5PSo0/KAEGTYSQZYDQCchDKS1kfvWlnJ51rtPJhrS/ Q==;
X-CSE-ConnectionGUID: vw0M9/ILQ5K0vQ+fjBn1Jg==
X-CSE-MsgGUID: xzBK7YzMQmGbMKVg+BznLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10497107"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="10497107"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:12 -0700
X-CSE-ConnectionGUID: IcJc4x4WS4SFKBhxxL1zng==
X-CSE-MsgGUID: QvcD2cEbSQisjsRJmMdFPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; d="scan'208";a="26721830"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.109.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 10:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/4] gputop: Allow to set delay interval
Date: Wed,  1 May 2024 12:33:03 -0500
Message-ID: <20240501173303.115737-5-lucas.demarchi@intel.com>
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

Like `top` and `htop`, allow to pass -d, --delay =SEC[.TENTHS] as
argument.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_core.h |  1 +
 tools/gputop.c | 21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 26bb0cb68..084d94da7 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1489,6 +1489,7 @@ void igt_kmsg(const char *format, ...);
 
 #define MSEC_PER_SEC (1000)
 #define USEC_PER_SEC (1000*MSEC_PER_SEC)
+#define USEC_PER_DECISEC (100*MSEC_PER_SEC)
 #define NSEC_PER_SEC (1000*USEC_PER_SEC)
 
 #define for_if(expr__) if (!(expr__)) {} else
diff --git a/tools/gputop.c b/tools/gputop.c
index 1ac382a7e..5634fa58a 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -26,6 +26,7 @@
 #include <sys/sysmacros.h>
 #include <stdbool.h>
 
+#include "igt_core.h"
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
 #include "drmtest.h"
@@ -294,6 +295,7 @@ static void clrscr(void)
 
 struct gputop_args {
 	long n_iter;
+	unsigned long delay_usec;
 };
 
 static void help(void)
@@ -302,15 +304,17 @@ static void help(void)
 	       "\t%s [options]\n\n"
 	       "Options:\n"
 	       "\t-h, --help                show this help\n"
+	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
 	       "\t-n, --iterations =NUMBER  number of executions\n"
 	       , program_invocation_short_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = "hn:";
+	static const char cmdopts_s[] = "hn:d:";
 	static const struct option cmdopts[] = {
 	       {"help", no_argument, 0, 'h'},
+	       {"delay", required_argument, 0, 'd'},
 	       {"iterations", required_argument, 0, 'n'},
 	       { }
 	};
@@ -318,9 +322,11 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	/* defaults */
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
+	args->delay_usec = 2 * USEC_PER_SEC;
 
 	for (;;) {
 		int c, idx = 0;
+		char *end_ptr = NULL;
 
 		c = getopt_long(argc, argv, cmdopts_s, cmdopts, &idx);
 		if (c == -1)
@@ -330,6 +336,16 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 		case 'n':
 			args->n_iter = strtol(optarg, NULL, 10);
 			break;
+		case 'd':
+			args->delay_usec = strtoul(optarg, &end_ptr, 10) * USEC_PER_SEC;
+			if (*end_ptr == '.')
+				args->delay_usec += strtoul(end_ptr + 1, &end_ptr, 10) * USEC_PER_DECISEC;
+
+			if (!args->delay_usec) {
+				fprintf(stderr, "Invalid delay value: %s\n", optarg);
+				return -1;
+			}
+			break;
 		case 'h':
 			help();
 			return 0;
@@ -345,7 +361,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 int main(int argc, char **argv)
 {
 	struct gputop_args args;
-	unsigned int period_us = 2e6;
+	unsigned int period_us;
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
 	int ret;
@@ -358,6 +374,7 @@ int main(int argc, char **argv)
 		return EXIT_SUCCESS;
 
 	n = args.n_iter;
+	period_us = args.delay_usec;
 
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
-- 
2.45.0

