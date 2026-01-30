Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC03CD49C94
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 09:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C87D10E2C4;
	Fri, 30 Jan 2026 09:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2ZrkZPX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C2F10E2C4
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769767125; x=1801303125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2G32URO/QrKrf+gkl+2fdFGdoXButrT3EQlQ4S/WO8o=;
 b=a2ZrkZPXxREja6yUL8reK2kZqAAVlO+ZQb0E++N6uVw9pF6OjueT5pst
 skdZjFYWlSlofL3brEeLUmFrX+P4NVJ+sR36rs3b94seAIlMUMaplhgNo
 X4b2a6+LKudw5Qb+OrNWCL19rP8xyamXwMT4RszQvjjUlqFDMTlnq8T9u
 pIkZw3B/G2tTCmd2H2lF4Ksdr3MzZ1xiIxXv8pnSR5K9ciMrNmWCzLC5u
 V8IWIQsLz4EKusFuNXGakMZMfEkHZssDPvCNT+EpESR1qOZeNiz7T2d+m
 uruyKH0XjMVeVwLGF8kXoOoj2c1V+ZSRiMpEYFbnwHzqyyOhITWn+mAMu w==;
X-CSE-ConnectionGUID: eAIkk8oXShSFh4k/KNGgkA==
X-CSE-MsgGUID: +aDkQAn2T1q3YksBlfUguA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58595955"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="58595955"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:58:45 -0800
X-CSE-ConnectionGUID: fepv32TERPuhVmaWgw26wQ==
X-CSE-MsgGUID: Gaa+txIHS7SzzsoaE1RRRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208414011"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:58:42 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v7 5/5] tools/gputop.src/gputop: Add command line option
 for device filter
Date: Fri, 30 Jan 2026 15:23:18 +0530
Message-Id: <20260130095318.644256-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130095318.644256-1-soham.purkait@intel.com>
References: <20260130095318.644256-1-soham.purkait@intel.com>
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

