Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253AAC021AA
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 13:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D860410E470;
	Mon, 17 Feb 2025 13:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ayUIB30j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3810E345
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739800776; x=1771336776;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lle0hsfsFgYTymUJsOktoEdhvh4r9a2T6pLWrPxGcMQ=;
 b=ayUIB30jPCl32Z1G9bvP6VUHVPzPg/NeHcQJJxbcBpg0au6TlL5v5ORL
 Q/Mv4jQ0TfdqyQJKiD2fS12t8x5mSdTQLsNk8C8wxQwslb1YXHHm+gH1J
 pnrbK3VT/14Z5DKvdPSquTWlp0Yg9Z//fTkow76YHyz37srB0me5Enwi6
 /TpdoOl0kRn3mgZXHfVbVekoEq/2LQuYi6TulLSKUKp3+CiBxbN9Bujn8
 cWUxetDviecZnZSo95cxaWG89EiBo7qG5On3/hUAlUIHKqsLtwyiR9LqK
 w0qiahY+GwjFfciUrgNixaqkNrEb9zvqUwWa8rAbIGur7TpQE8axTlEwf g==;
X-CSE-ConnectionGUID: n25CaQ39RFOJ30CJ7HXBaQ==
X-CSE-MsgGUID: pZgo00uOTZW15a6rZoTZ7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65836662"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="65836662"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:59:36 -0800
X-CSE-ConnectionGUID: YfGsKInzQdWU6WtWH3z/wQ==
X-CSE-MsgGUID: ZfNtLGGrT3mVlNDk1AWJkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="119128082"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:59:34 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 kamil.konieczny@linux.intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 2/3] tests/intel/xe_pmu: Add PMU test to validate
 engine activity stats
Date: Mon, 17 Feb 2025 19:50:17 +0530
Message-ID: <20250217142021.951467-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250217142021.951467-1-riana.tauro@intel.com>
References: <20250217142021.951467-1-riana.tauro@intel.com>
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

v2: rename busy to active
    add assert to format events (Umesh)
    add a helper macro

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pmu.c | 156 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 tests/intel/xe_pmu.c

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
new file mode 100644
index 000000000..aa7d53523
--- /dev/null
+++ b/tests/intel/xe_pmu.c
@@ -0,0 +1,156 @@
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
+ *
+ * SUBTEST: engine-activity-load
+ * Description: Test to validate engine activity stats by running a workload and
+ *              reading engine active ticks and engine total ticks PMU counters
+ */
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
+#define test_each_engine(test, fd, hwe) \
+	igt_subtest_with_dynamic(test) \
+		xe_for_each_engine(fd, hwe) \
+			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
+				      hwe->engine_instance)
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
+static uint64_t add_format_config(const char *xe_device, const char *format, uint64_t val)
+{
+	int ret;
+	uint32_t shift;
+	uint64_t config;
+
+	ret = perf_event_format(xe_device, format, &shift);
+	igt_assert(ret >= 0);
+	config = val << shift;
+
+	return config;
+}
+
+static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
+				 const char *event)
+{
+	int ret;
+	char xe_device[100];
+	uint64_t pmu_config;
+
+	xe_perf_device(xe, xe_device, sizeof(xe_device));
+	ret = perf_event_config(xe_device, event, &pmu_config);
+	igt_assert(ret >= 0);
+	pmu_config |= add_format_config(xe_device, "gt", gt);
+
+	if (eci) {
+		pmu_config |= add_format_config(xe_device, "engine_class", eci->engine_class);
+		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
+	}
+
+	return pmu_config;
+}
+
+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
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
+	engine_active_ticks = after[0] - before[0];
+	engine_total_ticks = after[1] - before[1];
+
+	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
+		  engine_active_ticks);
+	igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
+		  engine_total_ticks);
+
+	if (cork)
+		xe_cork_destroy(fd, cork);
+
+	xe_vm_destroy(fd, vm);
+
+	close(pmu_fd[0]);
+	close(pmu_fd[1]);
+
+	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
+}
+
+igt_main
+{
+	int fd;
+	struct drm_xe_engine_class_instance *eci;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+	}
+
+	igt_describe("Validate engine activity with workload");
+	test_each_engine("engine-activity-load", fd, eci)
+		engine_activity(fd, eci);
+
+	igt_fixture {
+		close(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1a731fc73..a385e9cd4 100644
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

