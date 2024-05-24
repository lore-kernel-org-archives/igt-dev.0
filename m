Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2CBC25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 03:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B6B10E059;
	Fri, 24 May 2024 03:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTAgwFTF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AAA10E891
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 03:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520492; x=1748056492;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=oNxX7CGMahaRORkHAtCUqHNWhfsGQ8IyQQKIVnT+/xE=;
 b=BTAgwFTFii3VsSOsG/aM4pnzelUpxO5n4qKo0g0JXHmcMp2A9qTaVAxL
 fuHJN6ZKYS+sXPnr3HSOclLVgx0iCX5MsKWnkydBzVq6iEJULQASRmhBt
 uYVflIhKX3YS2U7FojwXjCe5wofzmrSb4n7xmQGi+nuF2xkFi2HEKOcWR
 9vLhEvyPz7C9BxQ5AHD6BoiB7D1+AhvQz0gzWlXQUHWwoueVVonpNUK8T
 TQqFHtWYjVoYj3jBix74HBs8EguOMJPtWm9h5mQxbgg56dDI3blCglbae
 +V7KlI13bDJb/vOC4lJ0Q3bqMBHXJG3VDLnglEMrtg7zpdpdSwT9SO+VW A==;
X-CSE-ConnectionGUID: ihl+HzMDQ+mmm+rEkAA12g==
X-CSE-MsgGUID: lFwExIBuSwS7muiBDLbJJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30384646"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="30384646"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:49 -0700
X-CSE-ConnectionGUID: 8UasLnCcRGe5ATnhC3E43A==
X-CSE-MsgGUID: mZXgseWLTgOEtsLfAWz61Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="34413537"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:14:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 23/23] tools/xe-perf: xe_perf_reader,
 xe_perf_control and xe_perf_configs
Date: Thu, 23 May 2024 20:14:39 -0700
Message-ID: <20240524031439.106332-24-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240524031439.106332-1-ashutosh.dixit@intel.com>
References: <20240524031439.106332-1-ashutosh.dixit@intel.com>
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

Add xe_perf_reader, xe_perf_control and xe_perf_configs tools, similar to
their i915 counterparts.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tools/xe-perf/meson.build       |  17 ++
 tools/xe-perf/xe_perf_configs.c | 247 ++++++++++++++++++++++++
 tools/xe-perf/xe_perf_control.c | 117 ++++++++++++
 tools/xe-perf/xe_perf_reader.c  | 325 ++++++++++++++++++++++++++++++++
 4 files changed, 706 insertions(+)
 create mode 100644 tools/xe-perf/xe_perf_configs.c
 create mode 100644 tools/xe-perf/xe_perf_control.c
 create mode 100644 tools/xe-perf/xe_perf_reader.c

diff --git a/tools/xe-perf/meson.build b/tools/xe-perf/meson.build
index a5f59a67fe..8506aa320f 100644
--- a/tools/xe-perf/meson.build
+++ b/tools/xe-perf/meson.build
@@ -1,5 +1,22 @@
+executable('xe-perf-configs',
+           [ 'xe_perf_configs.c' ],
+           include_directories: inc,
+           dependencies: [lib_igt_chipset, lib_igt_xe_oa],
+           install: true)
+
 executable('xe-perf-recorder',
            [ 'xe_perf_recorder.c' ],
            include_directories: inc,
            dependencies: [lib_igt, lib_igt_xe_oa],
            install: true)
+
+executable('xe-perf-control',
+           [ 'xe_perf_control.c' ],
+           include_directories: inc,
+           install: true)
+
+executable('xe-perf-reader',
+           [ 'xe_perf_reader.c' ],
+           include_directories: inc,
+           dependencies: [lib_igt, lib_igt_xe_oa],
+           install: true)
diff --git a/tools/xe-perf/xe_perf_configs.c b/tools/xe-perf/xe_perf_configs.c
new file mode 100644
index 0000000000..af33c0078c
--- /dev/null
+++ b/tools/xe-perf/xe_perf_configs.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+
+#include <assert.h>
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/sysmacros.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "intel_chipset.h"
+#include "xe/xe_oa.h"
+
+static bool
+read_file_uint64(const char *file, uint64_t *value)
+{
+	char buf[32];
+	int fd, n;
+
+	fd = open(file, 0);
+	if (fd < 0)
+		return false;
+	n = read(fd, buf, sizeof (buf) - 1);
+	close(fd);
+	if (n < 0)
+		return false;
+
+	buf[n] = '\0';
+	*value = strtoull(buf, 0, 0);
+
+	return true;
+}
+
+static uint32_t
+read_device_param(const char *stem, int id, const char *param)
+{
+	char *name;
+	int ret = asprintf(&name, "/sys/class/drm/%s%u/device/%s", stem, id, param);
+	uint64_t value;
+	bool success;
+
+	assert(ret != -1);
+
+	success = read_file_uint64(name, &value);
+	free(name);
+
+	return success ? value : 0;
+}
+
+static int
+find_intel_render_node(void)
+{
+	for (int i = 128; i < (128 + 16); i++) {
+		if (read_device_param("renderD", i, "vendor") == 0x8086)
+			return i;
+	}
+
+	return -1;
+}
+
+static int
+open_render_node(uint32_t *devid)
+{
+	char *name;
+	int ret;
+	int fd;
+
+	int render = find_intel_render_node();
+	if (render < 0)
+		return -1;
+
+	ret = asprintf(&name, "/dev/dri/renderD%u", render);
+	assert(ret != -1);
+
+	*devid = read_device_param("renderD", render, "device");
+
+	fd = open(name, O_RDWR);
+	free(name);
+
+	return fd;
+}
+
+static int
+get_card_for_fd(int fd)
+{
+	struct stat sb;
+	int mjr, mnr;
+	char buffer[128];
+	DIR *drm_dir;
+	struct dirent *entry;
+	int retval = -1;
+
+	if (fstat(fd, &sb)) {
+		fprintf(stderr, "Failed to stat DRM fd\n");
+		return -1;
+	}
+
+	mjr = major(sb.st_rdev);
+	mnr = minor(sb.st_rdev);
+
+	snprintf(buffer, sizeof(buffer), "/sys/dev/char/%d:%d/device/drm", mjr, mnr);
+
+	drm_dir = opendir(buffer);
+	assert(drm_dir != NULL);
+
+	while ((entry = readdir(drm_dir))) {
+		if (entry->d_type == DT_DIR && strncmp(entry->d_name, "card", 4) == 0) {
+			retval = strtoull(entry->d_name + 4, NULL, 10);
+			break;
+		}
+	}
+
+	closedir(drm_dir);
+
+	return retval;
+}
+
+static const char *
+metric_name(struct intel_xe_perf *perf, const char *hw_config_guid)
+{
+	struct intel_xe_perf_metric_set *metric_set;
+
+	igt_list_for_each_entry(metric_set, &perf->metric_sets, link) {
+		if (!strcmp(metric_set->hw_config_guid, hw_config_guid))
+			return metric_set->symbol_name;
+	}
+
+	return "Unknown";
+}
+
+static void
+usage(void)
+{
+	printf("Usage: xe-perf-configs [options]\n"
+	       "Manages xe-perf configurations stored in xe.\n"
+	       "     --purge, -p         Purge configurations from the kernel\n"
+	       "     --list,  -l         List configurations from the kernel\n");
+}
+
+int
+main(int argc, char *argv[])
+{
+	char metrics_path[128];
+	DIR *metrics_dir;
+	struct dirent *entry;
+	int drm_fd, drm_card;
+	int opt;
+	bool purge = false;
+	const struct option long_options[] = {
+		{"help",   no_argument, 0, 'h'},
+		{"list",   no_argument, 0, 'l'},
+		{"purge",  no_argument, 0, 'p'},
+		{0, 0, 0, 0}
+	};
+	const struct intel_device_info *devinfo;
+	struct intel_xe_perf *perf;
+	uint32_t devid = 0;
+
+	while ((opt = getopt_long(argc, argv, "hlp", long_options, NULL)) != -1) {
+		switch (opt) {
+		case 'h':
+			usage();
+			return EXIT_SUCCESS;
+		case 'l':
+			break;
+		case 'p':
+			purge = true;
+			break;
+		default:
+			fprintf(stderr, "Internal error: "
+				"unexpected getopt value: %d\n", opt);
+			usage();
+			return EXIT_FAILURE;
+		}
+	}
+
+	drm_fd = open_render_node(&devid);
+	drm_card = get_card_for_fd(drm_fd);
+
+	fprintf(stdout, "Found device id=0x%x\n", devid);
+
+	devinfo = intel_get_device_info(drm_fd);
+	if (!devinfo) {
+		fprintf(stderr, "No device info found.\n");
+		return EXIT_FAILURE;
+	}
+
+	fprintf(stdout, "Device graphics_ver=%i gt=%i\n", devinfo->graphics_ver, devinfo->gt);
+
+	perf = intel_xe_perf_for_fd(drm_fd, 0);
+	if (!perf) {
+		fprintf(stderr, "No perf data found.\n");
+		return EXIT_FAILURE;
+	}
+
+	snprintf(metrics_path, sizeof(metrics_path),
+		 "/sys/class/drm/card%d/metrics", drm_card);
+	metrics_dir = opendir(metrics_path);
+	if (!metrics_dir)
+		return EXIT_FAILURE;
+
+	fprintf(stdout, "Looking at metrics in %s\n", metrics_path);
+
+	while ((entry = readdir(metrics_dir))) {
+		char metric_id_path[400];
+		uint64_t metric_id;
+
+		if (entry->d_type != DT_DIR)
+			continue;
+
+		snprintf(metric_id_path, sizeof(metric_id_path),
+			 "%s/%s/id", metrics_path, entry->d_name);
+
+		if (!read_file_uint64(metric_id_path, &metric_id))
+			continue;
+
+		if (purge) {
+			if (intel_xe_perf_ioctl(drm_fd, DRM_XE_PERF_OP_REMOVE_CONFIG, &metric_id) == 0)
+				fprintf(stdout, "\tRemoved config %s id=%03" PRIu64 " name=%s\n",
+					entry->d_name, metric_id, metric_name(perf, entry->d_name));
+			else
+				fprintf(stdout, "\tFailed to remove config %s id=%03" PRIu64 " name=%s\n",
+					entry->d_name, metric_id, metric_name(perf, entry->d_name));
+		} else {
+			fprintf(stdout, "\tConfig %s id=%03" PRIu64 " name=%s\n",
+				entry->d_name, metric_id, metric_name(perf, entry->d_name));
+		}
+	}
+
+	closedir(metrics_dir);
+	close(drm_fd);
+
+	return EXIT_SUCCESS;
+}
diff --git a/tools/xe-perf/xe_perf_control.c b/tools/xe-perf/xe_perf_control.c
new file mode 100644
index 0000000000..da96232bc8
--- /dev/null
+++ b/tools/xe-perf/xe_perf_control.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+
+#include <getopt.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "xe_perf_recorder_commands.h"
+
+static void
+usage(const char *name)
+{
+	fprintf(stdout,
+		"Usage: %s [options]\n"
+		"\n"
+		"     --help,               -h         Print this screen\n"
+		"     --command-fifo,       -f <path>  Path to a command fifo\n"
+		"     --dump,               -d <path>  Write a content of circular buffer to path\n",
+		name);
+}
+
+int
+main(int argc, char *argv[])
+{
+	const struct option long_options[] = {
+		{"help",                       no_argument, 0, 'h'},
+		{"dump",                 required_argument, 0, 'd'},
+		{"command-fifo",         required_argument, 0, 'f'},
+		{"quit",                       no_argument, 0, 'q'},
+		{0, 0, 0, 0}
+	};
+	const char *command_fifo = XE_PERF_RECORD_FIFO_PATH, *dump_file = NULL;
+	FILE *command_fifo_file;
+	int opt;
+	bool quit = false;
+
+	while ((opt = getopt_long(argc, argv, "hd:f:q", long_options, NULL)) != -1) {
+		switch (opt) {
+		case 'h':
+			usage(argv[0]);
+			return EXIT_SUCCESS;
+		case 'd':
+			dump_file = optarg;
+			break;
+		case 'f':
+			command_fifo = optarg;
+			break;
+		case 'q':
+			quit = true;
+			break;
+		default:
+			fprintf(stderr, "Internal error: "
+				"unexpected getopt value: %d\n", opt);
+			usage(argv[0]);
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (!command_fifo)
+		return EXIT_FAILURE;
+
+	command_fifo_file = fopen(command_fifo, "r+");
+	if (!command_fifo_file) {
+		fprintf(stderr, "Unable to open command file\n");
+		return EXIT_FAILURE;
+	}
+
+	if (dump_file) {
+		if (dump_file[0] == '/') {
+			uint32_t total_len =
+				sizeof(struct recorder_command_base) + strlen(dump_file) + 1;
+			struct {
+				struct recorder_command_base base;
+				uint8_t dump[];
+			} *data = malloc(total_len);
+
+			data->base.command = RECORDER_COMMAND_DUMP;
+			data->base.size = total_len;
+			snprintf((char *) data->dump, strlen(dump_file) + 1, "%s", dump_file);
+
+			fwrite(data, total_len, 1, command_fifo_file);
+		} else {
+			char *cwd = getcwd(NULL, 0);
+			uint32_t path_len = strlen(cwd) + 1 + strlen(dump_file) + 1;
+			uint32_t total_len = sizeof(struct recorder_command_base) + path_len;
+			struct {
+				struct recorder_command_base base;
+				uint8_t dump[];
+			} *data = malloc(total_len);
+
+			data->base.command = RECORDER_COMMAND_DUMP;
+			data->base.size = total_len;
+			snprintf((char *) data->dump, path_len, "%s/%s", cwd, dump_file);
+
+			fwrite(data, total_len, 1, command_fifo_file);
+		}
+	}
+
+	if (quit) {
+		struct recorder_command_base base = {
+			.command = RECORDER_COMMAND_QUIT,
+			.size = sizeof(base),
+		};
+
+		fwrite(&base, sizeof(base), 1, command_fifo_file);
+	}
+
+	fclose(command_fifo_file);
+
+	return EXIT_SUCCESS;
+}
diff --git a/tools/xe-perf/xe_perf_reader.c b/tools/xe-perf/xe_perf_reader.c
new file mode 100644
index 0000000000..62a4237ee4
--- /dev/null
+++ b/tools/xe-perf/xe_perf_reader.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <assert.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <unistd.h>
+
+#include "igt_core.h"
+#include "intel_chipset.h"
+#include "xe/xe_oa.h"
+#include "xe/xe_oa_data_reader.h"
+
+#define MAX(a,b) ((a) > (b) ? (a) : (b))
+#define MIN(a,b) ((a) > (b) ? (b) : (a))
+
+static void
+usage(void)
+{
+	printf("Usage: xe-perf-reader [options] file\n"
+	       "Reads the content of an xe-perf recording.\n"
+	       "\n"
+	       "     --help,    -h             Print this screen\n"
+	       "     --counters, -c c1,c2,...  List of counters to display values for.\n"
+	       "                               Use 'all' to display all counters.\n"
+	       "                               Use 'list' to list available counters.\n"
+	       "     --reports, -r             Print out data per report.\n");
+}
+
+static struct intel_xe_perf_logical_counter *
+find_counter(struct intel_xe_perf_metric_set *metric_set,
+	     const char *name)
+{
+	for (uint32_t i = 0; i < metric_set->n_counters; i++) {
+		if (!strcmp(name, metric_set->counters[i].symbol_name)) {
+			return &metric_set->counters[i];
+		}
+	}
+
+	return NULL;
+}
+
+static void
+append_counter(struct intel_xe_perf_logical_counter ***counters,
+	       int32_t *n_counters,
+	       uint32_t *n_allocated_counters,
+	       struct intel_xe_perf_logical_counter *counter)
+{
+	if (*n_counters < *n_allocated_counters) {
+		(*counters)[(*n_counters)++] = counter;
+		return;
+	}
+
+	*n_allocated_counters = MAX(2, *n_allocated_counters * 2);
+	*counters = realloc(*counters,
+			    sizeof(struct intel_xe_perf_logical_counter *) *
+			    (*n_allocated_counters));
+	(*counters)[(*n_counters)++] = counter;
+}
+
+static struct intel_xe_perf_logical_counter **
+get_logical_counters(struct intel_xe_perf_metric_set *metric_set,
+		     const char *counter_list,
+		     int32_t *out_n_counters)
+{
+	struct intel_xe_perf_logical_counter **counters = NULL, *counter;
+	uint32_t n_allocated_counters = 0;
+	const char *current, *next;
+	char counter_name[100];
+
+	if (!counter_list) {
+		*out_n_counters = 0;
+		return NULL;
+	}
+
+	if (!strcmp(counter_list, "list")) {
+		uint32_t longest_name = 0;
+
+		*out_n_counters = -1;
+		for (uint32_t i = 0; i < metric_set->n_counters; i++) {
+			longest_name = MAX(longest_name,
+					   strlen(metric_set->counters[i].symbol_name));
+		}
+
+		fprintf(stdout, "Available counters:\n");
+		for (uint32_t i = 0; i < metric_set->n_counters; i++) {
+			fprintf(stdout, "%s:%*s%s\n",
+				metric_set->counters[i].symbol_name,
+				(int)(longest_name -
+				      strlen(metric_set->counters[i].symbol_name) + 1), " ",
+				metric_set->counters[i].name);
+		}
+		return NULL;
+	}
+
+	if (!strcmp(counter_list, "all")) {
+		counters = malloc(sizeof(*counters) * metric_set->n_counters);
+		*out_n_counters = metric_set->n_counters;
+		for (uint32_t i = 0; i < metric_set->n_counters; i++)
+			counters[i] = &metric_set->counters[i];
+		return counters;
+	}
+
+	*out_n_counters = 0;
+	current = counter_list;
+	while ((next = strstr(current, ","))) {
+		snprintf(counter_name,
+			 MIN((uint32_t)(next - current) + 1, sizeof(counter_name)),
+			 "%s", current);
+
+		counter = find_counter(metric_set, counter_name);
+		if (!counter) {
+			fprintf(stderr, "Unknown counter '%s'.\n", counter_name);
+			free(counters);
+			*out_n_counters = -1;
+			return NULL;
+		}
+
+		append_counter(&counters, out_n_counters, &n_allocated_counters, counter);
+
+		current = next + 1;
+	}
+
+	if (strlen(current) > 0) {
+		counter = find_counter(metric_set, current);
+		if (!counter) {
+			fprintf(stderr, "Unknown counter '%s'.\n", current);
+			free(counters);
+			*out_n_counters = -1;
+			return NULL;
+		}
+
+		append_counter(&counters, out_n_counters, &n_allocated_counters, counter);
+	}
+
+	return counters;
+}
+
+static void
+print_report_deltas(const struct intel_xe_perf_data_reader *reader,
+		    const struct intel_xe_perf_record_header *xe_report0,
+		    const struct intel_xe_perf_record_header *xe_report1,
+		    struct intel_xe_perf_logical_counter **counters,
+		    uint32_t n_counters)
+{
+	struct intel_xe_perf_accumulator accu;
+
+	intel_xe_perf_accumulate_reports(&accu,
+				      reader->perf, reader->metric_set,
+				      xe_report0, xe_report1);
+
+	for (uint32_t c = 0; c < n_counters; c++) {
+		struct intel_xe_perf_logical_counter *counter = counters[c];
+
+		switch (counter->storage) {
+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_UINT64:
+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_UINT32:
+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_BOOL32:
+			fprintf(stdout, "   %s: %" PRIu64 "\n",
+				counter->symbol_name, counter->read_uint64(reader->perf,
+									   reader->metric_set,
+									   accu.deltas));
+			break;
+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_DOUBLE:
+		case INTEL_XE_PERF_LOGICAL_COUNTER_STORAGE_FLOAT:
+			fprintf(stdout, "   %s: %f\n",
+				counter->symbol_name, counter->read_float(reader->perf,
+									  reader->metric_set,
+									  accu.deltas));
+			break;
+		}
+	}
+}
+
+int
+main(int argc, char *argv[])
+{
+	const struct option long_options[] = {
+		{"help",             no_argument, 0, 'h'},
+		{"counters",   required_argument, 0, 'c'},
+		{"reports",          no_argument, 0, 'r'},
+		{0, 0, 0, 0}
+	};
+	struct intel_xe_perf_data_reader reader;
+	struct intel_xe_perf_logical_counter **counters;
+	const struct intel_device_info *devinfo;
+	const char *counter_names = NULL;
+	int32_t n_counters;
+	int fd, opt;
+	bool print_reports = false;
+
+	while ((opt = getopt_long(argc, argv, "hc:r", long_options, NULL)) != -1) {
+		switch (opt) {
+		case 'h':
+			usage();
+			return EXIT_SUCCESS;
+		case 'c':
+			counter_names = optarg;
+			break;
+		case 'r':
+			print_reports = true;
+			break;
+		default:
+			fprintf(stderr, "Internal error: "
+				"unexpected getopt value: %d\n", opt);
+			usage();
+			return EXIT_FAILURE;
+		}
+	}
+
+	if (optind >= argc) {
+		fprintf(stderr, "No recording file specified.\n");
+		return EXIT_FAILURE;
+	}
+
+	fd = open(argv[optind], 0, O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "Cannot open '%s': %s.\n",
+			argv[optind], strerror(errno));
+		return EXIT_FAILURE;
+	}
+
+	if (!intel_xe_perf_data_reader_init(&reader, fd)) {
+		fprintf(stderr, "Unable to parse '%s': %s.\n",
+			argv[optind], reader.error_msg);
+		return EXIT_FAILURE;
+	}
+
+	counters = get_logical_counters(reader.metric_set, counter_names, &n_counters);
+	if (n_counters < 0)
+		goto exit;
+
+	devinfo = intel_get_device_info(reader.devinfo.devid);
+
+	fprintf(stdout, "Recorded on device=0x%x(%s) graphics_ver=%i\n",
+		reader.devinfo.devid, devinfo->codename,
+		reader.devinfo.graphics_ver);
+	fprintf(stdout, "Metric used : %s (%s) uuid=%s\n",
+		reader.metric_set->symbol_name, reader.metric_set->name,
+		reader.metric_set->hw_config_guid);
+	fprintf(stdout, "Reports: %u\n", reader.n_records);
+	fprintf(stdout, "Context switches: %u\n", reader.n_timelines);
+	fprintf(stdout, "Timestamp correlation points: %u\n", reader.n_correlations);
+
+	if (reader.n_correlations < 2) {
+		fprintf(stderr, "Less than 2 CPU/GPU timestamp correlation points.\n");
+		return EXIT_FAILURE;
+	}
+
+	fprintf(stdout, "Timestamp correlation CPU range:       0x%016"PRIx64"-0x%016"PRIx64"\n",
+		reader.correlations[0]->cpu_timestamp,
+		reader.correlations[reader.n_correlations - 1]->cpu_timestamp);
+	fprintf(stdout, "Timestamp correlation GPU range (64b): 0x%016"PRIx64"-0x%016"PRIx64"\n",
+		reader.correlations[0]->gpu_timestamp,
+		reader.correlations[reader.n_correlations - 1]->gpu_timestamp);
+	fprintf(stdout, "Timestamp correlation GPU range (32b): 0x%016"PRIx64"-0x%016"PRIx64"\n",
+		reader.correlations[0]->gpu_timestamp & 0xffffffff,
+		reader.correlations[reader.n_correlations - 1]->gpu_timestamp & 0xffffffff);
+
+	fprintf(stdout, "OA data timestamp range:               0x%016"PRIx64"-0x%016"PRIx64"\n",
+		intel_xe_perf_read_record_timestamp(reader.perf,
+						 reader.metric_set,
+						 reader.records[0]),
+		intel_xe_perf_read_record_timestamp(reader.perf,
+						 reader.metric_set,
+						 reader.records[reader.n_records - 1]));
+	fprintf(stdout, "OA raw data timestamp range:           0x%016"PRIx64"-0x%016"PRIx64"\n",
+		intel_xe_perf_read_record_timestamp_raw(reader.perf,
+						     reader.metric_set,
+						     reader.records[0]),
+		intel_xe_perf_read_record_timestamp_raw(reader.perf,
+						     reader.metric_set,
+						     reader.records[reader.n_records - 1]));
+
+	if (strcmp(reader.metric_set_uuid, reader.metric_set->hw_config_guid)) {
+		fprintf(stdout,
+			"WARNING: Recording used a different HW configuration.\n"
+			"WARNING: This could lead to inconsistent counter values.\n");
+	}
+
+	for (uint32_t i = 0; i < reader.n_timelines; i++) {
+		const struct intel_xe_perf_timeline_item *item = &reader.timelines[i];
+
+		fprintf(stdout, "Time: CPU=0x%016" PRIx64 "-0x%016" PRIx64
+			" GPU=0x%016" PRIx64 "-0x%016" PRIx64"\n",
+			item->cpu_ts_start, item->cpu_ts_end,
+			item->ts_start, item->ts_end);
+		fprintf(stdout, "hw_id=0x%x %s\n",
+			item->hw_id, item->hw_id == 0xffffffff ? "(idle)" : "");
+
+		print_report_deltas(&reader,
+				    reader.records[item->record_start],
+				    reader.records[item->record_end],
+				    counters, n_counters);
+
+		if (print_reports) {
+			for (uint32_t r = item->record_start; r < item->record_end; r++) {
+				fprintf(stdout, " report%i = %s\n",
+					r - item->record_start,
+					intel_xe_perf_read_report_reason(reader.perf, reader.records[r]));
+				print_report_deltas(&reader,
+						    reader.records[r],
+						    reader.records[r + 1],
+						    counters, n_counters);
+			}
+		}
+	}
+
+ exit:
+	intel_xe_perf_data_reader_fini(&reader);
+	close(fd);
+
+	return EXIT_SUCCESS;
+}
-- 
2.41.0

