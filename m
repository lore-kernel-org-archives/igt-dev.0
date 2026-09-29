Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A98CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 09:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8390F10EDB9;
	Tue, 29 Sep 2026 09:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2LLGZuC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCBC10EDB8
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 09:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790672711; x=1822208711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wSE/tYwk8fkQEEUjeM6GSC+WJxtmkguhY3cvyktGrys=;
 b=A2LLGZuCBn1ud9Yv6oXA2xfAvKH/kKW+0kWZn6Zt2sfMtWTN0l1jMtai
 D0KLOkRtoa9c7S8n48zPQ2A+CtHf9CglJb5fTMscaGMPwQzspnliSDkoO
 1/bRkHF0BHu1yGXsAYu5QOQyHEGr1IchVyV6Rg3s88p53qg3LHANiGhn3
 OTqS7wJqEH98Nt71pOijeLdsA5keK+jN5ek+jFWDP/UmaP8WpShZ9033a
 9WR1A2NGaOz98uBE6Ajbr/ARfbbyUEX+V9MgT/XShZDWlPLuP02xgK+nM
 yhx/WChJtYoNaG8krsVpnO9K/FG8vpGKiZ7t6SfjF7il7WAoN/8k9WUwt A==;
X-CSE-ConnectionGUID: hRy11FFBRjuHOWDy+YUcKA==
X-CSE-MsgGUID: JdsLHDchTyCQgExwOeU3IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91483786"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91483786"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:11 -0700
X-CSE-ConnectionGUID: WSfLAAu1Tf2q6g5wkGRmzQ==
X-CSE-MsgGUID: SyVkCsiXRXeoYY6MHDnH0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="275462941"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:05:09 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, kunal1.joshi@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v1 2/5] tests/intel/kms_alpm: add ALPM helper functions
Date: Tue, 29 Sep 2026 14:34:47 +0530
Message-ID: <20260929090454.2796967-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929090454.2796967-1-sowmiya.s@intel.com>
References: <20260929090454.2796967-1-sowmiya.s@intel.com>
MIME-Version: 1.0
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

Add the ALPM debugfs status parsing (alpm_read_status(),
alpm_is_enabled(), alpm_mode_str()) and the audio and capability
preconditions (require_alpm_capable(), require_no_audio(),
sink_supports_audio()) used by the ALPM subtests added in the
following patches.

alpm_dump_status(), require_alpm_capable() and require_no_audio() have
no caller yet at this point in the series. Marked __maybe_unused until
the test harness and subtests that consume them land in the following
patches.

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Assisted-by: Gnai_Claude:sonnet-5
---
 tests/intel/kms_alpm.c | 282 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 282 insertions(+)

diff --git a/tests/intel/kms_alpm.c b/tests/intel/kms_alpm.c
index 8bd71a981..dfdccd74e 100644
--- a/tests/intel/kms_alpm.c
+++ b/tests/intel/kms_alpm.c
@@ -72,6 +72,288 @@ typedef struct {
 	struct igt_fb fb;
 } data_t;
 
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
+ * Audio is the primary limitation on ALPM: it must not be enabled on an
+ * audio capable display, because with HD Audio the driver cannot tell
+ * whether audio is actually streaming and so refuses ALPM whenever an
+ * audio endpoint can be enumerated at all.
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
+__maybe_unused
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
+ * Preconditions shared by every subtest that expects ALPM to actually engage.
+ *
+ * Beyond these the kernel requires that the sink supports AS SDP and that
+ * (set_context_latency + guardband) exceeds the first SDP position plus the
+ * link wake time. Neither is visible from userspace, so neither is checked
+ * here: intel_vrr_compute_config() computes the guardband for every crtc
+ * once the platform has VRR hardware at all (HAS_VRR()), regardless of
+ * whether the connector itself reports vrr_capable, so vrr_capable is not a
+ * reliable proxy for AS SDP support and gating on it here would risk false
+ * skips. A sink that can't actually support it is instead caught indirectly,
+ * by the subtest's own post-modeset wait for ALPM/Panel Replay/LOBF failing.
+ */
+__maybe_unused
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
+}
+
+/*
+ * An audio capable sink is expected to keep ALPM off, so this is a skip rather
+ * than a failure for every subtest that wants ALPM to engage. Without it those
+ * subtests would report a failure on the large majority of real DisplayPort
+ * monitors.
+ */
+__maybe_unused
+static void require_no_audio(data_t *data, igt_output_t *output)
+{
+	igt_require_f(!sink_supports_audio(data->drm_fd, output),
+		      "%s: sink declares audio support, ALPM is not enabled on audio capable displays\n",
+		      output->name);
+}
+
 int igt_main()
 {
 	data_t data = {};
-- 
2.43.0

