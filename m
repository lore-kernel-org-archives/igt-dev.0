Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556F7CCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 09:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138E110E082;
	Thu, 16 Oct 2025 09:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGHzQLXX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A8110E082
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 09:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760608616; x=1792144616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h+gVcDdyxKvOS2gKJHqRI5W+EJ6b3dk3RReXQlHjgdI=;
 b=IGHzQLXXhoyQ4++GgBmeamz+MLPH+ZHni7Ujq96N8J8oyib4LVD31mIs
 VrUE8Q42z5tymOGiK+ofVZVobybP0bLOOdHWGrwzZC3sA2/bGTTBFpVqE
 ahEqVAIyq9SYwT4n6pHH3jAf+KdfdOSchTMHIVyqzZdCeepUOJi1yYlUW
 G1WJusnCHhOFYXt6WMcscmBm1eNtnbZLy9sleBUfyDuqejhlwhMarCDOB
 0G6lafE33obXnaumrUIdxjukQx46fWmlDai3TPpt1U+50cBe6sh9F8OiJ
 r8bjA2VsezMrI4/1qkdtm+0T89BHC8S0J0EjhYYosGIEColep7eolt4rf w==;
X-CSE-ConnectionGUID: hAqRT/FwQfGSjdivztImKg==
X-CSE-MsgGUID: sERCNU8XTbypEzyGPCcX/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62840008"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62840008"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 02:56:56 -0700
X-CSE-ConnectionGUID: eDkb4TgBTiSrnuAoAcLgag==
X-CSE-MsgGUID: uoF43FavRPC9seT+gXj91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="182209496"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.225])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 02:56:55 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Simon Fairweather <simon.n.fairweather@gmail.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tools/intel_gpu_top: Add iteration option -n
Date: Thu, 16 Oct 2025 11:56:49 +0200
Message-ID: <20251016095649.31446-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

From: Simon Fairweather <simon.n.fairweather@gmail.com>

When using option -J or -c default is looping forever until user
break process. Lets introduce new option -n <number> and break
printing after reaching given number of iterations.

v2: corrected whitespaces, extended description (Kamil)

Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/intel_gpu_top.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 54e71e559..4bcac4b47 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1051,6 +1051,7 @@ usage(const char *appname)
 		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
 		"\t[-p]            Default to showing physical engines instead of classes.\n"
 		"\t[-m]            Default to showing all memory regions.\n"
+		"\t[-n]            Specify number of iterations. Can be used with -J or -c.\n"
 		"\n",
 		appname, DEFAULT_PERIOD_MS);
 	igt_device_print_filter_types();
@@ -2618,9 +2619,11 @@ int main(int argc, char **argv)
 	struct igt_device_card card;
 	char *codename = NULL;
 	struct timespec ts;
+	int iteration_value, iteration_count = 0;
+	bool iteration_check = false;
 
 	/* Parse options */
-	while ((ch = getopt(argc, argv, "o:s:d:mpcJLlh")) != -1) {
+	while ((ch = getopt(argc, argv, "o:s:d:n:mpcJLlh")) != -1) {
 		switch (ch) {
 		case 'o':
 			output_path = optarg;
@@ -2631,6 +2634,10 @@ int main(int argc, char **argv)
 		case 'd':
 			opt_device = strdup(optarg);
 			break;
+		case 'n':
+			iteration_check = true;
+			iteration_value = atoi(optarg);
+			break;
 		case 'p':
 			physical_engines = true;
 			break;
@@ -2858,6 +2865,12 @@ int main(int argc, char **argv)
 		if (disp_clients != iclients.clients)
 			free_display_clients(disp_clients);
 
+		if (iteration_check) {
+			iteration_count++;
+			if (iteration_count >= iteration_value)
+				stop_top = true;
+		}
+
 		if (stop_top)
 			break;
 
-- 
2.51.0

