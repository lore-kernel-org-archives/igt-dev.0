Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D23C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 06:42:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E81610E8EB;
	Thu, 22 Jan 2026 06:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bamwqAKt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9013E10E8F1
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 06:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769064141; x=1800600141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2G32URO/QrKrf+gkl+2fdFGdoXButrT3EQlQ4S/WO8o=;
 b=bamwqAKt9v5x2y6vzyRfygRrSDDt8J7bdK9s8MYAsQP6KY7OiSJmIzsW
 NGZ+bD5Vvjt2w3IrTLs/RgIUNWBZcvxKSoMk4tcs1iCzxpZZzWNxaZ2Ns
 IokwQVnxDNW5tGZr6N6d2Cv4/nr18QXw5EF6TLXPUFdZJuSUBux1r5cLX
 ESaGVNP7Dk9GpILNZbfBmu5cgJOeOWSYDUTRiPTSLEu2qP9KcR7EisLEY
 6QJhfg696NuSgZWoBuQbAJ68LI1/lhBMOzeKqUGLHG+9+p23vGDpMwWB6
 D7VLbsVck7NZpmNg1JPQDVnLw0sJmPk4OKY2CzTcgoGN5Dehl5d+Q3duO w==;
X-CSE-ConnectionGUID: FF9YJJldQDa0OnYgg8DpmQ==
X-CSE-MsgGUID: trJo6T/yQl6c1elZaNOw2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="74152312"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="74152312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 22:42:20 -0800
X-CSE-ConnectionGUID: +zGPYh4XQfa7mVz+EzrRag==
X-CSE-MsgGUID: 5wAWMRv8SIOh2vY2HJdJDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="210807539"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 22:42:18 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v5 5/5] tools/gputop.src/gputop: Add command line option
 for device filter
Date: Thu, 22 Jan 2026 12:07:02 +0530
Message-Id: <20260122063702.524450-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122063702.524450-1-soham.purkait@intel.com>
References: <20260122063702.524450-1-soham.purkait@intel.com>
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

With a new command-line option for device filtering, the engine
busyness for the specific device could be selected.

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop.src/gputop.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/gputop.src/gputop.c b/tools/gputop.src/gputop.c
index 7d4515f8f..e803db99e 100644
--- a/tools/gputop.src/gputop.c
+++ b/tools/gputop.src/gputop.c
@@ -412,6 +412,7 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	char *device;
 };
 
 static void countdown(const char *msg, const int start_sec)
@@ -450,7 +451,8 @@ static void help(char *full_path)
 	       "Options:\n"
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
-	       "\t-n, --iterations =NUMBER  number of executions\n\n"
+	       "\t-n, --iterations =NUMBER  number of executions\n"
+	       "\t-D, --device              Device filter\n\n"
 	       "Running without root:\n"
 	       "\tAs a non-root user, CAP_PERFMON or perf_event_paranoid is required to\n"
 	       "\taccess engine busyness\n"
@@ -481,11 +483,12 @@ static void help(char *full_path)
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = "hn:d:";
+	static const char cmdopts_s[] = "hn:d:D:";
 	static const struct option cmdopts[] = {
 	       {"help", no_argument, 0, 'h'},
 	       {"delay", required_argument, 0, 'd'},
 	       {"iterations", required_argument, 0, 'n'},
+	       {"device", required_argument, 0, 'D'},
 	       { }
 	};
 
@@ -493,6 +496,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
 	args->delay_usec = 2 * USEC_PER_SEC;
+	args->device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -516,6 +520,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args->device = optarg;
+			break;
 		case 'h':
 			help(argv[0]);
 			return 0;
@@ -557,7 +564,8 @@ int main(int argc, char **argv)
 
 	n = args.n_iter;
 	period_us = args.delay_usec;
-	populate_device_instances("device:subsystem=pci,card=all");
+	populate_device_instances(args.device ? args.device
+				  : "device:subsystem=pci,card=all");
 
 	for (int i = 0; drivers[i]; i++) {
 		if (!per_driver_contexts[i].device_present)
-- 
2.34.1

