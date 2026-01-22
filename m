Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDABD625FD
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 08:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D486510E955;
	Thu, 22 Jan 2026 08:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmAjsPro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E3110E950
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 08:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769071877; x=1800607877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2G32URO/QrKrf+gkl+2fdFGdoXButrT3EQlQ4S/WO8o=;
 b=LmAjsProkBz42p4SG6rGxuI79Ght+PpYHBiwUGemMicuBLBXYM3iC3Gs
 PMjg1zCG7qA57h+UZKAPuunJeOt9Qt2K8DWHWFhEi9qMhMXLAsNdNQpqO
 kuFa0k2kx7VL6chA/5UoWtAB1BSjLUm+n7G4V6uBAUrDHi8H3rmkKrDQ3
 g00pCE5UukEBCBFODkHzv0s8yBfqiHqZ8unb6EuJa6I2cT2KcZNoOZuRu
 UpRMx6j5ReHL5n7nfinlz6ZknB2n/NKCIibpkvppxwwjXXooCsMfkdfgi
 etTVEXQ6uEdywiXL0x4SpqwKnD82yGfGv7EljVqCdTS8PLgLTMa+6cx/0 A==;
X-CSE-ConnectionGUID: 8aBYudR2Qu+f/cNFi2yuAg==
X-CSE-MsgGUID: QBbmBUFTRhy8ZHB1jUl0bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70031165"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="70031165"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:50:46 -0800
X-CSE-ConnectionGUID: nJkiOiDWQ1S0cqIVU6alJw==
X-CSE-MsgGUID: t0WHHk28Rk+yiBnMLje4ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="244280636"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:50:43 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v5 5/5] tools/gputop.src/gputop: Add command line option
 for device filter
Date: Thu, 22 Jan 2026 14:15:26 +0530
Message-Id: <20260122084526.538837-6-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122084526.538837-1-soham.purkait@intel.com>
References: <20260122084526.538837-1-soham.purkait@intel.com>
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

