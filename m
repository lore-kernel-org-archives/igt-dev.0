Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DDFC9830E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 12:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B5010F51F;
	Thu, 24 Sep 2026 12:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bMX+uFkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B03010F51F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790254173; x=1821790173;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=01//m2aC+EKdXRJU1RSmpTdoK5IPDHxzaRux9hHsVHk=;
 b=bMX+uFkmNPUI2IVNds/Uehgq79H+n+yf2GoHvafkG7mSYrs78XEtb6bH
 tkd13c+oA7MLIDwZpDifrW+NzhDiupEyxd5+GFxX7u5R6+kCbTjCXBTOe
 83OE8ceahCfbNbbCAJNMtMcy3f1K0koa8bxeE45BB5IfdPLufUU6Q5fn+
 ++B+3ktxCtTRJHJHwdkPewX5i66X8ZyviSuNIlTkHMLhNk4H4XSgj50uq
 ajdRfI9zoo7/auacLr7YftOs0O6Mbn1mYFUadVN1ihoKzdo8ZsDZcySFf
 Y1gZ2WyOFACBAMJUdVhLtx02ize9T3/tSlXi/ZGvkmWLCT2JuywDBX2rk A==;
X-CSE-ConnectionGUID: qkthI+M1QY6WFN+b/pxNuQ==
X-CSE-MsgGUID: 2jwuOIIzTOKfKilMSjuq5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="107408776"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="107408776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 05:49:33 -0700
X-CSE-ConnectionGUID: WR/22HXuSBC9vYsa56haoA==
X-CSE-MsgGUID: CymYuQPDQiW28vt04RQheA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="300286186"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 05:49:31 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_alpm: add ALPM Panel Replay and LOBF
 subtests
Date: Thu, 24 Sep 2026 18:19:15 +0530
Message-ID: <20260924124920.2710640-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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

Add a new kms_alpm test covering ALPM (Advanced Link Power Management)
on eDP and DP 2.1 outputs, with two subtests:

- alpm-panel-replay: verifies ALPM is reached via Panel Replay after a
  modeset, using aux-less ALPM on DP and either aux-wake or aux-less on
  eDP, with LOBF staying off while Panel Replay is active.

- alpm-lobf: verifies LOBF can be enabled on an eDP output once PSR/
  PSR2/Panel Replay are disabled, and that Panel Replay stays off while
  LOBF is active. LOBF is eDP only, so DP outputs are skipped during
  enumeration for this subtest.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_alpm.c | 721 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   1 +
 2 files changed, 722 insertions(+)
 create mode 100644 tests/intel/kms_alpm.c

diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c
new file mode 100644
index 000000000..71283b168
--- /dev/null
+++ b/tests/intel/kms_alpm.c
@@ -0,0 +1,721 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: kms alpm
+ * Category: Display
+ * Description: Test ALPM (Advanced Link Power Management) on eDP and DP2.1
+ *              outputs
+ * Driver requirement: i915, xe
+ * Mega feature: Panel Replay
+ */
+
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_edid.h"
+#include "igt_psr.h"
+#include "igt_sysfs.h"
+#include "intel_chipset.h"
+
+/**
+ * SUBTEST: alpm-panel-replay
+ * Description: Verify ALPM is reached via Panel Replay after a modeset.
+ *              DP 2.1: Panel Replay must use aux-less ALPM.
+ *              eDP: Panel Replay may use either aux-wake or aux-less ALPM.
+ *              On both connector types, LOBF must stay off while Panel
+ *              Replay is active.
+ *
+ * SUBTEST: alpm-lobf
+ * Description: Verify LOBF can be enabled on an eDP output once PSR/PSR2/
+ *              Panel Replay are disabled, and that Panel Replay stays off
+ *              while LOBF is active.
+ */
+
+#define ALPM_INFO_FILE		"i915_edp_lobf_info"
+#define ALPM_DEBUG_FILE		"i915_edp_lobf_debug"
+#define ALPM_INFO_MAX_LEN	512
+#define ALPM_TIMEOUT_MS		100
+
+/*
+ * LOBF needs longer to settle than PR/aux-less ALPM: after Panel Replay is
+ * disabled and the modeset happens, the link visibly bounces between
+ * aux-wake-only and aux-less-only for a while before the LOBF bit actually
+ * latches, unlike PR which comes up inside ALPM_TIMEOUT_MS. Observed taking
+ * several seconds on a NovaLake eDP panel.
+ */
+#define ALPM_LOBF_TIMEOUT_MS	5000
+
+/*
+ * Mirrors I915_PSR_DEBUG_DISABLE and I915_PSR_DEBUG_PANEL_REPLAY_DISABLE
+ * from intel_display_types.h. intel_alpm_lobf_compute_config_late() kills
+ * has_lobf whenever crtc_state->has_psr is true, and has_psr is set by
+ * intel_psr_compute_config() (intel_psr.c) if *either* Panel Replay or
+ * classic PSR/PSR2 succeeds - so LOBF needs both disabled, not just PR:
+ * DISABLE alone (mode 0x1) only gates classic PSR/PSR2, leaving
+ * panel_replay_global_enabled() untouched (PR keeps winning); PANEL_
+ * REPLAY_DISABLE alone (0x40) only blocks PR, and PSR2 then takes over and
+ * keeps has_psr true instead. Both bits have to be set together.
+ */
+#define PSR_DEBUG_FILE			"i915_edp_psr_debug"
+#define PSR_DEBUG_DISABLE		0x1
+#define PSR_DEBUG_PANEL_REPLAY_DISABLE	0x40
+
+/*
+ * The kernel gates creation of the ALPM debugfs files on
+ * intel_alpm_source_supported(): external DisplayPort needs display ver 35,
+ * eDP needs display ver 20.
+ */
+#define ALPM_DP_MIN_DISPLAY_VER		35
+#define ALPM_EDP_MIN_DISPLAY_VER	20
+
+/**
+ * struct alpm_status - parsed contents of the ALPM info debugfs
+ * @lobf: ALPM_CTL_LOBF_ENABLE is set
+ * @aux_less: ALPM_CTL_ALPM_AUX_LESS_ENABLE is set
+ * @aux_wake: the aux-wake line as printed by the kernel
+ *
+ * The kernel dumps three lines derived from ALPM_CTL. Note that it never
+ * prints ALPM_CTL_ALPM_ENABLE directly, which constrains what can be
+ * asserted; see alpm_is_enabled().
+ *
+ * @aux_wake's meaning is connector-type dependent. Per the HAS, DP only ever
+ * uses AUX-Less ALPM flows - AUX-Wake is not supported by this feature on DP
+ * at all - so on a DP link @aux_wake is just the observed complement of
+ * @aux_less and carries no independent information (confirmed on a NovaLake
+ * DP link: "LOBF disabled, Aux-wake disabled, Aux-less enabled"). eDP is
+ * different: classic PSR2 genuinely runs over AUX-Wake ALPM (distinct from
+ * Panel Replay's AUX-Less), so there @aux_wake is real, independent evidence
+ * that ALPM is up. alpm_is_enabled() branches on connector type for exactly
+ * this reason - never read @aux_wake on its own, go through it (or
+ * alpm_mode_str(), which resolves the mode only once ALPM is known to be up).
+ */
+struct alpm_status {
+	bool lobf;
+	bool aux_less;
+	bool aux_wake;
+};
+
+typedef struct {
+	int drm_fd;
+	int debugfs_fd;
+	uint32_t devid;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+	struct igt_fb fb;
+	bool psr_needs_restore;
+} data_t;
+
+static bool output_is_dp(igt_output_t *output);
+
+/**
+ * alpm_is_enabled - is ALPM programmed, as far as debugfs can tell
+ * @output: the connector @status was read from
+ * @status: parsed ALPM status
+ *
+ * intel_alpm_configure() always sets ALPM_CTL_ALPM_ENABLE together with one
+ * of the aux-less/aux-wake/LOBF bits, and writes ALPM_CTL as zero when
+ * disabling, so any of them being set is positive evidence.
+ *
+ * Per the HAS, DP only ever uses AUX-Less ALPM flows - AUX-Wake is not
+ * supported by this feature on DP at all (matches DPCD 00116h[2]: "0 =
+ * AUX-wake ALPM (not supported by DP). 1 = AUX-less ALPM (shall be set for
+ * DP)"), so @status->aux_wake carries no information there. eDP is
+ * different: classic PSR2 genuinely runs over AUX-Wake ALPM (the kernel's
+ * intel_psr2_config_valid() calls alpm_config_valid() with aux_less=false),
+ * distinct from Panel Replay's AUX-Less, so @status->aux_wake is real
+ * evidence there and has to be counted too.
+ *
+ * On an external DP link below display ver 35 the LOBF bit is never set at
+ * all (see the ALPM_DP_MIN_DISPLAY_VER check in require_alpm_capable()), so
+ * there the aux-less bit is the only available evidence.
+ */
+static bool alpm_is_enabled(igt_output_t *output, const struct alpm_status *status)
+{
+	if (output_is_dp(output))
+		return status->aux_less || status->lobf;
+
+	return status->aux_less || status->aux_wake || status->lobf;
+}
+
+/**
+ * alpm_mode_str - which wake mechanism ALPM is using
+ * @output: the connector @status was read from
+ * @status: parsed ALPM status
+ *
+ * The two mechanisms are mutually exclusive, so the aux-less bit alone
+ * decides between them. Resolved only once ALPM is known to be up (via
+ * alpm_is_enabled()), which is what keeps a bare aux-wake line from being
+ * read as a mode on DP, where it carries no information at all.
+ */
+static const char *alpm_mode_str(igt_output_t *output, const struct alpm_status *status)
+{
+	if (!alpm_is_enabled(output, status))
+		return "none";
+
+	return status->aux_less ? "AUX-less" : "AUX-wake";
+}
+
+static bool output_is_dp(igt_output_t *output)
+{
+	return output->config.connector->connector_type ==
+	       DRM_MODE_CONNECTOR_DisplayPort;
+}
+
+static bool output_is_alpm_capable_type(igt_output_t *output)
+{
+	int type = output->config.connector->connector_type;
+
+	return type == DRM_MODE_CONNECTOR_DisplayPort ||
+	       type == DRM_MODE_CONNECTOR_eDP;
+}
+
+/*
+ * Audio is the primary limitation on ALPM: the HAS lists "no audio" among the
+ * static conditions for enabling it and states that ALPM must not be enabled
+ * on an audio capable display, because with HD Audio the driver cannot tell
+ * whether audio is actually streaming and so refuses ALPM whenever an audio
+ * endpoint can be enumerated at all.
+ *
+ * Detect the sink side of that check: a CTA-861 extension either declaring
+ * Basic Audio or carrying an Audio Data Block. This matters in practice rather
+ * than theoretically, since the HAS lab survey found only 10 of 206 DP
+ * monitors without audio.
+ */
+static bool sink_supports_audio(int drm_fd, igt_output_t *output)
+{
+	uint64_t edid_blob_id;
+	drmModePropertyBlobRes *edid_blob;
+	const struct edid *edid;
+	bool audio = false;
+	int i, j;
+
+	if (!kmstest_get_property(drm_fd, output->id,
+				  DRM_MODE_OBJECT_CONNECTOR, "EDID",
+				  NULL, &edid_blob_id, NULL) || !edid_blob_id)
+		return false;
+
+	edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
+	if (!edid_blob)
+		return false;
+
+	edid = (const struct edid *)edid_blob->data;
+
+	for (i = 0; i < edid->extensions_len && !audio; i++) {
+		const struct edid_ext *ext = &edid->extensions[i];
+		const struct edid_cea *cea = &ext->data.cea;
+		const uint8_t *dbc = (const uint8_t *)cea->data;
+		int dbc_len;
+
+		if (ext->tag != EDID_EXT_CEA)
+			continue;
+
+		if (cea->misc & EDID_CEA_BASIC_AUDIO) {
+			audio = true;
+			break;
+		}
+
+		/*
+		 * dtd_start counts from the start of the extension block, and
+		 * cea->data begins four bytes into it, past tag, revision,
+		 * dtd_start and misc.
+		 */
+		dbc_len = cea->dtd_start < 4 ? 0 : cea->dtd_start - 4;
+		dbc_len = min_t(int, dbc_len, (int)sizeof(cea->data));
+
+		/* Data Block Collection: three bits of tag, five of length. */
+		for (j = 0; j < dbc_len; j += (dbc[j] & 0x1f) + 1) {
+			if ((dbc[j] >> 5) == EDID_CEA_DATA_AUDIO) {
+				audio = true;
+				break;
+			}
+		}
+	}
+
+	drmModeFreePropertyBlob(edid_blob);
+
+	return audio;
+}
+
+/*
+ * Presence of a given file in the connector's debugfs directory,
+ * independent of whether it is currently readable. Deliberately does not
+ * assert: a connector without a debugfs directory is a legitimate "not
+ * present" answer, not a test failure.
+ */
+static bool connector_has_debugfs_file(int drm_fd, igt_output_t *output,
+				       const char *filename)
+{
+	int dir, ret;
+
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	if (dir < 0)
+		return false;
+
+	ret = faccessat(dir, filename, F_OK, 0);
+	close(dir);
+
+	return ret == 0;
+}
+
+static bool alpm_has_debugfs(int drm_fd, igt_output_t *output)
+{
+	return connector_has_debugfs_file(drm_fd, output, ALPM_INFO_FILE);
+}
+
+/*
+ * The kernel only creates the LOBF debug override on connectors where it has
+ * LOBF to control, so its presence is the LOBF equivalent of
+ * alpm_has_debugfs(): a per-connector answer straight from the driver,
+ * without hardcoding which display version introduces LOBF for which output
+ * type.
+ */
+static bool parse_status_line(const char *line, const char *prefix, bool *out)
+{
+	size_t len = strlen(prefix);
+
+	if (strncmp(line, prefix, len))
+		return false;
+
+	*out = !strcmp(line + len, "enabled");
+
+	return true;
+}
+
+/*
+ * Read and parse all three status lines from a single snapshot of the file.
+ *
+ * Returns false when the file cannot be read. That is an expected outcome
+ * rather than an error: the kernel's show handler returns -ENODEV whenever the
+ * connector is disconnected or has no CRTC attached.
+ */
+static bool alpm_read_status(int drm_fd, igt_output_t *output,
+			     struct alpm_status *status)
+{
+	char buf[ALPM_INFO_MAX_LEN];
+	char *line, *saveptr = NULL;
+	int dir, res;
+
+	memset(status, 0, sizeof(*status));
+
+	dir = igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
+	if (dir < 0)
+		return false;
+
+	res = igt_debugfs_simple_read(dir, ALPM_INFO_FILE, buf, sizeof(buf));
+	close(dir);
+
+	if (res <= 0)
+		return false;
+
+	buf[min_t(int, res, (int)sizeof(buf) - 1)] = '\0';
+
+	/*
+	 * Match on whole lines. "Aux-less alpm status" and "Aux-wake alpm
+	 * status" share the "alpm status: " substring, so a plain strstr()
+	 * over the whole buffer would cross-match.
+	 */
+	for (line = strtok_r(buf, "\n", &saveptr); line;
+	     line = strtok_r(NULL, "\n", &saveptr)) {
+		if (parse_status_line(line, "LOBF status: ", &status->lobf))
+			continue;
+		if (parse_status_line(line, "Aux-wake alpm status: ",
+				      &status->aux_wake))
+			continue;
+		parse_status_line(line, "Aux-less alpm status: ",
+				  &status->aux_less);
+	}
+
+	return true;
+}
+
+/*
+ * alpm_is_enabled() alone isn't enough here: aux-less-only ALPM (no LOBF)
+ * shows up as "enabled" too, and the trace on a NovaLake eDP panel shows
+ * the link bouncing through exactly that state - and through aux-wake-only
+ * and briefly missing debugfs entirely during the transition - before LOBF
+ * itself latches. Wait on the LOBF bit specifically, with the longer budget
+ * that settling needs.
+ */
+static bool alpm_lobf_active(int drm_fd, igt_output_t *output)
+{
+	struct alpm_status status;
+
+	return alpm_read_status(drm_fd, output, &status) && status.lobf;
+}
+
+static bool alpm_wait_lobf_enabled(int drm_fd, igt_output_t *output)
+{
+	return igt_wait(alpm_lobf_active(drm_fd, output), ALPM_LOBF_TIMEOUT_MS, 50);
+}
+
+/*
+ * psr_get_mode(fd, output) reads "<connector>/i915_psr_status" under the
+ * device debugfs dir. Some kernels only ever expose the legacy single-eDP
+ * "i915_edp_psr_status" at the top level instead (no connector
+ * subdirectory) - confirmed on a NovaLake box where the connector-scoped
+ * path 404s but /sys/kernel/debug/dri/0/i915_edp_psr_status has the real
+ * "PSR mode: Panel Replay ... enabled" line. Fall back to that legacy path
+ * (psr_get_mode(fd, NULL)) whenever the connector-scoped read comes back
+ * disabled, so this works on both layouts.
+ */
+static bool psr_panel_replay_enabled(int debugfs_fd, igt_output_t *output)
+{
+	enum psr_mode mode = psr_get_mode(debugfs_fd, output);
+
+	if (mode == PSR_DISABLED)
+		mode = psr_get_mode(debugfs_fd, NULL);
+
+	return mode == PR_MODE || mode == PR_MODE_SEL_FETCH ||
+	       mode == PR_MODE_SEL_FETCH_ET;
+}
+
+static bool psr_wait_panel_replay_enabled(int debugfs_fd, igt_output_t *output,
+					  bool enabled)
+{
+	return igt_wait(psr_panel_replay_enabled(debugfs_fd, output) == enabled,
+			ALPM_TIMEOUT_MS, 1);
+}
+
+static void alpm_dump_status(int drm_fd, igt_output_t *output)
+{
+	struct alpm_status status;
+
+	if (!alpm_read_status(drm_fd, output, &status)) {
+		igt_info("%s: ALPM status unavailable\n", output->name);
+		return;
+	}
+
+	igt_info("%s: ALPM %s, mode %s (aux-less %s, aux-wake %s, LOBF %s)\n",
+		 output->name,
+		 alpm_is_enabled(output, &status) ? "enabled" : "disabled",
+		 alpm_mode_str(output, &status),
+		 status.aux_less ? "enabled" : "disabled",
+		 status.aux_wake ? "enabled" : "disabled",
+		 status.lobf ? "enabled" : "disabled");
+}
+
+/*
+ * The debug knob holds intel_dp->alpm.lobf_disable_debug, consumed by
+ * intel_alpm_lobf_compute_config() at atomic check time. Writing it therefore
+ * has no effect until the next modeset.
+ *
+ * Since "drm/i915/alpm: Introduce has_alpm to decouple from pr/psr2/lobf" ties
+ * has_alpm to has_lobf, this is also the only userspace control that can take
+ * ALPM itself down on an otherwise idle DP link.
+ */
+static bool alpm_set_disable_debug(int drm_fd, igt_output_t *output,
+				   bool disable)
+{
+	const char *val = disable ? "1" : "0";
+
+	return igt_debugfs_write_connector_file(drm_fd, output->name,
+						ALPM_DEBUG_FILE,
+						val, strlen(val)) == 0;
+}
+
+/*
+ * i915_edp_psr_debug is global (one file for the whole display, applied to
+ * every PSR-capable encoder), not per-connector - see the FIXME in
+ * lib/igt_psr.c's psr_write(). "0x0" restores I915_PSR_DEBUG_DEFAULT.
+ */
+static bool set_psr_pr_disable_debug(int debugfs_fd, bool disable)
+{
+	char val[8];
+	int ret;
+
+	snprintf(val, sizeof(val), "0x%x",
+		 disable ? (PSR_DEBUG_DISABLE | PSR_DEBUG_PANEL_REPLAY_DISABLE) : 0);
+
+	ret = igt_sysfs_write(debugfs_fd, PSR_DEBUG_FILE, val, strlen(val));
+
+	return ret == (int)strlen(val);
+}
+
+/*
+ * Light the output up. ALPM on an idle link is reached via LOBF, which
+ * requires a fixed refresh rate (intel_vrr_is_fixed_rr()), so the mode is
+ * committed without ever setting VRR_ENABLED; the driver still runs the VRR
+ * timing generator on the platforms that support ALPM.
+ */
+static void test_setup(data_t *data)
+{
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+
+	igt_output_set_crtc(output, data->crtc);
+
+	mode = igt_output_get_mode(output);
+	igt_assert(mode);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			      &data->fb);
+	igt_plane_set_fb(primary, &data->fb);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static void test_cleanup(data_t *data)
+{
+	igt_output_t *output = data->output;
+	igt_plane_t *primary;
+
+	/*
+	 * Clear the debug override unconditionally. A subtest that fails
+	 * midway would otherwise leave it set, suppressing ALPM for
+	 * everything that runs afterwards on this machine.
+	 */
+	if (alpm_has_debugfs(data->drm_fd, output))
+		alpm_set_disable_debug(data->drm_fd, output, false);
+
+	/*
+	 * test_alpm_lobf() sets PSR_DEBUG_DISABLE | PSR_DEBUG_PANEL_REPLAY_
+	 * DISABLE in the global i915_edp_psr_debug file. That write outlives
+	 * this dynamic subtest (all of them share one process), so every
+	 * later output/subtest would run with PSR/PR forced off unless it is
+	 * put back here.
+	 */
+	if (data->psr_needs_restore) {
+		set_psr_pr_disable_debug(data->debugfs_fd, false);
+		data->psr_needs_restore = false;
+	}
+
+	/* Same reasoning for the mode override left behind by the mode sweep. */
+	igt_output_override_mode(output, NULL);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_crtc(output, NULL);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_remove_fb(data->drm_fd, &data->fb);
+}
+
+/*
+ * Preconditions shared by every subtest that expects ALPM to actually engage.
+ *
+ * Beyond these the kernel requires that the sink supports AS SDP and that
+ * (set_context_latency + guardband) exceeds the first SDP position plus the
+ * link wake time. Neither input is visible from userspace, so neither can be
+ * checked here. vrr_capable is the closest available proxy for AS SDP support.
+ */
+static void require_alpm_capable(data_t *data, igt_output_t *output)
+{
+	unsigned int ver = intel_display_ver(data->devid);
+
+	igt_require_f(output_is_alpm_capable_type(output),
+		      "%s: not an eDP or DisplayPort output\n", output->name);
+
+	if (output_is_dp(output))
+		igt_require_f(ver >= ALPM_DP_MIN_DISPLAY_VER,
+			      "DP2.1 ALPM needs display ver %d, have %u\n",
+			      ALPM_DP_MIN_DISPLAY_VER, ver);
+	else
+		igt_require_f(ver >= ALPM_EDP_MIN_DISPLAY_VER,
+			      "eDP ALPM needs display ver %d, have %u\n",
+			      ALPM_EDP_MIN_DISPLAY_VER, ver);
+
+	igt_require_f(alpm_has_debugfs(data->drm_fd, output),
+		      "%s: %s not present\n", output->name, ALPM_INFO_FILE);
+
+	igt_require_f(igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
+		      igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE),
+		      "%s: not VRR capable, sink is unlikely to support AS SDP\n",
+		      output->name);
+}
+
+/*
+ * An audio capable sink is expected to keep ALPM off, so this is a skip rather
+ * than a failure for every subtest that wants ALPM to engage. Without it those
+ * subtests would report a failure on the large majority of real DisplayPort
+ * monitors.
+ *
+ * Deliberately not folded into require_alpm_capable(): alpm-audio-negative is
+ * the subtest whose whole subject is an audio capable sink, and it has to be
+ * able to get past the shared preconditions to reach it.
+ */
+static void require_no_audio(data_t *data, igt_output_t *output)
+{
+	igt_require_f(!sink_supports_audio(data->drm_fd, output),
+		      "%s: sink declares audio support, ALPM is not enabled on audio capable displays\n",
+		      output->name);
+}
+
+/*
+ * Covers "alpm_init() for DP2.1", "Replace is_edp() with alpm_is_possible()"
+ * and "Introduce has_alpm to decouple from pr/psr2/lobf": on an external DP
+ * link none of the ALPM programming happens at all before those patches.
+ *
+ * DP only has one legal ALPM mechanism (Panel Replay, aux-less); eDP may
+ * reach ALPM via Panel Replay (either aux flavor) or via LOBF, but never
+ * both, so this subtest only cares that Panel Replay is what came up and
+ * that LOBF stayed off while it did.
+ */
+static void test_alpm_panel_replay(data_t *data)
+{
+	igt_output_t *output = data->output;
+	struct alpm_status status;
+
+	require_no_audio(data, output);
+
+	test_setup(data);
+
+	alpm_dump_status(data->drm_fd, output);
+
+	igt_require_f(psr_wait_panel_replay_enabled(data->debugfs_fd, output, true),
+		      "%s: Panel Replay not enabled after modeset\n", output->name);
+
+	igt_require(alpm_read_status(data->drm_fd, output, &status));
+
+	igt_assert_f(!status.lobf,
+		     "%s: LOBF must not be enabled while Panel Replay is active\n",
+		     output->name);
+
+	if (output_is_dp(output))
+		igt_assert_f(status.aux_less,
+			     "%s: DP must use aux-less ALPM under Panel Replay\n",
+			     output->name);
+
+	igt_info("%s: Panel Replay active, ALPM mode %s\n",
+		 output->name, alpm_mode_str(output, &status));
+}
+
+/*
+ * LOBF is eDP only (DP2.1 ALPM only ever runs through Panel Replay, see
+ * test_alpm_panel_replay()). intel_alpm_lobf_compute_config_late() (kernel
+ * intel_alpm.c) unconditionally clears has_lobf whenever crtc_state->has_psr
+ * is true, and intel_psr_compute_config() (intel_psr.c) sets has_psr from
+ * *either* Panel Replay or classic PSR/PSR2 succeeding - so both have to be
+ * disabled together, not just PR: PSR_DEBUG_DISABLE alone leaves Panel
+ * Replay's own enable check untouched (PR keeps winning), and PSR_DEBUG_
+ * PANEL_REPLAY_DISABLE alone just lets PSR2 take over and keep has_psr true
+ * instead. psr_disable()'s plain I915_PSR_DEBUG_DISABLE write is therefore
+ * the wrong knob here.
+ */
+static void test_alpm_lobf(data_t *data)
+{
+	igt_output_t *output = data->output;
+	struct alpm_status status;
+
+	igt_require_f(!output_is_dp(output), "%s: LOBF is eDP only\n", output->name);
+
+	require_no_audio(data, output);
+
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, output) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_2, output) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, output)) {
+		igt_require_f(set_psr_pr_disable_debug(data->debugfs_fd, true),
+			      "%s: failed to write %s\n", output->name, PSR_DEBUG_FILE);
+		data->psr_needs_restore = true;
+	}
+
+	test_setup(data);
+
+	alpm_dump_status(data->drm_fd, output);
+
+	igt_require_f(alpm_wait_lobf_enabled(data->drm_fd, output),
+		      "%s: LOBF not enabled after modeset\n", output->name);
+
+	igt_require(alpm_read_status(data->drm_fd, output, &status));
+
+	igt_assert_f(status.lobf,
+		     "%s: ALPM enabled but not via LOBF\n", output->name);
+
+	igt_assert_f(!psr_panel_replay_enabled(data->debugfs_fd, output),
+		     "%s: Panel Replay must not be active while LOBF is enabled\n",
+		     output->name);
+
+	igt_info("%s: LOBF active, ALPM mode %s ✓\n",
+		 output->name, alpm_mode_str(output, &status));
+}
+
+static void run_test(data_t *data, void (*test)(data_t *))
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		igt_crtc_t *crtc;
+
+		if (!output_is_alpm_capable_type(output))
+			continue;
+
+		/*
+		 * LOBF never latches on DP: has_lobf is unconditionally
+		 * cleared whenever has_psr is set, and DP always sets has_psr
+		 * via Panel Replay (see test_alpm_lobf()). Skip enumeration
+		 * entirely instead of creating a dynamic subtest that always
+		 * SKIPs.
+		 */
+		if (test == test_alpm_lobf && output_is_dp(output)) {
+			igt_info("%s: skipping, LOBF is eDP only\n", output->name);
+			continue;
+		}
+
+		for_each_crtc(&data->display, crtc) {
+			igt_display_reset(&data->display);
+			igt_output_set_crtc(output, crtc);
+
+			if (!intel_pipe_output_combo_valid(&data->display)) {
+				igt_output_set_crtc(output, NULL);
+				continue;
+			}
+
+			data->output = output;
+			data->crtc = crtc;
+
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      output->name) {
+				require_alpm_capable(data, output);
+				test(data);
+			}
+
+			test_cleanup(data);
+			break;
+		}
+	}
+}
+
+int igt_main()
+{
+	data_t data = {};
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
+		data.devid = intel_get_drm_devid(data.drm_fd);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+		igt_display_require_output(&data.display);
+	}
+
+	igt_describe("Verify ALPM is reached via Panel Replay after a modeset, "
+		     "with LOBF staying off while it is active.");
+	igt_subtest_with_dynamic("alpm-panel-replay")
+		run_test(&data, test_alpm_panel_replay);
+
+	igt_describe("Verify LOBF can be enabled on an eDP output once PSR/PSR2/"
+		     "Panel Replay are disabled, with Panel Replay staying off "
+		     "while LOBF is active.");
+	igt_subtest_with_dynamic("alpm-lobf")
+		run_test(&data, test_alpm_lobf);
+
+	igt_fixture() {
+		close(data.debugfs_fd);
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1ac89bab7..8ad4d096f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -246,6 +246,7 @@ intel_i915_progs = [
 ]
 
 intel_kms_progs = [
+	'kms_alpm',
 	'kms_big_fb',
 	'kms_busy',
 	'kms_ccs',
-- 
2.43.0

