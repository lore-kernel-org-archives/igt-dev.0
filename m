Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF91E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 22:59:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F1710E1F6;
	Fri,  6 Dec 2024 22:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvwS6f6F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286BD10E1DB
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 22:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733525954; x=1765061954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sFlRQf+a05grgHEwV8ILbi1z1PPphGTS8PPhIXRkFKs=;
 b=fvwS6f6FKv6lPjQJQTzImCEHuZ67PY04fJgx8MzWzulct7yD52MNq0+U
 X2+wwx/r/3Px2iwVeCsXEjOg/bILZPWoGX9MfXq3Mdq56yCQPHZtUuIDS
 XcYU35upLpypKecCG9ddfiyZIJXexqqlAUbyDphX1fslnAFiAu1wDl2/v
 PZcKfy6nNOpWXRuBNs2RS3qZOugekB02b6id80mo08wn5R22la71jeWx8
 /d/N81unlj+ohpSBZ/W+VU2VEOdo1Ajv3kWEDZGPz2b32YZSPCTcwtDEo
 Iyd67wG/ClOM6HsgXLEWJkjfvkuH37EiZi3RJspyLkqbjP8yQyj/SmeLi Q==;
X-CSE-ConnectionGUID: U3pjY/ZsSKuvP/F198plxw==
X-CSE-MsgGUID: k0tUksfoSkyMJIUUReJV5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="36726383"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="36726383"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 14:59:14 -0800
X-CSE-ConnectionGUID: 54D+zE2uQkmKfD0FGts/Eg==
X-CSE-MsgGUID: 20jt/43eSmii/vMAizLEww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="125440452"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa001.fm.intel.com with ESMTP; 06 Dec 2024 14:59:13 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v9] tests/intel/xe_exec_capture: Add xe_exec_capture test
Date: Fri,  6 Dec 2024 14:59:11 -0800
Message-Id: <20241206225911.465603-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Submit cmds to the GPU that result in a GuC engine reset and check that
devcoredump register dump is generated, by the GuC, and includes the
full register range.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
Changes from prior revs:
 v9:-  Reduced job timeout to 2 seconds to speedup test
       Add info print to show test is running on single/multiple GPU
 v8:-  Move change list below ---
 v7:-  Fix typo and removed unused macros
 v6:-  Adjust start_line to start from 0
       Use 7 bit engine_cid, start with random number
       Add ioerror detect on fgets
       Reorgnize the regular expression
       Remove unnecessary radom seed init
 v5:-  Detect devcoredump matches the testing engine
       Engine will run with random cid
 v4:-  Support runs on multiple GPU
       Load all devcoredump content to buffer
       Alloc line buffer dynamic vs static global memory
       Changed to igt_assert_f to provide more info if failed
 v3:-  Remove call to bash and awk
       Add regular express parse
       Detect devcoredump through card index
       Add devcoredump removal check
 v2:-  Fix CI.build error
       Add multiple GPU card support
 tests/intel/xe_exec_capture.c | 510 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 511 insertions(+)
 create mode 100644 tests/intel/xe_exec_capture.c

diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
new file mode 100644
index 000000000..6123df7b4
--- /dev/null
+++ b/tests/intel/xe_exec_capture.c
@@ -0,0 +1,510 @@
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
+#include <regex.h>
+#include <stdio.h>
+#include <string.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "igt_sysfs.h"
+#include "lib/igt_syncobj.h"
+#include "lib/intel_reg.h"
+#include "linux_scaffold.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+#include "xe/xe_spin.h"
+
+#define MAX_N_EXECQUEUES		16
+#define CAPTURE_JOB_TIMEOUT		2000
+#define JOB_TIMOUT_ENTRY		"job_timeout_ms"
+
+#define BASE_ADDRESS			0x1a0000
+#define ADDRESS_SHIFT			39
+#define CID_ADDRESS_MASK		0x7F
+/* Batch buffer element count, in number of dwords(u32) */
+#define BATCH_DW_COUNT			16
+
+#define MAX_TEMP_LEN			80
+#define MAX_SYSFS_PATH_LEN		128
+#define MAX_LINES			4096
+/* Max line buffer size (includes last '\0') */
+#define MAX_LINE_LEN			1024
+#define MAIN_BUF_SIZE			(MAX_LINES * MAX_LINE_LEN * sizeof(char))
+/*
+ * Devcoredump might have long line this test don't care.
+ * This buffer size used when load dump content
+ */
+#define LINE_BUF_SIZE			(64 * 1024)
+
+#define DUMP_PATH			"/sys/class/drm/card%d/device/devcoredump/data"
+#define START_TAG			"**** Job ****"
+#define END_TAG				"**** VM state ****"
+
+/* Optional Space */
+#define SPC_O				"[ \t]*"
+/* Required Space */
+#define SPC				"[ \t]+"
+/* Optional Non-Space */
+#define NSPC_O				"([^ \t]*)"
+/* Required Non-Space */
+#define NSPC				"([^ \t]+)"
+#define BEG				"^" SPC_O
+#define REQ_FIELD			NSPC SPC
+#define REQ_FIELD_LAST			NSPC SPC_O
+#define OPT_FIELD			NSPC_O SPC_O
+#define END				SPC_O "$"
+
+#define REGEX_NON_SPACE_GROUPS	BEG REQ_FIELD REQ_FIELD_LAST OPT_FIELD OPT_FIELD OPT_FIELD END
+#define REGEX_NON_SPACE_GROUPS_COUNT	6
+
+#define INDEX_KEY			1
+#define INDEX_VALUE			2
+#define INDEX_ENGINE_PHYSICAL		2
+#define INDEX_ENGINE_NAME		1
+#define INDEX_ENGINE_INSTANCE		4
+
+static u64
+xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	int engine_fd = -1;
+	u64 ret;
+
+	engine_fd = xe_sysfs_engine_open(fd, eci->gt_id, eci->engine_class);
+	ret = igt_sysfs_get_u64(engine_fd, JOB_TIMOUT_ENTRY);
+	close(engine_fd);
+
+	return ret;
+}
+
+static void xe_sysfs_set_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci,
+					u64 timeout)
+{
+	int engine_fd = -1;
+
+	engine_fd = xe_sysfs_engine_open(fd, eci->gt_id, eci->engine_class);
+	igt_sysfs_set_u64(engine_fd, JOB_TIMOUT_ENTRY, CAPTURE_JOB_TIMEOUT);
+	close(engine_fd);
+}
+
+static char *safe_strncpy(char *dst, const char *src, int n)
+{
+	char *s;
+
+	igt_assert(n > 0);
+	igt_assert(dst && src);
+
+	s = strncpy(dst, src, n - 1);
+	s[n - 1] = '\0';
+
+	return s;
+}
+
+static const char *xe_engine_class_name(u32 engine_class)
+{
+	switch (engine_class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return "rcs";
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return "bcs";
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "vcs";
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "vecs";
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return "ccs";
+	default:
+		igt_warn("Engine class 0x%x unknown\n", engine_class);
+		return "unknown";
+	}
+}
+
+static void
+test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_queues, int n_execs,
+		 unsigned int flags, u64 addr)
+{
+	u32 vm;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	u32 exec_queues[MAX_N_EXECQUEUES];
+	u32 syncobjs[MAX_N_EXECQUEUES];
+	size_t bo_size;
+	u32 bo = 0;
+	struct {
+		struct xe_spin spin;
+		u32 batch[BATCH_DW_COUNT];
+		u64 pad;
+		u32 data;
+	} *data;
+	struct xe_spin_opts spin_opts = { .preempt = false };
+	int i, b;
+
+	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
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
+		u64 base_addr = addr;
+		u64 batch_offset = (char *)&data[i].batch - (char *)data;
+		u64 batch_addr = base_addr + batch_offset;
+		u64 spin_offset = (char *)&data[i].spin - (char *)data;
+		u64 sdi_offset = (char *)&data[i].data - (char *)data;
+		u64 sdi_addr = base_addr + sdi_offset;
+		u64 exec_addr;
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
+static char **alloc_lines_buffer(void)
+{
+	int i;
+	char **lines = (char **)malloc(MAX_LINES * sizeof(char *));
+	char *main_buf =  (char *)malloc(MAIN_BUF_SIZE);
+
+	igt_assert_f(lines, "Out of memory.\n");
+	igt_assert_f(main_buf, "Out of memory.\n");
+
+	/* set string array pointers */
+	for (i = 0; i < MAX_LINES; i++)
+		lines[i] = main_buf + i * MAX_LINE_LEN;
+
+	return lines;
+}
+
+static char *get_devcoredump_path(int card_id, char *buf)
+{
+	sprintf(buf, DUMP_PATH, card_id);
+	return buf;
+}
+
+static int load_all(FILE *fd, char **lines, char *buf)
+{
+	int start_line = 0, i = 0;
+	bool skip = true;
+
+	memset(lines[0], 0, MAIN_BUF_SIZE);
+	while (!feof(fd) && i < MAX_LINES) {
+		/*
+		 * Devcoredump might have long lines, load up to
+		 * LINE_BUF_SIZE for a single line
+		 */
+		if (!fgets(buf, LINE_BUF_SIZE, fd))
+			if (ferror(fd) != 0) {
+				igt_warn("Failed to read devcoredump file, error: %d\n",
+					 ferror(fd));
+				break;
+			}
+
+		if (skip) {
+			start_line++;
+			/* Skip all lines before START_TAG */
+			if (strncmp(START_TAG, buf, strlen(START_TAG)))
+				continue;
+			else
+				skip = false;
+		}
+
+		/* Only save up to MAX_LINE_LEN to buffer */
+		safe_strncpy(lines[i++], buf, MAX_LINE_LEN);
+
+		/* Stop on END_TAG */
+		if (!strncmp(END_TAG, buf, strlen(END_TAG)))
+			break;
+	}
+	return start_line;
+}
+
+static int access_devcoredump(char *path, char **lines, char *line_buf)
+{
+	int start_line = -1;
+	FILE *fd = fopen(path, "r");
+
+	if (!fd)
+		return false;
+
+	igt_debug("Devcoredump found: %s\n", path);
+
+	/* Clear memory before load file */
+	if (lines)
+		start_line = load_all(fd, lines, line_buf);
+
+	fclose(fd);
+	return start_line;
+}
+
+static bool rm_devcoredump(char *path)
+{
+	int fd = open(path, O_WRONLY);
+
+	if (fd != -1) {
+		igt_debug("Clearing devcoredump.\n");
+		write(fd, "0", 1);
+		close(fd);
+		return true;
+	}
+
+	return false;
+}
+
+static char
+*get_coredump_item(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index)
+{
+	int i;
+	regmatch_t match[REGEX_NON_SPACE_GROUPS_COUNT];
+
+	for (i = 0; i < MAX_LINES; i++) {
+		char *line = lines[i];
+
+		/* Skip lines without tag */
+		if (!strstr(line, tag))
+			continue;
+
+		if ((regexec(regex, line, REGEX_NON_SPACE_GROUPS_COUNT, match, 0)) == 0) {
+			char *key = NULL, *value = NULL;
+
+			if (match[tag_index].rm_so >= 0) {
+				key = &line[match[tag_index].rm_so];
+				line[match[tag_index].rm_eo] = '\0';
+			}
+			if (match[target_index].rm_so >= 0) {
+				value = &line[match[target_index].rm_so];
+				line[match[target_index].rm_eo] = '\0';
+			}
+
+			if (key && value && strcmp(tag, key) == 0)
+				return value;
+			/* if key != tag,  keep searching and loop to next line */
+		}
+	}
+
+	return NULL;
+}
+
+static void
+check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo, u64 addr_hi)
+{
+	u64 result;
+	char *output;
+
+	igt_assert_f((output = get_coredump_item(regex, lines, tag, INDEX_KEY, INDEX_VALUE)),
+		     "Target not found:%s\n", tag);
+	result = strtoul(output, NULL, 16);
+	igt_debug("Compare %s %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
+	igt_assert_f((addr_lo <= result) && (result <= addr_hi),
+		     "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
+}
+
+static void
+check_item_str(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index,
+	       const char *target, bool up_to_target_len)
+{
+	char buf[MAX_TEMP_LEN] = {0};
+	char *output;
+	int code;
+
+	igt_assert_f(output = get_coredump_item(regex, lines, tag, tag_index, target_index),
+		     "Target not found:%s\n", tag);
+
+	if (up_to_target_len) {
+		igt_assert_f(strlen(target) < MAX_TEMP_LEN, "Target too long.\n");
+		safe_strncpy(buf, output, MAX_TEMP_LEN);
+		buf[strlen(target)] = 0;
+		output = buf;
+	}
+	code = strncmp(output, target, strlen(target));
+	igt_debug("From tag '%s' found %s vs %s\n", tag, output, target);
+	igt_assert_f(code == 0, "Expected value:%s, received:%s\n", target, output);
+}
+
+/**
+ * SUBTEST: reset
+ * Description: Reset GuC, check devcoredump output values
+ */
+static void test_card(int fd)
+{
+	struct drm_xe_engine_class_instance *hwe;
+	regex_t regex;
+	int start_line;
+	int engine_cid = rand();
+	char **lines;
+	char *single_line_buf =  (char *)malloc(LINE_BUF_SIZE);
+	char temp[MAX_TEMP_LEN];
+	char path[MAX_SYSFS_PATH_LEN];
+
+	igt_assert_f(single_line_buf, "Out of memory.\n");
+
+	regcomp(&regex, REGEX_NON_SPACE_GROUPS, REG_EXTENDED | REG_NEWLINE);
+	get_devcoredump_path(igt_device_get_card_index(fd), path);
+	lines = alloc_lines_buffer();
+
+	/* clear old devcoredump, if any */
+	rm_devcoredump(path);
+
+	xe_for_each_engine(fd, hwe) {
+		/*
+		 * To test devcoredump register data, the test batch address is
+		 * used to compare with the dump, address bit 40 to 46 act as
+		 * context id, which start with an random number, increased 1
+		 * per engine. By this way, the address is unique for each
+		 * engine, and start with an random number on each run.
+		 */
+		const u64 addr = BASE_ADDRESS | ((u64)(engine_cid++ % CID_ADDRESS_MASK) <<
+						 ADDRESS_SHIFT);
+		u64 job_timeout = xe_sysfs_get_job_timeout_ms(fd, hwe);
+
+		igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
+			  hwe->engine_instance);
+
+		/* Reduce timeout value to speedup test */
+		xe_sysfs_set_job_timeout_ms(fd, hwe, CAPTURE_JOB_TIMEOUT);
+
+		test_legacy_mode(fd, hwe, 1, 1, 0, addr);
+
+		/* Restore timeout value */
+		xe_sysfs_set_job_timeout_ms(fd, hwe, job_timeout);
+
+		/* assert devcoredump created */
+		igt_assert_f((start_line = access_devcoredump(path, lines, single_line_buf)) > 0,
+			     "Devcoredump not exist, errno=%d.\n", errno);
+
+		sprintf(temp, "instance=%d", hwe->engine_instance);
+		check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
+			       INDEX_ENGINE_INSTANCE, temp, false);
+		check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
+			       INDEX_ENGINE_NAME, xe_engine_class_name(hwe->engine_class), true);
+
+		check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, INDEX_VALUE,
+			       "GuC", false);
+		check_item_u64(&regex, lines, "ACTHD:", addr,
+			       addr + BATCH_DW_COUNT * sizeof(u32));
+		check_item_u64(&regex, lines, "RING_BBADDR:", addr,
+			       addr + BATCH_DW_COUNT * sizeof(u32));
+
+		/* clear devcoredump */
+		rm_devcoredump(path);
+		sleep(1);
+		/* Assert devcoredump removed */
+		igt_assert_f(!access_devcoredump(path, NULL, NULL), "Devcoredump not removed\n");
+	}
+	/* Free lines buffer */
+	free(lines);
+	free(single_line_buf);
+	regfree(&regex);
+}
+
+igt_main
+{
+	int xe;
+
+	igt_fixture
+		xe = drm_open_driver(DRIVER_XE);
+
+	igt_subtest("reset") {
+		int gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
+
+		igt_require(xe > 0);
+		if (gpu_count >= 2) {
+			igt_info("Running test on multiple GPU\n");
+
+			igt_multi_fork(child, gpu_count) {
+				int gpu_fd;
+
+				gpu_fd = drm_open_filtered_card(child);
+				igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child,
+					     errno);
+				igt_assert(is_xe_device(gpu_fd));
+
+				test_card(gpu_fd);
+				drm_close_driver(gpu_fd);
+			}
+			igt_waitchildren();
+		} else {
+			igt_info("Running test on single GPU\n");
+			test_card(xe);
+		}
+	}
+
+	igt_fixture
+		drm_close_driver(xe);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2724c7a9a..a6750d523 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -285,6 +285,7 @@ intel_xe_progs = [
 	'xe_exec_atomic',
 	'xe_exec_balancer',
 	'xe_exec_basic',
+	'xe_exec_capture',
 	'xe_exec_compute_mode',
 	'xe_exec_fault_mode',
 	'xe_exec_mix_modes',
-- 
2.34.1

