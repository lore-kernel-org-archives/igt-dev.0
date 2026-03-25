Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18754109C035
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 15:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6AE10E7BC;
	Wed, 25 Mar 2026 15:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKrdXHMH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E01410E7BD
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453071; x=1805989071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rrk1/KAg4354w/r78UMVIqcxDTzZ6Vj689HwKN30Yjw=;
 b=HKrdXHMHeKL70WO7RmyvFryxEjIaNyY6XjS1vbzvw4md+otRMHgt06+2
 1kx2IfdTwFmqPdBxSmCxc2v0TEtfAxacnE9/WVxDpJybYXrevZzozRmpQ
 iaOye+QL4K9XEM3oTfQgmuO+44lcnCi73uCKvHI9QhzxYIp5Eyp3pDs18
 JclgEa8geTFgrAVzlC1QynU1+Zh9tZ0m04jSofupyu0e+FqjQzEBH9b4A
 IhOUlvxMZmLTQzox2obxiU8CnsjR1ttzn9kr+9bLncngDA2xmwQA1nScq
 0ax4F5MRY5b4HIgG6ElBwzZjxl0G62otfbgR94k3ZSO2aiIDtzUBH1JCp Q==;
X-CSE-ConnectionGUID: Nqab3PkzRzGjZddvIW+tQA==
X-CSE-MsgGUID: d/7rCQNITEyRAv2ClLsebQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75209604"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75209604"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:37:51 -0700
X-CSE-ConnectionGUID: K+c+wOG3SlWT7bgokSuUDA==
X-CSE-MsgGUID: JfuBDHNYT16hrbVHmXO/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="228784719"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:37:46 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 tvrtko.ursulin@igalia.com, tursulin@ursulin.net, lucas.de.marchi@gmail.com
Subject: [PATCH i-g-t v9 5/5] tools/gputop.src/gputop: Add command line option
 for device filter
Date: Wed, 25 Mar 2026 21:00:38 +0530
Message-Id: <20260325153038.2099329-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325153038.2099329-1-soham.purkait@intel.com>
References: <20260325153038.2099329-1-soham.purkait@intel.com>
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
index 479897f40..a2e3578cc 100644
--- a/tools/gputop.src/gputop.c
+++ b/tools/gputop.src/gputop.c
@@ -610,6 +610,7 @@ struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
 	bool verbose;
+	char *device;
 };
 
 static void countdown(const char *msg, const int start_sec)
@@ -651,7 +652,8 @@ static void help(char *full_path)
 	       " non-root mode if neither CAP_PERFMON is set nor perf_event_paranoid is"
 	       " permissive.\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
-	       "\t-n, --iterations =NUMBER  number of executions\n\n"
+	       "\t-n, --iterations =NUMBER  number of executions\n"
+	       "\t-D, --device              Device filter\n\n"
 	       "Running without root:\n"
 	       "\tAs a non-root user, CAP_PERFMON or perf_event_paranoid is required to\n"
 	       "\taccess engine busyness\n"
@@ -682,12 +684,13 @@ static void help(char *full_path)
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 {
-	static const char cmdopts_s[] = "hvn:d:";
+	static const char cmdopts_s[] = "hvn:d:D:";
 	static const struct option cmdopts[] = {
 	       {"help", no_argument, 0, 'h'},
 	       {"delay", required_argument, 0, 'd'},
 	       {"iterations", required_argument, 0, 'n'},
 	       {"verbose", no_argument, 0, 'v'},
+	       {"device", required_argument, 0, 'D'},
 	       { }
 	};
 
@@ -696,6 +699,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	args->n_iter = -1;
 	args->delay_usec = 2 * USEC_PER_SEC;
 	args->verbose = false;
+	args->device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -722,6 +726,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args->device = optarg;
+			break;
 		case 'h':
 			help(argv[0]);
 			return 0;
@@ -763,7 +770,8 @@ int main(int argc, char **argv)
 
 	n = args.n_iter;
 	period_us = args.delay_usec;
-	populate_device_instances("device:subsystem=pci,card=all");
+	populate_device_instances(args.device ? args.device
+				  : "device:subsystem=pci,card=all");
 
 	for (int i = 0; drivers[i]; i++) {
 		if (!per_driver_contexts[i].device_present)
-- 
2.34.1

