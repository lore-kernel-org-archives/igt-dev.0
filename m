Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F199FC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 09:28:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B419A10E047;
	Fri,  2 Aug 2024 09:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dt7Is+t9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D558D10E047
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2024 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722590894; x=1754126894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gj0z+YZ+J+ocTg2cuq17G/gADTLAGd79cV2tOceUQIA=;
 b=dt7Is+t912cRebDDBEXGARSWyaAdSKPl2YFnUGQzud4FMXjLwFjmA2ty
 WsX+ZNs39T5+XTtPoNn0l8nN74DUVK/aVwSz4IfMeVGzy2v8tosRM4SQo
 BK9rD2AsN2gBIul/9ONE4YxhVmDfvT4mfDr2aLzLB/mn6rhBRxdn/AmNL
 wWg4ekOLRFO6aYHHat9K6fE5nc8vIFUXlh5H+R7Mx9u0Sdw2vusEvFCha
 mjXS6E6tmr1KEsrKrOCMbDczDjTENWYZoJQ+HKRAvnN+5x9FD/6dGerf8
 MjOe2jUvKhEpQBf40p4l74V5LlDcwMiA+SRIyXDucNyRRC84I75cDMiYN g==;
X-CSE-ConnectionGUID: SbTVhpSYQ6qSLySFSjlesw==
X-CSE-MsgGUID: AQnfEspjQLy0CBu/RIsBww==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31750531"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="31750531"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 02:28:03 -0700
X-CSE-ConnectionGUID: rO8ZY2jiQ8SZ572m1dy88Q==
X-CSE-MsgGUID: qdInnpwGSraLhHWcP/y2VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="60165692"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.94])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 02:28:02 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 1/1] tools/lsgpu: Introduce version printing
Date: Fri,  2 Aug 2024 11:27:45 +0200
Message-ID: <20240802092746.22001-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802092746.22001-1-kamil.konieczny@linux.intel.com>
References: <20240802092746.22001-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add version information for the lsgpu tool. You can now show it
with long option --version or short -v, for example:
./lsgpu --version

Also while at this, update copyright years and sort out include
headers.

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/lsgpu.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/tools/lsgpu.c b/tools/lsgpu.c
index bdc6671fe..2bf2cf5f0 100644
--- a/tools/lsgpu.c
+++ b/tools/lsgpu.c
@@ -1,5 +1,5 @@
 /*
- * Copyright © 2019 Intel Corporation
+ * Copyright © 2019-2024 Intel Corporation
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -22,15 +22,16 @@
  *
  */
 
-#include "igt_device_scan.h"
-#include "igt.h"
-#include <sys/ioctl.h>
-#include <fcntl.h>
 #include <errno.h>
-#include <string.h>
-#include <signal.h>
+#include <fcntl.h>
 #include <glib.h>
 #include <libudev.h>
+#include <string.h>
+#include <signal.h>
+#include <sys/ioctl.h>
+
+#include "igt.h"
+#include "igt_device_scan.h"
 
 /**
  * SECTION:lsgpu
@@ -80,12 +81,14 @@ enum {
 	OPT_DEVICE         = 'd',
 	OPT_HELP           = 'h',
 	OPT_PCISCAN        = 'P',
+	OPT_VERSION        = 'V',
 };
 
 static bool g_show_vendors;
 static bool g_list_filters;
 static bool g_help;
 static bool g_pciscan;
+static bool g_version;
 static char *igt_device;
 
 static const char *usage_str =
@@ -99,12 +102,21 @@ static const char *usage_str =
 	"  -v, --list-vendors          List recognized vendors\n"
 	"  -l, --list-filter-types     List registered device filters types\n"
 	"  -d, --device filter         Device filter, can be given multiple times\n"
+	"  -V, --version               Show version information and exit\n"
 	"  -h, --help                  Show this help message and exit\n"
 	"\nOptions valid for default print out mode only:\n"
 	"      --drm                   Show DRM filters (default) for each device\n"
 	"      --sysfs                 Show sysfs filters for each device\n"
 	"      --pci                   Show PCI filters for each device\n";
 
+static void show_version(void)
+{
+	printf("lsgpu version 1.0\n"
+	       "Copyright © 2019-2024 Intel Corporation\n"
+	       "This is free software; see the source for copying conditions.  There is NO\n"
+	       "warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n");
+}
+
 static void test_device_open(struct igt_device_card *card)
 {
 	int fd;
@@ -256,6 +268,7 @@ int main(int argc, char *argv[])
 		{"list-filter-types", no_argument,       NULL, OPT_LIST_FILTERS},
 		{"device",            required_argument, NULL, OPT_DEVICE},
 		{"help",              no_argument,       NULL, OPT_HELP},
+		{"version",           no_argument,       NULL, OPT_VERSION},
 		{0, 0, 0, 0}
 	};
 	int c, ret = 0, index = 0;
@@ -264,7 +277,7 @@ int main(int argc, char *argv[])
 			.type = IGT_PRINT_USER,
 	};
 
-	while ((c = getopt_long(argc, argv, "ncspvld:hP",
+	while ((c = getopt_long(argc, argv, "ncspvld:hPV",
 				long_options, &index)) != -1) {
 		switch(c) {
 
@@ -295,6 +308,9 @@ int main(int argc, char *argv[])
 		case OPT_PCISCAN:
 			g_pciscan = true;
 			break;
+		case OPT_VERSION:
+			g_version = true;
+			break;
 		case 0:
 			fmt.option = IGT_PRINT_DRM;
 			break;
@@ -315,6 +331,11 @@ int main(int argc, char *argv[])
 		exit(0);
 	}
 
+	if (g_version) {
+		show_version();
+		exit(0);
+	}
+
 	if (g_show_vendors) {
 		igt_devices_print_vendors();
 		return 0;
-- 
2.43.0

