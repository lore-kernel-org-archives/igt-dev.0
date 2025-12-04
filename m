Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CC1D1D866
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 05:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A3C10E845;
	Thu,  4 Dec 2025 05:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMCwdFpv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660C610E845
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 05:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764825530; x=1796361530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WvszN6CF16mbhx/EGMhfc+O6YRIQ1bAA4Tut/4hl1ko=;
 b=PMCwdFpvpVDFSPpP2agX5ALAo7AsCYsy1mg1hwB5MKQHnhKJmaEXWRtZ
 XXPx2Nqs61kfkFiZAAJrwWOqoKmqWMeDAe3P5y+oMSXvAPu5DPDatQ+To
 YxKcdQS9HMH/GPVLeKKyDgvVvkb+HkSzhFTz3nmcV9efJWF1C2JZ4NRjz
 1OwaTEHAo9VzUHVvO70JEt7Nk5+ChFA3IDux0gMTb5yff1TBGePqps5WI
 K/e77rgun2UA4TrWEHGlmoHZxOWuwdosSis/fSPrKSfFkzCMcz46QC7bi
 iLMBTj7awIIhcbkxmrJZawIJxh02OysHcgic9KzuqhtpDsuQ/wXgmZSuU w==;
X-CSE-ConnectionGUID: 53L9+p7yQQSYxdnt5Ue2oQ==
X-CSE-MsgGUID: VW2DR0puTveCL9TKM/vG2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92314608"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92314608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 21:18:50 -0800
X-CSE-ConnectionGUID: xFXLaLxhRb60pryCM+ptYw==
X-CSE-MsgGUID: Bt9dGJUzQm6czgWo8PpM3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199303596"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 03 Dec 2025 21:18:48 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com, Adith Narein T <adith.narein.t@intel.com>
Subject: [PATCH i-g-t v3 4/4] tools/displaytop: Add ftrace support to Display
 Top
Date: Thu,  4 Dec 2025 10:56:58 +0530
Message-Id: <20251204052658.232429-5-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204052658.232429-1-pranay.samala@intel.com>
References: <20251204052658.232429-1-pranay.samala@intel.com>
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
 tools/displaytop/include/utils.h              |   5 +-
 tools/displaytop/meson.build                  |   6 +
 tools/displaytop/src/display_dump_tracing.c   | 113 +++++++
 tools/displaytop/src/display_filter_tracing.c | 285 ++++++++++++++++++
 tools/displaytop/src/display_ftrace.c         |  77 +++++
 tools/displaytop/src/display_live_tracing.c   |  95 ++++++
 tools/displaytop/src/populate.c               |   1 +
 tools/displaytop/src/populate_ftrace.c        |  36 +++
 tools/displaytop/src/utils_trace.c            |  41 +++
 13 files changed, 667 insertions(+), 1 deletion(-)
 create mode 100644 tools/displaytop/src/display_dump_tracing.c
 create mode 100644 tools/displaytop/src/display_filter_tracing.c
 create mode 100644 tools/displaytop/src/display_ftrace.c
 create mode 100644 tools/displaytop/src/display_live_tracing.c
 create mode 100644 tools/displaytop/src/populate_ftrace.c
 create mode 100644 tools/displaytop/src/utils_trace.c

diff --git a/tools/displaytop/README.md b/tools/displaytop/README.md
index dc5ffb46c..76a9b0fe9 100644
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
index ae24f2f0a..b95a1eed1 100644
--- a/tools/displaytop/include/data.h
+++ b/tools/displaytop/include/data.h
@@ -26,5 +26,6 @@ struct DP_mapping {
 
 struct DP_mapping **get_dp_mapping_storage(void);
 int *get_dp_mapping_count_ptr(void);
+#define TRACE_PATH "/sys/kernel/debug/tracing/trace"
 
 #endif
diff --git a/tools/displaytop/include/display.h b/tools/displaytop/include/display.h
index db76f997c..7973cf139 100644
--- a/tools/displaytop/include/display.h
+++ b/tools/displaytop/include/display.h
@@ -23,5 +23,10 @@ void display_framebuffer(WINDOW *pad, struct node *node, int *content_line);
 void display_summary(WINDOW *pad, struct node *node, int *content_line);
 void display_debugfs_file(WINDOW *pad, struct node *node, int *content_line);
 void display_dpcd(WINDOW *pad, struct node *node, int *content_line);
+void display_ftrace_options(WINDOW *pad, struct node *node, int *content_line);
+void display_live_tracing(WINDOW *pad, struct node *node, int *content_line);
+void display_dump_tracing(WINDOW *pad, struct node *node, int *content_line);
+void display_filter_tracing(WINDOW *pad, struct node *node, int *content_line);
+void display_clear_ftrace(WINDOW *pad, struct node *node, int *content_line);
 
 #endif
diff --git a/tools/displaytop/include/populate.h b/tools/displaytop/include/populate.h
index b2efadc59..cb87a7593 100644
--- a/tools/displaytop/include/populate.h
+++ b/tools/displaytop/include/populate.h
@@ -15,5 +15,6 @@ void populate_data(void);
 void initialize_display_config(void);
 void initialize_display_debugfs(void);
 void initialize_DPCD(void);
+void initialize_ftrace(void);
 
 #endif
diff --git a/tools/displaytop/include/utils.h b/tools/displaytop/include/utils.h
index a8a9a1b73..b5b9e1ae5 100644
--- a/tools/displaytop/include/utils.h
+++ b/tools/displaytop/include/utils.h
@@ -101,5 +101,8 @@ char *find_debugfs_dir(int drm_fd);
 int read_dpcd_registers(const char *aux_path, unsigned char *buffer, size_t size, uint64_t offset);
 
 uint64_t parse_hex_address(const char *hex_str);
-
+/* utils_trace.c */
+void free_cache(void);
+int clear_ftrace(void);
+void ensure_tracing_on(void);
 #endif
diff --git a/tools/displaytop/meson.build b/tools/displaytop/meson.build
index 43599a1a6..32aa11286 100644
--- a/tools/displaytop/meson.build
+++ b/tools/displaytop/meson.build
@@ -64,6 +64,12 @@ if have_displaytop
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
 
    executable(
diff --git a/tools/displaytop/src/display_dump_tracing.c b/tools/displaytop/src/display_dump_tracing.c
new file mode 100644
index 000000000..1a51f5eb6
--- /dev/null
+++ b/tools/displaytop/src/display_dump_tracing.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "display.h"
+#include "utils.h"
+#include "igt_core.h"
+
+void display_dump_tracing(WINDOW *pad, struct node *node, int *content_line)
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
+	igt_info("Dumping trace logs for node: %s", node->name);
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
+		igt_debug("Error opening trace file: %s", strerror(errno));
+		*content_line = line;
+		return;
+	}
+
+	dump_fp = fopen(dump_file_path, "w");
+	if (!dump_fp) {
+		igt_debug("Error creating dump file: %s", strerror(errno));
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
index 000000000..2b446450d
--- /dev/null
+++ b/tools/displaytop/src/display_filter_tracing.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include <form.h>
+
+#include "display.h"
+#include "utils.h"
+#include "igt_core.h"
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
+		igt_debug("Memory allocation failed for input buffer\n");
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
+void display_filter_tracing(WINDOW *pad, struct node *node, int *content_line)
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
+		igt_debug("Failed to get range input\n");
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
+		igt_debug("Error opening trace file\n");
+		goto cleanup;
+	}
+
+	dump_fp = fopen(dump_file_path, "w");
+	if (!dump_fp) {
+		igt_debug("Error creating dump file\n");
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
index 000000000..99bd78c20
--- /dev/null
+++ b/tools/displaytop/src/display_ftrace.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "node.h"
+#include "utils.h"
+#include "display.h"
+
+void display_ftrace_options(WINDOW *pad, struct node *node, int *content_line)
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
+ * @param node A pointer to a `node` object (currently unused in this function).
+ * @param content_line A pointer to an integer that will be updated with the
+ *                     number of lines written to the `pad`.
+ */
+void display_clear_ftrace(WINDOW *pad, struct node *node, int *content_line)
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
index 000000000..66b7e353f
--- /dev/null
+++ b/tools/displaytop/src/display_live_tracing.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "display.h"
+#include "igt_core.h"
+
+void display_live_tracing(WINDOW *pad, struct node *node, int *content_line)
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
+		igt_debug("Failed to open trace file\n");
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
index 30e81c558..a5fd7829b 100644
--- a/tools/displaytop/src/populate.c
+++ b/tools/displaytop/src/populate.c
@@ -10,4 +10,5 @@ void populate_data(void)
 	initialize_display_config();
 	initialize_display_debugfs();
 	initialize_DPCD();
+	initialize_ftrace();
 }
diff --git a/tools/displaytop/src/populate_ftrace.c b/tools/displaytop/src/populate_ftrace.c
new file mode 100644
index 000000000..5f8d18b07
--- /dev/null
+++ b/tools/displaytop/src/populate_ftrace.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "data.h"
+#include "display.h"
+#include "populate.h"
+#include "igt_core.h"
+
+void initialize_ftrace(void)
+{
+	struct node *ftrace;
+	struct node *live_tracing;
+	struct node *dump_tracing;
+	struct node *filter_tracing;
+	struct node *clear_ftrace;
+
+	ftrace = create_node("Ftrace", display_ftrace_options, root);
+	igt_assert_f(ftrace, "Failed to create Ftrace node\n");
+
+	live_tracing = create_node("Live Tracing", display_live_tracing, ftrace);
+	igt_assert_f(live_tracing, "Failed to create Live Tracing node\n");
+	add_child(ftrace, live_tracing);
+
+	dump_tracing = create_node("Dump Tracing", display_dump_tracing, ftrace);
+	igt_assert_f(dump_tracing, "Failed to create Dump Tracing node\n");
+	add_child(ftrace, dump_tracing);
+
+	filter_tracing = create_node("Filter Tracing", display_filter_tracing, ftrace);
+	igt_assert_f(filter_tracing, "Failed to create Register Range Tracing ndoe\n");
+	add_child(ftrace, filter_tracing);
+
+	clear_ftrace = create_node("Clear Ftrace", display_clear_ftrace, ftrace);
+	igt_assert_f(clear_ftrace, "Failed to create Clear Ftrace node\n");
+	add_child(ftrace, clear_ftrace);
+	add_child(root, ftrace);
+}
diff --git a/tools/displaytop/src/utils_trace.c b/tools/displaytop/src/utils_trace.c
new file mode 100644
index 000000000..38aa842b2
--- /dev/null
+++ b/tools/displaytop/src/utils_trace.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: MIT
+/* Copyright © 2025 Intel Corporation */
+
+#include "utils.h"
+#include "display.h"
+#include "igt_core.h"
+
+void ensure_tracing_on(void)
+{
+	FILE *fp;
+
+	fp = fopen("/sys/kernel/debug/tracing/events/i915/i915_reg_rw/enable", "w");
+	if (!fp || fprintf(fp, "1") < 0 || fclose(fp) != 0)
+		igt_debug("Error enabling i915_reg_rw event\n");
+
+	fp = fopen("/sys/kernel/debug/tracing/current_tracer", "w");
+	if (!fp || fprintf(fp, "nop") < 0 || fclose(fp) != 0)
+		igt_debug("Error setting current tracer to nop\n");
+
+	fp = fopen("/sys/kernel/debug/tracing/tracing_on", "w");
+	if (!fp || fprintf(fp, "1") < 0 || fclose(fp) != 0)
+		igt_debug("Error enabling tracing\n");
+
+	igt_info("Tracing enabled\n");
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
+		igt_debug("Error clearing trace\n");
+		return -1;
+	}
+
+	igt_info("Trace cleared\n");
+	return 0;
+}
-- 
2.34.1

