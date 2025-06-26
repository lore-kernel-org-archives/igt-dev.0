Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78545C7EE33
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 09:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD3510E866;
	Thu, 26 Jun 2025 09:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m34S9laG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83C010E866
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 09:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750929766; x=1782465766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bbI5sbXRFByw8+A5Hjt79U+UmZ48R/3vx4gOOQjX6BE=;
 b=m34S9laGOaTnPZTAPtTjrqdKcuS5wcq129MhWBsAOyLwvnnAQqiWbl0E
 lDG4K6w1Lt6ReWevqOcbTiOeyAGuGNleqTo4Et4s9ssgnOGfvpl85MdLP
 9lAxmMGmFbejCag6r4cKXOFlkfVUQSpLoWOKU7TjlLC1axEsjrYRlWNjI
 ZExaVRKUYcdyXt1POn6e3AT1OhH0k8yhnoFeTvze1uuy7H9azKRdxV0A1
 daywgPk6U3iFV6kCKEfvcFp7jj91cF7yaCmrIeKH8SUDHOJ/ayNjONavT
 MKq3G3rBcQQSx4k6UxehQeuq1ss5cocw0Edo2aTpIzAYf4/5tJff1VkfN Q==;
X-CSE-ConnectionGUID: 7MGeTTNvSN2zyjw95S4HLA==
X-CSE-MsgGUID: XNhLchJ2TLmK+BSD55JwTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="57003034"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="57003034"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:22:46 -0700
X-CSE-ConnectionGUID: cs161YdkSXKct+hntLtYRw==
X-CSE-MsgGUID: WdksR/EOS7qHSr8PYog50g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="157960059"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 02:22:42 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 vinay.belgaumkar@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, zbigniew.kempczynski@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 soham.purkait@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH v15 3/5] tools/gputop/utils: Add gputop utility functions
 common to all drivers
Date: Thu, 26 Jun 2025 14:46:24 +0530
Message-Id: <20250626091626.3760324-4-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626091626.3760324-1-soham.purkait@intel.com>
References: <20250626091626.3760324-1-soham.purkait@intel.com>
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

Implement utility functions in gputop for common operations and data
handling across different drivers.

v1:
 - Refactor GPUTOP into a vendor-agnostic tool. (Lucas)
v2:
 - Remove magic number. (Krzysztof)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop/utils.c | 51 +++++++++++++++++++++++++++++++++++
 tools/gputop/utils.h | 63 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)
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
index 000000000..00befed56
--- /dev/null
+++ b/tools/gputop/utils.h
@@ -0,0 +1,63 @@
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
+ * struct gputop_driver
+ *
+ * @device_present: It is set if at least a single device of the
+ * respective driver is found.
+ * @len: Number of total device discovered of the respective
+ * driver.
+ * @instances: pointer to the array of discovered instances
+ * of the devices of the same driver.
+ */
+struct gputop_driver {
+	bool device_present;
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
+	void (*gputop_init)(void *ptr, int index,
+			    struct igt_device_card *card);
+	void *(*init_engines)(const void *obj, int index);
+	int (*pmu_init)(const void *obj, int index);
+	void (*pmu_sample)(const void *obj, int index);
+	int (*print_engines)(const void *obj, int index, int lines,
+			     int w, int h);
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

