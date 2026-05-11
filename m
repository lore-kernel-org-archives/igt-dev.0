Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809E8CD37B7
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 05:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C68F10E492;
	Mon, 11 May 2026 05:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+KNpqer";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4833E10E485
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 05:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778476957; x=1810012957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fsz1zQo59tCiKQ3P9CHqzKh4RQLUxJEIUVt+Vub3Gg0=;
 b=a+KNpqerjFjANlwcL4vKJ0puh4aFA/Byv+l3LoHZI3hW8TrnCBrM76Zv
 RUras8oJYTTT9J0LUHHaL8IB7JdVx7q96X71bi22xGYA5h0I9HTKzFR+L
 cs7U58kjZaRJocFwiCY0fYElxdZVY5x5wtZs7dSmog9n9sSel7sCDhYyt
 IFeydVv6FyDZxKVY3C9xPde7e3Zyc0JUXR9NVEau/A8QKer7XSz2CzzeI
 0P0hlkmcHnuH/aVlIu0lV0mOYzV0I0LPgbMBIlfcIzNS+N6MxskN4zY1t
 TTIIlkxmX3pUZu1BlRdAAn5pdMFWFgJx+ub5Ug3vLUKBS6kivdPTC+4IU Q==;
X-CSE-ConnectionGUID: vXK8efqEToKBtrGQ0a2LJA==
X-CSE-MsgGUID: z0E4R2v6SsGDjuleLe1WGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90823868"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90823868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:22:37 -0700
X-CSE-ConnectionGUID: V1bMe8GkTOq+NdzRYa2J4A==
X-CSE-MsgGUID: /v4nFOjySfqOtaYwDD4dlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="237299749"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 22:22:34 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Imre Deak <imre.deak@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_tbt: Add DP tunneling validation
 tests
Date: Mon, 11 May 2026 11:13:56 +0530
Message-Id: <20260511054356.1313884-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260511054356.1313884-1-kunal1.joshi@intel.com>
References: <20260511054356.1313884-1-kunal1.joshi@intel.com>
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

Add a kms_tbt test binary that exercises the DP tunneling debugfs
ABI exposed by drm/display/dp_tunnel and the i915/xe usage of it.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_tbt.c | 2583 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build     |    5 +
 2 files changed, 2588 insertions(+)
 create mode 100644 tests/intel/kms_tbt.c

diff --git a/tests/intel/kms_tbt.c b/tests/intel/kms_tbt.c
new file mode 100644
index 000000000..c879bbf53
--- /dev/null
+++ b/tests/intel/kms_tbt.c
@@ -0,0 +1,2583 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: kms tbt
+ * Category: Display
+ * Description: Functional tests for i915 DP tunneling over USB4/Thunderbolt.
+ *              Validates kernel behavior (BW allocation, mode fallback,
+ *              suspend/resume, multi-stream accounting) using debugfs hooks.
+ * Driver requirement: i915, xe
+ * Mega feature: DP Tunneling
+ *
+ * SUBTEST: basic
+ * Description: A tunneled output exists, BWA is enabled and a modeset on its
+ *              preferred mode allocates positive BW. Also asserts the tunnel
+ *              DPRX max rate is at least the link's current max rate.
+ *
+ * SUBTEST: modeset-bw
+ * Description: Switching between modes correctly updates allocated BW both
+ *              upward (low->high) and back to exactly the same value on a
+ *              round-trip to the original mode.
+ *
+ * SUBTEST: disable-bw
+ * Description: Disabling a tunneled output releases its allocated BW to zero.
+ *
+ * SUBTEST: suspend
+ * Description: Tunnel state including BWA, allocated BW, DPRX rate and group
+ *              ID is fully restored after a mem suspend/resume cycle.
+ *
+ * SUBTEST: limit-fallback
+ * Description: Setting bw_limit below the preferred mode's BW requirement
+ *              filters the preferred mode from the connector list and
+ *              allows a lower-clock fallback mode to modeset.
+ *
+ * SUBTEST: limit-boundary
+ * Description: BW limit at the mode's BW threshold keeps the mode in the
+ *              connector list; one kB/s below removes it; clearing the cap
+ *              restores the full mode list.
+ *
+ * SUBTEST: limit-suspend
+ * Description: bw_limit is reset to 0 across suspend/resume because the
+ *              tunnel object is destroyed on suspend and re-created on resume.
+ *
+ * SUBTEST: bwa-re-enable
+ * Description: Disabling BWA reports allocated BW = -1 with the tunnel still
+ *              alive and link parameters falling back to standard DPCD;
+ *              re-enabling BWA + a fresh modeset restores both BW allocation
+ *              and the original max link rate.
+ *
+ * SUBTEST: bwa-cycle
+ * Description: Ten rapid BWA disable/enable cycles do not corrupt the display
+ *              or leak BW resources.
+ *
+ * SUBTEST: dual-bw-sum
+ * Description: Two SST tunnels in the same USB4 group report the same
+ *              group_free BW (estimated - allocated) and group_free is
+ *              non-negative.
+ *
+ * SUBTEST: dual-limit-isolation
+ * Description: bw_limit is per-tunnel-object, not per-group. With two SST
+ *              tunnels sharing one USB4 group, a cap on tunnel A clips A's
+ *              connector mode list and forces A to a lower-clock mode, while
+ *              tunnel B's mode list and active mode are unchanged; B's
+ *              allocation drift stays within one granularity step.
+ *
+ * SUBTEST: dual-bwa-disable
+ * Description: Disabling BWA on one SST tunnel in a shared USB4 group does
+ *              not destroy the other tunnel's allocation; re-enable + fresh
+ *              modeset restores the disabled tunnel's allocation.
+ *
+ * SUBTEST: mst-basic
+ * Description: Two MST connectors sharing one tunnel object report the same
+ *              per-tunnel allocated BW, and that value is positive.
+ *
+ * SUBTEST: mst-modeset-bw
+ * Description: Aggregate allocation does not decrease when one MST stream's
+ *              mode is raised from the lowest- to the preferred-clock mode.
+ *
+ * SUBTEST: mst-partial-disable
+ * Description: Disabling one MST stream leaves the tunnel alive; the residual
+ *              allocation is positive and not larger than the two-stream
+ *              allocation.
+ *
+ * SUBTEST: mst-suspend
+ * Description: MST tunnel survives suspend/resume; per the
+ *              intel_dp_tunnel_resume() "TODO: Add support for MST"
+ *              limitation the test accepts BW re-allocation on at least
+ *              one of the two streams.
+ *
+ * SUBTEST: mst-limit-fallback
+ * Description: bw_limit on the shared MST tunnel forces both streams to fall
+ *              back to lower-clock modes; aggregate BW remains positive and
+ *              not greater than the pre-limit value.
+ *
+ * SUBTEST: mst-bwa-re-enable
+ * Description: Re-enabling BWA on an MST tunnel + fresh modeset restores
+ *              allocation for all active streams to the pre-disable value.
+ */
+
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "igt.h"
+#include "igt_connector_helper.h"
+#include "igt_debugfs.h"
+#include "igt_kms.h"
+#include "igt_sysfs.h"
+#include "intel/kms_mst_helper.h"
+
+#define TUNNEL_INFO_BUF_SIZE	2048
+/*
+ * Number of disable/enable cycles for the bwa-cycle subtest. Empirically
+ * tuned to be high enough to surface refcount/state-machine drift between
+ * driver and TBT host without pushing per-subtest runtime past CI budgets.
+ */
+#define BWA_CYCLE_COUNT		10
+#define MAX_CLEANUP_OUTPUTS	16
+#define BW_RETRY_TIMEOUT_MS	1000
+#define BW_RETRY_STEP_MS	50
+
+/*
+ * Tunnel debugfs file names, attached per connector under
+ *	/sys/kernel/debug/dri/<N>/<connector>/dp_tunnel/{info,bw_alloc_enable,bw_limit}
+ */
+#define TUNNEL_DBG_DIR			"dp_tunnel"
+#define TUNNEL_DBG_INFO			"info"
+#define TUNNEL_DBG_BW_ALLOC		"bw_alloc_enable"
+#define TUNNEL_DBG_BW_LIMIT		"bw_limit"
+
+typedef struct {
+	int drm_fd;
+	uint32_t devid;
+	igt_display_t display;
+	igt_output_t *output;		/* primary tunneled output */
+	igt_output_t *output2;		/* second tunneled output (dual-SST) */
+	igt_output_t *mst_outputs[IGT_MAX_PIPES]; /* MST stream outputs */
+	int n_mst_outputs;
+	/*
+	 * Connector names whose dp_tunnel/ debugfs state must be reset
+	 * (bw_limit=0, bw_alloc_enable=1) at process exit. Stored as
+	 * names rather than igt_output_t * so the exit handler is safe
+	 * after any igt_display_fini() / re-bind sequence (e.g. across
+	 * suspend/resume re-enumeration).
+	 */
+	char cleanup_names[MAX_CLEANUP_OUTPUTS][IGT_CONNECTOR_NAME_MAX];
+	int n_cleanup;
+} data_t;
+
+/*
+ * Single live test instance per process; stashed in a global so the IGT
+ * exit handler (called with a signal-only argument) can find it. Set in
+ * the bootstrap fixture, never re-assigned after.
+ */
+static data_t *g_data;
+
+/*
+ * Open the per-connector dp_tunnel/ debugfs directory for @output.
+ * Returns an open fd, or -1 if the directory does not exist (no tunnel).
+ * Caller must close() the returned fd.
+ */
+static int tunnel_dbg_open_dir(int drm_fd, igt_output_t *output)
+{
+	int conn_dir, sub;
+
+	conn_dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	if (conn_dir < 0)
+		return -1;
+
+	sub = openat(conn_dir, TUNNEL_DBG_DIR, O_RDONLY | O_DIRECTORY);
+	close(conn_dir);
+	return sub;
+}
+
+/* forward declaration: defined further down once helpers are in place */
+static int read_tunnel_info(int drm_fd, igt_output_t *output,
+			    char *buf, int size);
+
+static bool has_tunnel(int drm_fd, igt_output_t *output)
+{
+	char buf[TUNNEL_INFO_BUF_SIZE];
+	int ret;
+
+	ret = read_tunnel_info(drm_fd, output, buf, sizeof(buf));
+	/* File must exist, be non-empty, and show an actual tunnel */
+	return ret > 0 && strncmp(buf, "Tunnel:", 7) == 0;
+}
+
+/*
+ * Parse an integer-valued line of the form "  <field> <number>...\n" out of
+ * the multi-line tunnel info blob. The match is anchored to the start of a
+ * line so that a future field whose name is a substring of @field (e.g. an
+ * "Allocated BW limit:" line added next to "Allocated BW:") cannot
+ * mis-match. Returns -1 if the field is absent or malformed.
+ */
+static int parse_tunnel_field_int(const char *buf, const char *field)
+{
+	const char *loc = buf;
+	int val = -1;
+	size_t flen = strlen(field);
+
+	while ((loc = strstr(loc, field)) != NULL) {
+		const char *line_start = loc;
+
+		while (line_start > buf && line_start[-1] != '\n')
+			line_start--;
+		/*
+		 * Accept the match only if @field appears at line start
+		 * (after optional leading whitespace).
+		 */
+		while (line_start < loc && (*line_start == ' ' ||
+					    *line_start == '\t'))
+			line_start++;
+		if (line_start == loc) {
+			if (sscanf(loc + flen, "%d", &val) != 1)
+				return -1;
+			return val;
+		}
+		loc += flen;
+	}
+	return val;
+}
+
+static void set_bw_limit(int drm_fd, igt_output_t *output, int limit_kbps)
+{
+	char buf[64];
+	int dir, ret;
+
+	dir = tunnel_dbg_open_dir(drm_fd, output);
+	igt_assert_fd(dir);
+	snprintf(buf, sizeof(buf), "%d", limit_kbps);
+	ret = igt_sysfs_write(dir, TUNNEL_DBG_BW_LIMIT, buf, strlen(buf));
+	igt_assert_f(ret == strlen(buf),
+		     "Failed to write bw_limit=%d (ret=%d): %m\n",
+		     limit_kbps, ret);
+	close(dir);
+}
+
+static int get_bw_limit(int drm_fd, igt_output_t *output)
+{
+	char buf[64] = {};
+	int dir;
+
+	dir = tunnel_dbg_open_dir(drm_fd, output);
+	igt_assert_fd(dir);
+	igt_debugfs_simple_read(dir, TUNNEL_DBG_BW_LIMIT, buf, sizeof(buf));
+	close(dir);
+	return atoi(buf);
+}
+
+static void set_bwa_enabled(int drm_fd, igt_output_t *output, bool enable)
+{
+	int dir, ret;
+
+	dir = tunnel_dbg_open_dir(drm_fd, output);
+	igt_assert_fd(dir);
+	ret = igt_sysfs_write(dir, TUNNEL_DBG_BW_ALLOC,
+			      enable ? "1" : "0", 1);
+	igt_assert_f(ret == 1,
+		     "Failed to write bw_alloc_enable=%d (ret=%d): %m\n",
+		     enable, ret);
+	close(dir);
+}
+
+static bool get_bwa_enabled(int drm_fd, igt_output_t *output)
+{
+	char buf[64] = {};
+	int dir;
+
+	dir = tunnel_dbg_open_dir(drm_fd, output);
+	igt_assert_fd(dir);
+	igt_debugfs_simple_read(dir, TUNNEL_DBG_BW_ALLOC, buf, sizeof(buf));
+	close(dir);
+	/*
+	 * The kernel writer is round-trippable and prints "0\n" or "1\n";
+	 * older out-of-tree kernels printed "enabled\n" / "disabled\n".
+	 * Accept both formats by anchoring on the leading character.
+	 */
+	if (buf[0] == '0' || buf[0] == '1')
+		return buf[0] == '1';
+	return strncmp(buf, "enabled", 7) == 0;
+}
+
+/*
+ * Non-asserting reset of bw_limit=0 and bwa_enable=1 for the connector
+ * @name. Safe to call from exit handlers and cleanup paths where
+ * igt_assert would abort the process. Silently skips if the connector's
+ * dp_tunnel/ debugfs directory does not exist (e.g. the connector was
+ * re-enumerated or the tunnel is gone).
+ */
+static void try_reset_by_name(int drm_fd, const char *name)
+{
+	int conn_dir, dir;
+
+	if (!name || !name[0])
+		return;
+
+	conn_dir = igt_debugfs_connector_dir(drm_fd, (char *)name, O_RDONLY);
+	if (conn_dir < 0)
+		return;
+	dir = openat(conn_dir, TUNNEL_DBG_DIR, O_RDONLY | O_DIRECTORY);
+	close(conn_dir);
+	if (dir < 0) {
+		igt_debug("kms_tbt: cleanup: no dp_tunnel/ for %s\n", name);
+		return;
+	}
+
+	/* Best effort: ignore errors, we are in a cleanup/exit path */
+	igt_sysfs_write(dir, TUNNEL_DBG_BW_LIMIT, "0", 1);
+	igt_sysfs_write(dir, TUNNEL_DBG_BW_ALLOC, "1", 1);
+	close(dir);
+}
+
+/*
+ * Append @output's connector name to data->cleanup_names[] so the exit
+ * handler can later reset its debugfs state by name (without
+ * dereferencing igt_output_t * which may have been invalidated by an
+ * intervening igt_display_fini()). Duplicates and overflow are
+ * silently ignored.
+ */
+static void register_for_cleanup(data_t *data, igt_output_t *output)
+{
+	int i;
+
+	if (!data || !output || !output->name)
+		return;
+	for (i = 0; i < data->n_cleanup; i++) {
+		if (strcmp(data->cleanup_names[i], output->name) == 0)
+			return;
+	}
+	if (data->n_cleanup >= MAX_CLEANUP_OUTPUTS)
+		return;
+	snprintf(data->cleanup_names[data->n_cleanup],
+		 IGT_CONNECTOR_NAME_MAX, "%s", output->name);
+	data->n_cleanup++;
+}
+
+/*
+ * Clear bw_limit and re-enable BWA on every connector that was ever
+ * registered as a tunneled output during the test. Called from both
+ * the closing fixture and the process exit handler so debugfs state
+ * is always reset regardless of how a subtest exits.
+ */
+static void restore_all_debugfs(data_t *data)
+{
+	int i;
+
+	if (!data || data->drm_fd < 0)
+		return;
+
+	for (i = 0; i < data->n_cleanup; i++)
+		try_reset_by_name(data->drm_fd, data->cleanup_names[i]);
+}
+
+static void exit_handler(int sig)
+{
+	(void)sig;
+	if (g_data)
+		restore_all_debugfs(g_data);
+}
+
+/*
+ * read_tunnel_info - Read the dp_tunnel/info debugfs file for @output into
+ * @buf. The buffer is zeroed up front and the read is bounded to size-1 so
+ * the result is always a properly NUL-terminated C string, safe to feed
+ * straight into strstr/strncmp/sscanf without an explicit length check.
+ *
+ * Returns the byte count from igt_debugfs_simple_read(), or -1 if the
+ * dp_tunnel/ debugfs directory does not exist (no tunnel).
+ */
+static int read_tunnel_info(int drm_fd, igt_output_t *output,
+			    char *buf, int size)
+{
+	int dir, ret;
+
+	igt_assert(size > 0);
+	memset(buf, 0, size);
+
+	dir = tunnel_dbg_open_dir(drm_fd, output);
+	if (dir < 0)
+		return -1;
+
+	ret = igt_debugfs_simple_read(dir, TUNNEL_DBG_INFO, buf, size - 1);
+	close(dir);
+
+	if (ret <= 0) {
+		igt_debug("kms_tbt: empty/error read of dp_tunnel/info on %s "
+			  "(ret=%d)\n", output->name, ret);
+		buf[0] = '\0';
+		return ret;
+	}
+
+	buf[min(ret, size - 1)] = '\0';
+	return ret;
+}
+
+static int get_allocated_bw(int drm_fd, igt_output_t *output)
+{
+	char buf[TUNNEL_INFO_BUF_SIZE];
+
+	read_tunnel_info(drm_fd, output, buf, sizeof(buf));
+	return parse_tunnel_field_int(buf, "Allocated BW:");
+}
+
+static int get_estimated_bw(int drm_fd, igt_output_t *output)
+{
+	char buf[TUNNEL_INFO_BUF_SIZE];
+
+	read_tunnel_info(drm_fd, output, buf, sizeof(buf));
+	return parse_tunnel_field_int(buf, "Estimated BW:");
+}
+
+static int get_granularity(int drm_fd, igt_output_t *output)
+{
+	char buf[TUNNEL_INFO_BUF_SIZE];
+
+	read_tunnel_info(drm_fd, output, buf, sizeof(buf));
+	return parse_tunnel_field_int(buf, "BW granularity:");
+}
+
+static int get_dprx_rate(int drm_fd, igt_output_t *output)
+{
+	char buf[TUNNEL_INFO_BUF_SIZE];
+
+	read_tunnel_info(drm_fd, output, buf, sizeof(buf));
+	return parse_tunnel_field_int(buf, "DPRX max rate:");
+}
+
+/*
+ * get_tunnel_group_id - Returns a combined host:link key from the DPTUN name
+ * "Tunnel: DPTUN <host>:<link>:<ep>". Two tunnels share a BW group only when
+ * they have the same host AND link number (same physical USB4 connection).
+ * Encoding: host*1000 + link, so TC1 (1:1:x) -> 1001 and TC2 (1:2:x) -> 1002.
+ */
+static int get_tunnel_group_id(int drm_fd, igt_output_t *output)
+{
+	char buf[TUNNEL_INFO_BUF_SIZE];
+	int host = -1, link = -1;
+
+	read_tunnel_info(drm_fd, output, buf, sizeof(buf));
+	if (sscanf(buf, "Tunnel: DPTUN %d:%d:", &host, &link) == 2)
+		return host * 1000 + link;
+	return -1;
+}
+
+/*
+ * find_mode_bw_threshold - Binary-search for the minimum bw_limit (kB/s) at
+ * which @mode appears in the connector's reprobed mode list.
+ *
+ * The kernel's mode_valid BW check uses minimum-bpp accounting and may allow
+ * DSC-capable modes to survive limits that would reject uncompressed modes.
+ * Rather than hard-coding any formula, probe the actual kernel threshold.
+ *
+ * Search range is [1, estimated_bw]. A cap of 0 means "no cap", so the
+ * lowest meaningful filtering cap is 1. If the mode is still present at
+ * limit=1, no positive cap exists that rejects it, and the caller must skip.
+ *
+ * Returns:
+ *   threshold > 0 - minimum bw_limit that keeps mode present
+ *   0             - mode cannot be filtered (survives at limit=1)
+ *  -1             - mode not in unfiltered connector list
+ *
+ * On return, bw_limit is left at 0.
+ */
+static int find_mode_bw_threshold(int drm_fd, igt_output_t *output,
+				  uint32_t connector_id,
+				  const drmModeModeInfo *mode,
+				  int estimated_bw)
+{
+	drmModeConnector *conn;
+	char numbuf[32];
+	int lo, hi, mid;
+	int dir;
+	bool present;
+
+	/*
+	 * The binary search issues ~log2(estimated_bw) writes to
+	 * bw_limit (typically 30+). Open the per-connector dp_tunnel/
+	 * directory once and reuse the fd to avoid re-walking debugfs
+	 * for every step.
+	 */
+	dir = tunnel_dbg_open_dir(drm_fd, output);
+	if (dir < 0)
+		return -1;
+
+	#define WRITE_LIMIT(_v) do {					\
+		int _n = snprintf(numbuf, sizeof(numbuf), "%d", (_v));	\
+		int _ret = igt_sysfs_write(dir, TUNNEL_DBG_BW_LIMIT,	\
+					   numbuf, _n);			\
+		igt_assert_f(_ret == _n,				\
+			     "Failed to write bw_limit=%d (ret=%d): %m\n", \
+			     (_v), _ret);				\
+	} while (0)
+
+	/* Verify mode is present with no limit */
+	WRITE_LIMIT(0);
+	conn = drmModeGetConnector(drm_fd, connector_id);
+	if (!conn) {
+		close(dir);
+		return -1;
+	}
+	present = igt_connector_mode_in_list(conn, mode);
+	drmModeFreeConnector(conn);
+	if (!present) {
+		close(dir);
+		return -1;
+	}
+
+	/* Quick check: is mode still present at the minimum (1 kB/s) cap? */
+	WRITE_LIMIT(1);
+	conn = drmModeGetConnector(drm_fd, connector_id);
+	present = conn && igt_connector_mode_in_list(conn, mode);
+	drmModeFreeConnector(conn);
+	if (present) {
+		WRITE_LIMIT(0);
+		close(dir);
+		return 0;  /* mode survives min cap - cannot filter */
+	}
+
+	/*
+	 * Binary search.
+	 * lo = highest limit where mode is absent (starts at 1).
+	 * hi = lowest limit where mode is present.
+	 */
+	lo = 1;
+	hi = estimated_bw;
+	while (hi - lo > 1) {
+		mid = lo + (hi - lo) / 2;
+		WRITE_LIMIT(mid);
+		conn = drmModeGetConnector(drm_fd, connector_id);
+		if (conn && igt_connector_mode_in_list(conn, mode))
+			hi = mid;
+		else
+			lo = mid;
+		drmModeFreeConnector(conn);
+	}
+
+	WRITE_LIMIT(0);
+	close(dir);
+	#undef WRITE_LIMIT
+	return hi;  /* minimum limit at which mode is present */
+}
+
+/*
+ * assign_outputs_to_crtcs - Assigns each output in @outputs to the next
+ * available CRTC, iterating over all display CRTCs.
+ */
+static void assign_outputs_to_crtcs(igt_display_t *display,
+				    igt_output_t **outputs, int n_outputs)
+{
+	int i, n_crtcs;
+
+	igt_require_f(n_outputs > 0, "No outputs to assign\n");
+
+	n_crtcs = igt_display_n_crtcs(display);
+	igt_require_f(n_crtcs >= n_outputs,
+		      "Not enough CRTCs (%d) for %d outputs\n",
+		      n_crtcs, n_outputs);
+
+	for (i = 0; i < n_outputs; i++)
+		igt_output_set_crtc(outputs[i],
+				    igt_crtc_for_pipe(display, (enum pipe)i));
+}
+
+/*
+ * do_modeset - Sets up and commits a modeset for @outputs with @modes.
+ * If @modes[i] is NULL, the default preferred mode is used. Creates solid
+ * blue FBs stored in @fbs which the caller must free with cleanup_outputs().
+ */
+static void do_modeset(data_t *data, igt_output_t **outputs, int n_outputs,
+		       drmModeModeInfo **modes, struct igt_fb *fbs)
+{
+	igt_plane_t *plane;
+	int i;
+
+	igt_display_reset(&data->display);
+	assign_outputs_to_crtcs(&data->display, outputs, n_outputs);
+
+	for (i = 0; i < n_outputs; i++) {
+		drmModeModeInfo *mode;
+
+		if (modes && modes[i])
+			igt_output_override_mode(outputs[i], modes[i]);
+		mode = igt_output_get_mode(outputs[i]);
+		igt_assert_f(mode, "No mode available for output %s\n",
+			     igt_output_name(outputs[i]));
+
+		igt_info("Modeset %s at %dx%d@%d\n",
+			 igt_output_name(outputs[i]),
+			 mode->hdisplay, mode->vdisplay, mode->vrefresh);
+
+		igt_create_color_fb(data->drm_fd,
+				    mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    0.0, 0.0, 1.0, &fbs[i]);
+		plane = igt_output_get_plane_type(outputs[i],
+						  DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(plane, &fbs[i]);
+	}
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+/*
+ * cleanup_outputs - Disables all outputs, commits blank state, removes FBs,
+ * and clears any mode overrides. Must be called after do_modeset().
+ */
+static void cleanup_outputs(data_t *data, igt_output_t **outputs,
+			    int n_outputs, struct igt_fb *fbs)
+{
+	int i;
+
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	for (i = 0; i < n_outputs; i++) {
+		igt_remove_fb(data->drm_fd, &fbs[i]);
+		igt_output_override_mode(outputs[i], NULL);
+	}
+}
+
+/*
+ * retrigger_modeset - Disables the output, then re-enables it at the same
+ * mode. Used after setting bw_limit to force a fresh modeset that re-evaluates
+ * BW constraints.
+ */
+static void retrigger_modeset(data_t *data, igt_output_t **outputs,
+			      int n_outputs, drmModeModeInfo **modes,
+			      struct igt_fb *old_fbs, struct igt_fb *new_fbs)
+{
+	cleanup_outputs(data, outputs, n_outputs, old_fbs);
+	do_modeset(data, outputs, n_outputs, modes, new_fbs);
+}
+
+/*
+ * find_tunneled_output - Finds the first connected DP output that has an
+ * active DP tunnel (has_tunnel() returns true). Returns NULL if none found.
+ */
+static igt_output_t *find_tunneled_output(data_t *data)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		if (output->config.connector->connector_type !=
+		    DRM_MODE_CONNECTOR_DisplayPort)
+			continue;
+		if (has_tunnel(data->drm_fd, output))
+			return output;
+	}
+	return NULL;
+}
+
+/*
+ * sst_tunnel_group - Helper: returns the USB4 group id for @output if it is
+ * a connected non-MST DP output with an active tunnel, or -1 otherwise.
+ * Centralises the eligibility filter for the dual-SST selectors below.
+ */
+static int sst_tunnel_group(data_t *data, igt_output_t *output)
+{
+	if (output->config.connector->connector_type !=
+	    DRM_MODE_CONNECTOR_DisplayPort)
+		return -1;
+	if (igt_check_output_is_dp_mst(output))
+		return -1;
+	if (!has_tunnel(data->drm_fd, output))
+		return -1;
+	return get_tunnel_group_id(data->drm_fd, output);
+}
+
+/*
+ * find_two_tunneled_sst_outputs - Finds two connected SST DP outputs whose
+ * tunnels share the same physical USB4 link (same host:link group), so the
+ * pair is suitable for shared-group accounting tests (dual-bw-sum,
+ * dual-bwa-disable).
+ *
+ * Two MST sinks behind the same hub also share host:link so they would
+ * pass the group check; sst_tunnel_group() filters them out via
+ * igt_check_output_is_dp_mst() since their BW is aggregated on a single
+ * tunnel slot, not summed from two.
+ *
+ * Implementation: O(n^2) pair search rather than first-found-then-match,
+ * so a topology like A(group X), B(group Y), C(group Y) still produces
+ * the valid B+C pair instead of dead-locking on A having no peer.
+ *
+ * Stores the two outputs in data->output and data->output2. Returns true
+ * on success.
+ */
+static bool find_two_tunneled_sst_outputs(data_t *data)
+{
+	int i, j;
+
+	for (i = 0; i < data->display.n_outputs; i++) {
+		igt_output_t *out_a = &data->display.outputs[i];
+		int group_a;
+
+		if (!igt_output_is_connected(out_a))
+			continue;
+		group_a = sst_tunnel_group(data, out_a);
+		if (group_a < 0)
+			continue;
+
+		for (j = 0; j < data->display.n_outputs; j++) {
+			igt_output_t *out_b = &data->display.outputs[j];
+
+			if (j == i)
+				continue;
+			if (!igt_output_is_connected(out_b))
+				continue;
+			if (sst_tunnel_group(data, out_b) != group_a)
+				continue;
+
+			data->output = out_a;
+			data->output2 = out_b;
+			register_for_cleanup(data, out_a);
+			register_for_cleanup(data, out_b);
+			return true;
+		}
+	}
+	return false;
+}
+
+/*
+ * find_mst_outputs - Finds at least 2 connected MST outputs that share the
+ * same tunnel. Populates data->mst_outputs[] and data->n_mst_outputs.
+ * Returns true if at least 2 MST outputs with a common tunnel are found.
+ *
+ * Some TBT docks present their SST SINK ports as MST virtual connectors
+ * (igt_check_output_is_dp_mst() returns true for them).  For mst-* tests
+ * we need a TRUE MST hub where both outputs share one aggregate BW slot.
+ * Strategy: prefer an MST tree on a DIFFERENT tunnel group than the primary
+ * output (data->output) - that USB4 path is more likely to have a real MST
+ * hub rather than the dock's internal pseudo-MST routing.  Fall back to any
+ * MST tree with 2+ connected outputs if no better option exists.
+ */
+static bool find_mst_outputs(data_t *data)
+{
+	igt_output_t *output;
+	igt_output_t *best_root = NULL;
+	int primary_group = -1;
+
+	if (data->output)
+		primary_group = get_tunnel_group_id(data->drm_fd, data->output);
+
+	for_each_connected_output(&data->display, output) {
+		igt_output_t *candidates[IGT_MAX_PIPES];
+		int count = 0, n_connected = 0, i, root_group;
+
+		if (output->config.connector->connector_type !=
+		    DRM_MODE_CONNECTOR_DisplayPort)
+			continue;
+		if (!igt_check_output_is_dp_mst(output))
+			continue;
+		if (!has_tunnel(data->drm_fd, output))
+			continue;
+
+		root_group = get_tunnel_group_id(data->drm_fd, output);
+
+		if (igt_find_all_mst_output_in_topology(data->drm_fd,
+							&data->display,
+							output, candidates,
+							&count) != 0)
+			continue;
+
+		for (i = 0; i < count; i++) {
+			if (candidates[i]->config.connector->connection ==
+			    DRM_MODE_CONNECTED)
+				n_connected++;
+		}
+		if (n_connected < 2)
+			continue;
+
+		/* Prefer a tree on a different tunnel group from data->output */
+		if (root_group != primary_group) {
+			best_root = output;
+			break;
+		}
+		if (!best_root)
+			best_root = output; /* fallback: same group */
+	}
+
+	if (!best_root)
+		return false;
+
+	{
+		igt_output_t *candidates[IGT_MAX_PIPES];
+		int count = 0, i;
+
+		if (igt_find_all_mst_output_in_topology(data->drm_fd,
+							&data->display,
+							best_root, candidates,
+							&count) != 0)
+			return false;
+
+		data->n_mst_outputs = 0;
+		for (i = 0; i < count; i++) {
+			if (candidates[i]->config.connector->connection ==
+			    DRM_MODE_CONNECTED) {
+				data->mst_outputs[data->n_mst_outputs++] =
+					candidates[i];
+				register_for_cleanup(data, candidates[i]);
+			}
+		}
+	}
+
+	return data->n_mst_outputs >= 2;
+}
+
+/* ------------------------------------------------------------------ */
+/* Per-subtest setup helpers: encapsulate the early-skip boilerplate. */
+/* ------------------------------------------------------------------ */
+
+/*
+ * require_sst - Skip the calling subtest if the primary tunneled output
+ * is gone (e.g. the user yanked the dock between subtests). Returns the
+ * primary tunneled output, ready for use.
+ */
+static igt_output_t *require_sst(data_t *d)
+{
+	igt_output_t *out = d->output;
+
+	igt_require_f(out, "No primary tunneled output\n");
+	igt_require_f(has_tunnel(d->drm_fd, out),
+		      "No DP tunnel on %s, skipping\n", out->name);
+	return out;
+}
+
+/*
+ * require_bwa - Skip the calling subtest unless BWA is currently enabled
+ * on @out's tunnel. Subtests that depend on toggling BWA (bwa-*, bwa-cycle,
+ * dual-bwa-*, mst-bwa-*) call this so they don't hard-assert on a sink that
+ * doesn't advertise the BWA capability.
+ */
+static void require_bwa(data_t *d, igt_output_t *out)
+{
+	igt_require_f(get_bwa_enabled(d->drm_fd, out),
+		      "BWA not enabled on %s; sink may not support it\n",
+		      out->name);
+}
+
+/*
+ * require_dual_sst_same_group - Skip if two tunneled SST outputs sharing
+ * one USB4 link cannot be found. On success d->output and d->output2 are
+ * populated.
+ */
+static void require_dual_sst_same_group(data_t *d)
+{
+	igt_require_f(find_two_tunneled_sst_outputs(d),
+		      "Need 2 tunneled non-MST DP outputs on same dock\n");
+	igt_require_f(has_tunnel(d->drm_fd, d->output) &&
+		      has_tunnel(d->drm_fd, d->output2),
+		      "Both outputs need tunnels\n");
+}
+
+/*
+ * require_mst_pair - Skip unless 2+ connected MST outputs sharing a
+ * single tunnel are available. On success d->mst_outputs[] is populated.
+ */
+static void require_mst_pair(data_t *d)
+{
+	igt_require_f(find_mst_outputs(d),
+		      "Need 2 connected MST outputs on same tunnel\n");
+	igt_require_f(has_tunnel(d->drm_fd, d->mst_outputs[0]) &&
+		      has_tunnel(d->drm_fd, d->mst_outputs[1]),
+		      "Both MST outputs (%s, %s) need tunnel debugfs\n",
+		      d->mst_outputs[0]->name, d->mst_outputs[1]->name);
+}
+
+/*
+ * Output of prepare_limit_setup() consumed by the limit-* subtests.
+ */
+struct limit_setup {
+	uint32_t connector_id;
+	drmModeModeInfo preferred;
+	int estimated_bw;
+	int full_mode_count;
+	int threshold;	/* min bw_limit at which preferred is present */
+};
+
+/*
+ * limit_setup_status - prepare_limit_setup() result.
+ *
+ * Helpers don't call igt_skip() / igt_require_f() so that the per-subtest
+ * caller controls the skip reason and the IGT framework attributes the
+ * skip to the right subtest in CI logs.
+ */
+enum limit_setup_status {
+	LIMIT_SETUP_OK,
+	LIMIT_SETUP_NO_ESTIMATED_BW,
+	LIMIT_SETUP_NO_MODES,
+	LIMIT_SETUP_NO_THRESHOLD,
+};
+
+/*
+ * prepare_limit_setup - Common preamble for limit-fallback / limit-boundary
+ * / limit-suspend:
+ *   - Clear stale bw_limit.
+ *   - Probe the unfiltered connector for the preferred mode and full count.
+ *   - Binary-search for the kernel's actual rejection threshold for the
+ *     preferred mode.
+ *
+ * Returns one of #limit_setup_status; @s is populated only on
+ * %LIMIT_SETUP_OK. Caller decides how (or whether) to skip on the other
+ * statuses.
+ */
+static enum limit_setup_status prepare_limit_setup(data_t *d,
+						   igt_output_t *out,
+						   struct limit_setup *s)
+{
+	drmModeConnector *conn;
+	int i;
+
+	set_bw_limit(d->drm_fd, out, 0);
+
+	s->connector_id = out->config.connector->connector_id;
+	s->estimated_bw = get_estimated_bw(d->drm_fd, out);
+	if (s->estimated_bw <= 0)
+		return LIMIT_SETUP_NO_ESTIMATED_BW;
+
+	conn = drmModeGetConnector(d->drm_fd, s->connector_id);
+	igt_assert_f(conn, "Failed to probe connector\n");
+	if (conn->count_modes <= 0) {
+		drmModeFreeConnector(conn);
+		return LIMIT_SETUP_NO_MODES;
+	}
+	s->full_mode_count = conn->count_modes;
+	s->preferred = conn->modes[0];
+	for (i = 0; i < conn->count_modes; i++) {
+		if (conn->modes[i].type & DRM_MODE_TYPE_PREFERRED) {
+			s->preferred = conn->modes[i];
+			break;
+		}
+	}
+	drmModeFreeConnector(conn);
+
+	s->threshold = find_mode_bw_threshold(d->drm_fd, out, s->connector_id,
+					      &s->preferred, s->estimated_bw);
+	if (s->threshold <= 0)
+		return LIMIT_SETUP_NO_THRESHOLD;
+
+	return LIMIT_SETUP_OK;
+}
+
+/*
+ * require_limit_setup - prepare_limit_setup() wrapper that turns each non-OK
+ * status into an igt_require_f skip with a specific message. Use this from
+ * limit-* subtests for uniform skip behaviour.
+ */
+static void require_limit_setup(data_t *d, igt_output_t *out,
+				struct limit_setup *s)
+{
+	enum limit_setup_status st = prepare_limit_setup(d, out, s);
+
+	switch (st) {
+	case LIMIT_SETUP_OK:
+		return;
+	case LIMIT_SETUP_NO_ESTIMATED_BW:
+		igt_skip("No estimated BW on %s\n", out->name);
+		break;
+	case LIMIT_SETUP_NO_MODES:
+		igt_skip("No modes on %s\n", out->name);
+		break;
+	case LIMIT_SETUP_NO_THRESHOLD:
+		igt_skip("Cannot filter preferred mode (clock=%d): "
+			 "always present or not in list\n",
+			 s->preferred.clock);
+		break;
+	}
+}
+
+/*
+ * preferred_mode_present_at_limit - Apply @limit, reprobe @connector_id and
+ * return whether @preferred survives in the filtered mode list. Optionally
+ * stores the post-filter mode count in @mode_count_out. Centralises the
+ * write-bw_limit / drmModeGetConnector / membership-check pattern shared by
+ * the limit-* subtests.
+ */
+static bool preferred_mode_present_at_limit(data_t *d, igt_output_t *out,
+					    uint32_t connector_id,
+					    const drmModeModeInfo *preferred,
+					    int limit, int *mode_count_out)
+{
+	drmModeConnector *conn;
+	bool present;
+
+	set_bw_limit(d->drm_fd, out, limit);
+	conn = drmModeGetConnector(d->drm_fd, connector_id);
+	igt_assert_f(conn, "Failed to reprobe connector\n");
+
+	present = igt_connector_mode_in_list(conn, preferred);
+	if (mode_count_out)
+		*mode_count_out = conn->count_modes;
+
+	drmModeFreeConnector(conn);
+	return present;
+}
+
+/* ------------------------------------------------------------------ */
+/* Subtest implementations.                                           */
+/*                                                                    */
+/* Each test_* assumes its caller has already established the         */
+/* connectors it needs (via the require_* helpers above).             */
+/* ------------------------------------------------------------------ */
+
+/*
+ * test_basic - Functional baseline:
+ *   1. Modeset the preferred mode on a tunneled output.
+ *   2. Tunnel info begins with "Tunnel: DPTUN" (debugfs format sanity).
+ *   3. Allocated BW becomes positive within BW_RETRY_TIMEOUT_MS (BWA
+ *      negotiation runs on a worker after commit returns).
+ *   4. Tunnel DPRX max rate is at least the link's current max rate
+ *      (i.e. the tunnel can carry whatever the link is using).
+ *
+ * TODO: split into basic-sst-{uhbr,non-uhbr} / basic-mst-{uhbr,non-uhbr}
+ * once test-rig coverage exists.
+ */
+static void test_basic(data_t *d, igt_output_t *out)
+{
+	char buf[TUNNEL_INFO_BUF_SIZE];
+	struct igt_fb fb;
+	int allocated, dprx_rate, current_max_rate;
+	int t;
+
+	igt_require_f(out->config.connector->count_modes > 0,
+		      "No modes available on %s\n", out->name);
+
+	/*
+	 * Reset bw_limit=0 in case a previously crashed limit-* subtest
+	 * left a stale cap on the tunnel that would now make BW
+	 * allocation fail for unrelated reasons.
+	 */
+	set_bw_limit(d->drm_fd, out, 0);
+	do_modeset(d, &out, 1, NULL, &fb);
+
+	read_tunnel_info(d->drm_fd, out, buf, sizeof(buf));
+	igt_info("tunnel_info:\n%s\n", buf);
+
+	igt_assert_f(strncmp(buf, "Tunnel: DPTUN", 13) == 0,
+		     "Unexpected tunnel name format: %s\n", buf);
+
+	/*
+	 * BWA negotiation with the USB4 host runs on a worker after the
+	 * modeset commit returns. Poll for up to BW_RETRY_TIMEOUT_MS for a
+	 * positive allocation rather than racing it with a single sample.
+	 */
+	allocated = get_allocated_bw(d->drm_fd, out);
+	for (t = 0; t < BW_RETRY_TIMEOUT_MS / BW_RETRY_STEP_MS &&
+	     allocated <= 0; t++) {
+		usleep(BW_RETRY_STEP_MS * 1000);
+		allocated = get_allocated_bw(d->drm_fd, out);
+	}
+	igt_info("[basic] allocated_bw=%d kB/s\n", allocated);
+	igt_assert_f(allocated > 0,
+		     "Allocated BW is %d, expected > 0\n", allocated);
+
+	dprx_rate = get_dprx_rate(d->drm_fd, out);
+	current_max_rate = igt_get_max_link_rate(d->drm_fd, out);
+	igt_info("[basic] dprx_rate=%d kbps  link_max_rate=%d kbps\n",
+		 dprx_rate, current_max_rate);
+	igt_assert_f(dprx_rate > 0,
+		     "DPRX max rate %d invalid\n", dprx_rate);
+	igt_assert_f(current_max_rate > 0,
+		     "Current max link rate %d invalid\n", current_max_rate);
+	igt_assert_f(dprx_rate >= current_max_rate,
+		     "DPRX rate %d < current max link rate %d\n",
+		     dprx_rate, current_max_rate);
+
+	cleanup_outputs(d, &out, 1, &fb);
+}
+
+static void test_modeset_bw(data_t *d, igt_output_t *out)
+{
+	drmModeConnector *c = out->config.connector;
+	struct igt_fb fb_low = {}, fb_high = {}, fb_back = {};
+	drmModeModeInfo low_mode_copy, high_mode_copy;
+	drmModeModeInfo *modes[1];
+	int bw_low, bw_high, bw_back;
+
+	igt_require_f(c->count_modes >= 2,
+		      "Need at least 2 modes on %s\n", out->name);
+	igt_require_f(igt_connector_find_lowest_clock_mode(out, &low_mode_copy) &&
+		      igt_connector_find_preferred_mode(out, &high_mode_copy) &&
+		      low_mode_copy.clock != high_mode_copy.clock,
+		      "Need distinct low and high modes on %s\n", out->name);
+
+	/* Step 1: lowest mode */
+	modes[0] = &low_mode_copy;
+	do_modeset(d, &out, 1, modes, &fb_low);
+	bw_low = get_allocated_bw(d->drm_fd, out);
+	igt_info("[modeset-bw] Step1 low_mode=%dx%d@%d  bw_low=%d kB/s\n",
+		 low_mode_copy.hdisplay, low_mode_copy.vdisplay,
+		 low_mode_copy.vrefresh, bw_low);
+	igt_assert_f(bw_low > 0, "Low mode allocated BW %d <= 0\n", bw_low);
+
+	/* Step 2: highest mode */
+	cleanup_outputs(d, &out, 1, &fb_low);
+	modes[0] = &high_mode_copy;
+	do_modeset(d, &out, 1, modes, &fb_high);
+	bw_high = get_allocated_bw(d->drm_fd, out);
+	igt_info("[modeset-bw] Step2 high_mode=%dx%d@%d  bw_high=%d kB/s"
+		 "  pass=(bw_high > bw_low): %d > %d\n",
+		 high_mode_copy.hdisplay, high_mode_copy.vdisplay,
+		 high_mode_copy.vrefresh, bw_high, bw_high, bw_low);
+	igt_assert_f(bw_high > bw_low,
+		     "High mode BW %d not > low mode BW %d\n",
+		     bw_high, bw_low);
+
+	/*
+	 * Step 3: back to lowest mode. With the same input mode and the
+	 * same group state (single tunnel, no other allocations changed),
+	 * the kernel's BWA path is deterministic, so allocation must round
+	 * to exactly the same value as Step 1.
+	 */
+	cleanup_outputs(d, &out, 1, &fb_high);
+	modes[0] = &low_mode_copy;
+	do_modeset(d, &out, 1, modes, &fb_back);
+	bw_back = get_allocated_bw(d->drm_fd, out);
+	igt_info("[modeset-bw] Step3 round-trip bw_back=%d kB/s"
+		 "  pass=(bw_back == bw_low): %d == %d\n",
+		 bw_back, bw_back, bw_low);
+	igt_assert_f(bw_back == bw_low,
+		     "BW after round-trip %d != bw_low %d\n",
+		     bw_back, bw_low);
+
+	cleanup_outputs(d, &out, 1, &fb_back);
+}
+
+static void test_disable_bw(data_t *d, igt_output_t *out)
+{
+	struct igt_fb fb;
+	int allocated;
+
+	do_modeset(d, &out, 1, NULL, &fb);
+	allocated = get_allocated_bw(d->drm_fd, out);
+	igt_info("[disable-bw] Before disable: allocated_bw=%d kB/s\n",
+		 allocated);
+	igt_assert_f(allocated > 0,
+		     "Expected allocated BW > 0 before disable\n");
+
+	igt_output_set_crtc(out, NULL);
+	igt_display_commit2(&d->display, COMMIT_ATOMIC);
+	igt_remove_fb(d->drm_fd, &fb);
+
+	allocated = get_allocated_bw(d->drm_fd, out);
+	igt_info("[disable-bw] After disable: allocated_bw=%d kB/s  "
+		 "pass=(==0): %d == 0\n", allocated, allocated);
+	igt_assert_f(allocated == 0,
+		     "Allocated BW %d != 0 after output disabled\n", allocated);
+
+	do_modeset(d, &out, 1, NULL, &fb);
+	allocated = get_allocated_bw(d->drm_fd, out);
+	igt_info("[disable-bw] After re-enable: allocated_bw=%d kB/s  "
+		 "pass=(>0): %d > 0\n", allocated, allocated);
+	igt_assert_f(allocated > 0,
+		     "Expected allocated BW > 0 after re-enable\n");
+
+	cleanup_outputs(d, &out, 1, &fb);
+}
+
+/*
+ * await_tunnel_after_resume_identity - Wait up to 3s for the cached @out
+ * pointer to regain a working tunnel; if the kernel re-enumerated the
+ * connector, rebuild IGT's display state and look up the new connector
+ * for *the same physical sink* by matching @pre_path (preferred, more
+ * reliable for MST topologies) or @pre_serial (EDID fallback). Returns
+ * the (possibly updated) output, or NULL if the original sink does not
+ * re-establish a tunnel within 30s.
+ *
+ * @pre_path / @pre_serial: pre-suspend identity captured via
+ *			    igt_connector_get_info(); either may be empty.
+ * @tag:		    log prefix for diagnostics.
+ */
+static igt_output_t *await_tunnel_after_resume_identity(data_t *d,
+							igt_output_t *out,
+							const char *pre_path,
+							const char *pre_serial,
+							const char *tag)
+{
+	igt_until_timeout(3) {
+		if (has_tunnel(d->drm_fd, out))
+			return out;
+		usleep(100 * 1000);
+	}
+
+	igt_display_fini(&d->display);
+	igt_display_require(&d->display, d->drm_fd);
+
+	igt_until_timeout(30) {
+		uint32_t new_id = 0;
+		igt_output_t *new_out;
+
+		igt_connector_reprobe_all(d->drm_fd);
+
+		if (pre_path[0] &&
+		    !igt_connector_find_by_path(d->drm_fd, pre_path, &new_id)) {
+			new_id = 0;
+		}
+		if (!new_id && pre_serial[0]) {
+			if (!igt_connector_find_by_serial(d->drm_fd, pre_serial,
+							  &new_id))
+				new_id = 0;
+		}
+		if (new_id) {
+			new_out = igt_connector_find_output_by_id(&d->display,
+								  new_id);
+			if (new_out && has_tunnel(d->drm_fd, new_out)) {
+				igt_info("[%s] Tunnel re-established on %s "
+					 "(re-enumerated id=%u)\n",
+					 tag, new_out->name, new_id);
+				register_for_cleanup(d, new_out);
+				return new_out;
+			}
+		}
+		usleep(500 * 1000);
+	}
+	return NULL;
+}
+
+static void test_suspend(data_t *d, igt_output_t *out)
+{
+	struct igt_fb fb;
+	int pre_allocated, pre_dprx_rate, pre_group;
+	int post_allocated, granularity;
+	bool pre_bwa;
+	char pre_path[128] = {};
+	char pre_serial[64] = {};
+	char tmp[32];
+
+	igt_connector_get_info(d->drm_fd,
+			       out->config.connector->connector_id,
+			       tmp, sizeof(tmp),
+			       pre_serial, sizeof(pre_serial),
+			       pre_path, sizeof(pre_path));
+
+	do_modeset(d, &out, 1, NULL, &fb);
+
+	pre_allocated = get_allocated_bw(d->drm_fd, out);
+	pre_dprx_rate = get_dprx_rate(d->drm_fd, out);
+	pre_group = get_tunnel_group_id(d->drm_fd, out);
+	granularity = get_granularity(d->drm_fd, out);
+	pre_bwa = get_bwa_enabled(d->drm_fd, out);
+	igt_info("[suspend] Pre-suspend: %s allocated_bw=%d kB/s  dprx_rate=%d kbps"
+		 "  group_id=%d  granularity=%d kB/s  bwa=%d  path='%s' serial='%s'\n",
+		 out->name, pre_allocated, pre_dprx_rate, pre_group, granularity,
+		 pre_bwa, pre_path, pre_serial);
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	out = await_tunnel_after_resume_identity(d, out, pre_path, pre_serial,
+						 "suspend");
+	if (!out) {
+		igt_remove_fb(d->drm_fd, &fb);
+		igt_skip("Tunnel not re-established 30s after resume\n");
+	}
+
+	if (pre_bwa)
+		igt_assert_f(get_bwa_enabled(d->drm_fd, out),
+			     "BWA was enabled pre-suspend but not restored after resume\n");
+
+	post_allocated = get_allocated_bw(d->drm_fd, out);
+	igt_info("[suspend] Post-resume: allocated_bw=%d kB/s  bwa_enabled=%d"
+		 "  dprx_rate=%d kbps  group_id=%d\n",
+		 post_allocated, get_bwa_enabled(d->drm_fd, out),
+		 get_dprx_rate(d->drm_fd, out),
+		 get_tunnel_group_id(d->drm_fd, out));
+	igt_info("[suspend] pass=(|post-pre| <= gran): |%d - %d| = %d <= %d\n",
+		 post_allocated, pre_allocated,
+		 abs(post_allocated - pre_allocated), granularity);
+	igt_assert_f(abs(post_allocated - pre_allocated) <= granularity,
+		     "Allocated BW changed more than one granularity step "
+		     "after resume: pre=%d post=%d gran=%d\n",
+		     pre_allocated, post_allocated, granularity);
+	igt_assert_f(get_dprx_rate(d->drm_fd, out) == pre_dprx_rate,
+		     "DPRX rate changed after resume\n");
+	igt_assert_f(get_tunnel_group_id(d->drm_fd, out) == pre_group,
+		     "Tunnel group ID changed after resume\n");
+
+	/*
+	 * After suspend/resume, TBT re-enumerates connectors which can
+	 * cause a stale DRM state in IGT. Use targeted per-output disable
+	 * to avoid touching connectors that may have changed.
+	 */
+	igt_output_set_crtc(out, NULL);
+	igt_output_override_mode(out, NULL);
+	igt_display_commit2(&d->display, COMMIT_ATOMIC);
+	igt_remove_fb(d->drm_fd, &fb);
+}
+
+static void test_limit_fallback(data_t *d, igt_output_t *out)
+{
+	struct igt_fb fb;
+	struct limit_setup s;
+	drmModeConnector *conn;
+	drmModeModeInfo fallback_copy;
+	drmModeModeInfo *modes[1];
+	int reject_limit, pref_alloc, fallback_alloc, count;
+	bool present;
+
+	require_limit_setup(d, out, &s);
+
+	/* Record the BW actually allocated for the preferred mode */
+	modes[0] = &s.preferred;
+	do_modeset(d, &out, 1, modes, &fb);
+	pref_alloc = get_allocated_bw(d->drm_fd, out);
+	igt_info("[limit-fallback] preferred_mode=%dx%d@%d clock=%d kHz"
+		 "  pref_alloc=%d kB/s  estimated_bw=%d kB/s\n",
+		 s.preferred.hdisplay, s.preferred.vdisplay,
+		 s.preferred.vrefresh, s.preferred.clock,
+		 pref_alloc, s.estimated_bw);
+	cleanup_outputs(d, &out, 1, &fb);
+
+	reject_limit = s.threshold - 1;
+	igt_info("[limit-fallback] threshold=%d  reject_limit=%d\n",
+		 s.threshold, reject_limit);
+
+	/* Apply the reject limit and verify preferred is gone */
+	present = preferred_mode_present_at_limit(d, out, s.connector_id,
+						  &s.preferred, reject_limit,
+						  &count);
+	igt_info("[limit-fallback] At T-1=%d: preferred_present=%d  modes_remaining=%d\n",
+		 reject_limit, present, count);
+	igt_assert_f(!present,
+		     "Preferred mode (clock=%d) still present at "
+		     "limit=%d (threshold=%d)\n",
+		     s.preferred.clock, reject_limit, s.threshold);
+
+	conn = drmModeGetConnector(d->drm_fd, s.connector_id);
+	igt_assert_f(conn, "Failed to reprobe connector\n");
+	if (!igt_connector_find_highest_clock_mode_in(conn, &fallback_copy)) {
+		drmModeFreeConnector(conn);
+		set_bw_limit(d->drm_fd, out, 0);
+		igt_skip("No modes available at limit=%d\n", reject_limit);
+	}
+	drmModeFreeConnector(conn);
+
+	modes[0] = &fallback_copy;
+	do_modeset(d, &out, 1, modes, &fb);
+	fallback_alloc = get_allocated_bw(d->drm_fd, out);
+	/*
+	 * The kernel filters modes using 18bpp minimum
+	 * (intel_dp_mode_valid_format) but allocates BWA at the actual
+	 * pixel rate.  On low-res displays the granularity rounding can
+	 * make fallback_alloc == pref_alloc.  Assert on clock difference
+	 * instead (proves mode-list filtering worked).
+	 */
+	igt_info("[limit-fallback] fallback_mode=%dx%d@%d  fallback_alloc=%d kB/s"
+		 "  pref_alloc=%d kB/s  pass=(fallback_clock < pref_clock): %d < %d\n",
+		 fallback_copy.hdisplay, fallback_copy.vdisplay,
+		 fallback_copy.vrefresh, fallback_alloc, pref_alloc,
+		 fallback_copy.clock, s.preferred.clock);
+	igt_assert_f(fallback_copy.clock < s.preferred.clock,
+		     "Expected fallback mode (clock %d < preferred %d) "
+		     "but mode-list filtering did not work\n",
+		     fallback_copy.clock, s.preferred.clock);
+	igt_assert_f(fallback_alloc > 0,
+		     "Fallback allocated BW %d <= 0\n", fallback_alloc);
+
+	set_bw_limit(d->drm_fd, out, 0);
+	cleanup_outputs(d, &out, 1, &fb);
+}
+
+/*
+ * test_limit_boundary - Three-stage off-by-one + clear check on the same
+ * tunnel:
+ *   1. limit = threshold T:    preferred must be present.
+ *   2. limit = T - 1:          preferred must be absent.
+ *   3. limit = 0:              preferred and full mode count restored.
+ *
+ * Stage 3 absorbs what test_limit_clear used to cover separately - the
+ * unique "full mode count restored after clearing" check now lives here.
+ */
+static void test_limit_boundary(data_t *d, igt_output_t *out)
+{
+	struct limit_setup s;
+	int count;
+	bool present;
+
+	require_limit_setup(d, out, &s);
+
+	igt_info("[limit-boundary] preferred_mode=%dx%d@%d clock=%d kHz"
+		 "  estimated_bw=%d kB/s  threshold(T)=%d kB/s"
+		 "  full_mode_count=%d\n",
+		 s.preferred.hdisplay, s.preferred.vdisplay,
+		 s.preferred.vrefresh, s.preferred.clock,
+		 s.estimated_bw, s.threshold, s.full_mode_count);
+
+	/* At threshold: preferred must be present */
+	present = preferred_mode_present_at_limit(d, out, s.connector_id,
+						  &s.preferred, s.threshold,
+						  &count);
+	igt_info("[limit-boundary] At T=%d: preferred_present=%d (expect 1)"
+		 "  modes_count=%d\n", s.threshold, present, count);
+	igt_assert_f(present,
+		     "Preferred mode (clock=%d) absent at boundary limit=%d\n",
+		     s.preferred.clock, s.threshold);
+
+	/* One below threshold: preferred must be absent */
+	present = preferred_mode_present_at_limit(d, out, s.connector_id,
+						  &s.preferred,
+						  s.threshold - 1, &count);
+	igt_info("[limit-boundary] At T-1=%d: preferred_present=%d (expect 0)"
+		 "  modes_count=%d\n", s.threshold - 1, present, count);
+	igt_assert_f(!present,
+		     "Preferred mode (clock=%d) still present at "
+		     "limit=%d (one below threshold=%d)\n",
+		     s.preferred.clock, s.threshold - 1, s.threshold);
+
+	/* Clear: full mode list and preferred must be restored */
+	present = preferred_mode_present_at_limit(d, out, s.connector_id,
+						  &s.preferred, 0, &count);
+	igt_info("[limit-boundary] After clear (limit=0): modes_count=%d"
+		 "  preferred_present=%d  pass=(count == full): %d == %d\n",
+		 count, present, count, s.full_mode_count);
+	igt_assert_f(get_bw_limit(d->drm_fd, out) == 0,
+		     "bw_limit not 0 after clearing\n");
+	igt_assert_f(count == s.full_mode_count,
+		     "Mode count %d != original %d after clearing\n",
+		     count, s.full_mode_count);
+	igt_assert_f(present,
+		     "Preferred mode not restored after clearing limit\n");
+}
+
+static void test_limit_suspend(data_t *d, igt_output_t *out)
+{
+	struct igt_fb fb;
+	struct limit_setup s;
+	drmModeConnector *conn;
+	drmModeModeInfo fallback_copy;
+	drmModeModeInfo *modes[1];
+	int allocated_before, limit, allocated_pre, allocated_after;
+	char pre_path[128] = {};
+	char pre_serial[64] = {};
+	char tmp[32];
+
+	igt_connector_get_info(d->drm_fd,
+			       out->config.connector->connector_id,
+			       tmp, sizeof(tmp),
+			       pre_serial, sizeof(pre_serial),
+			       pre_path, sizeof(pre_path));
+
+	require_limit_setup(d, out, &s);
+
+	/* Modeset at preferred mode, then record allocated BW */
+	modes[0] = &s.preferred;
+	do_modeset(d, &out, 1, modes, &fb);
+	allocated_before = get_allocated_bw(d->drm_fd, out);
+	igt_info("[limit-suspend] preferred_mode=%dx%d@%d  allocated_before=%d kB/s\n",
+		 s.preferred.hdisplay, s.preferred.vdisplay,
+		 s.preferred.vrefresh, allocated_before);
+	cleanup_outputs(d, &out, 1, &fb);
+
+	limit = s.threshold - 1;
+	set_bw_limit(d->drm_fd, out, limit);
+
+	conn = drmModeGetConnector(d->drm_fd, s.connector_id);
+	if (!conn || conn->count_modes == 0) {
+		if (conn)
+			drmModeFreeConnector(conn);
+		set_bw_limit(d->drm_fd, out, 0);
+		igt_skip("No modes available within limit=%d\n", limit);
+	}
+
+	igt_assert_f(igt_connector_find_highest_clock_mode_in(conn, &fallback_copy),
+		     "No modes in filtered connector list at limit=%d\n", limit);
+	drmModeFreeConnector(conn);
+
+	modes[0] = &fallback_copy;
+	do_modeset(d, &out, 1, modes, &fb);
+
+	/*
+	 * Note: bw_limit filters using 18bpp; actual BWA is at display
+	 * pixel rate, so allocated_pre may exceed limit. Log the value
+	 * as evidence but don't assert allocated <= limit. The meaningful
+	 * check is that bw_limit is reset across suspend.
+	 */
+	allocated_pre = get_allocated_bw(d->drm_fd, out);
+	igt_info("[limit-suspend] fallback_mode=%dx%d@%d  limit=%d kB/s"
+		 "  allocated_pre=%d kB/s"
+		 "  (note: alloc may exceed limit due to 18bpp filter)\n",
+		 fallback_copy.hdisplay, fallback_copy.vdisplay,
+		 fallback_copy.vrefresh, limit, allocated_pre);
+	igt_assert_f(allocated_pre > 0,
+		     "Allocated BW %d <= 0 for fallback mode\n", allocated_pre);
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	out = await_tunnel_after_resume_identity(d, out, pre_path, pre_serial,
+						 "limit-suspend");
+	if (!out) {
+		igt_remove_fb(d->drm_fd, &fb);
+		igt_skip("Tunnel not re-established 30s after resume\n");
+	}
+
+	/*
+	 * bw_limit lives on the tunnel object; the tunnel is destroyed on
+	 * suspend and re-created on resume, so the cap is reset to 0.
+	 */
+	igt_assert_f(get_bw_limit(d->drm_fd, out) == 0,
+		     "bw_limit not reset after resume: expected 0, got %d\n",
+		     get_bw_limit(d->drm_fd, out));
+
+	allocated_after = get_allocated_bw(d->drm_fd, out);
+	igt_info("[limit-suspend] Post-resume: bw_limit=%d kB/s  allocated_after=%d kB/s"
+		 "  allocated_pre=%d kB/s  delta=%d kB/s\n",
+		 get_bw_limit(d->drm_fd, out), allocated_after,
+		 allocated_pre, allocated_after - allocated_pre);
+	igt_assert_f(allocated_after > 0,
+		     "Allocated BW %d <= 0 after resume\n", allocated_after);
+
+	if (has_tunnel(d->drm_fd, out))
+		set_bw_limit(d->drm_fd, out, 0);
+	igt_output_set_crtc(out, NULL);
+	igt_output_override_mode(out, NULL);
+	igt_display_commit2(&d->display, COMMIT_ATOMIC);
+	igt_remove_fb(d->drm_fd, &fb);
+}
+
+/*
+ * test_bwa_re_enable - End-to-end BWA toggle lifecycle. Replaces three
+ * earlier subtests (bwa-disable / bwa-link-params / bwa-modeset):
+ *
+ *   1. Modeset preferred mode; record alloc_initial, rate_on. BWA must be
+ *      enabled and allocation positive.
+ *   2. Disable BWA via debugfs (no commit).  Snapshot tunnel info once
+ *      and assert: bwa is off, Allocated BW == -1, "Tunnel:" header still
+ *      present, rate_off > 0 (DPCD fallback path).
+ *   3. Disable display, re-enable BWA, fresh modeset on the same preferred
+ *      mode.  alloc_post must equal alloc_initial (same input, same group
+ *      state -> deterministic), and rate_restored must equal rate_on.
+ */
+static void test_bwa_re_enable(data_t *d, igt_output_t *out)
+{
+	struct igt_fb fb;
+	char buf[TUNNEL_INFO_BUF_SIZE];
+	int alloc_initial, rate_on, rate_off, rate_restored, alloc_post;
+	int disabled_alloc;
+	bool tunnel_alive, bwa_off;
+
+	do_modeset(d, &out, 1, NULL, &fb);
+	require_bwa(d, out);
+
+	alloc_initial = get_allocated_bw(d->drm_fd, out);
+	rate_on = igt_get_max_link_rate(d->drm_fd, out);
+	igt_info("[bwa-re-enable] Stage1 alloc_initial=%d kB/s  rate_on=%d kbps\n",
+		 alloc_initial, rate_on);
+	igt_assert_f(alloc_initial > 0,
+		     "Expected positive allocated BW, got %d\n", alloc_initial);
+	igt_assert_f(rate_on > 0, "Max link rate %d invalid\n", rate_on);
+
+	/*
+	 * Stage 2: disable BWA and snapshot the resulting state once. Reading
+	 * tunnel info / link rate / bwa_enabled all in one go avoids racing
+	 * the debugfs against any background activity that might mutate state
+	 * between separate reads.
+	 */
+	set_bwa_enabled(d->drm_fd, out, false);
+	read_tunnel_info(d->drm_fd, out, buf, sizeof(buf));
+	bwa_off = !get_bwa_enabled(d->drm_fd, out);
+	disabled_alloc = parse_tunnel_field_int(buf, "Allocated BW:");
+	tunnel_alive = strncmp(buf, "Tunnel:", 7) == 0;
+	rate_off = igt_get_max_link_rate(d->drm_fd, out);
+	igt_info("[bwa-re-enable] Stage2 (BWA off): bwa_off=%d  alloc=%d (expect -1)"
+		 "  tunnel_alive=%d  rate_off=%d kbps\n",
+		 bwa_off, disabled_alloc, tunnel_alive, rate_off);
+	igt_assert_f(bwa_off, "BWA still enabled after disabling\n");
+	igt_assert_f(disabled_alloc == -1,
+		     "Allocated BW should be -1 when BWA disabled, got %d\n",
+		     disabled_alloc);
+	igt_assert_f(tunnel_alive, "Tunnel disappeared after BWA disable\n");
+	igt_assert_f(rate_off > 0,
+		     "Max link rate %d invalid after BWA off\n", rate_off);
+
+	/*
+	 * Stage 3: bring the display down, re-enable BWA on the quiesced
+	 * tunnel, then bring it back up. BWA negotiation with the USB4 host
+	 * runs as part of the display-enable transition, so a fresh modeset
+	 * is what verifies the knob took effect.
+	 */
+	cleanup_outputs(d, &out, 1, &fb);
+	set_bwa_enabled(d->drm_fd, out, true);
+	igt_assert_f(get_bwa_enabled(d->drm_fd, out), "BWA not re-enabled\n");
+	do_modeset(d, &out, 1, NULL, &fb);
+
+	alloc_post = get_allocated_bw(d->drm_fd, out);
+	rate_restored = igt_get_max_link_rate(d->drm_fd, out);
+	igt_info("[bwa-re-enable] Stage3 (re-enable+fresh modeset):"
+		 " alloc_post=%d kB/s  estimated=%d kB/s  rate_restored=%d kbps"
+		 "  pass=(alloc_post == alloc_initial && rate_restored == rate_on):"
+		 "  %d == %d && %d == %d\n",
+		 alloc_post, get_estimated_bw(d->drm_fd, out), rate_restored,
+		 alloc_post, alloc_initial, rate_restored, rate_on);
+	igt_assert_f(alloc_post > 0,
+		     "Allocated BW %d <= 0 after re-enable\n", alloc_post);
+	igt_assert_f(get_estimated_bw(d->drm_fd, out) > 0,
+		     "Estimated BW <= 0 after re-enable\n");
+	igt_assert_f(alloc_post == alloc_initial,
+		     "Post-re-enable alloc %d != initial %d\n",
+		     alloc_post, alloc_initial);
+	igt_assert_f(rate_restored == rate_on,
+		     "Max link rate after re-enable (%d) != original (%d)\n",
+		     rate_restored, rate_on);
+
+	cleanup_outputs(d, &out, 1, &fb);
+}
+
+/*
+ * test_bwa_cycle - Stress repeated debugfs-only BWA toggle (no modeset
+ * inside the loop) and verify that BW allocation is unchanged once a
+ * fresh modeset re-establishes the link. This exercises rapid
+ * debugfs-knob handling, not BWA renegotiation.
+ */
+static void test_bwa_cycle(data_t *d, igt_output_t *out)
+{
+	struct igt_fb fb;
+	int original, post, i;
+
+	do_modeset(d, &out, 1, NULL, &fb);
+	require_bwa(d, out);
+
+	original = get_allocated_bw(d->drm_fd, out);
+	igt_info("[bwa-cycle] Initial: original_bw=%d kB/s  n_cycles=%d\n",
+		 original, BWA_CYCLE_COUNT);
+	igt_assert_f(original > 0,
+		     "Expected positive allocated BW, got %d\n", original);
+
+	for (i = 0; i < BWA_CYCLE_COUNT; i++) {
+		set_bwa_enabled(d->drm_fd, out, false);
+		igt_assert_f(!get_bwa_enabled(d->drm_fd, out),
+			     "BWA still enabled in cycle %d\n", i);
+		/*
+		 * Sanity-check that the knob has the expected debugfs side
+		 * effect (Allocated BW becomes -1) once per run, not every
+		 * iteration - one reading per cycle is enough overhead.
+		 */
+		if (i == 0)
+			igt_assert_f(get_allocated_bw(d->drm_fd, out) == -1,
+				     "Allocated BW != -1 after first disable\n");
+		set_bwa_enabled(d->drm_fd, out, true);
+		igt_assert_f(get_bwa_enabled(d->drm_fd, out),
+			     "BWA not re-enabled in cycle %d\n", i);
+	}
+
+	cleanup_outputs(d, &out, 1, &fb);
+	do_modeset(d, &out, 1, NULL, &fb);
+
+	post = get_allocated_bw(d->drm_fd, out);
+	igt_info("[bwa-cycle] After %d cycles + fresh modeset: post_bw=%d kB/s"
+		 "  pass=(post == original): %d == %d\n",
+		 BWA_CYCLE_COUNT, post, post, original);
+	igt_assert_f(post > 0,
+		     "Allocated BW %d <= 0 after cycles\n", post);
+	igt_assert_f(post == original,
+		     "BW drifted after %d BWA cycles: orig=%d post=%d\n",
+		     BWA_CYCLE_COUNT, original, post);
+
+	cleanup_outputs(d, &out, 1, &fb);
+}
+
+static void test_dual_bw_sum(data_t *d)
+{
+	igt_output_t *outs[2] = { d->output, d->output2 };
+	struct igt_fb fbs[2] = {};
+	int alloc_a, alloc_b, estimated_a, estimated_b;
+	int group_a, group_b, group_free_a, group_free_b;
+
+	do_modeset(d, outs, 2, NULL, fbs);
+
+	group_a = get_tunnel_group_id(d->drm_fd, outs[0]);
+	group_b = get_tunnel_group_id(d->drm_fd, outs[1]);
+	igt_assert_f(group_a >= 0 && group_b >= 0,
+		     "Invalid tunnel group IDs: %d vs %d\n", group_a, group_b);
+	igt_assert_f(group_a == group_b,
+		     "Tunnels have different group IDs: %d vs %d\n",
+		     group_a, group_b);
+
+	alloc_a = get_allocated_bw(d->drm_fd, outs[0]);
+	alloc_b = get_allocated_bw(d->drm_fd, outs[1]);
+	estimated_a = get_estimated_bw(d->drm_fd, outs[0]);
+	estimated_b = get_estimated_bw(d->drm_fd, outs[1]);
+
+	/*
+	 * Per-tunnel "Estimated BW" reported by the TBT Connection Manager
+	 * is (this tunnel's allocated BW) + (group free BW). Two tunnels in
+	 * the same group therefore see the same group_free, even though
+	 * their per-tunnel estimated values legitimately differ when their
+	 * allocations differ. The shared-group invariant is:
+	 *
+	 *   estimated_a - alloc_a == estimated_b - alloc_b == group_free
+	 *
+	 * and that group_free must be non-negative.
+	 */
+	group_free_a = estimated_a - alloc_a;
+	group_free_b = estimated_b - alloc_b;
+	igt_info("[dual-bw-sum] group=%d  alloc_a=%d estimated_a=%d  "
+		 "alloc_b=%d estimated_b=%d  group_free_a=%d group_free_b=%d\n",
+		 group_a, alloc_a, estimated_a, alloc_b, estimated_b,
+		 group_free_a, group_free_b);
+	igt_assert_f(alloc_a > 0 && alloc_b > 0,
+		     "Both outputs must have positive allocated BW (got %d, %d)\n",
+		     alloc_a, alloc_b);
+	igt_assert_f(group_free_a == group_free_b,
+		     "Grouped tunnels report different free BW (%d vs %d). "
+		     "estimated_a=%d alloc_a=%d  estimated_b=%d alloc_b=%d\n",
+		     group_free_a, group_free_b,
+		     estimated_a, alloc_a, estimated_b, alloc_b);
+	igt_assert_f(group_free_a >= 0,
+		     "Negative group free BW (%d): allocations overran the pool\n",
+		     group_free_a);
+
+	cleanup_outputs(d, outs, 2, fbs);
+}
+
+/*
+ * test_dual_limit_isolation - Per-tunnel bw_limit isolation within a shared
+ * group.
+ *
+ * The strong contract being tested: bw_limit is per-tunnel state
+ * (tunnel->bw_limit), not group state, even when two tunnels share one USB4
+ * group's BW pool. Writing to A's bw_limit debugfs file must:
+ *
+ *   (a) clip A's connector mode list (modes whose 18bpp BW exceed the cap
+ *       are filtered from drmModeGetConnector() on A).
+ *   (b) NOT clip B's connector mode list (B's mode count + preferred mode
+ *       are unchanged at the moment A's cap is set).
+ *   (c) After a retrigger that pins B to its prior mode, B's mode is
+ *       preserved and B's allocation drifts by at most one granularity
+ *       step (group BW accounting can redistribute the freed BW within
+ *       the group, which can shift B's bucket; that is allowed).
+ *
+ * This complements dual-bw-sum (which tests the group BW invariant) and
+ * mst-limit-fallback (which tests bw_limit on a single tunnel with two
+ * streams). Neither covers the per-tunnel-vs-group scope of bw_limit.
+ */
+static void test_dual_limit_isolation(data_t *d)
+{
+	igt_output_t *outs[2] = { d->output, d->output2 };
+	struct igt_fb fbs[2] = {}, fbs2[2] = {};
+	drmModeModeInfo *modes[2] = {};
+	drmModeModeInfo limited_mode, mode_a_before, mode_b_before;
+	drmModeConnector *conn;
+	uint32_t connector_id_a, connector_id_b;
+	int alloc_a_before, alloc_b_before, alloc_a_after, alloc_b_after, limit_a;
+	int gran_b, delta_b;
+	int b_modes_unfiltered, b_modes_under_a_limit;
+	int group_a, group_b;
+	bool b_preferred_under_a_limit;
+	const drmModeModeInfo *mode_b_after;
+
+	do_modeset(d, outs, 2, NULL, fbs);
+
+	/*
+	 * Sanity: the require_dual_sst_same_group() helper at the call site
+	 * already filters by group, but assert it inside the test too so the
+	 * trace is unambiguous when looking at logs.
+	 */
+	group_a = get_tunnel_group_id(d->drm_fd, outs[0]);
+	group_b = get_tunnel_group_id(d->drm_fd, outs[1]);
+	igt_assert_f(group_a >= 0 && group_b >= 0 && group_a == group_b,
+		     "Pair not in same group: group_a=%d group_b=%d\n",
+		     group_a, group_b);
+
+	mode_a_before = *igt_output_get_mode(outs[0]);
+	mode_b_before = *igt_output_get_mode(outs[1]);
+	alloc_a_before = get_allocated_bw(d->drm_fd, outs[0]);
+	alloc_b_before = get_allocated_bw(d->drm_fd, outs[1]);
+	gran_b = get_granularity(d->drm_fd, outs[1]);
+	limit_a = alloc_a_before / 2;
+	igt_require_f(limit_a > 0, "Allocated BW too small for test\n");
+
+	/*
+	 * Probe B's connector once with no cap on A so we can compare the
+	 * mode-list count + preferred-mode presence after applying A's cap.
+	 */
+	connector_id_a = outs[0]->config.connector->connector_id;
+	connector_id_b = outs[1]->config.connector->connector_id;
+
+	conn = drmModeGetConnector(d->drm_fd, connector_id_b);
+	igt_assert_f(conn, "Failed to probe B unfiltered\n");
+	b_modes_unfiltered = conn->count_modes;
+	drmModeFreeConnector(conn);
+
+	/*
+	 * Apply limit to tunnel A only, then probe both connectors:
+	 *   - A's filtered list: pick the highest-clock surviving mode.
+	 *   - B's filtered list: must be unchanged (count + preferred mode
+	 *     present), which is the per-tunnel-scope assertion.
+	 */
+	set_bw_limit(d->drm_fd, outs[0], limit_a);
+
+	conn = drmModeGetConnector(d->drm_fd, connector_id_a);
+	if (!conn || conn->count_modes == 0) {
+		if (conn)
+			drmModeFreeConnector(conn);
+		set_bw_limit(d->drm_fd, outs[0], 0);
+		igt_skip("No modes on A after applying bw_limit\n");
+	}
+	if (!igt_connector_find_highest_clock_mode_in(conn, &limited_mode)) {
+		drmModeFreeConnector(conn);
+		set_bw_limit(d->drm_fd, outs[0], 0);
+		igt_skip("No modes available within limit=%d\n", limit_a);
+	}
+	drmModeFreeConnector(conn);
+
+	conn = drmModeGetConnector(d->drm_fd, connector_id_b);
+	igt_assert_f(conn, "Failed to reprobe B under A's cap\n");
+	b_modes_under_a_limit = conn->count_modes;
+	b_preferred_under_a_limit =
+		igt_connector_mode_in_list(conn, &mode_b_before);
+	drmModeFreeConnector(conn);
+
+	igt_info("[dual-limit-isolation] group=%d  "
+		 "B_modes: unfiltered=%d under_A_limit=%d  "
+		 "B_preferred_under_A_limit=%d  "
+		 "A_clk_before=%d A_clk_under_limit=%d  limit_a=%d\n",
+		 group_a, b_modes_unfiltered, b_modes_under_a_limit,
+		 b_preferred_under_a_limit,
+		 mode_a_before.clock, limited_mode.clock, limit_a);
+
+	/* Per-tunnel scope: A's cap must NOT shrink B's mode list. */
+	igt_assert_f(b_modes_under_a_limit == b_modes_unfiltered,
+		     "B's mode count changed when A was capped: "
+		     "unfiltered=%d under_A_limit=%d (bw_limit leaked from A to B)\n",
+		     b_modes_unfiltered, b_modes_under_a_limit);
+	igt_assert_f(b_preferred_under_a_limit,
+		     "B's previously-active mode (clk=%d) was filtered out "
+		     "when A was capped (bw_limit leaked from A to B)\n",
+		     mode_b_before.clock);
+
+	/* A's cap took effect on A's own list. */
+	igt_assert_f(limited_mode.clock < mode_a_before.clock,
+		     "A's mode list was not constrained by its bw_limit: "
+		     "limited_clock=%d, original_clock=%d\n",
+		     limited_mode.clock, mode_a_before.clock);
+
+	/*
+	 * Pin tunnel B to its prior mode and bring A up at the limited
+	 * mode. After commit, B's mode must be preserved and B's
+	 * allocation must stay within one granularity step (the freed
+	 * BW from A may shift B's BWA bucket via group accounting).
+	 */
+	modes[0] = &limited_mode;
+	modes[1] = &mode_b_before;
+	retrigger_modeset(d, outs, 2, modes, fbs, fbs2);
+
+	alloc_a_after = get_allocated_bw(d->drm_fd, outs[0]);
+	alloc_b_after = get_allocated_bw(d->drm_fd, outs[1]);
+	mode_b_after = igt_output_get_mode(outs[1]);
+	delta_b = abs(alloc_b_after - alloc_b_before);
+
+	igt_info("[dual-limit-isolation] post-retrigger: "
+		 "alloc_a: %d->%d  alloc_b: %d->%d (gran=%d delta=%d)  "
+		 "B_clk: %d->%d\n",
+		 alloc_a_before, alloc_a_after,
+		 alloc_b_before, alloc_b_after, gran_b, delta_b,
+		 mode_b_before.clock, mode_b_after->clock);
+	igt_assert_f(alloc_a_after > 0,
+		     "A allocated BW %d <= 0 after limited modeset\n",
+		     alloc_a_after);
+	igt_assert_f(mode_b_after->clock == mode_b_before.clock,
+		     "B mode changed across A's cap retrigger: "
+		     "before clk=%d after clk=%d\n",
+		     mode_b_before.clock, mode_b_after->clock);
+	igt_assert_f(alloc_b_after > 0,
+		     "B alloc invalid after retrigger: %d\n", alloc_b_after);
+	igt_assert_f(delta_b <= gran_b,
+		     "B alloc drifted beyond one granularity step: "
+		     "before=%d after=%d gran=%d delta=%d\n",
+		     alloc_b_before, alloc_b_after, gran_b, delta_b);
+
+	set_bw_limit(d->drm_fd, outs[0], 0);
+	cleanup_outputs(d, outs, 2, fbs2);
+}
+
+static void test_dual_bwa_disable(data_t *d)
+{
+	igt_output_t *outs[2] = { d->output, d->output2 };
+	struct igt_fb fbs[2] = {};
+	int alloc_b_before, alloc_b_after, gran_b, delta_b;
+	int group_a, group_b;
+
+	do_modeset(d, outs, 2, NULL, fbs);
+	require_bwa(d, outs[0]);
+	require_bwa(d, outs[1]);
+
+	group_a = get_tunnel_group_id(d->drm_fd, outs[0]);
+	group_b = get_tunnel_group_id(d->drm_fd, outs[1]);
+	igt_require_f(group_a >= 0 && group_b >= 0,
+		      "Invalid tunnel group IDs: %d vs %d\n",
+		      group_a, group_b);
+	igt_require_f(group_a == group_b,
+		      "Need two tunnels in same group, got %d vs %d\n",
+		      group_a, group_b);
+
+	alloc_b_before = get_allocated_bw(d->drm_fd, outs[1]);
+	gran_b = get_granularity(d->drm_fd, outs[1]);
+
+	set_bwa_enabled(d->drm_fd, outs[0], false);
+
+	igt_assert_f(!get_bwa_enabled(d->drm_fd, outs[0]),
+		     "Tunnel A BWA still enabled\n");
+	igt_assert_f(get_bwa_enabled(d->drm_fd, outs[1]),
+		     "Tunnel B BWA was also disabled\n");
+	igt_assert_f(get_allocated_bw(d->drm_fd, outs[0]) == -1,
+		     "Tunnel A Allocated BW != -1 after BWA disable\n");
+
+	alloc_b_after = get_allocated_bw(d->drm_fd, outs[1]);
+	delta_b = abs(alloc_b_after - alloc_b_before);
+	igt_info("[dual-bwa-disable] alloc_b: before=%d after=%d  gran_b=%d  "
+		 "delta=%d\n",
+		 alloc_b_before, alloc_b_after, gran_b, delta_b);
+	igt_assert_f(alloc_b_after > 0,
+		     "Tunnel B alloc invalid after disabling A's BWA: %d\n",
+		     alloc_b_after);
+	igt_assert_f(delta_b <= gran_b,
+		     "Tunnel B alloc drifted beyond granularity: "
+		     "before=%d after=%d gran=%d\n",
+		     alloc_b_before, alloc_b_after, gran_b);
+
+	/*
+	 * Re-enable tunnel A BWA on a quiesced display. BWA negotiation with
+	 * the USB4 host runs as part of the display-enable transition, so we
+	 * first bring the displays down, flip the bw_alloc_enable knob, and
+	 * bring them back up. The fresh modeset is what verifies that
+	 * allocation can be restored after re-enabling the knob.
+	 */
+	cleanup_outputs(d, outs, 2, fbs);
+	set_bwa_enabled(d->drm_fd, outs[0], true);
+	igt_assert_f(get_bwa_enabled(d->drm_fd, outs[0]),
+		     "Tunnel A BWA not re-enabled\n");
+	do_modeset(d, outs, 2, NULL, fbs);
+	igt_assert_f(get_allocated_bw(d->drm_fd, outs[0]) > 0,
+		     "Tunnel A alloc not restored after BWA re-enable\n");
+
+	cleanup_outputs(d, outs, 2, fbs);
+}
+
+/*
+ * test_mst_basic - Two MST streams share one tunnel object so both MST
+ * connectors expose the same per-tunnel debugfs allocation. Verify that
+ * (a) the two connectors report the same allocated BW, (b) the value is
+ * positive. We deliberately do not compare the allocation to a 18bpp
+ * pixel-rate estimate of either stream because the kernel may use DSC
+ * to compress streams below 18bpp aggregate, making such estimates
+ * fragile.
+ */
+static void test_mst_basic(data_t *d)
+{
+	struct igt_fb fbs[2] = {};
+	int alloc0, alloc1;
+
+	do_modeset(d, d->mst_outputs, 2, NULL, fbs);
+
+	alloc0 = get_allocated_bw(d->drm_fd, d->mst_outputs[0]);
+	alloc1 = get_allocated_bw(d->drm_fd, d->mst_outputs[1]);
+	igt_info("[mst-basic] alloc0=%d kB/s  alloc1=%d kB/s\n", alloc0, alloc1);
+	igt_assert_f(alloc0 > 0,
+		     "Allocated BW %d <= 0 with 2 MST streams\n", alloc0);
+	igt_assert_f(alloc0 == alloc1,
+		     "MST connectors under same tunnel report different "
+		     "allocations: %d vs %d\n", alloc0, alloc1);
+
+	cleanup_outputs(d, d->mst_outputs, 2, fbs);
+}
+
+/*
+ * test_mst_modeset_bw - Raise stream 0's mode from lowest- to preferred-
+ * clock while stream 1 keeps whatever do_modeset() picks by default.
+ * Aggregate allocation should not decrease. Strict-greater is avoided
+ * because BWA granularity rounding can make distinct modes share an
+ * allocation bucket.
+ */
+static void test_mst_modeset_bw(data_t *d)
+{
+	struct igt_fb fbs_low0[2] = {}, fbs_high0[2] = {};
+	drmModeModeInfo low0_copy, high0_copy;
+	drmModeModeInfo *modes[2];
+	int bw_low0_default1, bw_high0_default1;
+
+	igt_require_f(d->mst_outputs[0]->config.connector->count_modes >= 2,
+		      "MST output 0 needs at least 2 modes\n");
+	igt_require_f(igt_connector_find_lowest_clock_mode(d->mst_outputs[0], &low0_copy) &&
+		      igt_connector_find_preferred_mode(d->mst_outputs[0], &high0_copy),
+		      "Could not locate low / preferred modes on MST output 0\n");
+	igt_require_f(high0_copy.clock > low0_copy.clock,
+		      "Preferred mode clock %d not greater than lowest clock %d "
+		      "on MST output 0\n", high0_copy.clock, low0_copy.clock);
+
+	modes[0] = &low0_copy;
+	modes[1] = NULL;
+	do_modeset(d, d->mst_outputs, 2, modes, fbs_low0);
+	bw_low0_default1 = get_allocated_bw(d->drm_fd, d->mst_outputs[0]);
+
+	cleanup_outputs(d, d->mst_outputs, 2, fbs_low0);
+	modes[0] = &high0_copy;
+	modes[1] = NULL;
+	do_modeset(d, d->mst_outputs, 2, modes, fbs_high0);
+	bw_high0_default1 = get_allocated_bw(d->drm_fd, d->mst_outputs[0]);
+
+	igt_info("[mst-modeset-bw] bw_low0_default1=%d  bw_high0_default1=%d  "
+		 "low0_clk=%d  high0_clk=%d\n",
+		 bw_low0_default1, bw_high0_default1,
+		 low0_copy.clock, high0_copy.clock);
+	igt_assert_f(bw_high0_default1 >= bw_low0_default1,
+		     "BW decreased when raising stream 0's mode: low=%d high=%d\n",
+		     bw_low0_default1, bw_high0_default1);
+
+	cleanup_outputs(d, d->mst_outputs, 2, fbs_high0);
+}
+
+/*
+ * test_mst_partial_disable - Disabling one MST stream leaves the tunnel
+ * alive on the remaining stream. Allocation must stay positive and not
+ * grow. Strict-less-than is avoided because granularity rounding can
+ * make the residual allocation share a bucket with the two-stream value.
+ */
+static void test_mst_partial_disable(data_t *d)
+{
+	struct igt_fb fbs[2] = {};
+	int bw_both, bw_one;
+
+	do_modeset(d, d->mst_outputs, 2, NULL, fbs);
+	bw_both = get_allocated_bw(d->drm_fd, d->mst_outputs[0]);
+	igt_assert_f(bw_both > 0, "Expected positive BW with 2 streams\n");
+
+	igt_output_set_crtc(d->mst_outputs[1], NULL);
+	igt_display_commit2(&d->display, COMMIT_ATOMIC);
+	igt_remove_fb(d->drm_fd, &fbs[1]);
+
+	igt_assert_f(has_tunnel(d->drm_fd, d->mst_outputs[0]),
+		     "Tunnel disappeared after partial MST disable\n");
+
+	bw_one = get_allocated_bw(d->drm_fd, d->mst_outputs[0]);
+	igt_info("[mst-partial-disable] bw_both=%d  bw_one=%d\n",
+		 bw_both, bw_one);
+	igt_assert_f(bw_one > 0,
+		     "Allocated BW %d <= 0 after partial MST disable\n", bw_one);
+	igt_assert_f(bw_one <= bw_both,
+		     "BW after partial disable increased: one=%d both=%d\n",
+		     bw_one, bw_both);
+
+	cleanup_outputs(d, d->mst_outputs, 1, fbs);
+}
+
+/*
+ * mst_outputs_remapped_with_bw - True iff both cached MST output pointers
+ * are non-NULL, both expose a tunnel via debugfs, and at least one of them
+ * has a positive Allocated BW. The "at least one" rule reflects the known
+ * resume limitation: intel_dp_tunnel_resume() only re-allocates BW for the
+ * single crtc_state it's passed (see "TODO: Add support for MST" in
+ * drivers/gpu/drm/i915/display/intel_dp_tunnel.c::intel_dp_tunnel_resume()).
+ */
+static bool mst_outputs_remapped_with_bw(data_t *d)
+{
+	if (!d->mst_outputs[0] || !d->mst_outputs[1])
+		return false;
+
+	if (!has_tunnel(d->drm_fd, d->mst_outputs[0]) ||
+	    !has_tunnel(d->drm_fd, d->mst_outputs[1]))
+		return false;
+
+	return get_allocated_bw(d->drm_fd, d->mst_outputs[0]) > 0 ||
+	       get_allocated_bw(d->drm_fd, d->mst_outputs[1]) > 0;
+}
+
+static void test_mst_suspend(data_t *d)
+{
+	struct igt_fb fbs[2] = {};
+	int bw_before, bw_after, bw_after1;
+	/*
+	 * Stable pre-suspend identity (PATH + EDID serial) for both streams.
+	 * After resume the kernel re-enumerates connectors with new DRM IDs;
+	 * PATH and EDID serial persist and let us map old IGT pointers to
+	 * new connectors without a fresh modeset (kernel retains the BW
+	 * allocation). PATH is preferred (captures MST topology); EDID
+	 * serial is a fallback.
+	 */
+	char pre_path[2][128] = {};
+	char pre_serial[2][64] = {};
+	char pre_name[2][32] = {};
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		uint32_t cid = d->mst_outputs[i]->config.connector->connector_id;
+		char tmp[32];
+
+		igt_connector_get_info(d->drm_fd, cid,
+				       tmp, sizeof(tmp),
+				       pre_serial[i], sizeof(pre_serial[i]),
+				       pre_path[i], sizeof(pre_path[i]));
+		snprintf(pre_name[i], sizeof(pre_name[i]), "%s",
+			 d->mst_outputs[i]->name);
+		igt_info("[mst-suspend] pre[%d]: %s id=%u path='%s' serial='%s'\n",
+			 i, pre_name[i], cid, pre_path[i], pre_serial[i]);
+	}
+
+	do_modeset(d, d->mst_outputs, 2, NULL, fbs);
+	bw_before = get_allocated_bw(d->drm_fd, d->mst_outputs[0]);
+	igt_assert_f(bw_before > 0, "Expected positive BW before suspend\n");
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	/*
+	 * Fast path: poll up to 3s for cached MST pointers to regain a
+	 * working tunnel - that means the kernel preserved their DRM IDs.
+	 */
+	igt_until_timeout(3) {
+		if (mst_outputs_remapped_with_bw(d))
+			break;
+		usleep(100 * 1000);
+	}
+
+	if (mst_outputs_remapped_with_bw(d)) {
+		igt_info("[mst-suspend] cached pointers survived resume\n");
+	} else {
+		bool mst_found = false;
+
+		/*
+		 * Refresh IGT's connector/output cache. The kernel may have
+		 * re-created MST connectors with new DRM IDs while the
+		 * restored display state is still active; we keep the FB
+		 * handles and only rebuild the IGT display object before
+		 * remapping outputs. Drop the stale igt_output_t * pointers
+		 * first so the cleanup-by-name exit handler doesn't race
+		 * post-fini access.
+		 */
+		d->mst_outputs[0] = NULL;
+		d->mst_outputs[1] = NULL;
+		igt_display_fini(&d->display);
+		igt_display_require(&d->display, d->drm_fd);
+
+		igt_until_timeout(60) {
+			uint32_t new_ids[2] = {0, 0};
+			bool mapped[2] = {false, false};
+
+			igt_connector_reprobe_all(d->drm_fd);
+
+			for (i = 0; i < 2; i++) {
+				if (pre_path[i][0] &&
+				    igt_connector_find_by_path(d->drm_fd,
+							       pre_path[i],
+							       &new_ids[i])) {
+					mapped[i] = true;
+					continue;
+				}
+				if (pre_serial[i][0] &&
+				    igt_connector_find_by_serial(d->drm_fd,
+								 pre_serial[i],
+								 &new_ids[i])) {
+					mapped[i] = true;
+				}
+			}
+
+			if (!mapped[0] || !mapped[1]) {
+				usleep(500 * 1000);
+				continue;
+			}
+
+			/*
+			 * Reject mapping both pre-suspend identities to the
+			 * same connector_id - happens if a sink reports an
+			 * empty / duplicated EDID serial and PATH lookup
+			 * fell back to that.
+			 */
+			if (new_ids[0] == new_ids[1]) {
+				igt_info("[mst-suspend] both streams mapped to "
+					 "same connector id=%u, retrying\n",
+					 new_ids[0]);
+				usleep(500 * 1000);
+				continue;
+			}
+
+			for (i = 0; i < 2; i++)
+				d->mst_outputs[i] =
+					igt_connector_find_output_by_id(&d->display,
+									new_ids[i]);
+
+			if (mst_outputs_remapped_with_bw(d)) {
+				igt_info("[mst-suspend] remapped: "
+					 "pre=%s->%s id=%u  pre=%s->%s id=%u\n",
+					 pre_name[0],
+					 d->mst_outputs[0]->name, new_ids[0],
+					 pre_name[1],
+					 d->mst_outputs[1]->name, new_ids[1]);
+				mst_found = true;
+				break;
+			}
+			usleep(500 * 1000);
+		}
+		if (!mst_found) {
+			igt_remove_fb(d->drm_fd, &fbs[0]);
+			igt_remove_fb(d->drm_fd, &fbs[1]);
+			igt_skip("MST outputs not re-mapped 60s after resume "
+				 "(pre=%s,%s)\n", pre_name[0], pre_name[1]);
+		}
+	}
+
+	/*
+	 * Known limitation: intel_dp_tunnel_resume() takes a single
+	 * crtc_state and re-allocates BW only for that pipe (see
+	 * drivers/gpu/drm/i915/display/intel_dp_tunnel.c, the
+	 * "TODO: Add support for MST" hunk in intel_dp_tunnel_resume()).
+	 * MST sinks therefore see only one stream's BW re-allocated post-
+	 * resume; pick whichever connector has the positive value.
+	 */
+	bw_after = get_allocated_bw(d->drm_fd, d->mst_outputs[0]);
+	bw_after1 = get_allocated_bw(d->drm_fd, d->mst_outputs[1]);
+	if (bw_after <= 0)
+		bw_after = bw_after1;
+	igt_info("[mst-suspend] BW before=%d  after[0]=%d after[1]=%d "
+		 "(partial resume expected)\n",
+		 bw_before, get_allocated_bw(d->drm_fd, d->mst_outputs[0]),
+		 bw_after1);
+	igt_assert_f(bw_after > 0,
+		     "MST allocated BW <= 0 on both connectors after resume\n");
+
+	cleanup_outputs(d, d->mst_outputs, 2, fbs);
+}
+
+/*
+ * mst_clear_limits - Clear bw_limit on all MST children up to and
+ * including index @upto. Safe to call from skip paths.
+ */
+static void mst_clear_limits(data_t *d, int upto)
+{
+	int k;
+
+	for (k = 0; k <= upto; k++)
+		set_bw_limit(d->drm_fd, d->mst_outputs[k], 0);
+}
+
+static void test_mst_limit_fallback(data_t *d)
+{
+	struct igt_fb fbs[2] = {}, fbs2[2] = {};
+	drmModeModeInfo best_modes[2], pref_modes[2];
+	drmModeModeInfo *modes[2];
+	int bw_both, limit, bw_after;
+	igt_output_t *parent = d->mst_outputs[0];
+	int i, min_pref_18bpp;
+	bool active_modeset = false;
+	const char *skip_reason = NULL;
+	char skip_msg[160] = {};
+
+	do_modeset(d, d->mst_outputs, 2, NULL, fbs);
+	active_modeset = true;
+	bw_both = get_allocated_bw(d->drm_fd, parent);
+	igt_assert_f(bw_both > 0, "Expected positive BW with 2 MST streams\n");
+
+	/*
+	 * bw_limit filters modes using 18bpp minimum per
+	 * intel_dp_mode_valid_format(). Compute the 18bpp BW needed for
+	 * each stream's preferred mode, then set a limit one kB/s below
+	 * the smaller of the two so BOTH preferred modes are filtered
+	 * out on each connector but as many fallback modes as possible
+	 * remain available.
+	 */
+	min_pref_18bpp = INT_MAX;
+	for (i = 0; i < 2; i++) {
+		if (!igt_connector_find_preferred_mode(d->mst_outputs[i],
+						       &pref_modes[i])) {
+			snprintf(skip_msg, sizeof(skip_msg),
+				 "No preferred mode on MST output %d\n", i);
+			skip_reason = skip_msg;
+			goto out;
+		}
+		min_pref_18bpp = min(min_pref_18bpp,
+				     (int)(pref_modes[i].clock * 18 / 8));
+	}
+	limit = min_pref_18bpp - 1;
+	if (limit <= 0) {
+		skip_reason = "Cannot derive meaningful limit\n";
+		goto out;
+	}
+
+	/*
+	 * The MST connectors share a single tunnel object, so bw_limit is
+	 * one knob: setting it via the parent connector is sufficient for
+	 * every child's mode list to be re-filtered. We still probe each
+	 * child connector independently because each has its own native
+	 * mode set.
+	 */
+	set_bw_limit(d->drm_fd, parent, limit);
+	for (i = 0; i < 2; i++) {
+		uint32_t cid;
+		drmModeConnector *conn;
+
+		cid = d->mst_outputs[i]->config.connector->connector_id;
+		conn = drmModeGetConnector(d->drm_fd, cid);
+		if (!conn || conn->count_modes == 0) {
+			if (conn)
+				drmModeFreeConnector(conn);
+			snprintf(skip_msg, sizeof(skip_msg),
+				 "No modes left on MST output %d at limit=%d\n",
+				 i, limit);
+			skip_reason = skip_msg;
+			goto out;
+		}
+		if (!igt_connector_find_highest_clock_mode_in(conn,
+							      &best_modes[i])) {
+			drmModeFreeConnector(conn);
+			snprintf(skip_msg, sizeof(skip_msg),
+				 "No usable fallback on MST output %d at limit=%d\n",
+				 i, limit);
+			skip_reason = skip_msg;
+			goto out;
+		}
+		igt_info("[mst-limit-fallback] out%d: pref=%dx%d@%d"
+			 "  best_within_limit=%dx%d@%d  limit=%d kB/s\n",
+			 i, pref_modes[i].hdisplay, pref_modes[i].vdisplay,
+			 pref_modes[i].vrefresh,
+			 best_modes[i].hdisplay, best_modes[i].vdisplay,
+			 best_modes[i].vrefresh, limit);
+		if (best_modes[i].clock >= pref_modes[i].clock) {
+			drmModeFreeConnector(conn);
+			snprintf(skip_msg, sizeof(skip_msg),
+				 "Preferred mode not filtered on out%d "
+				 "(limit %d too generous)\n", i, limit);
+			skip_reason = skip_msg;
+			goto out;
+		}
+		modes[i] = &best_modes[i];
+		drmModeFreeConnector(conn);
+	}
+
+	cleanup_outputs(d, d->mst_outputs, 2, fbs);
+	active_modeset = false;
+	do_modeset(d, d->mst_outputs, 2, modes, fbs2);
+	active_modeset = true;
+	bw_after = get_allocated_bw(d->drm_fd, parent);
+
+	/*
+	 * Primary signal that the cap took effect: each stream picked a
+	 * strictly lower-clock mode (already asserted above). bw_after
+	 * is logged as supporting evidence; granularity rounding can
+	 * legitimately leave the aggregate in the same bucket, so a
+	 * strict-decrease assert here would be flaky.
+	 */
+	igt_info("[mst-limit-fallback] bw_both=%d kB/s  limit=%d kB/s"
+		 "  bw_after=%d kB/s  pass=(bw_after > 0 && <= bw_both): %d, %d\n",
+		 bw_both, limit, bw_after, bw_after, bw_both);
+	igt_assert_f(bw_after > 0,
+		     "MST allocated BW %d <= 0 after limited modeset\n",
+		     bw_after);
+	igt_assert_f(bw_after <= bw_both,
+		     "MST BW after limit (%d) > pre-limit (%d)\n",
+		     bw_after, bw_both);
+
+	mst_clear_limits(d, 1);
+	cleanup_outputs(d, d->mst_outputs, 2, fbs2);
+	return;
+
+out:
+	mst_clear_limits(d, 1);
+	if (active_modeset)
+		cleanup_outputs(d, d->mst_outputs, 2, fbs);
+	igt_skip("%s", skip_reason);
+}
+
+static void test_mst_bwa_re_enable(data_t *d)
+{
+	struct igt_fb fbs[2] = {};
+	igt_output_t *parent = d->mst_outputs[0];
+	int bw_both, granularity, post, disabled_bw;
+
+	do_modeset(d, d->mst_outputs, 2, NULL, fbs);
+	require_bwa(d, parent);
+
+	bw_both = get_allocated_bw(d->drm_fd, parent);
+	granularity = get_granularity(d->drm_fd, parent);
+	igt_assert_f(bw_both > 0, "Expected positive BW with 2 MST streams\n");
+	igt_assert_f(granularity > 0,
+		     "Invalid BW granularity: %d\n", granularity);
+
+	set_bwa_enabled(d->drm_fd, parent, false);
+	disabled_bw = get_allocated_bw(d->drm_fd, parent);
+	igt_assert_f(!get_bwa_enabled(d->drm_fd, parent),
+		     "BWA still enabled after disabling\n");
+	igt_assert_f(disabled_bw == -1,
+		     "Allocated BW should be -1 after BWA disable, got %d\n",
+		     disabled_bw);
+
+	/*
+	 * Re-enable BWA and trigger a fresh modeset for all MST streams.
+	 * BWA is re-allocated on the display-enable (off->on) path; toggling
+	 * bw_alloc_enable with the display active does not re-negotiate BWA.
+	 */
+	set_bwa_enabled(d->drm_fd, parent, true);
+	igt_assert_f(get_bwa_enabled(d->drm_fd, parent),
+		     "BWA not re-enabled\n");
+	cleanup_outputs(d, d->mst_outputs, 2, fbs);
+	do_modeset(d, d->mst_outputs, 2, NULL, fbs);
+
+	post = get_allocated_bw(d->drm_fd, parent);
+	igt_info("[mst-bwa-re-enable] bw_both=%d kB/s  post=%d kB/s"
+		 "  pass=(post == bw_both): %d == %d\n",
+		 bw_both, post, post, bw_both);
+	igt_assert_f(post > 0,
+		     "Allocated BW %d <= 0 after MST BWA re-enable\n", post);
+	igt_assert_f(post == bw_both,
+		     "Post-re-enable BW %d != bw_both %d\n", post, bw_both);
+
+	cleanup_outputs(d, d->mst_outputs, 2, fbs);
+}
+
+IGT_TEST_DESCRIPTION("Functional tests for i915 DP tunneling over "
+		     "USB4/Thunderbolt using debugfs hooks");
+
+int igt_main()
+{
+	data_t data = {};
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+
+		data.output = find_tunneled_output(&data);
+		if (!data.output) {
+			/*
+			 * The TBT tunnel debugfs may be transiently
+			 * unavailable right after a previous test's crash or
+			 * a suspend/resume cycle. Poll for up to 5s instead
+			 * of an unconditional fixed sleep so the common case
+			 * (tunnel already present) costs ~0.
+			 */
+			igt_until_timeout(5) {
+				data.output = find_tunneled_output(&data);
+				if (data.output)
+					break;
+				usleep(200 * 1000);
+			}
+		}
+		igt_require_f(data.output,
+			      "No connected DP output with tunnel found\n");
+		igt_info("Using %s as primary tunneled output\n",
+			 data.output->name);
+		register_for_cleanup(&data, data.output);
+
+		/*
+		 * Register a process-exit handler so that bw_limit and
+		 * bwa_enable are always restored even if the test exits via
+		 * SIGABRT, SIGTERM, or any other unhandled signal.
+		 */
+		g_data = &data;
+		igt_install_exit_handler(exit_handler);
+	}
+
+	igt_describe("Verify a tunneled output exists, modesets the preferred mode, "
+		     "allocates positive BW and reports a DPRX max rate >= link max rate");
+	igt_subtest("basic") {
+		test_basic(&data, require_sst(&data));
+	}
+
+	igt_describe("Verify allocated BW updates correctly when switching modes "
+		     "and returns to the same value on a low->high->low round-trip");
+	igt_subtest("modeset-bw") {
+		test_modeset_bw(&data, require_sst(&data));
+	}
+
+	igt_describe("Verify disabling a tunneled output releases its allocated BW");
+	igt_subtest("disable-bw") {
+		test_disable_bw(&data, require_sst(&data));
+	}
+
+	igt_describe("Verify tunnel state is fully restored after mem suspend/resume");
+	igt_subtest("suspend") {
+		test_suspend(&data, require_sst(&data));
+	}
+
+	igt_describe("Verify bw_limit below preferred mode's BW removes it from connector mode list "
+		     "and a lower-BW fallback can be modeseted");
+	igt_subtest("limit-fallback") {
+		test_limit_fallback(&data, require_sst(&data));
+	}
+
+	igt_describe("Verify preferred mode accepted at its exact BW threshold, "
+		     "rejected one kB/s below it, and restored after clearing the limit");
+	igt_subtest("limit-boundary") {
+		test_limit_boundary(&data, require_sst(&data));
+	}
+
+	igt_describe("Verify bw_limit is reset to 0 across suspend/resume because "
+		     "the tunnel object is destroyed and re-created");
+	igt_subtest("limit-suspend") {
+		test_limit_suspend(&data, require_sst(&data));
+	}
+
+	igt_describe("Disable BWA: tunnel stays alive with allocated BW = -1 and "
+		     "DPCD-derived link rate; re-enable BWA + fresh modeset restores "
+		     "the original allocation and link rate");
+	igt_subtest("bwa-re-enable") {
+		test_bwa_re_enable(&data, require_sst(&data));
+	}
+
+	igt_describe("Verify 10 rapid BWA disable/enable cycles do not corrupt the display");
+	igt_subtest("bwa-cycle") {
+		test_bwa_cycle(&data, require_sst(&data));
+	}
+
+	igt_describe("Verify two SST tunnels in the same USB4 group report the "
+		     "same group_free BW (estimated - allocated)");
+	igt_subtest("dual-bw-sum") {
+		require_dual_sst_same_group(&data);
+		test_dual_bw_sum(&data);
+	}
+
+	igt_describe("Verify bw_limit is per-tunnel-object, not per-group: "
+		     "with two SST tunnels in one USB4 group, a cap on tunnel A "
+		     "clips A's mode list and not B's, and B's previously-active "
+		     "mode remains in B's filtered list");
+	igt_subtest("dual-limit-isolation") {
+		require_dual_sst_same_group(&data);
+		test_dual_limit_isolation(&data);
+	}
+
+	igt_describe("Verify BWA disable on one tunnel does not affect the other "
+		     "tunnel sharing the same USB4 group BW pool");
+	igt_subtest("dual-bwa-disable") {
+		require_dual_sst_same_group(&data);
+		test_dual_bwa_disable(&data);
+	}
+
+	igt_describe("Verify two MST connectors sharing one tunnel object "
+		     "report the same per-tunnel allocated BW");
+	igt_subtest("mst-basic") {
+		require_mst_pair(&data);
+		test_mst_basic(&data);
+	}
+
+	igt_describe("Verify aggregate allocated BW does not decrease when one "
+		     "MST stream's mode is raised");
+	igt_subtest("mst-modeset-bw") {
+		require_mst_pair(&data);
+		test_mst_modeset_bw(&data);
+	}
+
+	igt_describe("Verify disabling one MST stream leaves the tunnel alive "
+		     "with positive residual BW not larger than the two-stream "
+		     "allocation");
+	igt_subtest("mst-partial-disable") {
+		require_mst_pair(&data);
+		test_mst_partial_disable(&data);
+	}
+
+	igt_describe("Verify MST tunnel survives suspend/resume; partial "
+		     "per-pipe BW re-allocation is accepted (kernel TODO)");
+	igt_subtest("mst-suspend") {
+		require_mst_pair(&data);
+		test_mst_suspend(&data);
+	}
+
+	igt_describe("Verify bw_limit on the shared MST tunnel forces both "
+		     "streams to fall back to lower-clock modes");
+	igt_subtest("mst-limit-fallback") {
+		require_mst_pair(&data);
+		test_mst_limit_fallback(&data);
+	}
+
+	igt_describe("Verify BWA re-enable + fresh modeset on an MST tunnel "
+		     "restores allocation for all active streams to the "
+		     "pre-disable value");
+	igt_subtest("mst-bwa-re-enable") {
+		require_mst_pair(&data);
+		test_mst_bwa_re_enable(&data);
+	}
+
+	igt_fixture() {
+		/*
+		 * Reset bw_limit=0 and bwa_enable=1 on all tracked tunneled
+		 * outputs before tearing down the display.  try_reset_output()
+		 * is non-asserting and guards with has_tunnel(), so it is safe
+		 * even if a connector was re-enumerated after suspend/resume.
+		 * This covers primary, dual-SST (output2), and all MST outputs.
+		 */
+		restore_all_debugfs(&data);
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+		data.drm_fd = -1;
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 60cea3aa8..1f7a1b42b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -279,6 +279,10 @@ intel_kms_progs = [
 	'kms_sharpness_filter',
 ]
 
+if libdisplay_info.found()
+	intel_kms_progs += 'kms_tbt'
+endif
+
 intel_xe_progs = [
 	'xe_wedged',
 	'xe_ccs',
@@ -407,6 +411,7 @@ extra_sources = {
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
+	'kms_tbt': [ join_paths ('intel', 'kms_mst_helper.c') ],
 }
 
 # Extra dependencies used on core and Intel drivers
-- 
2.25.1

