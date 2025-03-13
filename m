Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE43C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 06:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBF010E02B;
	Thu, 13 Mar 2025 06:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqHyynV6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AFC10E7F9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741847119; x=1773383119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LOrItPA/qcahwFLrM0aCRn3SiGeQXU48rwaIboUooBc=;
 b=LqHyynV6blNJt7GCms0p4PKNF/GwZlmvllcn6+JMxN10wY/ZPNQMrC2q
 +xcUNDd2oxT1sNf3qIRE8Jid8c2Ll0Bpa4p/SgdnjwCgMgH6PqgTr+ANn
 YqeonULHTL554I6R/jYbjZ8sm/t4BcTz33kbn2fqIInUhuX0AKaDJdJJb
 ZFtDMbF3nW3xlTZtt2p8rwRPakF7uwZNLLoP0DH7pEKktUzHlm8s7UGfv
 WuwlLmWCn2TeBckxJtI9RNvEpL0y1ew0ZSRtiOrMYtfdXkVvQWUVRlQgu
 JAWwuM5IlUb8M1c8lnyWjZSKkkX08X2tULDaYNc572CtRFJBpuWqwrAQX A==;
X-CSE-ConnectionGUID: A+EZI335Tm213uCJGonusg==
X-CSE-MsgGUID: yt+NQ2vYQVWRZwn8ziH0ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42829724"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="42829724"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:18 -0700
X-CSE-ConnectionGUID: byRgANDKRCexxs5VPPWrDw==
X-CSE-MsgGUID: Q/aaJC5ZR1aI8PZucTWyPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="158022894"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 23:25:09 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH <i-g-t> v4 2/4] tools/gputop/utils: Add gputop utility
 functions common to all drivers
Date: Thu, 13 Mar 2025 11:51:52 +0530
Message-Id: <20250313062154.1601701-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313062154.1601701-1-soham.purkait@intel.com>
References: <20250313062154.1601701-1-soham.purkait@intel.com>
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

    Implement utility functions in gputop for common
operations and data handling across different drivers.

v2 : fix for refactoring GPUTOP into a
     vendor-agnostic tool (Lucas)

v3 : Headers in alphabetical order (Kamil, Riana)

v4 : fix source file naming and remove driver
     specific codes (Riana)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/utils.c | 51 ++++++++++++++++++++++++++++++++++++++++
 tools/gputop/utils.h | 55 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h

diff --git a/tools/gputop/utils.c b/tools/gputop/utils.c
new file mode 100644
index 000000000..78dca415f
--- /dev/null
+++ b/tools/gputop/utils.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include <assert.h>
+
+#include "utils.h"
+
+static const char * const bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
+
+void n_spaces(const unsigned int n)
+{
+	unsigned int i;
+
+	for (i = 0; i < n; i++)
+		putchar(' ');
+}
+
+void print_percentage_bar(double percent, int max_len)
+{
+	int bar_len, i, len = max_len - 1;
+	const int w = 8;
+
+	len -= printf("|%5.1f%% ", percent);
+
+	/* no space left for bars, do what we can */
+	if (len < 0)
+		len = 0;
+
+	bar_len = ceil(w * percent * len / 100.0);
+	if (bar_len > w * len)
+		bar_len = w * len;
+
+	for (i = bar_len; i >= w; i -= w)
+		printf("%s", bars[w]);
+	if (i)
+		printf("%s", bars[i]);
+
+	len -= (bar_len + (w - 1)) / w;
+	n_spaces(len);
+
+	putchar('|');
+}
+
+int print_engines_footer(int lines, int con_w, int con_h)
+{
+	if (lines++ < con_h)
+		printf("\n");
+
+	return lines;
+}
diff --git a/tools/gputop/utils.h b/tools/gputop/utils.h
new file mode 100644
index 000000000..7030f04bd
--- /dev/null
+++ b/tools/gputop/utils.h
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef COMMON_GPUTOP_H
+#define COMMON_GPUTOP_H
+
+#include <math.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+#include "igt_device_scan.h"
+
+#define ANSI_HEADER "\033[7m"
+#define ANSI_RESET "\033[0m"
+
+/**
+ * struct gputop_device
+ *
+ * @driver_present: It is set if at least a
+ * single device found of the respective driver
+ * @len: Number of total device discovered
+ * of the respective driver
+ * @instances: pointer to the array of
+ * discovered instances of the devices
+ * of the same driver
+ */
+struct gputop_device {
+	bool driver_present;
+	int len;
+	void *instances;
+};
+
+/**
+ * struct device_operations - Structure to hold function
+ * pointers for device specific operations for each individual driver.
+ * @discover_engines: Function to discover engines.
+ * @pmu_init: Function to initialize the PMU (Performance Monitoring Unit).
+ * @pmu_sample: Function to sample PMU data.
+ * @print_engines: Function to print engine business.
+ */
+struct device_operations {
+	void *(*discover_engines)(const void *obj);
+	int (*pmu_init)(const void *obj);
+	void (*pmu_sample)(const void *obj);
+	int (*print_engines)(const void *obj, int lines, int w, int h);
+};
+
+void print_percentage_bar(double percent, int max_len);
+int print_engines_footer(int lines, int con_w, int con_h);
+void n_spaces(const unsigned int n);
+
+#endif  /* COMMON_GPUTOP_H */
-- 
2.34.1

