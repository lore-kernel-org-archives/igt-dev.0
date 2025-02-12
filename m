Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC96C021A4
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 09:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D6510E82C;
	Wed, 12 Feb 2025 09:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2Nf+6zt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98ABD10E82C
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 09:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739353074; x=1770889074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7RDc5wVuecDCE037I7KXRZaDcFiFvBDqud/0A1273wo=;
 b=d2Nf+6zta8dYFuvWQSgfBsz0OpDuBCgEny6cEOIlVjxW4Y2WRPmHC+IH
 g+0O59vEcaO1FVXN7X8seN8gShTFl7yzwGiqCCnGt4d3xiNDENfH0dX6P
 Fw6jz7aqCaZ95InS5V4btFIBGusNCKjwHP64cUkyZHCUHf7Pt3HgmXYh0
 9tuH6r9RlYBYaYJ7QegrtZxBQUJ2uW4XVixToFG4WgIViVw0U//SmkfDc
 Yf78iTeOu4v81ANMWZQDKuUMX+blfCw0wwAIl6Uec8kAOhvYL55wcVVEx
 AycPPjR/Y69cQ0LgtqeULy8fyiNZMaeLIIGOAv7BWQ6wB5AKx+3Q4+JpB A==;
X-CSE-ConnectionGUID: tJOEqSOnQz2s2XylFGCAYg==
X-CSE-MsgGUID: mIYv2KGuQuWTXhlZv5xQTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42842250"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="42842250"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 01:37:54 -0800
X-CSE-ConnectionGUID: KvRlQZU/S72vbg8n9+4zKg==
X-CSE-MsgGUID: pLDYrv8TStyBxUeP4Zjoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117951778"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 01:37:51 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pmu: Add PMU test to validate engine
 activity stats
Date: Wed, 12 Feb 2025 15:28:28 +0530
Message-ID: <20250212095834.384508-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250212095834.384508-1-riana.tauro@intel.com>
References: <20250212095834.384508-1-riana.tauro@intel.com>
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

Add a test to validate engine activity by reading PMU counters
(engine-active-ticks, engine-total-ticks) when running
workload on every engine

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 147 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 tests/intel/xe_pmu.c

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
new file mode 100644
index 000000000..cbb825755
--- /dev/null
+++ b/tests/intel/xe_pmu.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Test Xe PMU(Performance Monitoring Unit) functionality
+ * Category: Metrics
+ * Functionality: Power/Perf
+ * Mega feature: Performance Monitoring Unit
+ * Sub-category: Telemetry
+ * Test category: Functional tests
+ */
+
+#include "igt.h"
+#include "igt_perf.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_spin.h"
+
+#define SLEEP_DURATION 2 /* in seconds */
+const double tolerance = 0.1;
+
+#define assert_within_epsilon(x, ref, tolerance) \
+	igt_assert_f((double)(x) <= (1.0 + (tolerance)) * (double)(ref) && \
+		     (double)(x) >= (1.0 - (tolerance)) * (double)(ref), \
+		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n",\
+		     #x, #ref, (double)(x), \
+		     (tolerance) * 100.0, (tolerance) * 100.0, \
+		     (double)(ref))
+
+static int open_group(int xe, uint64_t config, int group)
+{
+	int fd;
+
+	fd = igt_perf_open_group(xe_perf_type_id(xe), config, group);
+	igt_skip_on(fd < 0 && errno == ENODEV);
+	igt_assert(fd >= 0);
+
+	return fd;
+}
+
+static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
+{
+	uint64_t buf[2 + num];
+	unsigned int i;
+
+	igt_assert_eq(read(fd, buf, sizeof(buf)), sizeof(buf));
+
+	for (i = 0; i < num; i++)
+		val[i] = buf[2 + i];
+
+	return buf[1];
+}
+
+static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
+				 const char *event)
+{
+	int ret;
+	char xe_device[100];
+	uint64_t pmu_config;
+	u32 start, end;
+
+	xe_perf_device(xe, xe_device, sizeof(xe_device));
+	ret = perf_event_config(xe_device, event, &pmu_config);
+	igt_assert(ret >= 0);
+	ret = perf_event_format(xe_device, "gt", &start, &end);
+	igt_assert(ret >= 0);
+	pmu_config |= (uint64_t)gt << start;
+
+	if (eci) {
+		ret = perf_event_format(xe_device, "engine_class", &start, &end);
+		pmu_config |= (uint64_t)eci->engine_class << start;
+		ret = perf_event_format(xe_device, "engine_instance", &start, &end);
+		pmu_config |= (uint64_t)eci->engine_instance << start;
+	}
+
+	return pmu_config;
+}
+
+/**
+ * SUBTEST: engine-activity
+ * Description: Test to validate engine activity stats by running a workload and
+ *              reading the active ticks and total ticks PMU counters
+ */
+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t config, busy_ticks, total_ticks, before[2], after[2];
+	struct xe_cork *cork = NULL;
+	uint32_t vm;
+	int pmu_fd[2];
+
+	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
+	pmu_fd[0] = open_group(fd, config, -1);
+
+	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
+
+	vm = xe_vm_create(fd, 0, 0);
+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
+	xe_cork_sync_start(fd, cork);
+
+	pmu_read_multi(pmu_fd[0], 2, before);
+	usleep(SLEEP_DURATION * USEC_PER_SEC);
+	pmu_read_multi(pmu_fd[0], 2, after);
+
+	xe_cork_sync_end(fd, cork);
+
+	busy_ticks = after[0] - before[0];
+	total_ticks = after[1] - before[1];
+
+	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
+		  busy_ticks);
+	igt_debug("Total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
+		  total_ticks);
+
+	if (cork)
+		xe_cork_destroy(fd, cork);
+
+	xe_vm_destroy(fd, vm);
+
+	close(pmu_fd[0]);
+	close(pmu_fd[1]);
+
+	assert_within_epsilon(busy_ticks, total_ticks, tolerance);
+}
+
+igt_main
+{
+	int fd;
+	struct drm_xe_engine_class_instance *hwe;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_describe("Validate engine activity with workload running by reading pmu counters");
+	igt_subtest_with_dynamic("engine-activity")
+		xe_for_each_engine(fd, hwe)
+			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),
+				      hwe->engine_instance)
+				engine_activity(fd, hwe);
+
+	igt_fixture {
+		close(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 33dffad31..d20f50766 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -309,6 +309,7 @@ intel_xe_progs = [
 	'xe_pat',
 	'xe_peer2peer',
 	'xe_pm',
+	'xe_pmu',
 	'xe_pm_residency',
 	'xe_prime_self_import',
 	'xe_query',
-- 
2.47.1

