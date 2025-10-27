Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B753CCF9EB
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 15:32:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14CE10E01F;
	Mon, 27 Oct 2025 15:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dashASov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A7B10E01F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761579174; x=1793115174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yhA5OXaHyGzqUERQ/TlNo4T/X5rhjuu2l+Ccg9lpPaM=;
 b=dashASovAzeQsl8RKnmRTd02v35bKxSPRZtnO1MgUjBxRu8+8xMBTFTB
 5GilMvRwtkDj8arhQ9oCZQxU/3Nq52w5O/admlQl62uwyHBH7GsL/PsAw
 7vqWMxn4DaifO182o8+JKN7u3jWTmIoWIhebw+4p2zTnrp2EfXo7lpNxi
 YKdiq6VCrgbFCXByBiINyBbg9J3Jo1iti7bLsERjjcPqMSJeUQc6QRnd1
 qJiQxcul/KBebLcawNAAoHpsgBpqeBhdT6AljY3pAKgm0WrZk/j8KcYVj
 JRj0XXG2a9abJQsIbz8vvQ9jn3eR1uVOXZTznVRUgGIFrXNxWsAzhh2ol Q==;
X-CSE-ConnectionGUID: jLPEZ3MkRdKl0+sKRUfAlg==
X-CSE-MsgGUID: GCEozM+MSiC6bnkRRFLNDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75005927"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="75005927"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:32:54 -0700
X-CSE-ConnectionGUID: P6pEqv6JRPqQblF+LjOV9w==
X-CSE-MsgGUID: ko/EuaxzRhmRfBhVOy8zVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="189109929"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.19])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 08:32:52 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Simon Fairweather <simon.n.fairweather@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v3] tools/intel_gpu_top: Add iteration option -n
Date: Mon, 27 Oct 2025 16:32:47 +0100
Message-ID: <20251027153247.109572-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.1
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
v3: reduced number of vars and changed printed help (Krzysztof)
  added description to man page (Tvrtko)

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 man/intel_gpu_top.rst |  6 +++++-
 tools/intel_gpu_top.c | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index 44a54a5f2..2f9bdac27 100644
--- a/man/intel_gpu_top.rst
+++ b/man/intel_gpu_top.rst
@@ -9,7 +9,7 @@ Display a top-like summary of Intel GPU usage
 :Author: IGT Developers <igt-dev@lists.freedesktop.org>
 :Date: 2023-01-27
 :Version: |PACKAGE_STRING|
-:Copyright: 2009,2011,2012,2016,2018,2019,2020,2023 Intel Corporation
+:Copyright: 2009,2011,2012,2016,2018,2019,2020,2023,2025 Intel Corporation
 :Manual section: |MANUAL_SECTION|
 :Manual group: |MANUAL_GROUP|
 
@@ -58,6 +58,10 @@ OPTIONS
 -m
    Default to showing all memory regions separately.
 
+-n <number>
+   Specify application running time as <number - 1> * <refresh period>
+
+
 RUNTIME CONTROL
 ===============
 
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 1bd88ba7c..e33272b3e 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1065,6 +1065,7 @@ usage(const char *appname)
 		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
 		"\t[-p]            Default to showing physical engines instead of classes.\n"
 		"\t[-m]            Default to showing all memory regions.\n"
+		"\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
 		"\n",
 		appname, DEFAULT_PERIOD_MS);
 	printf("To access interactive help, press 'h' while the application is running.\n");
@@ -2617,9 +2618,10 @@ int main(int argc, char **argv)
 	struct igt_device_card card;
 	char *codename = NULL;
 	struct timespec ts;
+	int iteration_count = 0;
 
 	/* Parse options */
-	while ((ch = getopt(argc, argv, "o:s:d:mpcJLlh")) != -1) {
+	while ((ch = getopt(argc, argv, "o:s:d:n:mpcJLlh")) != -1) {
 		switch (ch) {
 		case 'o':
 			output_path = optarg;
@@ -2630,6 +2632,9 @@ int main(int argc, char **argv)
 		case 'd':
 			opt_device = strdup(optarg);
 			break;
+		case 'n':
+			iteration_count = atoi(optarg);
+			break;
 		case 'p':
 			physical_engines = true;
 			break;
@@ -2857,6 +2862,12 @@ int main(int argc, char **argv)
 		if (disp_clients != iclients.clients)
 			free_display_clients(disp_clients);
 
+		if (iteration_count > 0) {
+			--iteration_count;
+			if (!iteration_count)
+				stop_top = true;
+		}
+
 		if (stop_top)
 			break;
 
-- 
2.51.1

