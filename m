Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30425C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 07:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45AA10E6D9;
	Wed, 30 Apr 2025 07:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oAcQTS0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2647110E6D9
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 07:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745997181; x=1777533181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8iAZIGwyMFjPvMRkzn4CKiG98AmrKqmAkfIdocQXTWY=;
 b=oAcQTS0Vf5p5n3fx+j2q/d35d3lNfY3JHMqyBOcTO186/yo7oLzUoUhG
 UFTK8g89WFTBQzuL2i3CGo4DJKvQ0BdS0n+XZsPzU4KN+CutLjiGQN4S9
 Ad7zU0cUkeAjs2fsDaXvutvyMCV6cMCcVVoal2tCFrWudAcPDmDZezU1D
 LnOJYYeM0BPeDxWRmy5T1JTKuvaHgiV9fCcWzupVpjPCzsqi2iztZ/FsS
 qZIv1ZJR+uFmKJLT7v2QRG7tStqMrIIwq7hPHcvrqkAA/ghlBBWbjIt01
 uTbhiwLTUxnZ1cD2zt1IgMmoAsDSqv/kM7ZIl18GyVMWC8a6qawEYiO4o A==;
X-CSE-ConnectionGUID: l+qLkMFPRJ+qtUeB3+Pvvw==
X-CSE-MsgGUID: aSU6twAzTYyO2ms04fU+YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73030126"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="73030126"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 00:13:01 -0700
X-CSE-ConnectionGUID: smNCJE4PS8O3yUYyQvWpKQ==
X-CSE-MsgGUID: 1ScmYzbMTBC28xYJi/KrQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="133965936"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 00:12:58 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH i-g-t v10 3/5] tools/gputop/utils: Add gputop utility
 functions common to all drivers
Date: Wed, 30 Apr 2025 12:38:22 +0530
Message-Id: <20250430070824.3012927-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430070824.3012927-1-soham.purkait@intel.com>
References: <20250430070824.3012927-1-soham.purkait@intel.com>
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

v2 : Fix for refactoring GPUTOP into a
     vendor-agnostic tool. (Lucas)

v3 : Headers in alphabetical order. (Kamil, Riana)

v4 : Fix source file naming and remove driver
     specific codes. (Riana)

v7 : Fix per-client engine width value with
     a macro replacing magic number. (Krzysztof)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
 tools/gputop/utils.c | 51 +++++++++++++++++++++++++++++++++++
 tools/gputop/utils.h | 64 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 tools/gputop/utils.c
 create mode 100644 tools/gputop/utils.h

diff --git a/tools/gputop/utils.c b/tools/gputop/utils.c
new file mode 100644
index 000000000..7f260dc05
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
+	const int w = PERCLIENT_ENGINE_WIDTH;
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
index 000000000..3c62f1c47
--- /dev/null
+++ b/tools/gputop/utils.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef COMMON_GPUTOP_H
+#define COMMON_GPUTOP_H
+
+#include <glib.h>
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
+#define PERCLIENT_ENGINE_WIDTH 8
+
+/**
+ * struct gputop_device
+ *
+ * @driver_present: It is set if at least a
+ * single device of the respective driver is
+ * found
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
+ * @gputop_init: Function to initialize GPUTOP object
+ * @init_engines: Function to initialize engines for the respective driver.
+ * @pmu_init: Function to initialize the PMU (Performance Monitoring Unit).
+ * @pmu_sample: Function to sample PMU data.
+ * @print_engines: Function to print engine business.
+ * @clean_up: Function to release resources.
+ */
+struct device_operations {
+	void (*gputop_init)(void *ptr,
+			    struct igt_device_card *card);
+	void *(*init_engines)(const void *obj);
+	int (*pmu_init)(const void *obj);
+	void (*pmu_sample)(const void *obj);
+	int (*print_engines)(const void *obj, int lines, int w, int h);
+	void (*clean_up)(void *obj, int len);
+};
+
+void print_percentage_bar(double percent, int max_len);
+int print_engines_footer(int lines, int con_w, int con_h);
+void n_spaces(const unsigned int n);
+
+#endif  /* COMMON_GPUTOP_H */
-- 
2.34.1

