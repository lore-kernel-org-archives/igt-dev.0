Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8333C25B4F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 23:44:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E68113777;
	Tue, 23 Apr 2024 23:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxfhRwDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C105B113766
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 23:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713915830; x=1745451830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/C+peLRCQhUgfjSXT5e4HHFAqRD+BKz7WCeN+N6r1ds=;
 b=AxfhRwDNcay1fJ0Kwsr6TP5h1VzAw6x2um+jFZbkozvM4dNAqMLt6y65
 agH6GrL66Z3ke2dbJ3syeJiQKl3KTV2xmjZy6QAZeVSFtMtFzXYs6DukV
 6sxHkzTjJFrAh8p6LOnjEImJSpLjdFK25ieTFrLVanU/MBXl//gH8Ga5Y
 MT2fdxcJSxnWpmmCsLaXPndc25GWyisLYz6/RdvYpQcjg58MGErMwoZIS
 BycaUWo1K4UTPDyJR6H6uxQ4yGuD83xnSpLcfMCFh1/27qkpj7LSLLvhm
 WKOFaVUzN0U4A490xaPXAeJC1KdBrt30kxbP1hGxY51STBkkASmW0swtV g==;
X-CSE-ConnectionGUID: W5VN7pV8RQC/fRkintNhmQ==
X-CSE-MsgGUID: i+yeCHRaQpykAI7gXRbqPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13362023"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13362023"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:50 -0700
X-CSE-ConnectionGUID: +5Bt6Y5RS+2a+I14/sRIUw==
X-CSE-MsgGUID: Os+K/QX4RsW7Z29iKb1HDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29180959"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 16:43:49 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 20/21] gputop: Allow to set delay interval
Date: Tue, 23 Apr 2024 16:44:30 -0700
Message-ID: <20240423234431.1959354-21-lucas.demarchi@intel.com>
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
index e99aa56e5..80481f738 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -26,6 +26,7 @@
 #include <sys/sysmacros.h>
 #include <stdbool.h>
 
+#include "igt_core.h"
 #include "igt_drm_clients.h"
 #include "igt_drm_fdinfo.h"
 #include "drmtest.h"
@@ -302,6 +303,7 @@ static void clrscr(void)
 
 struct gputop_args {
 	long n_iter;
+	unsigned long delay_usec;
 };
 
 static void help(void)
@@ -310,15 +312,17 @@ static void help(void)
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
@@ -326,9 +330,11 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	/* defaults */
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
+	args->delay_usec = 2 * USEC_PER_SEC;
 
 	for (;;) {
 		int c, idx = 0;
+		char *end_ptr = NULL;
 
 		c = getopt_long(argc, argv, cmdopts_s, cmdopts, &idx);
 		if (c == -1)
@@ -338,6 +344,16 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
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
@@ -353,7 +369,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 int main(int argc, char **argv)
 {
 	struct gputop_args args;
-	unsigned int period_us = 2e6;
+	unsigned int period_us;
 	struct igt_drm_clients *clients = NULL;
 	int con_w = -1, con_h = -1;
 	int ret;
@@ -366,6 +382,7 @@ int main(int argc, char **argv)
 		return EXIT_SUCCESS;
 
 	n = args.n_iter;
+	period_us = args.delay_usec;
 
 	clients = igt_drm_clients_init(NULL);
 	if (!clients)
-- 
2.43.0

