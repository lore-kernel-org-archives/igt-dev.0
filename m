Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AA8FF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 06:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7AF10E06A;
	Tue, 28 Apr 2026 06:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEIS3W1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BED810E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 06:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777359273; x=1808895273;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bxl9txdGgErlvg2q9yJY68N600J1DHpMQwzC4tTANFY=;
 b=BEIS3W1VUrWQ7MZN1ClAFO6o9OxZsxFI1GlYtIq9qWlqJYXQUGWjkQMn
 t6WF5vXJyu6Lq7VDtq8a6MUD0vAZHXR8rRlDEeiGCzz4rI28in016VqnP
 qHATfUnb54plqo5/qemtGUxREXx88Mktmo04k3tvaw/J6H8U7CIs7mox8
 iedT910iz+MSclmTmPgZDxHOWTfkuv8riFF1Wl159FHmYRc9VfGHh6QZl
 218O0gru5NoUX6Ko6h1u7zDCHRPi14mClVPER4Del4zfadCe2cTXodb92
 /hEyJ6avijPnKIEh19tH4UgS6pOTwJ+ZUXZ4VtvGiNiZqFZm7/1zXM1e/ w==;
X-CSE-ConnectionGUID: c7y4vO3TRhiwV4xhqAVcmw==
X-CSE-MsgGUID: lNfnRRyCR7603f7VmNG7fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78137872"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78137872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:33 -0700
X-CSE-ConnectionGUID: VMoKBkOJSaWuX6P7leaKVw==
X-CSE-MsgGUID: ycvVC64sQcqUOqeNNQGKWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="232863008"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.161])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:32 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 2/6] tests/cgroup_dmem: add dmem cgroup controller test
Date: Tue, 28 Apr 2026 08:54:07 +0200
Message-ID: <20260428065411.4222-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428065411.4222-1-thomas.hellstrom@linux.intel.com>
References: <20260428065411.4222-1-thomas.hellstrom@linux.intel.com>
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

Add a test that exercises the cgroup v2 dmem controller interface using
the new igt_cgroup library.

The test uses igt_simple_main and:
  - Skips if no dmem regions are registered (no cgroup v2 or no
   dmem-capable device).
  - Creates a sub-cgroup and moves the test process into it.
  - Enumerates all registered device memory regions and prints their
   capacity, system-wide current usage, per-cgroup current usage, and
   configured min, low and max limits.
  - Destroys the cgroup on completion.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/cgroup_dmem.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 tests/cgroup_dmem.c

diff --git a/tests/cgroup_dmem.c b/tests/cgroup_dmem.c
new file mode 100644
index 000000000..442c965f9
--- /dev/null
+++ b/tests/cgroup_dmem.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: cgroup dmem
+ * Description: Exercises the cgroup v2 dmem controller interface.  Creates a
+ *              cgroup, moves the process into it, enumerates all dmem regions,
+ *              prints their capacity, system-wide current usage, per-cgroup
+ *              current usage and configured limits, then destroys the cgroup.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: cgroup
+ * Feature: dmem
+ * Test category: uapi
+ */
+
+#include <inttypes.h>
+
+#include "igt.h"
+#include "igt_cgroup.h"
+
+IGT_TEST_DESCRIPTION("Exercises the cgroup v2 dmem controller interface.");
+
+static void fmt_bytes(uint64_t v, char *buf, size_t len)
+{
+	if (v == IGT_CGROUP_DMEM_MAX)
+		snprintf(buf, len, "max");
+	else
+		snprintf(buf, len, "%" PRIu64, v);
+}
+
+int igt_simple_main()
+{
+	struct igt_cgroup *cg;
+	const char *region;
+	char **regions;
+	uint64_t capacity, sys_current, cg_current, min, low, max;
+	char cap_s[32], sys_s[32], cg_s[32];
+	char min_s[32], low_s[32], max_s[32];
+	int i;
+
+	igt_require_f(igt_cgroup_dmem_available(),
+		      "No dmem regions found; is cgroup v2 with the "
+		      "dmem controller available?\n");
+
+	cg = igt_cgroup_new("igt-cgroup-dmem-test");
+	igt_assert_f(cg, "Failed to create cgroup\n");
+
+	igt_cgroup_move_current(cg);
+
+	regions = igt_cgroup_dmem_regions();
+	igt_assert_f(regions, "Failed to enumerate dmem regions\n");
+
+	igt_info("%-40s %16s %16s %16s %16s %16s %16s\n",
+		 "region", "capacity", "system-current",
+		 "cgroup-current", "min", "low", "max");
+	igt_info("%-40s %16s %16s %16s %16s %16s %16s\n",
+		 "------", "--------", "--------------",
+		 "--------------", "---", "---", "---");
+
+	for (i = 0; regions[i]; i++) {
+		region = regions[i];
+
+		igt_cgroup_dmem_get_capacity(region, &capacity);
+		fmt_bytes(capacity, cap_s, sizeof(cap_s));
+
+		igt_cgroup_dmem_get_system_current(region, &sys_current);
+		fmt_bytes(sys_current, sys_s, sizeof(sys_s));
+
+		igt_cgroup_dmem_get_current(cg, region, &cg_current);
+		fmt_bytes(cg_current, cg_s, sizeof(cg_s));
+
+		igt_cgroup_dmem_get_min(cg, region, &min);
+		fmt_bytes(min, min_s, sizeof(min_s));
+
+		igt_cgroup_dmem_get_low(cg, region, &low);
+		fmt_bytes(low, low_s, sizeof(low_s));
+
+		igt_cgroup_dmem_get_max(cg, region, &max);
+		fmt_bytes(max, max_s, sizeof(max_s));
+
+		igt_info("%-40s %16s %16s %16s %16s %16s %16s\n",
+			 region, cap_s, sys_s, cg_s,
+			 min_s, low_s, max_s);
+	}
+
+	igt_cgroup_dmem_regions_free(regions);
+	igt_cgroup_free(cg);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 60cea3aa8..02fbb8c4e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -1,4 +1,5 @@
 test_progs = [
+	'cgroup_dmem',
 	'core_auth',
 	'core_debugfs',
 	'core_getclient',
-- 
2.53.0

