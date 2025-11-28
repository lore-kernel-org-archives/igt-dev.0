Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E4DD116E2
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 17:23:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A4210E18B;
	Fri, 28 Nov 2025 17:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ing8rkKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5F410E8F9
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 17:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764350612; x=1795886612;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y+ksbLg3jV4pXRYSiK7X9Kr2qOO6hzH5JmxaQaU/CqQ=;
 b=ing8rkKP7zXCvNn/izZKD0r83fZPWr/AGAiOjjE4e8pz/9bO1+YCl8Ib
 I9tX2+z13Bv5OVhuvlRtAvi2x/GRD0LPnxMNMfcLCgOG+28sK1atR+p/b
 UnwLSJ/H+TIfnAlFVNPAp6izbwxss5Gb3RnWdyf2XXVs5Yh6K6rLhSiAi
 rq5IC/QmAPmjZ+o/GmNO/AO3x06CFrh/v26q4M6fZYh1IPXUJVourLPz4
 rGTs5OYZVd9yAmXGqULKWdNOOMx/KOrvQYGhqhIkmnSNbszOYTqjxbYsg
 9Gh1PhUdMFpYtxJ8LHxY7s53EjBJi/9G584UBy74pULPHF+CRilLbYZL2 Q==;
X-CSE-ConnectionGUID: Up7NOyJoQ+2Y7jCZG3mErQ==
X-CSE-MsgGUID: KuAWu4KbQ0a6vTRtvdIyYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77744312"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="77744312"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 09:23:32 -0800
X-CSE-ConnectionGUID: ukaIhOJRTJyeRJrDWdSitA==
X-CSE-MsgGUID: nJe7d2RgREqepAtEJwAvsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="193173413"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.240])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 09:23:31 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Simon Fairweather <simon.n.fairweather@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v4] tools/intel_gpu_top: Add iteration option -n
Date: Fri, 28 Nov 2025 18:23:26 +0100
Message-ID: <20251128172326.92483-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

When using option -c, -J or -l default is looping forever until
user break process. Lets introduce new option -n <number> and
break printing after reaching given number of iterations. Also
while at it, update copyright year in man page.

v2: corrected whitespaces, extended description (Kamil)
v3: reduced number of vars and changed printed help (Krzysztof)
  added description to man page (Tvrtko)
v4: improved help (Krzysztof), changed var to long, update
  copyright year, added also -l option in description, added
  closes tag (Kamil)

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/173
Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 man/intel_gpu_top.rst | 10 +++++++++-
 tools/intel_gpu_top.c | 19 ++++++++++++++++++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
index 44a54a5f2..20204fdcf 100644
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
 
@@ -58,6 +58,14 @@ OPTIONS
 -m
    Default to showing all memory regions separately.
 
+-n <number>
+   Specify application running time as <number - 1> * <refresh period>.
+   Passing 0 (default) or negative number will run it in infinite loop
+   until user breaks with q or Ctrl-C or sends a signal. With options
+   -c, -J or -l it will print info <number> times.
+
+
+
 RUNTIME CONTROL
 ===============
 
diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
index 1bd88ba7c..fd6ad7b5e 100644
--- a/tools/intel_gpu_top.c
+++ b/tools/intel_gpu_top.c
@@ -1065,6 +1065,11 @@ usage(const char *appname)
 		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
 		"\t[-p]            Default to showing physical engines instead of classes.\n"
 		"\t[-m]            Default to showing all memory regions.\n"
+		"\t[-n <number>]   Specify running time as <number - 1> * <refresh period>.\n"
+		"\t                Passing 0 (default) or negative number will run it in\n"
+		"\t                infinite loop until user breaks with q or Ctrl-C or sends\n"
+		"\t                a signal. With options -c, -J or -l it will print info\n"
+		"\t                <number> times.\n"
 		"\n",
 		appname, DEFAULT_PERIOD_MS);
 	printf("To access interactive help, press 'h' while the application is running.\n");
@@ -2617,9 +2622,10 @@ int main(int argc, char **argv)
 	struct igt_device_card card;
 	char *codename = NULL;
 	struct timespec ts;
+	long iteration_count = 0;
 
 	/* Parse options */
-	while ((ch = getopt(argc, argv, "o:s:d:mpcJLlh")) != -1) {
+	while ((ch = getopt(argc, argv, "o:s:d:n:mpcJLlh")) != -1) {
 		switch (ch) {
 		case 'o':
 			output_path = optarg;
@@ -2630,6 +2636,11 @@ int main(int argc, char **argv)
 		case 'd':
 			opt_device = strdup(optarg);
 			break;
+		case 'n':
+			iteration_count = atol(optarg);
+			if (iteration_count < 0)
+				iteration_count = 0;
+			break;
 		case 'p':
 			physical_engines = true;
 			break;
@@ -2857,6 +2868,12 @@ int main(int argc, char **argv)
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
2.52.0

