Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F70C282C6
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 14:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A9310ECBA;
	Fri, 28 Feb 2025 14:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5pBQSae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C203110ECBA
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740752461; x=1772288461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EC6Bh7yh3xxIYcBYv6jCe7vjfBoCbkw13o1bTS/xy9Q=;
 b=m5pBQSaezh0jBbusukFc6QsiDXHxaJysUQRxGQofqVS46Rq/NJYbJWPe
 WURUHLHL5NoliG9c3QdFripQj3vEjA1AfCS8DHA8L1hQxFDxnsRw2oDAt
 l35rykbL8XXkILUeaqlmaOFu+Sg6FXbY86OOUVlpPJJuWOfd7Ahh8J3iB
 wDwtEiX9WbfCPpkyPFzepoOgTRnoMBehKXsrXYtIeeJ9YZeVP27V9wjEy
 WQ3QQOl2j7Sa0CY4W9MCXlkVZwPaNEH/bcUKwe1FKqO4+ncdfNF4vFHtI
 euZETt9OgANR34K7FnklX4BY9iOXkmzGuwqL+wNjhRBUfT1+GOzHG/6Iw g==;
X-CSE-ConnectionGUID: BUTIVtz0T4KQQZySTf57Vw==
X-CSE-MsgGUID: h+RuTCu6RvKvXFrdEtXM7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="51885201"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="51885201"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:21:01 -0800
X-CSE-ConnectionGUID: oCL/4HVzRt+coj1wbXGfIA==
X-CSE-MsgGUID: J05UwtNrTxGr+qKHAE6uVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="121955028"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:20:59 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, jonathan.ming.jun.lui@intel.com
Subject: [PATCH i-g-t v3 2/4] Add gputop functionality common to all drivers
Date: Fri, 28 Feb 2025 19:48:08 +0530
Message-Id: <20250228141810.1417657-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228141810.1417657-1-soham.purkait@intel.com>
References: <20250228141810.1417657-1-soham.purkait@intel.com>
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

v2 : fix for refactoring GPUTOP into a
     vendor-agnostic tool (Lucas)

v3 : Headers in alphabetical order (Kamil, Riana)

---
 tools/gputop/common_gputop.c | 79 ++++++++++++++++++++++++++++++++++++
 tools/gputop/common_gputop.h | 58 ++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 tools/gputop/common_gputop.c
 create mode 100644 tools/gputop/common_gputop.h

diff --git a/tools/gputop/common_gputop.c b/tools/gputop/common_gputop.c
new file mode 100644
index 000000000..578bd0a01
--- /dev/null
+++ b/tools/gputop/common_gputop.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#include <assert.h>
+
+#include "common_gputop.h"
+
+static const char * const bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
+
+/* tr_pmu_name()
+ *
+ * Transliterate pci_slot_id to sysfs device name entry for GPU
+ * from type struct igt_device_card.
+ * GPU PCI ID   ("xxxx:yy:zz.z")       device = "xe_xxxx_yy_zz.z".
+ */
+char *tr_pmu_name(const struct igt_device_card *card)
+{
+	int ret;
+	const int bufsize = 16;
+	char *buf, *device = NULL;
+
+	assert(card->pci_slot_name[0]);
+
+	device = malloc(bufsize);
+	assert(device);
+
+	ret = snprintf(device, bufsize, "xe_%s", card->pci_slot_name);
+	assert(ret == (bufsize - 1));
+
+	buf = device;
+	for (; *buf; buf++)
+		if (*buf == ':')
+			*buf = '_';
+
+	return device;
+}
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
diff --git a/tools/gputop/common_gputop.h b/tools/gputop/common_gputop.h
new file mode 100644
index 000000000..4e6f632af
--- /dev/null
+++ b/tools/gputop/common_gputop.h
@@ -0,0 +1,58 @@
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
+ * @populate_device_instances: Function to populate device instances.
+ * @discover_engines: Function to discover engines.
+ * @pmu_init: Function to initialize the PMU (Performance Monitoring Unit).
+ * @pmu_sample: Function to sample PMU data.
+ * @print_engines: Function to print engine business.
+ */
+struct device_operations {
+	void (*populate_device_instances)(struct gputop_device *dv);
+	void *(*discover_engines)(const void *obj);
+	int (*pmu_init)(const void *obj);
+	void (*pmu_sample)(const void *obj);
+	int (*print_engines)(const void *obj, int lines, int w, int h);
+};
+
+void print_percentage_bar(double percent, int max_len);
+int print_engines_footer(int lines, int con_w, int con_h);
+void n_spaces(const unsigned int n);
+char *tr_pmu_name(const struct igt_device_card *card);
+
+#endif // COMMON_GPUTOP_H
-- 
2.34.1

