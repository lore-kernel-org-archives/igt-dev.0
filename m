Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF756C369DC
	for <igt-dev@archiver.kernel.org>; Sun,  4 May 2025 20:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D4410E047;
	Sun,  4 May 2025 20:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/+zbvQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE0E10E047
 for <igt-dev@lists.freedesktop.org>; Sun,  4 May 2025 20:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746390515; x=1777926515;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xyoKSEq+PZKe7HwnQO6l8XVtdlBcyCi0xonoadkZfeM=;
 b=H/+zbvQWt7XCUkjZbd9bTbk0qo13UBYj2evmdVqwt7XgJoJOyw3zREfo
 7mN11TYSFks2vO7m4efLZn32YuJ91lziPvx4mYkR+m01Izh53m3y3L9h0
 6iZTfdOYKLXKNcNZRcUkwtz3zFaZ1YDpOWrynmgiVFWZeJHnPNg6Bwj2U
 LBX6tyvvLDEOEnKPTrhjPaAqYpYGw/usXpnVbLK20rmVKRccKLbMOMX4M
 aEqYM2Uwt7NG0MgU0YfCJseRM1FCezb47rTn5ZYfs81nyUu1R5pctpCuZ
 zJjsXOSulV7Oofh2nD/tsOHm6TvsGEkQSmdWFHpwA+4XHkRZDRFOIDAiG A==;
X-CSE-ConnectionGUID: 4OHq2tV5S2K1nbzSb0g8vQ==
X-CSE-MsgGUID: 89M5BcojSSCjpq/3l9dI7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="51651405"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="51651405"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 13:28:31 -0700
X-CSE-ConnectionGUID: hTFKAUvzTam44WhwaKr0rw==
X-CSE-MsgGUID: rhLilSnoRvuTfi80bQq/9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="140238306"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2025 13:28:30 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [RFC i-g-t] tests/intel/sec_xe_exec_queue_timeslice_abuse: Validate
 the Impact of Timeslice Abuse on Exec Queues
Date: Sun,  4 May 2025 22:28:06 +0200
Message-ID: <20250504202809.119066-1-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

DO NOT MERGE!

This is an RFC for a new kind of security-related test.

The objective is to test the behavior of the GPU scheduler under
conditions where one execution queue ("attacker") is configured with an
abnormally large timeslice, potentially disrupting the normal execution
of another queue ("attacked").

The proposed steps are:

For each GPU engine (drm_xe_engine_class_instance?):
  	1. Determine the values for the following parameters:
  		- `timeslice_duration_us`: Default timeslice duration in
  		   microseconds.
  		- `timeslice_duration_min`: Minimum allowable timeslice duration.
  		- `timeslice_duration_max`: Maximum allowable timeslice duration.

  	2. Create two execution queues with the following configurations:
  		- `attacked`: Queue with standard/default settings.
  		- `attacker`: Queue configured with an extended timeslice
  			      duration. The goal is to:
  			a) First attempt to set a timeslice greater than
  			   `timeslice_duration_max`.
  			b) If setting a timeslice above `timeslice_duration_max`
  			   fails, fallback to setting the timeslice to
  			   `timeslice_duration_max`.

  	3. Submit tasks to both queues:
  		- Submit a workload to the `attacked` queue with normal
  		   operations.
  		- Submit a workload to the `attacker` queue designed to
  		  maximize its timeslice and potentially disrupt the GPU
  		  scheduler.

  	4. Verify the behavior of the `attacked` queue:
  		- Ensure that tasks in the `attacked` queue execute within the
  		  expected time constraints and are not delayed or blocked due
  		  to the extended timeslice of the `attacker` queue.
  		- Specifically, confirm that tasks in the `attacked` queue do
  		  not exceed `timeslice_duration_max` in terms of execution
  		  delays or interruptions.

This RFC implements the first step that is reading timeslice values for
each engine.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 .../intel/sec_xe_exec_queue_timeslice_abuse.c | 296 ++++++++++++++++++
 tests/meson.build                             |   1 +
 2 files changed, 297 insertions(+)
 create mode 100644 tests/intel/sec_xe_exec_queue_timeslice_abuse.c

diff --git a/tests/intel/sec_xe_exec_queue_timeslice_abuse.c b/tests/intel/sec_xe_exec_queue_timeslice_abuse.c
new file mode 100644
index 000000000..bc00a0cd5
--- /dev/null
+++ b/tests/intel/sec_xe_exec_queue_timeslice_abuse.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/*
+ * Test Specification: Validate the Impact of Timeslice Abuse on Exec Queues
+ *
+ * Objective
+ * Test the behavior of the GPU scheduler under conditions where one execution
+ * queue ("attacker") is configured with an abnormally large timeslice,
+ * potentially disrupting the normal execution of another queue ("attacked").
+ *
+ * Steps:
+ *
+ * For each GPU engine available:
+ *	1. Determine the values for the following parameters:
+ *		- `timeslice_duration_us`: Default timeslice duration in
+ *		   microseconds.
+ *		- `timeslice_duration_min`: Minimum allowable timeslice duration.
+ *		- `timeslice_duration_max`: Maximum allowable timeslice duration.
+ *
+ *	2. Create two execution queues with the following configurations:
+ *		- `attacked`: Queue with standard/default settings.
+ *		- `attacker`: Queue configured with an extended timeslice
+ *			      duration. The goal is to:
+ *			a) First attempt to set a timeslice greater than
+ *			   `timeslice_duration_max`.
+ *			b) If setting a timeslice above `timeslice_duration_max`
+ *			   fails, fallback to setting the timeslice to
+ *			   `timeslice_duration_max`.
+ *
+ *	3. Submit tasks to both queues:
+ *		- Submit a workload to the `attacked` queue with normal
+ *		   operations.
+ *		- Submit a workload to the `attacker` queue designed to
+ *		  maximize its timeslice and potentially disrupt the GPU
+ *		  scheduler.
+ *
+ *	4. Verify the behavior of the `attacked` queue:
+ *		- Ensure that tasks in the `attacked` queue execute within the
+ *		  expected time constraints and are not delayed or blocked due
+ *		  to the extended timeslice of the `attacker` queue.
+ *		- Specifically, confirm that tasks in the `attacked` queue do
+ *		  not exceed `timeslice_duration_max` in terms of execution
+ *		  delays or interruptions.
+ *
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_list.h"
+#include "igt_sysfs.h"
+#include "xe/xe_query.h"
+
+static struct igt_list_head engines_list;
+
+/*
+ * Struct to Hold Data for Each Engine
+ */
+struct engines_timeslice_test_data {
+	/* Name of the GPU engine (e.g., "CCS", "VCS", "RCS", "BCS", "VECS") */
+	const char *engine_name;
+
+	/* Minimum allowable timeslice duration (microseconds) */
+	uint32_t timeslice_min;
+
+	/* Maximum allowable timeslice duration (microseconds) */
+	uint32_t timeslice_max;
+
+	/* Timeslice value set for the attacker queue (microseconds) */
+	uint32_t timeslice_set;
+
+	/* Pointer to the attacked execution queue */
+	struct xe_exec_queue *attacked_queue;
+
+	/* Pointer to the attacker execution queue */
+	struct xe_exec_queue *attacker_queue;
+
+	/* Linked list node */
+	struct igt_list_head link;
+};
+
+/**
+ * engine_list_add_timeslices: Check if there is already an entry in the list
+ *			       for the engine and add timeslices.
+ * @engine: name of the engine
+ * @set: timeslice duration set for the attacker queue
+ * @max: maximum allowable timeslice duration
+ * @min: minimum allowable timeslice duration
+ *
+ * Returns: bool indicating if timeslices were added to the list
+ *
+ */
+static bool engines_list_add_timeslices(const char *engine, uint32_t set,
+					uint32_t min, uint32_t max)
+{
+	struct engines_timeslice_test_data *engine_data = NULL;
+
+	/* Check if the engine already exists in the list. If it does
+	 * add the timeslice values to the existing entry
+	 */
+	igt_list_for_each_entry(engine_data, &engines_list, link) {
+		if (strcmp(engine_data->engine_name, engine) == 0) {
+			engine_data->timeslice_set = set;
+			engine_data->timeslice_min = min;
+			engine_data->timeslice_max = max;
+			return true;
+		}
+	}
+	/* If the engine does not exist, create a new entry */
+	engine_data = malloc(sizeof(*engine_data));
+	if (!engine_data)
+		return false;
+
+	engine_data->engine_name = strdup(engine);
+	engine_data->timeslice_set = set;
+	engine_data->timeslice_min = min;
+	engine_data->timeslice_max = max;
+	engine_data->attacked_queue = NULL;
+	engine_data->attacker_queue = NULL;
+
+	igt_list_add(&engine_data->link, &engines_list);
+	return true;
+}
+
+/**
+ * engine_list_print_all: Print all engines in the list
+ *
+ * Returns: void
+ *
+ */
+static void engines_list_print_all(void)
+{
+	struct engines_timeslice_test_data *engine_data = NULL;
+
+	igt_list_for_each_entry(engine_data, &engines_list, link) {
+		igt_info("Engine: %s, Set: %u, Min: %u, Max: %u\n",
+			 engine_data->engine_name,
+			 engine_data->timeslice_set,
+			 engine_data->timeslice_min,
+			 engine_data->timeslice_max);
+	}
+}
+
+/**
+ * engine_free_all: Free all engines in the list
+ *
+ * Returns: void
+ *
+ */
+static void engines_list_free_all(void)
+{
+	struct engines_timeslice_test_data *engine_data = NULL, *tmp = NULL;
+
+	igt_list_for_each_entry_safe(engine_data, tmp, &engines_list, link) {
+		free((void *)engine_data->engine_name);
+		free(engine_data);
+	}
+}
+
+/**
+ * get_queue_timeslice_properties: Get the timeslice properties for an engine
+ * @xe: xe device file descriptor
+ * @engine: engine file descriptor
+ * @set: pointer to store the timeslice duration set for the attacker queue
+ * @min: pointer to store the minimum allowable timeslice duration
+ * @max: pointer to store the maximum allowable timeslice duration
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+static int get_queue_timeslice_properties(int xe, int engine,
+	unsigned int *set, unsigned int *min, unsigned int *max)
+{
+	int defaults;
+
+	defaults = openat(engine, ".defaults", O_DIRECTORY);
+	if (defaults == -1)
+		return -1; /* Failure: Unable to open the defaults directory */
+
+	/* Read the max, min, and set values from the sysfs */
+	if (igt_sysfs_scanf(defaults, "timeslice_duration_max", "%u", max) != 1 ||
+	    igt_sysfs_scanf(defaults, "timeslice_duration_min", "%u", min) != 1 ||
+	    igt_sysfs_scanf(engine, "timeslice_duration_us", "%u", set) != 1) {
+		close(defaults);
+		return -1; /* Failure: Unable to read sysfs values */
+	}
+	close(defaults);
+
+	return 0; /* Success */
+}
+
+/**
+ * TEST: Validate the Impact of Timeslice Abuse on Exec Queues
+ * Category: Security
+ * Mega feature: Security Validation Plan
+ * Sub-category: Security Validation Plan
+ * Functionality: Test if exec queue timeslice property can be used as an
+ *		  attack to prevent other queues from running
+ * Test category: security test
+ *
+ * SUBTEST: get-timeslice-properties
+ * Description: Test to check if timeslice properties are available and
+ *		read them.
+ * Test category: functionality test
+ */
+
+/**
+ * engine_list_add_timeslices: Check if there is already an entry in the list
+ *			       for the engine and add timeslices.
+ * @engine: name of the engine
+ * @set: timeslice duration set for the attacker queue
+ * @max: maximum allowable timeslice duration
+ * @min: minimum allowable timeslice duration
+ *
+ * Returns: bool indicating if timeslices were added to the list
+ *
+ */
+igt_main
+{
+	int gt = -1;
+	bool has_sysfs;
+	unsigned int max = -1;
+	unsigned int min = -1;
+	unsigned int set = -1;
+	int sys_fd = -1;
+	int xe = -1;
+
+	igt_fixture {
+		/* Initialize the list of engines */
+		IGT_INIT_LIST_HEAD(&engines_list);
+
+		xe = drm_open_driver(DRIVER_XE);
+		sys_fd = igt_sysfs_open(xe);
+
+		if (sys_fd != -1) {
+			close(sys_fd);
+			has_sysfs = true;
+		} else {
+			has_sysfs = false;
+		}
+	}
+
+	igt_subtest("get-timeslice-properties") {
+		xe_for_each_gt(xe, gt) {
+			int engines = -1;
+			int gt_fd = -1;
+			DIR *dir;
+			struct dirent *de;
+
+			igt_require(has_sysfs);
+
+			gt_fd = xe_sysfs_gt_open(xe, gt);
+			igt_require(gt_fd != -1);
+
+			engines = openat(gt_fd, "engines", O_RDONLY);
+			igt_require(engines != -1);
+
+			lseek(engines, 0, SEEK_SET);
+
+			dir = fdopendir(engines);
+			if (!dir)
+				close(engines);
+
+			while ((de = readdir(dir))) {
+				int engine_fd = -1;
+
+				if (*de->d_name == '.')
+					continue;
+
+				engine_fd = openat(engines, de->d_name, O_RDONLY);
+				if (engine_fd < 0)
+					continue;
+
+				/* Check if the timeslice properties are available */
+				if (get_queue_timeslice_properties(xe, engine_fd, &set, &min, &max) == 0)
+					engines_list_add_timeslices(de->d_name, set, min, max);
+				else
+					igt_warn("Failed to get timeslice properties\n");
+
+				close(engine_fd);
+			}
+			close(gt_fd);
+		}
+		engines_list_print_all();
+	}
+
+	igt_fixture {
+		engines_list_free_all();
+		close(sys_fd);
+		xe_device_put(xe);
+		drm_close_driver(xe);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 20ddddb89..560b74ceb 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -273,6 +273,7 @@ intel_kms_progs = [
 ]
 
 intel_xe_progs = [
+	'sec_xe_exec_queue_timeslice_abuse',
 	'xe_wedged',
 	'xe_ccs',
 	'xe_create',
-- 
2.43.0

