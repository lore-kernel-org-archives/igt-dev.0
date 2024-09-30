Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7834CE835F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 15:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9561110E53B;
	Mon, 30 Sep 2024 15:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMFuGXSp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47C110E53A
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 15:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727710739; x=1759246739;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=w95IDCgfRfhrObZRdx2iqiVw7IMM8EWfYN62Yo1Y9yo=;
 b=iMFuGXSpnGn0s+ja1O5t/3Z3mR9egt9XqB8bLC84BXMPl5jNnIy6kLDO
 dXT0dHlNGT5ekaIK6aQPT+esDoweMZ3SKIYPJ8jRrS0zPExGgXtoxBWRC
 7mrgJNPNSOj6jr+xFnon6ro2ESwxaUFe1Q2L0M3iJbzY1VVcLOcwY2S39
 xaCaxqWjumoJbO7V5MyUnLqwlUySz1UrfJEKxX6W59VV9lNba/eMt+uTI
 UqAYjUuqOwcWz452n8X581P9aBabCNtzlmMmzb2CVT7mATZWMMUGzG21p
 M/4QpCrfEByLq9XXjz15LR5D3GVBZPLxqu1XYsvUPO3d9v8b6p6+oBf9m g==;
X-CSE-ConnectionGUID: WlurCf0CRJGqc8DzUhDzSQ==
X-CSE-MsgGUID: 73L0uR13SpiDI3v2VrEejg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52224360"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="52224360"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 08:38:59 -0700
X-CSE-ConnectionGUID: nxC/0gBjREayn65uvcD3Yw==
X-CSE-MsgGUID: zT3u1G20Rsido874h7Imaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="104145510"
Received: from priyanka.iind.intel.com ([10.145.169.174])
 by fmviesa001.fm.intel.com with ESMTP; 30 Sep 2024 08:38:58 -0700
From: priyanka.dandamudi@intel.com
To: janga.rahul.kumar@intel.com, igt-dev@lists.freedesktop.org,
 apoorva.singh@intel.com, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 1/2] lib/xe/xe_trace: Added code related to trace
Date: Mon, 30 Sep 2024 21:07:49 +0530
Message-Id: <20240930153750.1141461-2-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240930153750.1141461-1-priyanka.dandamudi@intel.com>
References: <20240930153750.1141461-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Trace related code has been added which will
start tracing, stop tracing and validate migration.

Cc: Brian Welty <brian.welty@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/meson.build   |  1 +
 lib/xe/xe_trace.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_trace.h | 12 ++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 lib/xe/xe_trace.c
 create mode 100644 lib/xe/xe_trace.h

diff --git a/lib/meson.build b/lib/meson.build
index c3556a921..5dd49872b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -116,6 +116,7 @@ lib_sources = [
 	'xe/xe_mmio.c',
 	'xe/xe_query.c',
 	'xe/xe_spin.c',
+        'xe/xe_trace.c',
 	'xe/xe_util.c',
 ]
 
diff --git a/lib/xe/xe_trace.c b/lib/xe/xe_trace.c
new file mode 100644
index 000000000..290ac91fa
--- /dev/null
+++ b/lib/xe/xe_trace.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <errno.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include "igt.h"
+#include "igt_types.h"
+#include "igt_sysfs.h"
+#include "xe_trace.h"
+
+const char *xe_migration_trace_path =
+				"/sys/kernel/tracing/events/xe/xe_bo_move/enable";
+const char *xe_acc_counter = "/sys/kernel/tracing/events/xe/xe_vma_acc/enable";
+const char *trace_on_path = "/sys/kernel/tracing/tracing_on";
+const char *trace_path = "/sys/kernel/tracing/trace";
+
+void xe_validate_acc_trace(int xe, int flag)
+{
+	igt_assert_eq(igt_debugfs_search(xe,
+		      trace_path, "migrate object"), flag);
+	igt_assert_eq(igt_debugfs_search(xe,
+		      trace_path, "xe_vma_acc"), flag);
+}
+
+bool xe_sysfs_trace_write(const char *file, const char *value)
+{
+	FILE *fp;
+
+	fp = fopen(file, "w");
+	if (!fp)
+		return false;
+
+	igt_assert_f(fwrite(value, 1, strlen(value), fp) == strlen(value),
+			"failed to update sysfs tracing node %s\n", file);
+	fclose(fp);
+	return true;
+}
+
+void xe_start_tracing(void)
+{
+	bool success = true;
+
+	success &= xe_sysfs_trace_write(xe_acc_counter, "1");
+	success &= xe_sysfs_trace_write(xe_migration_trace_path, "1");
+	success &= xe_sysfs_trace_write(trace_path, "1");
+	success &= xe_sysfs_trace_write(trace_on_path, "1");
+
+	igt_assert(success);
+}
+
+void xe_stop_tracing(void)
+{
+	xe_sysfs_trace_write(xe_acc_counter, "0");
+	xe_sysfs_trace_write(xe_migration_trace_path, "0");
+	xe_sysfs_trace_write(trace_on_path, "0");
+	xe_sysfs_trace_write(trace_path, "0");
+}
diff --git a/lib/xe/xe_trace.h b/lib/xe/xe_trace.h
new file mode 100644
index 000000000..430710d65
--- /dev/null
+++ b/lib/xe/xe_trace.h
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#include <stdio.h>
+#include <string.h>
+#include "igt.h"
+
+void xe_validate_acc_trace(int xe, int flag);
+bool xe_sysfs_trace_write(const char *file, const char *value);
+void xe_start_tracing(void);
+void xe_stop_tracing(void);
-- 
2.34.1

