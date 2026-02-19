Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FF7E9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 09:54:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479ED10E23C;
	Thu, 19 Feb 2026 09:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3hzVGph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8ADC10E280
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771494850; x=1803030850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZV5/lgpXlXhVs7RHOnjGjypVVK6dltmCFIezjOLK1U=;
 b=i3hzVGphewB80Hxc72TBj2NmoAYgp7Z/JrelrMfqkuYuDX+G3KO/nZ4M
 z8Osy2EWPoKjoaCAhwUKL0Tqo+PCfK/OKm0YMZYaRGE8s27lEXQL5ct54
 dT5moWwT8nwcPYQPm3RbgqKksntaRLGN5cXToQSpijJV8FgAjTDcF9W8b
 vrnnLCtrMTxa+YaJTxxzodJyDIdDWoMsOcelCzd+HoAJn8A7VQKj8Wrq6
 qboiCi4OmWrUirX6997LYaeuHrC+gOWVrS8dLu54T2zhqAv3NOseujIQu
 Tuxog1tOkO2QZsSYoq6/FV1WQsNwjxsV7ti2LZOfZaF67pXQ0aRzAQfEg g==;
X-CSE-ConnectionGUID: C6Y3twYxTl+q9u/tmwvYog==
X-CSE-MsgGUID: BsfSutsuQ/SZHxNoskFYgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="82901449"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="82901449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:54:09 -0800
X-CSE-ConnectionGUID: xUEo5IyDTMG3c7eQWZT0tw==
X-CSE-MsgGUID: MPqHPla/TxSPKi2nnjG29A==
X-ExtLoop1: 1
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:54:07 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com, vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v8 5/5] tools/gputop.src/gputop: Add command line option
 for device filter
Date: Thu, 19 Feb 2026 15:18:04 +0530
Message-Id: <20260219094804.835429-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219094804.835429-1-soham.purkait@intel.com>
References: <20260219094804.835429-1-soham.purkait@intel.com>
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
index d04c408f9..668a20275 100644
--- a/tools/gputop.src/gputop.c
+++ b/tools/gputop.src/gputop.c
@@ -418,6 +418,7 @@ static void clrscr(void)
 struct gputop_args {
 	long n_iter;
 	unsigned long delay_usec;
+	char *device;
 };
 
 static void countdown(const char *msg, const int start_sec)
@@ -456,7 +457,8 @@ static void help(char *full_path)
 	       "Options:\n"
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
-	       "\t-n, --iterations =NUMBER  number of executions\n\n"
+	       "\t-n, --iterations =NUMBER  number of executions\n"
+	       "\t-D, --device              Device filter\n\n"
 	       "Running without root:\n"
 	       "\tAs a non-root user, CAP_PERFMON or perf_event_paranoid is required to\n"
 	       "\taccess engine busyness\n"
@@ -487,11 +489,12 @@ static void help(char *full_path)
 
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
 
@@ -499,6 +502,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 	memset(args, 0, sizeof(*args));
 	args->n_iter = -1;
 	args->delay_usec = 2 * USEC_PER_SEC;
+	args->device = NULL;
 
 	for (;;) {
 		int c, idx = 0;
@@ -522,6 +526,9 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 				return -1;
 			}
 			break;
+		case 'D':
+			args->device = optarg;
+			break;
 		case 'h':
 			help(argv[0]);
 			return 0;
@@ -563,7 +570,8 @@ int main(int argc, char **argv)
 
 	n = args.n_iter;
 	period_us = args.delay_usec;
-	populate_device_instances("device:subsystem=pci,card=all");
+	populate_device_instances(args.device ? args.device
+				  : "device:subsystem=pci,card=all");
 
 	for (int i = 0; drivers[i]; i++) {
 		if (!per_driver_contexts[i].device_present)
-- 
2.34.1

