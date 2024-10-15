Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ECED1D879
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 15:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C22010E5A9;
	Tue, 15 Oct 2024 15:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mybb5Up1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDABC10E5A9
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729006266; x=1760542266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fwtx5cAhCrlwkB4goVbd38wEiYWXe3E5NHTICoS5tD0=;
 b=mybb5Up1ES74Q20y5MT+gPw/dNpZPPhGgZKm8QcgeBDbRnErkORDjmPU
 Ik+a1axcR0tVuoEbozvyqH8I/9wMdAAJpb2GsVYj7Uklax5n+gWlUduo6
 FO9tZQRPpsa/lt+BKel0wVCWtloWEiFUu2Yu/kRB3WpPYgOhHjytWqfHz
 VVlyJJoWJWm+21eqZpqWse4pAgm+KlMTmxO9qnZZX0l2Jn99Lv/HkmSvM
 k+4NbcaLm4DHgCmYRHlLF0IaZZveapvSyJ1Jm+hYTu8OaC/Nsi9hrWZn5
 lyD5HRTenWkoIe0vfv1q6d+qPz/lO+L7fd54MB5nuKHu9pYCm7QowyLqG w==;
X-CSE-ConnectionGUID: mjtjyjxeRzS7S4mxYG/awQ==
X-CSE-MsgGUID: phLt3Eo4Q7Ghtp+Y24f2AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28287220"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28287220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:31:04 -0700
X-CSE-ConnectionGUID: J4GIK6ELShaP014tX2B2wA==
X-CSE-MsgGUID: Suqg1UUqT3ygJM+yrGY/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="82496840"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa005.fm.intel.com with ESMTP; 15 Oct 2024 08:31:04 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/intel/xe_exec_capture: Add xe_exec_capture
 test
Date: Tue, 15 Oct 2024 08:31:01 -0700
Message-Id: <20241015153101.4114544-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015153101.4114544-1-zhanjun.dong@intel.com>
References: <20241015153101.4114544-1-zhanjun.dong@intel.com>
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

Test with GuC reset, check if devcoredump register dump is within the
range.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 tests/intel/xe_exec_capture.c | 308 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 309 insertions(+)
 create mode 100644 tests/intel/xe_exec_capture.c

diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
new file mode 100644
index 000000000..89b544c93
--- /dev/null
+++ b/tests/intel/xe_exec_capture.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for GuC based register capture
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: CMD submission
+ * Functionality: Debug
+ * Test category: functionality test
+ */
+
+#include <ctype.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <regex.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+
+#define MAX_N_EXECQUEUES		16
+#define MAX_INSTANCE			9
+#define GT_RESET			(0x1 << 0)
+#define CLOSE_FD			(0x1 << 1)
+#define CLOSE_EXEC_QUEUES		(0x1 << 2)
+#define VIRTUAL				(0x1 << 3)
+#define PARALLEL			(0x1 << 4)
+#define CAT_ERROR			(0x1 << 5)
+
+#define BASE_ADDRESS			0x1a0000
+/* Batch buffer element count, in number of dwords(uint32_t) */
+#define BATCH_DW_COUNT			16
+
+#define MAX_PATH_NAME_LEN		512
+#define MAX_LINES			512
+#define MAX_LINE_LEN			1024
+
+#define DUMP_PATH			"/sys/class/drm/card%d/device/devcoredump/data"
+#define START_TAG			"**** Job ****"
+#define REGEX_KEY_VALUE_PAIR		"^[ \t]*([^:]+):[ \t]*([^ \t]+)[ \t]*$"
+#define REGEX_KEY_INDEX			1
+#define REGEX_VALUE_INDEX		2
+#define REGEX_KEY_VALUE_MATCH_COUNT	3
+
+int card_id;
+regex_t regex;
+char lines[MAX_LINES][MAX_LINE_LEN];
+
+static bool access_devcoredump(bool load_file)
+{
+	FILE *fd;
+	char path[MAX_PATH_NAME_LEN];
+
+	sprintf(path, DUMP_PATH, card_id);
+	fd = fopen(path, "r");
+	if (!fd) {
+		igt_debug("Devcoredump not exist.\n");
+		return false;
+	}
+	igt_debug("Devcoredump found: %s\n", path);
+
+	/* Clear memory before load file */
+	if (load_file) {
+		int i = 0;
+		bool found = false;
+
+		memset(lines, 0, sizeof(lines));
+		while (!feof(fd)) {
+			fgets(lines[i], MAX_LINE_LEN, fd);
+
+			/* Only save lines after start tag */
+			if (!found)
+				found = strstr(lines[0], START_TAG);
+			else
+				if (++i >= MAX_LINES)
+					break;
+		}
+	}
+
+	fclose(fd);
+	return true;
+}
+
+static void rm_devcoredump(void)
+{
+	char path[MAX_PATH_NAME_LEN];
+	int fd;
+
+	igt_debug("Clearing devcoredump.\n");
+
+	sprintf(path, DUMP_PATH, card_id);
+	fd = open(path, O_WRONLY);
+	if (fd != -1) {
+		write(fd, "0", 1);
+		close(fd);
+	}
+}
+
+static char *get_coredump_item(const char *tag)
+{
+	int i;
+	regmatch_t match[REGEX_KEY_VALUE_MATCH_COUNT];
+
+	for (i = 0; i < MAX_LINES && lines[i][0]; i++) {
+		char *line = lines[i];
+
+		/* Skip lines without tag */
+		if (!strstr(line, tag))
+			continue;
+
+		if (regexec(&regex, line, REGEX_KEY_VALUE_MATCH_COUNT, match, 0) == 0) {
+			char *key, *value;
+
+			key = &line[match[REGEX_KEY_INDEX].rm_so];
+			line[match[REGEX_KEY_INDEX].rm_eo] = '\0';
+			value = &line[match[REGEX_VALUE_INDEX].rm_so];
+			line[match[REGEX_VALUE_INDEX].rm_eo] = '\0';
+
+			if (strcmp(tag, key) == 0)
+				return value;
+			/* if key != tag,  continue */
+		}
+	}
+
+	return NULL;
+}
+
+static void check_capture_output(const char *tag, uint64_t addr_lo, uint64_t addr_hi)
+{
+	uint64_t result;
+	char *output;
+
+	igt_assert(output = get_coredump_item(tag));
+	result = strtol(output, NULL, 16);
+	igt_debug("Compare %s: %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
+	igt_assert((addr_lo <= result) && (result <= addr_hi));
+}
+
+static void check_capture_output_str(const char *tag, const char *target)
+{
+	char *output;
+
+	igt_assert(output = get_coredump_item(tag));
+	igt_debug("Compare %s: '%s' vs '%s'\n", tag, output, target);
+	igt_assert(!strcmp(output, target));
+}
+
+static void check_capture_out(uint64_t base_addr, uint64_t length)
+{
+	/* assert devcoredump created */
+	assert(access_devcoredump(true));
+
+	check_capture_output_str("Capture_source", "GuC");
+	check_capture_output("ACTHD", base_addr, base_addr +  length);
+	check_capture_output("RING_BBADDR", base_addr, base_addr + length);
+
+	/* clear devcoredump */
+	rm_devcoredump();
+	sleep(1);
+	/* Assert devcoredump removed */
+	assert(!access_devcoredump(false));
+}
+
+/**
+ * SUBTEST: close-fd
+ * Description: Test close fd, check if devcoredump register dump is within the
+ */
+static void
+test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
+		 int n_exec_queues, int n_execs, unsigned int flags)
+{
+	uint32_t vm;
+	const uint64_t addr = BASE_ADDRESS;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint32_t exec_queues[MAX_N_EXECQUEUES];
+	uint32_t syncobjs[MAX_N_EXECQUEUES];
+	size_t bo_size;
+	uint32_t bo = 0;
+	struct {
+		struct xe_spin spin;
+		uint32_t batch[BATCH_DW_COUNT];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
+	int i, b;
+
+	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
+
+	if (flags & CLOSE_FD)
+		fd = drm_open_driver(DRIVER_XE);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*data) * n_execs;
+	bo_size = xe_bb_size(fd, bo_size);
+
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	data = xe_bo_map(fd, bo, bo_size);
+
+	for (i = 0; i < n_exec_queues; i++) {
+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		syncobjs[i] = syncobj_create(fd, 0);
+	};
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	for (i = 0; i < n_execs; i++) {
+		uint64_t base_addr = addr;
+		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
+		uint64_t batch_addr = base_addr + batch_offset;
+		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
+		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
+		uint64_t sdi_addr = base_addr + sdi_offset;
+		uint64_t exec_addr;
+		int e = i % n_exec_queues;
+
+		if (!i) {
+			spin_opts.addr = base_addr + spin_offset;
+			xe_spin_init(&data[i].spin, &spin_opts);
+			exec_addr = spin_opts.addr;
+		} else {
+			b = 0;
+			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+			data[i].batch[b++] = sdi_addr;
+			data[i].batch[b++] = sdi_addr >> 32;
+			data[i].batch[b++] = 0xc0ffee;
+			data[i].batch[b++] = MI_BATCH_BUFFER_END;
+			igt_assert(b <= ARRAY_SIZE(data[i].batch));
+
+			exec_addr = batch_addr;
+		}
+
+		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+		sync[1].handle = syncobjs[e];
+
+		exec.exec_queue_id = exec_queues[e];
+		exec.address = exec_addr;
+		if (e != i)
+			syncobj_reset(fd, &syncobjs[e], 1);
+		xe_exec(fd, &exec);
+	}
+
+	for (i = 0; i < n_exec_queues && n_execs; i++)
+		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
+					NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	for (i = 0; i < n_exec_queues; i++) {
+		syncobj_destroy(fd, syncobjs[i]);
+		xe_exec_queue_destroy(fd, exec_queues[i]);
+	}
+
+	munmap(data, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		card_id = igt_device_get_card_index(fd);
+
+		regcomp(&regex, REGEX_KEY_VALUE_PAIR, REG_EXTENDED | REG_NEWLINE);
+	}
+
+	igt_subtest("close-fd")
+		xe_for_each_engine(fd, hwe) {
+			igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
+				  hwe->engine_instance);
+
+			test_legacy_mode(fd, hwe, 1, 1, 0);
+			check_capture_out(BASE_ADDRESS, sizeof(uint32_t) * BATCH_DW_COUNT);
+		}
+
+	igt_fixture {
+		drm_close_driver(fd);
+		regfree(&regex);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2d8cb87d5..b724a7c6d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -284,6 +284,7 @@ intel_xe_progs = [
 	'xe_exec_atomic',
 	'xe_exec_balancer',
 	'xe_exec_basic',
+	'xe_exec_capture',
 	'xe_exec_compute_mode',
 	'xe_exec_fault_mode',
 	'xe_exec_mix_modes',
-- 
2.34.1

