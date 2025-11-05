Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C43CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 06:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC6610E1B5;
	Wed,  5 Nov 2025 06:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2OiH2m/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4E010E1B5
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 06:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762322501; x=1793858501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F61VxTjlzI5q/jX4wizLuAsOf/x9fr2anmhNYQI3euk=;
 b=X2OiH2m/e4Ghp7yOiaTXv4eTyhFCo6DBuVFNVBfTlnEwW+Hc1o/U6poN
 c4u4yM39tcsn4yyr0JkRlqNgy61sjb2CQrNYDEFJJdmLkXJ1uOotF+jHb
 H2d2OohNT2tRRiHLLvRz6XLyz471D8EnfrGYQQXjCrMrX5sQrtxolGL48
 dOH1Vn94n3kX3dIaQ5Pd64fYCKqMHwwIgpKedtyrAgL3m1rR48gqyvPNf
 bbAmTcArjK1Cja3BWLXWDrzYsRu1Qj4QRBgMkopHUIc1tGUsXIPDc3xpo
 K/zhzzMKeTfJ019Bvs1BlU2Me/fUaWEOJWFkeDHaf2C1h+QK7Y65tXc8f g==;
X-CSE-ConnectionGUID: JeFYV+16Q9qggte1Nv17bw==
X-CSE-MsgGUID: vIYjcHnKQr+r9mr2n/GbxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64527716"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="64527716"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 22:01:40 -0800
X-CSE-ConnectionGUID: mNerRc4LQYysEz5RTlo76g==
X-CSE-MsgGUID: g0WsvECtR3yGFit2/8Vxew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="186652346"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 04 Nov 2025 22:01:37 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Adith Narein T <adith.narein.t@intel.com>
Subject: [PATCH i-g-t v2 4/4] tools/displaytop: Add ftrace support to Display
 Top
Date: Wed,  5 Nov 2025 11:39:14 +0530
Message-Id: <20251105060914.673664-5-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251105060914.673664-1-pranay.samala@intel.com>
References: <20251105060914.673664-1-pranay.samala@intel.com>
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

From: Adith Narein T <adith.narein.t@intel.com>

This patch adds support for live tracing using ftrace in the DisplayTop
tool. It enables real-time monitoring with options for filtering, dumping,
and clearing the trace data.

Key features introduced:

- Live ftrace output visualization within the terminal UI
- Filter trace logs by register address for focused debugging
- Dump current trace buffer to a file for offline analysis
- Clear trace buffer on demand via the UI

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Signed-off-by: Adith Narein T <adith.narein.t@intel.com>
Co-authored-by: Pranay Samala <pranay.samala@intel.com>
---
 tools/displaytop/README.md                    |   2 +
 tools/displaytop/include/data.h               |   1 +
 tools/displaytop/include/display.h            |   5 +
 tools/displaytop/include/populate.h           |   1 +
 tools/displaytop/include/utils.h              |   4 +
 tools/displaytop/meson.build                  |   6 +
 tools/displaytop/src/display_dump_tracing.c   | 133 ++++++++
 tools/displaytop/src/display_filter_tracing.c | 305 ++++++++++++++++++
 tools/displaytop/src/display_ftrace.c         |  98 ++++++
 tools/displaytop/src/display_live_tracing.c   | 115 +++++++
 tools/displaytop/src/populate.c               |   1 +
 tools/displaytop/src/populate_ftrace.c        |  71 ++++
 tools/displaytop/src/utils_trace.c            |  61 ++++
 13 files changed, 803 insertions(+)
 create mode 100644 tools/displaytop/src/display_dump_tracing.c
 create mode 100644 tools/displaytop/src/display_filter_tracing.c
 create mode 100644 tools/displaytop/src/display_ftrace.c
 create mode 100644 tools/displaytop/src/display_live_tracing.c
 create mode 100644 tools/displaytop/src/populate_ftrace.c
 create mode 100644 tools/displaytop/src/utils_trace.c

diff --git a/tools/displaytop/README.md b/tools/displaytop/README.md
index a47051f8d..9405dc484 100644
--- a/tools/displaytop/README.md
+++ b/tools/displaytop/README.md
@@ -9,6 +9,8 @@ A terminal-based tool for monitoring and debugging the display pipeline.
 - Real-time display Configuration
 - view Live Display Debugfs in a terminal ui
 - Read & view DPCD register value & bitfield information
+- Formatted Live trace using Ftrace
+- filter the formatted ftrace by register address/range
 
 ---
 
diff --git a/tools/displaytop/include/data.h b/tools/displaytop/include/data.h
index 7cdbd2cb2..df632da0e 100644
--- a/tools/displaytop/include/data.h
+++ b/tools/displaytop/include/data.h
@@ -48,5 +48,6 @@ struct DP_mapping {
 
 struct DP_mapping **get_dp_mapping_storage(void);
 int *get_dp_mapping_count_ptr(void);
+#define TRACE_PATH "/sys/kernel/debug/tracing/trace"
 
 #endif
diff --git a/tools/displaytop/include/display.h b/tools/displaytop/include/display.h
index c2502b040..c38d63843 100644
--- a/tools/displaytop/include/display.h
+++ b/tools/displaytop/include/display.h
@@ -46,5 +46,10 @@ void display_summary(WINDOW *pad, struct Node *node, int *content_line);
 
 void display_debugfs_file(WINDOW *pad, struct Node *node, int *content_line);
 void display_dpcd(WINDOW *pad, struct Node *node, int *content_line);
+void display_ftrace_options(WINDOW *pad, struct Node *node, int *content_line);
+void display_live_tracing(WINDOW *pad, struct Node *node, int *content_line);
+void display_dump_tracing(WINDOW *pad, struct Node *node, int *content_line);
+void display_filter_tracing(WINDOW *pad, struct Node *node, int *content_line);
+void display_clear_ftrace(WINDOW *pad, struct Node *node, int *content_line);
 
 #endif
diff --git a/tools/displaytop/include/populate.h b/tools/displaytop/include/populate.h
index eb29ac31d..76e687b75 100644
--- a/tools/displaytop/include/populate.h
+++ b/tools/displaytop/include/populate.h
@@ -36,5 +36,6 @@ void populate_data(void);
 void initialize_display_config(void);
 void initialize_display_debugfs(void);
 void initialize_DPCD(void);
+void initialize_ftrace(void);
 
 #endif
diff --git a/tools/displaytop/include/utils.h b/tools/displaytop/include/utils.h
index ab3424cee..c62451ae7 100644
--- a/tools/displaytop/include/utils.h
+++ b/tools/displaytop/include/utils.h
@@ -128,5 +128,9 @@ char *find_debugfs_dir(int drm_fd);
 int read_dpcd_registers(const char *aux_path, unsigned char *buffer, size_t size, uint64_t offset);
 
 uint64_t parse_hex_address(const char *hex_str);
+/* utils_trace.c */
+void free_cache(void);
+int clear_ftrace(void);
+void ensure_tracing_on(void);
 
 #endif
diff --git a/tools/displaytop/meson.build b/tools/displaytop/meson.build
index e54ffec26..3c3f87975 100644
--- a/tools/displaytop/meson.build
+++ b/tools/displaytop/meson.build
@@ -70,6 +70,12 @@ if have_displaytop
     'src/display_DPCD.c',
     'src/populate_DPCD.c',
     'src/utils_registers.c',
+    'src/utils_trace.c',
+    'src/populate_ftrace.c',
+    'src/display_ftrace.c',
+    'src/display_live_tracing.c',
+    'src/display_dump_tracing.c',
+    'src/display_filter_tracing.c',
   )
 
   if meson.is_subproject()
diff --git a/tools/displaytop/src/display_dump_tracing.c b/tools/displaytop/src/display_dump_tracing.c
new file mode 100644
index 000000000..88d9e8a79
--- /dev/null
+++ b/tools/displaytop/src/display_dump_tracing.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "display.h"
+#include "utils.h"
+
+void display_dump_tracing(WINDOW *pad, struct Node *node, int *content_line)
+{
+	int line = 0;
+	FILE *trace_fp = NULL, *dump_fp = NULL;
+	char buffer[512];
+	time_t now;
+	struct tm *t = NULL;
+	char dump_file_path[256];
+	int width, col_widths[6];
+	int total_count = 0;
+	WINDOW *progress_win = NULL;
+	size_t log_count = 0;
+	int current_count = 0;
+
+	now = time(NULL);
+	t = localtime(&now);
+	log_message(LOG_INFO, "Dumping trace logs for node: %s", node->name);
+	snprintf(dump_file_path, sizeof(dump_file_path), DUMP_DIR "/Ftrace_dump_");
+	strftime(dump_file_path + strlen(dump_file_path),
+		 sizeof(dump_file_path) - strlen(dump_file_path),
+		 "%Y-%m-%d-%H.%M.%S.txt", t);
+
+	ensure_tracing_on();
+	ensure_dump_directory();
+
+	trace_fp = fopen(TRACE_PATH, "r");
+	if (!trace_fp) {
+		log_message(LOG_ERROR, "Error opening trace file: %s", strerror(errno));
+		*content_line = line;
+		return;
+	}
+
+	dump_fp = fopen(dump_file_path, "w");
+	if (!dump_fp) {
+		log_message(LOG_ERROR, "Error creating dump file: %s", strerror(errno));
+		fclose(trace_fp);
+		*content_line = line;
+		return;
+	}
+	chmod(dump_file_path, 0777);
+
+	width = getmaxx(pad) - 8;
+
+	col_widths[0] = width * 0.10f;
+	col_widths[1] = width * 0.05f;
+	col_widths[2] = width * 0.10f;
+	col_widths[3] = width * 0.08f;
+	col_widths[4] = width * 0.10f;
+	col_widths[5] = width * 0.25f;
+
+	wclear(pad);
+	wattron(pad, A_BOLD);
+	mvwprintw(pad, line++, 1, "Ftrace Formatted & Dumped!");
+	wattroff(pad, A_BOLD);
+
+	while (fgets(buffer, sizeof(buffer), trace_fp)) {
+		if (strstr(buffer, "i915_reg_rw"))
+			total_count++;
+	}
+	rewind(trace_fp);
+
+	progress_win = newwin(getmaxy(stdscr), getmaxx(stdscr), 0, 0);
+	wbkgd(progress_win, COLOR_PAIR(6));
+	wclear(progress_win);
+	box(progress_win, 0, 0);
+	print_bold_text(progress_win, 8, 2, "DUMPING IS IN PROGRESS :)");
+	wrefresh(progress_win);
+
+	while (fgets(buffer, sizeof(buffer), trace_fp)) {
+		char process[32], op[8];
+		int pid, cpu, reg, val1, val2, len;
+		double timestamp;
+		char value_str[64];
+
+		if (!strstr(buffer, "i915_reg_rw"))
+			continue;
+
+		if (sscanf(buffer, "%31[^-]-%d  [%d] %*s %lf: i915_reg_rw: %7s reg=0x%x, len=%d, val=(0x%x, 0x%x)",
+			   process, &pid, &cpu, &timestamp, op, &reg, &len, &val1, &val2) == 9) {
+			strip_whitespace(process);
+			strip_whitespace(op);
+
+			snprintf(value_str, sizeof(value_str), "(0x%X, 0x%X)", val1, val2);
+
+			fprintf(dump_fp, "| %-*s | %-*d | %-*.6f | %-*s | 0x%-*X | %-*s |\n",
+				col_widths[0], process,
+				col_widths[1], cpu,
+				col_widths[2], timestamp,
+				col_widths[3], op,
+				col_widths[4] - 2, reg,
+				col_widths[5], value_str);
+
+			log_count++;
+			current_count++;
+			render_progress_bar(progress_win, log_count, total_count);
+		}
+	}
+
+	mvwprintw(pad, line + 2, 1, "Dump saved to: %s", dump_file_path);
+	*content_line = line;
+
+	fclose(trace_fp);
+	fclose(dump_fp);
+
+	delwin(progress_win);
+}
diff --git a/tools/displaytop/src/display_filter_tracing.c b/tools/displaytop/src/display_filter_tracing.c
new file mode 100644
index 000000000..e46816b53
--- /dev/null
+++ b/tools/displaytop/src/display_filter_tracing.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include <form.h>
+
+#include "display.h"
+#include "utils.h"
+
+static char *get_range_input(void)
+{
+	int rows, cols;
+	WINDOW *overlay;
+	FIELD * fields[2];
+	FORM *form;
+	char *input_buffer;
+	int ch, pos;
+
+	rows = 0;
+	cols = 0;
+	overlay = NULL;
+	fields[0] = NULL;
+	fields[1] = NULL;
+	form = NULL;
+	input_buffer = NULL;
+	ch = 0;
+	pos = 0;
+
+	wclear(stdscr);
+	wrefresh(stdscr);
+	getmaxyx(stdscr, rows, cols);
+	overlay = newwin(rows, cols, 0, 0);
+	wbkgd(overlay, COLOR_PAIR(6));
+	keypad(overlay, TRUE);
+	box(overlay, 0, 0);
+	wrefresh(overlay);
+
+	print_bold_text(overlay, 1, 1, "Trace Log Filtering - Instructions");
+	mvwprintw(overlay, 3, 2, "1. Enter a single register address (e.g., 0x40000)");
+	mvwprintw(overlay, 4, 2, "2. Enter an address range (e.g., 0x40000-0x40400)");
+	mvwprintw(overlay, 5, 2, "3. Press ENTER to apply filter, ESC to exit.");
+	mvwhline(overlay, 6, 1, 0, cols - 2);
+
+	fields[0] = new_field(1, cols - 4, 1, 1, 0, 0);
+	fields[1] = NULL;
+
+	set_field_back(fields[0], A_UNDERLINE);
+	field_opts_off(fields[0], O_AUTOSKIP);
+
+	form = new_form(fields);
+	set_form_win(form, overlay);
+	set_form_sub(form, derwin(overlay, 3, cols - 2, 7, 1));
+
+	wbkgd(form_sub(form), COLOR_PAIR(7));
+	box(form_sub(form), 0, 0);
+	post_form(form);
+	wrefresh(overlay);
+
+	input_buffer = malloc(256);
+	if (!input_buffer) {
+		log_message(LOG_ERROR, "Memory allocation failed for input buffer");
+		return NULL;
+	}
+	memset(input_buffer, 0, 256);
+	pos = 0;
+
+	while ((ch = getch()) != 27) {
+		switch (ch) {
+		case KEY_BACKSPACE:
+		case 127:
+		case 8:
+			if (pos > 0) {
+				pos--;
+				input_buffer[pos] = '\0';
+				form_driver(form, REQ_DEL_PREV);
+			}
+			break;
+		case '\n':
+			if (pos > 0) {
+				unpost_form(form);
+				free_form(form);
+				free_field(fields[0]);
+				wclear(overlay);
+				wrefresh(overlay);
+				delwin(overlay);
+				return input_buffer;
+			}
+			break;
+		default:
+			if (pos < 255) {
+				input_buffer[pos++] = ch;
+				input_buffer[pos] = '\0';
+				form_driver(form, ch);
+			}
+			break;
+		}
+		wrefresh(overlay);
+	}
+
+	if (form)
+		unpost_form(form), free_form(form);
+	if (fields[0])
+		free_field(fields[0]);
+	if (overlay)
+		wclear(overlay), wrefresh(overlay), delwin(overlay);
+	if (input_buffer)
+		free(input_buffer);
+
+	return NULL;
+}
+
+void display_filter_tracing(WINDOW *pad, struct Node *node, int *content_line)
+{
+	int line = 0;
+	char buffer[512];
+	size_t log_count = 0;
+	time_t now = time(NULL);
+	uint32_t start_addr = 0, end_addr = 0;
+	FILE *trace_fp = NULL;
+	FILE *dump_fp = NULL;
+	char dump_file_path[256];
+	char *input_buffer = NULL;
+	int width = getmaxx(pad) - 9;
+	int col_widths[6];
+	int total_count = 0;
+	int current_count = 0;
+	WINDOW *progress_win = NULL;
+	struct tm *t = NULL;
+
+	col_widths[0] = width * 0.12f;
+	col_widths[1] = width * 0.06f;
+	col_widths[2] = width * 0.13f;
+	col_widths[3] = width * 0.10f;
+	col_widths[4] = width * 0.15f;
+	col_widths[5] = width * 0.44f;
+
+	t = localtime(&now);
+	ensure_dump_directory();
+	strftime(dump_file_path, sizeof(dump_file_path),
+		 DUMP_DIR "/filtered_trace_dump_%Y-%m-%d_%H.%M.%S.txt", t);
+
+	*content_line = line;
+	line = 3;
+
+	ensure_tracing_on();
+
+	print_bold_text(pad, line++, 1, "%s", node->name);
+	line++;
+
+	input_buffer = get_range_input();
+	if (!input_buffer || strlen(input_buffer) == 0) {
+		log_message(LOG_ERROR, "Failed to get range input");
+		free(input_buffer);
+		return;
+	}
+
+	if (strchr(input_buffer, '-')) {
+		if (sscanf(input_buffer, "0x%x-0x%x", &start_addr, &end_addr) != 2) {
+			print_bold_text(pad, line++, 2,
+					"Error: Invalid address range! Please retry.");
+			free(input_buffer);
+			return;
+		}
+		if (start_addr > end_addr) {
+			print_bold_text(pad, line++, 2,
+					"Error: Invalid range! Please retry.");
+			free(input_buffer);
+			return;
+		}
+	} else {
+		if (sscanf(input_buffer, "0x%x", &start_addr) != 1) {
+			print_bold_text(pad, line++, 2, "Error: Invalid address! Please retry.");
+			free(input_buffer);
+			return;
+		}
+		end_addr = start_addr;
+	}
+
+	trace_fp = fopen(TRACE_PATH, "r");
+	if (!trace_fp) {
+		log_message(LOG_ERROR, "Error opening trace file: %s", strerror(errno));
+		goto cleanup;
+	}
+
+	dump_fp = fopen(dump_file_path, "w");
+	if (!dump_fp) {
+		log_message(LOG_ERROR, "Error creating dump file: %s", strerror(errno));
+		goto cleanup;
+	}
+
+	wclear(pad);
+	wattron(pad, A_BOLD);
+	mvwprintw(pad, line++, 1, "| %-*s | %-*s | %-*s | %-*s | %-*s | %-*s |",
+		  col_widths[0], "Process",
+		  col_widths[1], "CPU",
+		  col_widths[2], "Timestamp",
+		  col_widths[3], "R/W",
+		  col_widths[4], "Reg",
+		  col_widths[5], "Value");
+	wattroff(pad, A_BOLD);
+
+	while (fgets(buffer, sizeof(buffer), trace_fp)) {
+		if (strstr(buffer, "i915_reg_rw"))
+			total_count++;
+	}
+	rewind(trace_fp);
+
+	progress_win = newwin(getmaxy(stdscr), getmaxx(stdscr), 0, 0);
+	wbkgd(progress_win, COLOR_PAIR(6));
+	wclear(progress_win);
+	box(progress_win, 0, 0);
+	print_bold_text(progress_win, 8, 2, "FILTERING IS IN PROGRESS :)");
+	wrefresh(progress_win);
+
+	while (fgets(buffer, sizeof(buffer), trace_fp)) {
+		uint32_t reg;
+		double timestamp;
+		char value_str[64];
+		char process[32], op[8];
+		int pid, cpu, val1, val2, len;
+
+		if (!strstr(buffer, "i915_reg_rw"))
+			continue;
+
+		if (sscanf(buffer, "%31[^-]-%d  [%d] %*s %lf: i915_reg_rw: %7s "
+			   "reg=0x%x, len=%d, val=(0x%x, 0x%x)",
+			   process, &pid, &cpu, &timestamp, op, &reg, &len, &val1, &val2) == 9) {
+			strip_whitespace(process);
+			strip_whitespace(op);
+
+			snprintf(value_str, sizeof(value_str), "(0x%X, 0x%X)", val1, val2);
+
+			if (reg >= start_addr && reg <= end_addr) {
+				log_count++;
+
+				mvwprintw(pad, line++, 1,
+					  "| %-*s | %-*d | %-*.2f | %-*s | 0x%-*X | %-*s |",
+					  col_widths[0], process,
+					  col_widths[1], cpu,
+					  col_widths[2], timestamp,
+					  col_widths[3], op,
+					  col_widths[4] - 2, reg,
+					  col_widths[5], value_str);
+
+				fprintf(dump_fp, "| %-*s | %-*d | %-*.2f | %-*s | 0x%-*X | %-*s |\n",
+					col_widths[0], process,
+					col_widths[1], cpu,
+					col_widths[2], timestamp,
+					col_widths[3], op,
+					col_widths[4] - 2, reg,
+					col_widths[5], value_str);
+			}
+
+			if (line >= getmaxy(pad) - 2) {
+				wscrl(pad, 1);
+				line--;
+			}
+
+			current_count++;
+			render_progress_bar(progress_win, current_count, total_count);
+		}
+	}
+
+	wattron(pad, A_BOLD | COLOR_PAIR(2));
+	mvwprintw(pad, 1, 1, "Filtered range: 0x%X - 0x%X, Hits: %zu",
+		  start_addr, end_addr, log_count);
+	wattroff(pad, A_BOLD | COLOR_PAIR(2));
+
+	if (log_count == 0) {
+		remove(dump_file_path);
+		mvwprintw(pad, line + 2, 1, "No matching logs found. Dump file not created.");
+	} else {
+		mvwprintw(pad, line + 2, 1, "Dump saved to: %s", dump_file_path);
+	}
+
+	*content_line = line;
+
+cleanup:
+	if (trace_fp)
+		fclose(trace_fp);
+	if (dump_fp)
+		fclose(dump_fp);
+	if (input_buffer)
+		free(input_buffer);
+}
diff --git a/tools/displaytop/src/display_ftrace.c b/tools/displaytop/src/display_ftrace.c
new file mode 100644
index 000000000..051abb46e
--- /dev/null
+++ b/tools/displaytop/src/display_ftrace.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "node.h"
+#include "utils.h"
+#include "display.h"
+
+void display_ftrace_options(WINDOW *pad, struct Node *node, int *content_line)
+{
+	int line = 0;
+	int size = getmaxx(pad) - 2;
+
+	print_bold_text(pad, line++, 1, "%s Menu", node->name);
+	line++;
+
+	print_bold_text(pad, line++, 1, "1. Live Tracing");
+	wattron(pad, A_DIM);
+	print_wrapped_text(pad, &line, 1, size, "Formats and displays the LAST 1000 lines of "
+			   "the ftrace logs, refresh (key r) to see the changes updated", false);
+	wattroff(pad, A_DIM);
+	line++;
+
+	print_bold_text(pad, line++, 1, "2. Dump Tracing");
+	wattron(pad, A_DIM);
+	print_wrapped_text(pad, &line, 1, size, "Formats and displays the FIRST 1000 lines but "
+			   "also dumps the entire formatted ", false);
+	wattroff(pad, A_DIM);
+	line++;
+
+	print_bold_text(pad, line++, 1, "3. Register Range Tracing");
+	wattron(pad, A_DIM);
+	print_wrapped_text(pad, &line, 1, size, "Filters & formats your desired register range, "
+			   "displays the first 1000 lines in Display Top. FILTERED RESULTS ARE "
+			   "DUMPED BY DEFAULT", false);
+	wattroff(pad, A_DIM);
+	line++;
+
+	print_bold_text(pad, line++, 1, "4. Clear Ftrace");
+	wattron(pad, A_DIM);
+	print_wrapped_text(pad, &line, 1, size, "Clears the ftrace buffer", false);
+	wattroff(pad, A_DIM);
+	line++;
+
+	*content_line = line;
+}
+
+/**
+ * @brief Clears the Ftrace buffer and updates the display with the result.
+ *
+ * This function is responsible for clearing the Ftrace buffer by calling
+ * the `clear_ftrace` function. It updates the provided `pad` window with
+ * messages indicating the success or failure of the operation. The number
+ * of lines written to the `pad` is updated in the `content_line` parameter.
+ *
+ * @param pad A pointer to the `WINDOW` object where the messages will be displayed.
+ * @param node A pointer to a `Node` object (currently unused in this function).
+ * @param content_line A pointer to an integer that will be updated with the
+ *                     number of lines written to the `pad`.
+ */
+void display_clear_ftrace(WINDOW *pad, struct Node *node, int *content_line)
+{
+	int line = 0;
+	int status;
+
+	print_bold_text(pad, line++, 1, "%s Menu", node->name);
+
+	line++;
+	status = clear_ftrace();
+	if (status == 0)
+		print_green_text(pad, line++, 2, "Ftrace cleared successfully.");
+	else
+		print_red_text(pad, line++, 2, "Failed to clear Ftrace.");
+	line++;
+
+	wrefresh(pad);
+	*content_line = line;
+}
diff --git a/tools/displaytop/src/display_live_tracing.c b/tools/displaytop/src/display_live_tracing.c
new file mode 100644
index 000000000..8460f243d
--- /dev/null
+++ b/tools/displaytop/src/display_live_tracing.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "display.h"
+
+void display_live_tracing(WINDOW *pad, struct Node *node, int *content_line)
+{
+	int line = 0;
+	FILE *trace;
+	char buffer[256];
+	int width;
+	int col_widths[6];
+	char *log_lines[1000];
+	size_t log_count = 0;
+
+	print_bold_text(pad, line++, 1, "%s", node->name);
+	line++;
+
+	trace = popen("cat /sys/kernel/debug/tracing/trace", "r");
+	if (!trace) {
+		log_message(LOG_ERROR, "Failed to open trace file: %s", strerror(errno));
+		*content_line = line;
+		return;
+	}
+
+	width = getmaxx(pad) - 2 - 6;
+
+	col_widths[0] = (int)(width * 0.10f) - 2;
+	col_widths[1] = (int)(width * 0.05f) - 2;
+	col_widths[2] = (int)(width * 0.12f) - 2;
+	col_widths[3] = (int)(width * 0.06f) - 2;
+	col_widths[4] = (int)(width * 0.10f) - 2;
+	col_widths[5] = (int)(width * 0.40f) - 2;
+
+	while (fgets(buffer, sizeof(buffer), trace)) {
+		char process[32], op[8], value_str[64];
+		double timestamp;
+		int pid, cpu, reg, val1, val2, len;
+		char *log_line;
+
+		if (!strstr(buffer, "i915_reg_rw"))
+			continue;
+
+		if (sscanf(buffer, "%31[^-]-%d  [%d] %*[^0-9] %lf: i915_reg_rw: %7s reg=0x%x,"
+			   "len=%d, val=(0x%x, 0x%x)", process, &pid, &cpu, &timestamp, op,
+			   &reg, &len, &val1, &val2) == 9) {
+			strip_whitespace(process);
+			strip_whitespace(op);
+
+			snprintf(value_str, sizeof(value_str), "(0x%X, 0x%X)", val1, val2);
+
+			log_line = malloc(1024);
+			snprintf(log_line, 1024, "| %-*s | %-*d | %-*.6f | %-*s | 0x%-*X | %-*s |",
+				 col_widths[0], process,
+				 col_widths[1], cpu,
+				 col_widths[2], timestamp,
+				 col_widths[3], op,
+				 col_widths[4] - 2, reg,
+				 col_widths[5], value_str);
+
+			if (log_count < 1000) {
+				log_lines[log_count++] = log_line;
+			} else {
+				free(log_lines[0]);
+				memmove(log_lines, log_lines + 1, (999) * sizeof(char *));
+				log_lines[999] = log_line;
+			}
+		}
+	}
+
+	wclear(pad);
+	line = 0;
+
+	wattron(pad, A_BOLD);
+	mvwprintw(pad, line++, 1, "| %-*s | %-*s | %-*s | %-*s | %-*s | %-*s |",
+		  col_widths[0], "Process",
+		  col_widths[1], "CPU",
+		  col_widths[2], "Timestamp",
+		  col_widths[3], "Op",
+		  col_widths[4], "Reg",
+		  col_widths[5], "Value");
+	wattroff(pad, A_BOLD);
+
+	for (size_t i = 0; i < log_count; i++)
+		mvwprintw(pad, line++, 1, "%s", log_lines[i]);
+
+	wrefresh(pad);
+
+	for (size_t i = 0; i < log_count; i++)
+		free(log_lines[i]);
+
+	pclose(trace);
+	*content_line = line;
+}
diff --git a/tools/displaytop/src/populate.c b/tools/displaytop/src/populate.c
index ae0af5b20..c62eb369b 100644
--- a/tools/displaytop/src/populate.c
+++ b/tools/displaytop/src/populate.c
@@ -31,4 +31,5 @@ void populate_data(void)
 	initialize_display_config();
 	initialize_display_debugfs();
 	initialize_DPCD();
+	initialize_ftrace();
 }
diff --git a/tools/displaytop/src/populate_ftrace.c b/tools/displaytop/src/populate_ftrace.c
new file mode 100644
index 000000000..805a92d8c
--- /dev/null
+++ b/tools/displaytop/src/populate_ftrace.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "data.h"
+#include "display.h"
+#include "populate.h"
+
+void initialize_ftrace(void)
+{
+	struct Node *ftrace;
+	struct Node *live_tracing;
+	struct Node *dump_tracing;
+	struct Node *filter_tracing;
+	struct Node *clear_ftrace;
+
+	ftrace = create_node("Ftrace", display_ftrace_options, root);
+	if (!ftrace) {
+		log_message(LOG_ERROR, "Failed to create Ftrace node");
+		return;
+	}
+
+	live_tracing = create_node("Live Tracing", display_live_tracing, ftrace);
+	if (!live_tracing) {
+		log_message(LOG_ERROR, "Failed to create Live Tracing node");
+		return;
+	}
+	add_child(ftrace, live_tracing);
+
+	dump_tracing = create_node("Dump Tracing", display_dump_tracing, ftrace);
+	if (!dump_tracing) {
+		log_message(LOG_ERROR, "Failed to create Dump Tracing node");
+		return;
+	}
+	add_child(ftrace, dump_tracing);
+
+	filter_tracing = create_node("Filter Tracing", display_filter_tracing, ftrace);
+	if (!filter_tracing) {
+		log_message(LOG_ERROR, "Failed to create Register Range Tracing node");
+		return;
+	}
+	add_child(ftrace, filter_tracing);
+
+	clear_ftrace = create_node("Clear Ftrace", display_clear_ftrace, ftrace);
+	if (!clear_ftrace) {
+		log_message(LOG_ERROR, "Failed to create Clear Ftrace node");
+		return;
+	}
+	add_child(ftrace, clear_ftrace);
+	add_child(root, ftrace);
+}
diff --git a/tools/displaytop/src/utils_trace.c b/tools/displaytop/src/utils_trace.c
new file mode 100644
index 000000000..7a7b28a74
--- /dev/null
+++ b/tools/displaytop/src/utils_trace.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#include "utils.h"
+#include "display.h"
+
+void ensure_tracing_on(void)
+{
+	FILE *fp;
+
+	fp = fopen("/sys/kernel/debug/tracing/events/i915/i915_reg_rw/enable", "w");
+	if (!fp || fprintf(fp, "1") < 0 || fclose(fp) != 0)
+		log_message(LOG_ERROR, "Error enabling i915_reg_rw event\n");
+
+	fp = fopen("/sys/kernel/debug/tracing/current_tracer", "w");
+	if (!fp || fprintf(fp, "nop") < 0 || fclose(fp) != 0)
+		log_message(LOG_ERROR, "Error setting current tracer to nop\n");
+
+	fp = fopen("/sys/kernel/debug/tracing/tracing_on", "w");
+	if (!fp || fprintf(fp, "1") < 0 || fclose(fp) != 0)
+		log_message(LOG_ERROR, "Error enabling tracing\n");
+
+	log_message(LOG_INFO, "Tracing enabled\n");
+}
+
+int clear_ftrace(void)
+{
+	FILE *fp;
+
+	fp = NULL;
+
+	fp = fopen(TRACE_PATH, "w");
+	if (!fp || fprintf(fp, " ") < 0 || fclose(fp) != 0) {
+		log_message(LOG_ERROR, "Error clearing trace\n");
+		return -1;
+	}
+
+	log_message(LOG_INFO, "Trace cleared\n");
+	return 0;
+}
-- 
2.34.1

