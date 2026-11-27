Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AEB606A31E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UoKhIXWY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E763C1128D5;
	Fri, 27 Nov 2026 09:40:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD5B1128D4
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795772321; x=1827308321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MbfalTNamDhXl7iGQM8hhnUDIrN+akB/IkncmvxlA/E=;
 b=UoKhIXWYRIiZgJAbODNKopHan+qIfQn1p1WIuGNzUz8SYn3ThVSVPk8R
 L0VcPmoBcTFExiBKJqhNu8J866jsskDW+NyTjpCjJJ4xNt6AeSXHnxS+3
 St+M28amNG7SkMkFLT7wuZfDuR27ZZrh4Uk7Td1vrwjvN6lf3k5rxU5iK
 5pjCTjzAn6amhKKfBUcd3ZOpDlEmU5LC+J48vykrLbTbrmj1kKfTXwofp
 TJw1jaSVGVcUVyqOhjzvxhLuYeFBWuw4DLvEjfWikFbUXQKqm31HksVEW
 1zFl+z0QQvvCQpc8VQVisViQsU3n07aeC2yxbahtsagsyuHA8RrpNDBgs g==;
X-CSE-ConnectionGUID: TQEmpBJ1Q4uJI/+HNr5JqQ==
X-CSE-MsgGUID: jNxe7V6gR/Kjfvtnj+5/MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4593227"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4593227"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:38:41 -0800
X-CSE-ConnectionGUID: sTbmADLwQaGfQYcllzYtWQ==
X-CSE-MsgGUID: i1P2YjFOQkisZCHydoKL9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12501350"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 01:38:39 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>, Jeevan B <jeevan.b@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t 2/2] lib/igt_joiner: Move the Intel joiner helpers out
 of igt_kms
Date: Fri, 27 Nov 2026 15:05:10 +0530
Message-ID: <20261127093510.2291076-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127093510.2291076-1-karthik.b.s@intel.com>
References: <20261127093510.2291076-1-karthik.b.s@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

igt_kms.[ch] is meant to be generic code common to all drivers, but it
carries a large amount of Intel specific pipe joiner code.

Move it to lib/igt_joiner.[ch], next to the other joiner helpers, and
include igt_joiner.h from igt.h so that the callers don't change. No
functional change.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt.h                        |   1 +
 lib/igt_joiner.c                 | 639 ++++++++++++++++++++++++++++++
 lib/igt_joiner.h                 |  38 ++
 lib/igt_kms.c                    | 642 +------------------------------
 lib/igt_kms.h                    |  36 --
 tests/intel/kms_mmap_write_crc.c |   1 +
 6 files changed, 680 insertions(+), 677 deletions(-)

diff --git a/lib/igt.h b/lib/igt.h
index 173ca70bf..06e4f6f3a 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -35,6 +35,7 @@
 #include "igt_fb.h"
 #include "igt_frame.h"
 #include "igt_gt.h"
+#include "igt_joiner.h"
 #include "igt_kms.h"
 #include "igt_params.h"
 #include "igt_pipe_crc.h"
diff --git a/lib/igt_joiner.c b/lib/igt_joiner.c
index fc22dd0ed..abaa41a46 100644
--- a/lib/igt_joiner.c
+++ b/lib/igt_joiner.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <fcntl.h>
+
 #include "igt_joiner.h"
 #include "igt.h"
 #include "igt_kms.h"
@@ -288,3 +290,640 @@ const char *igt_get_joined_pipes_name(enum joined_pipes val)
 		igt_assert(false);
 	}
 }
+
+static bool force_connector_joiner(int drm_fd,
+				      drmModeConnector *connector,
+				      const char *value)
+{
+	return connector_attr_set_debugfs(drm_fd, connector,
+					  "i915_joiner_force_enable",
+					  value, "0", false);
+}
+
+/**
+ * kmstest_force_connector_joiner:
+ * @fd: drm file descriptor
+ * @connector: connector
+ *
+ * Enable force joiner state on the specified connector
+ * and install exit handler for resetting
+ *
+ * Returns: True on success
+ */
+bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes)
+{
+	const char *value;
+	drmModeConnector *temp;
+
+	switch (joined_pipes) {
+	case JOINED_PIPES_DEFAULT:
+		value = "0";
+		break;
+	case JOINED_PIPES_NONE:
+		value = "1";
+		break;
+	case JOINED_PIPES_BIG_JOINER:
+		value = "2";
+		break;
+	case JOINED_PIPES_ULTRA_JOINER:
+		value = "4";
+		break;
+	default:
+		igt_assert(0);
+	}
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	if (!force_connector_joiner(drm_fd, connector, value))
+		return false;
+
+	dump_connector_attrs();
+	igt_install_exit_handler(reset_connectors_at_exit);
+
+	/*
+	 * To allow callers to always use GetConnectorCurrent we need to force a
+	 * redetection here.
+	 */
+	temp = drmModeGetConnector(drm_fd, connector->connector_id);
+	drmModeFreeConnector(temp);
+
+	return true;
+}
+
+/**
+ * intel_get_max_uncompressed_dotclock:
+ * @drm_fd: drm file descriptor
+ * @max_dotclock: Max pixel clock frequency
+ *
+ * Get the maximum pixel clock a single pipe supports without DSC. This
+ * mirrors the kernel's intel_max_uncompressed_dotclock(): above this
+ * limit an uncompressed mode can't be driven by a single pipe, so only
+ * modes below it are guaranteed to use a single pipe irrespective of
+ * DSC support in the sink.
+ *
+ * Returns: The maximum uncompressed pixel clock for a single pipe.
+ */
+int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock)
+{
+	int dev_id = intel_get_drm_devid(drm_fd);
+	int limit = max_dotclock;
+
+	if (IS_WILDCATLAKE(dev_id))
+		limit = MAX_UNCOMPRESSED_DOTCLOCK_WCL;
+	else if (intel_display_ver(dev_id) >= 30)
+		limit = MAX_UNCOMPRESSED_DOTCLOCK_DISPLAY_30;
+
+	return min(max_dotclock, limit);
+}
+
+/**
+ * intel_get_max_pipe_hdisplay:
+ * @drm_fd: drm file descriptor
+ *
+ * Get the maximum hdisplay (width) supported by a single pipe on the
+ * platform. This is a public function for querying platform capabilities.
+ *
+ * Returns: The maximum hdisplay supported per pipe.
+ */
+int intel_get_max_pipe_hdisplay(int drm_fd)
+{
+	int dev_id = intel_get_drm_devid(drm_fd);
+
+	return (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
+						   HDISPLAY_5K_PER_PIPE;
+}
+
+struct joiner_mode_exception {
+	uint16_t hdisplay, vdisplay;
+	uint32_t clock;
+};
+
+static bool match_joiner_exception(drmModeModeInfo *mode,
+				   const struct joiner_mode_exception *list,
+				   int count)
+{
+	for (int i = 0; i < count; i++) {
+		if (mode->hdisplay == list[i].hdisplay &&
+		    mode->vdisplay == list[i].vdisplay &&
+		    mode->clock == list[i].clock)
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * TODO: IGT cannot compute the DSC bubble overhead the driver adds to the
+ * effective pixel rate, since it cannot estimate the DSC parameters -
+ * whether DSC is used and how many slices. On NVL this lets modes like
+ * 6144x3456@60 pass igt_bigjoiner_possible()'s clock/hdisplay checks,
+ * yet the kernel still enables bigjoiner for them.
+ *
+ * Add mode_needs_joiner_exception() as a stopgap.
+ */
+static const struct joiner_mode_exception nvl_joiner_exception_modes[] = {
+	{ 6144, 3456, 1413390 }, /* 6144x3456@60Hz */
+	{ 3840, 2160, 1543000 }, /* 3840x2160@165Hz */
+	{ 3840, 2160, 1398400 }, /* 3840x2160@160Hz */
+	{ 3840, 2160, 2291120 }, /* 3840x2160@240 */
+};
+
+/*
+ * mode_needs_joiner_exception - check if a mode requires joiner via explicit exception
+ * @drm_fd: drm file descriptor
+ * @mode: libdrm mode
+ *
+ * On some platforms, a higher max_dotclock means certain modes won't trigger
+ * the standard clock or hdisplay checks even though the kernel enables joiner
+ * for them. Each platform has its own exception list.
+ *
+ * Returns: True if the mode is a known joiner exception, else False.
+ */
+static bool mode_needs_joiner_exception(int drm_fd, drmModeModeInfo *mode)
+{
+	unsigned int disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
+
+	if (disp_ver == 35)
+		return match_joiner_exception(mode, nvl_joiner_exception_modes,
+					      ARRAY_SIZE(nvl_joiner_exception_modes));
+
+	return false;
+}
+
+/**
+ * igt_bigjoiner_possible:
+ * @drm_fd: drm file descriptor
+ * @mode: libdrm mode
+ * @max_dotclock: Max pixel clock frequency
+ *
+ * Bigjoiner is required when the requested mode exceeds single-pipe
+ * platform limits, i.e. hdisplay is above the platform threshold or
+ * clock is above @max_dotclock.
+ *
+ * Returns: True if mode requires Bigjoiner, else False.
+ */
+bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
+{
+	/**
+	 * TODO: remove mode_needs_joiner_exception() once IGT can estimate
+	 * DSC parameters accurately
+	 */
+	return (mode_needs_joiner_exception(drm_fd, mode) ||
+		mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
+		mode->clock > max_dotclock);
+}
+
+/**
+ * bigjoiner_mode_found:
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @max_dot_clock: max dot clock frequency
+ * @mode: libdrm mode to be filled
+ *
+ * Finds the first connector mode that requires bigjoiner support based on
+ * igt_bigjoiner_possible(), while excluding modes that require ultrajoiner.
+ *
+ * Returns: True if a bigjoiner mode is found.
+ */
+bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int max_dotclock, drmModeModeInfo *mode)
+{
+	bool found = false;
+
+	for (int i=0; i< connector->count_modes; i++) {
+		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i], max_dotclock) &&
+		    !igt_ultrajoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
+			*mode = connector->modes[i];
+			found = true;
+			break;
+		}
+	}
+	return found;
+}
+
+/**
+ * intel_boundary_non_joiner_mode_found:
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @max_dot_clock: max dot clock frequency
+ * @mode: libdrm mode to be filled
+ *
+ * Check if connector supports a mode at the platform's maximum single-pipe
+ * hdisplay boundary. The mode clock must be below the uncompressed single
+ * pipe limit, so that the kernel doesn't fall back to joiner when the sink
+ * doesn't support DSC.
+ *
+ * Returns: True if a valid non-joiner mode at the boundary is found,
+ * false otherwise.
+ */
+bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+					  int max_dotclock, drmModeModeInfo *mode)
+{
+	int max_hdisplay = intel_get_max_pipe_hdisplay(drm_fd);
+	int max_uncompressed_dotclock = intel_get_max_uncompressed_dotclock(drm_fd, max_dotclock);
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		if (current_mode->hdisplay == max_hdisplay &&
+		    current_mode->clock < max_uncompressed_dotclock &&
+		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
+			*mode = *current_mode;
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/**
+ * igt_is_joiner_enabled_for_pipe:
+ * @drmfd: A drm file descriptor
+ * @pipe: display pipe
+ *
+ * Returns: True if joiner is enabled, false otherwise.
+ */
+bool igt_is_joiner_enabled_for_pipe(int drmfd, enum hardware_pipe pipe)
+{
+	char buf[16384], master_str[64], slave_str[64];
+	int dir, res;
+	unsigned  int pipe_mask = (1 << 0) | (1 << 1);
+
+	dir = igt_debugfs_dir(drmfd);
+	igt_assert(dir >= 0);
+
+	res = igt_debugfs_simple_read(dir, "i915_display_info",
+					    buf, sizeof(buf));
+	close(dir);
+	igt_assert(res >= 0);
+	pipe_mask <<= pipe;
+
+	snprintf(master_str, sizeof(master_str),
+		 "Linked to 0x%x pipes as a master", pipe_mask);
+	snprintf(slave_str, sizeof(slave_str),
+		 "Linked to 0x%x pipes as a slave", pipe_mask);
+
+	return (strstr(buf, master_str) && strstr(buf, slave_str));
+}
+
+/**
+ * igt_ultrajoiner_possible:
+ * @mode: libdrm mode
+ * @max_dotclock: Max pixel clock frequency
+ *
+ * Ultrajoiner will come into the picture, when the requested
+ * mode resolution > 10K or mode clock > 2 * max_dotclock.
+ *
+ * Returns: True if mode requires Ultrajoiner, else False.
+ */
+bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
+{
+	return (mode->hdisplay > 2 * intel_get_max_pipe_hdisplay(drm_fd) ||
+		mode->clock > 2 * max_dotclock);
+}
+
+/**
+ * Ultrajoiner_mode_found:
+ * @drm_fd: drm file descriptor
+ * @connector: libdrm connector
+ * @max_dot_clock: max dot clock frequency
+ * @mode: libdrm mode to be filled
+ *
+ * Ultrajoiner will come in to the picture when the
+ * resolution > 10K or clock > 2 * max-dot-clock.
+ *
+ * Returns: True if ultra joiner found in connector modes
+ */
+bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int max_dotclock, drmModeModeInfo *mode)
+{
+	bool found = false;
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		if (igt_ultrajoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
+			*mode = connector->modes[i];
+			found = true;
+			break;
+		}
+	}
+
+	return found;
+}
+
+/**
+ * igt_get_non_joiner_mode:
+ * @drm_fd: drm file descriptor
+ * @output: pointer to the output structure
+ *
+ * Finds the display mode from the output that does not require
+ * Big Joiner or Ultra Joiner.
+ *
+ * Returns: Pointer to non-joiner mode, or NULL if not found.
+ */
+drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output)
+{
+	drmModeConnector *connector;
+	int max_dotclock;
+
+	connector = output->config.connector;
+	max_dotclock = igt_get_max_dotclock(drm_fd);
+
+	for (int i = 0; i < connector->count_modes; i++) {
+		drmModeModeInfo *current_mode = &connector->modes[i];
+
+		/* Check if mode requires joiner */
+		if (!igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock) &&
+		    !igt_ultrajoiner_possible(drm_fd, current_mode, max_dotclock)) {
+			return current_mode;
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * is_joiner_mode:
+ * @drm_fd: drm file descriptor
+ * @output: pointer to the output structure
+ *
+ * Checks if the current configuration requires Big Joiner or Ultra Joiner mode
+ * based on the maximum dot clock and connector settings.
+ *
+ * Returns: True if joiner mode is required, otherwise False.
+ */
+bool is_joiner_mode(int drm_fd, igt_output_t *output)
+{
+	bool is_joiner = false;
+	bool is_ultra_joiner = false;
+	int max_dotclock;
+	drmModeModeInfo mode;
+
+        if (!is_intel_device(drm_fd))
+                return false;
+
+	max_dotclock = igt_get_max_dotclock(drm_fd);
+	is_joiner = bigjoiner_mode_found(drm_fd,
+					 output->config.connector,
+					 max_dotclock, &mode);
+	is_ultra_joiner = ultrajoiner_mode_found(drm_fd,
+						 output->config.connector,
+						 max_dotclock, &mode);
+
+	if (is_joiner || is_ultra_joiner)
+		return true;
+
+	return false;
+}
+
+/**
+ * igt_has_force_joiner_debugfs
+ * @drmfd: A drm file descriptor
+ * @conn_name: Name of the connector
+ *
+ * Checks if the force big joiner debugfs is available
+ * for a specific connector.
+ *
+ * Returns:
+ *  true if the debugfs is available, false otherwise.
+ */
+bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
+{
+	char buf[512];
+	int debugfs_fd, ret;
+
+	/*
+	 * bigjoiner is supported on display<= 12 with DSC only
+	 * and only on Pipe A for Display 11
+	 * For simplicity avoid Display 11 and 12, check for >= 13
+	 */
+	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 13)
+		return false;
+
+	igt_assert_f(conn_name, "Connector name cannot be NULL\n");
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, conn_name, O_RDONLY);
+	if (debugfs_fd < 0)
+		return false;
+
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
+	close(debugfs_fd);
+
+	return ret >= 0;
+}
+
+/**
+ * igt_check_force_joiner_status
+ * @drmfd: file descriptor of the DRM device.
+ * @connector_name: connector to check.
+ *
+ * Checks if the force joiner is enabled.
+ *
+ * Returns: True if the force joiner is enabled, False otherwise.
+ */
+bool igt_check_force_joiner_status(int drmfd, char *connector_name)
+{
+	char buf[512];
+	int debugfs_fd, ret;
+
+	if (!connector_name)
+		return false;
+
+	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	if (debugfs_fd < 0) {
+		igt_debug("Could not open debugfs for connector: %s\n", connector_name);
+		return false;
+	}
+
+	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
+	close(debugfs_fd);
+
+	if (ret < 0) {
+		igt_debug("Could not read i915_joiner_force_enable for connector: %s\n", connector_name);
+		return false;
+	}
+
+	return (atoi(buf) > 1);
+}
+
+/**
+ * igt_check_bigjoiner_support:
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Get all active pipes from connected outputs (i.e. pending_crtc != NULL)
+ * and check those pipes supports the selected mode(s).
+ *
+ * Example:
+ *  * Pipe-D can't support mode > 5K
+ *  * To use 8K mode on a pipe then consecutive pipe must be free.
+ *
+ * Returns: True if a valid crtc/connector mode combo found, else false
+ */
+bool igt_check_bigjoiner_support(igt_display_t *display)
+{
+	uint8_t i, pipes_in_use = 0;
+	igt_crtc_t *crtc;
+	igt_output_t *output;
+	enum hardware_pipe last_pipe = PIPE_NONE;
+	struct {
+		enum hardware_pipe idx;
+		drmModeModeInfo *mode;
+		igt_output_t *output;
+		bool force_joiner;
+	} pipes[IGT_MAX_PIPES];
+	int max_dotclock;
+
+	/* Get last pipe */
+	for_each_crtc(display, crtc) {
+		if (crtc->hardware_pipe > last_pipe)
+			last_pipe = crtc->hardware_pipe;
+	}
+
+	/*
+	 * Get list of CRTCs in use those were set by igt_output_set_crtc()
+	 * just before calling this function.
+	 */
+	for_each_connected_output(display, output) {
+		if (!output->pending_crtc)
+			continue;
+
+		pipes[pipes_in_use].idx = output->pending_crtc->hardware_pipe;
+		pipes[pipes_in_use].mode = igt_output_get_mode(output);
+		pipes[pipes_in_use].output = output;
+		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
+		pipes_in_use++;
+	}
+
+	if (!pipes_in_use) {
+		igt_info("We must set at least one output to pipe.\n");
+		return true;
+	}
+
+	max_dotclock = igt_get_max_dotclock(display->drm_fd);
+
+	/*
+	 * if force joiner is enabled (or) the mode requires bigjoiner,
+	 * then ignore
+	 *  - if the consecutive pipe is not available
+	 *  - last crtc in single/multi-connector config
+	 *  - consecutive crtcs in multi-connector config
+	 *
+	 * in multi-connector config ignore if
+	 *  - previous crtc (force joiner or mode requires bigjoiner) and
+	 *  - current & previous crtcs are consecutive
+	 */
+	for (i = 0; i < pipes_in_use; i++) {
+		if (pipes[i].force_joiner ||
+		    igt_bigjoiner_possible(display->drm_fd, pipes[i].mode, max_dotclock)) {
+			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
+				 kmstest_pipe_name(pipes[i].idx),
+				 igt_output_name(pipes[i].output),
+				 max_dotclock, pipes[i].force_joiner ? "Yes" : "No");
+			kmstest_dump_mode(pipes[i].mode);
+
+			if (pipes[i].idx >= last_pipe) {
+				igt_info("pipe-%s: Last pipe couldn't be used as a Bigjoiner Primary.\n",
+					 kmstest_pipe_name(pipes[i].idx));
+				return false;
+			}
+
+			for (int j = 0; j < pipes_in_use; j++) {
+				if (pipes[j].idx == pipes[i].idx + 1) {
+					igt_info("pipe-%s: Next pipe is already assigned to another output.\n",
+						 kmstest_pipe_name(pipes[j].idx));
+					return false;
+				}
+			}
+
+			if (!igt_crtc_for_pipe(display, pipes[i].idx + 1)) {
+				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
+					 kmstest_pipe_name(pipes[i].idx + 1));
+				return false;
+			}
+
+			if ((i < (pipes_in_use - 1)) &&
+			    (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)) {
+				igt_info("Consecutive pipe-%s: Not free to use it as a Bigjoiner Secondary.\n",
+					 kmstest_pipe_name(pipes[i + 1].idx));
+				return false;
+			}
+		}
+
+		if ((i > 0) && (pipes[i - 1].force_joiner ||
+				igt_bigjoiner_possible(display->drm_fd, pipes[i - 1].mode, max_dotclock))) {
+			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
+				 kmstest_pipe_name(pipes[i - 1].idx),
+				 igt_output_name(pipes[i - 1].output),
+				 max_dotclock, pipes[i - 1].force_joiner ? "Yes" : "No");
+			kmstest_dump_mode(pipes[i - 1].mode);
+
+			if (!igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)) {
+				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
+					 kmstest_pipe_name(pipes[i - 1].idx + 1));
+				return false;
+			}
+
+			if (abs(pipes[i].idx - pipes[i - 1].idx) <= 1) {
+				igt_info("Consecutive pipe-%s: Not free to use it as a Bigjoiner Secondary.\n",
+					 kmstest_pipe_name(pipes[i].idx));
+				return false;
+			}
+		}
+	}
+
+	return true;
+}
+
+/**
+ * intel_pipe_output_combo_valid:
+ * @display: a pointer to an #igt_display_t structure
+ *
+ * Every individual test must use igt_output_set_crtc() before calling this
+ * helper, so that this function will get all active pipes from connected
+ * outputs (i.e. pending_crtc != NULL) and check the selected combo is
+ * valid or not.
+ *
+ * This helper is supposed to be a superset of all constraints of pipe/output
+ * combo.
+ *
+ * Example:
+ *  * Pipe-D can't support mode > 5K
+ *  * To use 8K mode on a pipe then consecutive pipe must be free.
+ *  * MSO is supported only on PIPE_A/PIPE_B.
+ *
+ * Returns: True if a valid pipe/output mode combo found, else false
+ */
+bool intel_pipe_output_combo_valid(igt_display_t *display)
+{
+	int combo = 0;
+	igt_output_t *output;
+
+	for_each_connected_output(display, output) {
+		if (!output->pending_crtc)
+			continue;
+
+		if (!igt_crtc_connector_valid(output->pending_crtc, output)) {
+			igt_info("Output %s is disconnected (or) pipe-%s & %s cannot be used together\n",
+				 igt_output_name(output),
+				 igt_crtc_name(output->pending_crtc),
+				 igt_output_name(output));
+			return false;
+		}
+
+		combo++;
+	}
+
+	if (!combo) {
+		igt_info("At least one pipe/output combo needed.\n");
+		return false;
+	}
+
+	if (!is_intel_device(display->drm_fd))
+		return true;
+
+	/*
+	 * Check the given pipe/output combo is valid for Bigjoiner.
+	 *
+	 * TODO: Update this helper to support other features like MSO.
+	 */
+	return igt_check_bigjoiner_support(display);
+}
diff --git a/lib/igt_joiner.h b/lib/igt_joiner.h
index 8fc8dd505..c4222506f 100644
--- a/lib/igt_joiner.h
+++ b/lib/igt_joiner.h
@@ -9,6 +9,44 @@
 #include "igt_kms.h"
 #include "xe/xe_query.h"
 
+#define HDISPLAY_6K_PER_PIPE 6144
+#define HDISPLAY_5K_PER_PIPE 5120
+#define MAX_UNCOMPRESSED_DOTCLOCK_DISPLAY_30 1350000
+#define MAX_UNCOMPRESSED_DOTCLOCK_WCL 937500
+
+/**
+ * joined_pipes:
+ * @JOINED_PIPES_DEFAULT: Default setting with no force joiner
+ * @JOINED_PIPES_NONE: Force to exactly one pipe
+ * @JOINED_PIPES_BIG_JOINER: Join two pipes big joiner
+ * @JOINED_PIPES_ULTRA_JOINER: Join four pipes for ultra joiner
+ */
+enum joined_pipes {
+	JOINED_PIPES_DEFAULT,
+	JOINED_PIPES_NONE,
+	JOINED_PIPES_BIG_JOINER,
+	JOINED_PIPES_ULTRA_JOINER = 4
+};
+
+bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);
+int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock);
+int intel_get_max_pipe_hdisplay(int drm_fd);
+bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
+bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int max_dotclock, drmModeModeInfo *mode);
+bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+					   int max_dotclock, drmModeModeInfo *mode);
+bool igt_is_joiner_enabled_for_pipe(int drmfd, enum hardware_pipe pipe);
+bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock);
+bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
+			  int max_dotclock, drmModeModeInfo *mode);
+bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
+drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output);
+bool is_joiner_mode(int drm_fd, igt_output_t *output);
+bool igt_check_force_joiner_status(int drmfd, char *connector_name);
+bool igt_check_bigjoiner_support(igt_display_t *display);
+bool intel_pipe_output_combo_valid(igt_display_t *display);
+
 void igt_set_all_master_pipes_for_platform(igt_display_t *display,
 					   uint32_t *master_pipes);
 bool igt_assign_pipes_for_outputs(int drm_fd,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9c4c9b8ff..1acfa4f2c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -54,6 +54,7 @@
 
 #include "drmtest.h"
 #include "igt_core.h"
+#include "igt_joiner.h"
 #include "igt_kms.h"
 #include "igt_aux.h"
 #include "igt_edid.h"
@@ -1837,66 +1838,6 @@ bool kmstest_force_connector(int drm_fd, drmModeConnector *connector,
 	return true;
 }
 
-static bool force_connector_joiner(int drm_fd,
-				      drmModeConnector *connector,
-				      const char *value)
-{
-	return connector_attr_set_debugfs(drm_fd, connector,
-					  "i915_joiner_force_enable",
-					  value, "0", false);
-}
-
-/**
- * kmstest_force_connector_joiner:
- * @fd: drm file descriptor
- * @connector: connector
- *
- * Enable force joiner state on the specified connector
- * and install exit handler for resetting
- *
- * Returns: True on success
- */
-bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes)
-{
-	const char *value;
-	drmModeConnector *temp;
-
-	switch (joined_pipes) {
-	case JOINED_PIPES_DEFAULT:
-		value = "0";
-		break;
-	case JOINED_PIPES_NONE:
-		value = "1";
-		break;
-	case JOINED_PIPES_BIG_JOINER:
-		value = "2";
-		break;
-	case JOINED_PIPES_ULTRA_JOINER:
-		value = "4";
-		break;
-	default:
-		igt_assert(0);
-	}
-
-	if (!is_intel_device(drm_fd))
-		return false;
-
-	if (!force_connector_joiner(drm_fd, connector, value))
-		return false;
-
-	dump_connector_attrs();
-	igt_install_exit_handler(reset_connectors_at_exit);
-
-	/*
-	 * To allow callers to always use GetConnectorCurrent we need to force a
-	 * redetection here.
-	 */
-	temp = drmModeGetConnector(drm_fd, connector->connector_id);
-	drmModeFreeConnector(temp);
-
-	return true;
-}
-
 /**
  * kmstest_force_edid:
  * @drm_fd: drm file descriptor
@@ -7223,532 +7164,6 @@ int igt_get_current_cdclk(int fd)
 	return read_and_parse_cdclk_debugfs(fd, "Current CD clock frequency:");
 }
 
-/**
- * intel_get_max_uncompressed_dotclock:
- * @drm_fd: drm file descriptor
- * @max_dotclock: Max pixel clock frequency
- *
- * Get the maximum pixel clock a single pipe supports without DSC. This
- * mirrors the kernel's intel_max_uncompressed_dotclock(): above this
- * limit an uncompressed mode can't be driven by a single pipe, so only
- * modes below it are guaranteed to use a single pipe irrespective of
- * DSC support in the sink.
- *
- * Returns: The maximum uncompressed pixel clock for a single pipe.
- */
-int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock)
-{
-	int dev_id = intel_get_drm_devid(drm_fd);
-	int limit = max_dotclock;
-
-	if (IS_WILDCATLAKE(dev_id))
-		limit = MAX_UNCOMPRESSED_DOTCLOCK_WCL;
-	else if (intel_display_ver(dev_id) >= 30)
-		limit = MAX_UNCOMPRESSED_DOTCLOCK_DISPLAY_30;
-
-	return min(max_dotclock, limit);
-}
-
-/**
- * intel_get_max_pipe_hdisplay:
- * @drm_fd: drm file descriptor
- *
- * Get the maximum hdisplay (width) supported by a single pipe on the
- * platform. This is a public function for querying platform capabilities.
- *
- * Returns: The maximum hdisplay supported per pipe.
- */
-int intel_get_max_pipe_hdisplay(int drm_fd)
-{
-	int dev_id = intel_get_drm_devid(drm_fd);
-
-	return (intel_display_ver(dev_id) >= 30) ? HDISPLAY_6K_PER_PIPE :
-						   HDISPLAY_5K_PER_PIPE;
-}
-
-struct joiner_mode_exception {
-	uint16_t hdisplay, vdisplay;
-	uint32_t clock;
-};
-
-static bool match_joiner_exception(drmModeModeInfo *mode,
-				   const struct joiner_mode_exception *list,
-				   int count)
-{
-	for (int i = 0; i < count; i++) {
-		if (mode->hdisplay == list[i].hdisplay &&
-		    mode->vdisplay == list[i].vdisplay &&
-		    mode->clock == list[i].clock)
-			return true;
-	}
-
-	return false;
-}
-
-/*
- * TODO: IGT cannot compute the DSC bubble overhead the driver adds to the
- * effective pixel rate, since it cannot estimate the DSC parameters -
- * whether DSC is used and how many slices. On NVL this lets modes like
- * 6144x3456@60 pass igt_bigjoiner_possible()'s clock/hdisplay checks,
- * yet the kernel still enables bigjoiner for them.
- *
- * Add mode_needs_joiner_exception() as a stopgap.
- */
-static const struct joiner_mode_exception nvl_joiner_exception_modes[] = {
-	{ 6144, 3456, 1413390 }, /* 6144x3456@60Hz */
-	{ 3840, 2160, 1543000 }, /* 3840x2160@165Hz */
-	{ 3840, 2160, 1398400 }, /* 3840x2160@160Hz */
-	{ 3840, 2160, 2291120 }, /* 3840x2160@240 */
-};
-
-/*
- * mode_needs_joiner_exception - check if a mode requires joiner via explicit exception
- * @drm_fd: drm file descriptor
- * @mode: libdrm mode
- *
- * On some platforms, a higher max_dotclock means certain modes won't trigger
- * the standard clock or hdisplay checks even though the kernel enables joiner
- * for them. Each platform has its own exception list.
- *
- * Returns: True if the mode is a known joiner exception, else False.
- */
-static bool mode_needs_joiner_exception(int drm_fd, drmModeModeInfo *mode)
-{
-	unsigned int disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
-
-	if (disp_ver == 35)
-		return match_joiner_exception(mode, nvl_joiner_exception_modes,
-					      ARRAY_SIZE(nvl_joiner_exception_modes));
-
-	return false;
-}
-
-/**
- * igt_bigjoiner_possible:
- * @drm_fd: drm file descriptor
- * @mode: libdrm mode
- * @max_dotclock: Max pixel clock frequency
- *
- * Bigjoiner is required when the requested mode exceeds single-pipe
- * platform limits, i.e. hdisplay is above the platform threshold or
- * clock is above @max_dotclock.
- *
- * Returns: True if mode requires Bigjoiner, else False.
- */
-bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
-{
-	/**
-	 * TODO: remove mode_needs_joiner_exception() once IGT can estimate
-	 * DSC parameters accurately
-	 */
-	return (mode_needs_joiner_exception(drm_fd, mode) ||
-		mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
-		mode->clock > max_dotclock);
-}
-
-/**
- * bigjoiner_mode_found:
- * @drm_fd: drm file descriptor
- * @connector: libdrm connector
- * @max_dot_clock: max dot clock frequency
- * @mode: libdrm mode to be filled
- *
- * Finds the first connector mode that requires bigjoiner support based on
- * igt_bigjoiner_possible(), while excluding modes that require ultrajoiner.
- *
- * Returns: True if a bigjoiner mode is found.
- */
-bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
-			  int max_dotclock, drmModeModeInfo *mode)
-{
-	bool found = false;
-
-	for (int i=0; i< connector->count_modes; i++) {
-		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i], max_dotclock) &&
-		    !igt_ultrajoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
-			*mode = connector->modes[i];
-			found = true;
-			break;
-		}
-	}
-	return found;
-}
-
-/**
- * intel_boundary_non_joiner_mode_found:
- * @drm_fd: drm file descriptor
- * @connector: libdrm connector
- * @max_dot_clock: max dot clock frequency
- * @mode: libdrm mode to be filled
- *
- * Check if connector supports a mode at the platform's maximum single-pipe
- * hdisplay boundary. The mode clock must be below the uncompressed single
- * pipe limit, so that the kernel doesn't fall back to joiner when the sink
- * doesn't support DSC.
- *
- * Returns: True if a valid non-joiner mode at the boundary is found,
- * false otherwise.
- */
-bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
-					  int max_dotclock, drmModeModeInfo *mode)
-{
-	int max_hdisplay = intel_get_max_pipe_hdisplay(drm_fd);
-	int max_uncompressed_dotclock = intel_get_max_uncompressed_dotclock(drm_fd, max_dotclock);
-
-	for (int i = 0; i < connector->count_modes; i++) {
-		drmModeModeInfo *current_mode = &connector->modes[i];
-
-		if (current_mode->hdisplay == max_hdisplay &&
-		    current_mode->clock < max_uncompressed_dotclock &&
-		    !mode_needs_joiner_exception(drm_fd, current_mode)) {
-			*mode = *current_mode;
-			return true;
-		}
-	}
-
-	return false;
-}
-
-/* TODO: Move these lib functions to the joiner-specific library file
- *	 once those patches are merged.
- */
-
-/**
- * igt_is_joiner_enabled_for_pipe:
- * @drmfd: A drm file descriptor
- * @pipe: display pipe
- *
- * Returns: True if joiner is enabled, false otherwise.
- */
-bool igt_is_joiner_enabled_for_pipe(int drmfd, enum hardware_pipe pipe)
-{
-	char buf[16384], master_str[64], slave_str[64];
-	int dir, res;
-	unsigned  int pipe_mask = (1 << 0) | (1 << 1);
-
-	dir = igt_debugfs_dir(drmfd);
-	igt_assert(dir >= 0);
-
-	res = igt_debugfs_simple_read(dir, "i915_display_info",
-					    buf, sizeof(buf));
-	close(dir);
-	igt_assert(res >= 0);
-	pipe_mask <<= pipe;
-
-	snprintf(master_str, sizeof(master_str),
-		 "Linked to 0x%x pipes as a master", pipe_mask);
-	snprintf(slave_str, sizeof(slave_str),
-		 "Linked to 0x%x pipes as a slave", pipe_mask);
-
-	return (strstr(buf, master_str) && strstr(buf, slave_str));
-}
-
-/**
- * igt_ultrajoiner_possible:
- * @mode: libdrm mode
- * @max_dotclock: Max pixel clock frequency
- *
- * Ultrajoiner will come into the picture, when the requested
- * mode resolution > 10K or mode clock > 2 * max_dotclock.
- *
- * Returns: True if mode requires Ultrajoiner, else False.
- */
-bool igt_ultrajoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
-{
-	return (mode->hdisplay > 2 * intel_get_max_pipe_hdisplay(drm_fd) ||
-		mode->clock > 2 * max_dotclock);
-}
-
-/**
- * Ultrajoiner_mode_found:
- * @drm_fd: drm file descriptor
- * @connector: libdrm connector
- * @max_dot_clock: max dot clock frequency
- * @mode: libdrm mode to be filled
- *
- * Ultrajoiner will come in to the picture when the
- * resolution > 10K or clock > 2 * max-dot-clock.
- *
- * Returns: True if ultra joiner found in connector modes
- */
-bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
-			  int max_dotclock, drmModeModeInfo *mode)
-{
-	bool found = false;
-
-	for (int i = 0; i < connector->count_modes; i++) {
-		if (igt_ultrajoiner_possible(drm_fd, &connector->modes[i], max_dotclock)) {
-			*mode = connector->modes[i];
-			found = true;
-			break;
-		}
-	}
-
-	return found;
-}
-
-/**
- * igt_get_non_joiner_mode:
- * @drm_fd: drm file descriptor
- * @output: pointer to the output structure
- *
- * Finds the display mode from the output that does not require
- * Big Joiner or Ultra Joiner.
- *
- * Returns: Pointer to non-joiner mode, or NULL if not found.
- */
-drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output)
-{
-	drmModeConnector *connector;
-	int max_dotclock;
-
-	connector = output->config.connector;
-	max_dotclock = igt_get_max_dotclock(drm_fd);
-
-	for (int i = 0; i < connector->count_modes; i++) {
-		drmModeModeInfo *current_mode = &connector->modes[i];
-
-		/* Check if mode requires joiner */
-		if (!igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock) &&
-		    !igt_ultrajoiner_possible(drm_fd, current_mode, max_dotclock)) {
-			return current_mode;
-		}
-	}
-
-	return NULL;
-}
-
-/**
- * is_joiner_mode:
- * @drm_fd: drm file descriptor
- * @output: pointer to the output structure
- *
- * Checks if the current configuration requires Big Joiner or Ultra Joiner mode
- * based on the maximum dot clock and connector settings.
- *
- * Returns: True if joiner mode is required, otherwise False.
- */
-bool is_joiner_mode(int drm_fd, igt_output_t *output)
-{
-	bool is_joiner = false;
-	bool is_ultra_joiner = false;
-	int max_dotclock;
-	drmModeModeInfo mode;
-
-        if (!is_intel_device(drm_fd))
-                return false;
-
-	max_dotclock = igt_get_max_dotclock(drm_fd);
-	is_joiner = bigjoiner_mode_found(drm_fd,
-					 output->config.connector,
-					 max_dotclock, &mode);
-	is_ultra_joiner = ultrajoiner_mode_found(drm_fd,
-						 output->config.connector,
-						 max_dotclock, &mode);
-
-	if (is_joiner || is_ultra_joiner)
-		return true;
-
-	return false;
-}
-
-/**
- * igt_has_force_joiner_debugfs
- * @drmfd: A drm file descriptor
- * @conn_name: Name of the connector
- *
- * Checks if the force big joiner debugfs is available
- * for a specific connector.
- *
- * Returns:
- *  true if the debugfs is available, false otherwise.
- */
-bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name)
-{
-	char buf[512];
-	int debugfs_fd, ret;
-
-	/*
-	 * bigjoiner is supported on display<= 12 with DSC only
-	 * and only on Pipe A for Display 11
-	 * For simplicity avoid Display 11 and 12, check for >= 13
-	 */
-	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 13)
-		return false;
-
-	igt_assert_f(conn_name, "Connector name cannot be NULL\n");
-	debugfs_fd = igt_debugfs_connector_dir(drmfd, conn_name, O_RDONLY);
-	if (debugfs_fd < 0)
-		return false;
-
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
-	close(debugfs_fd);
-
-	return ret >= 0;
-}
-
-/**
- * igt_check_force_joiner_status
- * @drmfd: file descriptor of the DRM device.
- * @connector_name: connector to check.
- *
- * Checks if the force joiner is enabled.
- *
- * Returns: True if the force joiner is enabled, False otherwise.
- */
-bool igt_check_force_joiner_status(int drmfd, char *connector_name)
-{
-	char buf[512];
-	int debugfs_fd, ret;
-
-	if (!connector_name)
-		return false;
-
-	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
-	if (debugfs_fd < 0) {
-		igt_debug("Could not open debugfs for connector: %s\n", connector_name);
-		return false;
-	}
-
-	ret = igt_debugfs_simple_read(debugfs_fd, "i915_joiner_force_enable", buf, sizeof(buf));
-	close(debugfs_fd);
-
-	if (ret < 0) {
-		igt_debug("Could not read i915_joiner_force_enable for connector: %s\n", connector_name);
-		return false;
-	}
-
-	return (atoi(buf) > 1);
-}
-
-/**
- * igt_check_bigjoiner_support:
- * @display: a pointer to an #igt_display_t structure
- *
- * Get all active pipes from connected outputs (i.e. pending_crtc != NULL)
- * and check those pipes supports the selected mode(s).
- *
- * Example:
- *  * Pipe-D can't support mode > 5K
- *  * To use 8K mode on a pipe then consecutive pipe must be free.
- *
- * Returns: True if a valid crtc/connector mode combo found, else false
- */
-bool igt_check_bigjoiner_support(igt_display_t *display)
-{
-	uint8_t i, pipes_in_use = 0;
-	igt_crtc_t *crtc;
-	igt_output_t *output;
-	enum hardware_pipe last_pipe = PIPE_NONE;
-	struct {
-		enum hardware_pipe idx;
-		drmModeModeInfo *mode;
-		igt_output_t *output;
-		bool force_joiner;
-	} pipes[IGT_MAX_PIPES];
-	int max_dotclock;
-
-	/* Get last pipe */
-	for_each_crtc(display, crtc) {
-		if (crtc->hardware_pipe > last_pipe)
-			last_pipe = crtc->hardware_pipe;
-	}
-
-	/*
-	 * Get list of CRTCs in use those were set by igt_output_set_crtc()
-	 * just before calling this function.
-	 */
-	for_each_connected_output(display, output) {
-		if (!output->pending_crtc)
-			continue;
-
-		pipes[pipes_in_use].idx = output->pending_crtc->hardware_pipe;
-		pipes[pipes_in_use].mode = igt_output_get_mode(output);
-		pipes[pipes_in_use].output = output;
-		pipes[pipes_in_use].force_joiner = igt_check_force_joiner_status(display->drm_fd, output->name);
-		pipes_in_use++;
-	}
-
-	if (!pipes_in_use) {
-		igt_info("We must set at least one output to pipe.\n");
-		return true;
-	}
-
-	max_dotclock = igt_get_max_dotclock(display->drm_fd);
-
-	/*
-	 * if force joiner is enabled (or) the mode requires bigjoiner,
-	 * then ignore
-	 *  - if the consecutive pipe is not available
-	 *  - last crtc in single/multi-connector config
-	 *  - consecutive crtcs in multi-connector config
-	 *
-	 * in multi-connector config ignore if
-	 *  - previous crtc (force joiner or mode requires bigjoiner) and
-	 *  - current & previous crtcs are consecutive
-	 */
-	for (i = 0; i < pipes_in_use; i++) {
-		if (pipes[i].force_joiner ||
-		    igt_bigjoiner_possible(display->drm_fd, pipes[i].mode, max_dotclock)) {
-			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
-				 kmstest_pipe_name(pipes[i].idx),
-				 igt_output_name(pipes[i].output),
-				 max_dotclock, pipes[i].force_joiner ? "Yes" : "No");
-			kmstest_dump_mode(pipes[i].mode);
-
-			if (pipes[i].idx >= last_pipe) {
-				igt_info("pipe-%s: Last pipe couldn't be used as a Bigjoiner Primary.\n",
-					 kmstest_pipe_name(pipes[i].idx));
-				return false;
-			}
-
-			for (int j = 0; j < pipes_in_use; j++) {
-				if (pipes[j].idx == pipes[i].idx + 1) {
-					igt_info("pipe-%s: Next pipe is already assigned to another output.\n",
-						 kmstest_pipe_name(pipes[j].idx));
-					return false;
-				}
-			}
-
-			if (!igt_crtc_for_pipe(display, pipes[i].idx + 1)) {
-				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
-					 kmstest_pipe_name(pipes[i].idx + 1));
-				return false;
-			}
-
-			if ((i < (pipes_in_use - 1)) &&
-			    (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)) {
-				igt_info("Consecutive pipe-%s: Not free to use it as a Bigjoiner Secondary.\n",
-					 kmstest_pipe_name(pipes[i + 1].idx));
-				return false;
-			}
-		}
-
-		if ((i > 0) && (pipes[i - 1].force_joiner ||
-				igt_bigjoiner_possible(display->drm_fd, pipes[i - 1].mode, max_dotclock))) {
-			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz), force joiner: %s\n",
-				 kmstest_pipe_name(pipes[i - 1].idx),
-				 igt_output_name(pipes[i - 1].output),
-				 max_dotclock, pipes[i - 1].force_joiner ? "Yes" : "No");
-			kmstest_dump_mode(pipes[i - 1].mode);
-
-			if (!igt_crtc_for_pipe(display, pipes[i - 1].idx + 1)) {
-				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
-					 kmstest_pipe_name(pipes[i - 1].idx + 1));
-				return false;
-			}
-
-			if (abs(pipes[i].idx - pipes[i - 1].idx) <= 1) {
-				igt_info("Consecutive pipe-%s: Not free to use it as a Bigjoiner Secondary.\n",
-					 kmstest_pipe_name(pipes[i].idx));
-				return false;
-			}
-		}
-	}
-
-	return true;
-}
-
 /**
  * igt_parse_mode_string:
  * @mode_string: modeline string
@@ -7775,61 +7190,6 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
 	return true;
 }
 
-/**
- * intel_pipe_output_combo_valid:
- * @display: a pointer to an #igt_display_t structure
- *
- * Every individual test must use igt_output_set_crtc() before calling this
- * helper, so that this function will get all active pipes from connected
- * outputs (i.e. pending_crtc != NULL) and check the selected combo is
- * valid or not.
- *
- * This helper is supposed to be a superset of all constraints of pipe/output
- * combo.
- *
- * Example:
- *  * Pipe-D can't support mode > 5K
- *  * To use 8K mode on a pipe then consecutive pipe must be free.
- *  * MSO is supported only on PIPE_A/PIPE_B.
- *
- * Returns: True if a valid pipe/output mode combo found, else false
- */
-bool intel_pipe_output_combo_valid(igt_display_t *display)
-{
-	int combo = 0;
-	igt_output_t *output;
-
-	for_each_connected_output(display, output) {
-		if (!output->pending_crtc)
-			continue;
-
-		if (!igt_crtc_connector_valid(output->pending_crtc, output)) {
-			igt_info("Output %s is disconnected (or) pipe-%s & %s cannot be used together\n",
-				 igt_output_name(output),
-				 igt_crtc_name(output->pending_crtc),
-				 igt_output_name(output));
-			return false;
-		}
-
-		combo++;
-	}
-
-	if (!combo) {
-		igt_info("At least one pipe/output combo needed.\n");
-		return false;
-	}
-
-	if (!is_intel_device(display->drm_fd))
-		return true;
-
-	/*
-	 * Check the given pipe/output combo is valid for Bigjoiner.
-	 *
-	 * TODO: Update this helper to support other features like MSO.
-	 */
-	return igt_check_bigjoiner_support(display);
-}
-
 /**
  * igt_check_output_is_dp_mst:
  * @output: Target output
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 29a4e96fc..17c6affc9 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -152,10 +152,6 @@ const char *kmstest_scaling_mode_str(int mode);
 const char *kmstest_dsc_output_format_str(int output_format);
 
 void kmstest_dump_mode(drmModeModeInfo *mode);
-#define HDISPLAY_6K_PER_PIPE 6144
-#define HDISPLAY_5K_PER_PIPE 5120
-#define MAX_UNCOMPRESSED_DOTCLOCK_DISPLAY_30 1350000
-#define MAX_UNCOMPRESSED_DOTCLOCK_WCL 937500
 
 enum hardware_pipe __intel_get_pipe_from_crtc_index(int fd, int crtc_index);
 int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
@@ -254,26 +250,11 @@ enum intel_broadcast_rgb_mode {
 
 struct edid;
 
-/**
- * joined_pipes:
- * @JOINED_PIPES_DEFAULT: Default setting with no force joiner
- * @JOINED_PIPES_NONE: Force to exactly one pipe
- * @JOINED_PIPES_BIG_JOINER: Join two pipes big joiner
- * @JOINED_PIPES_ULTRA_JOINER: Join four pipes for ultra joiner
- */
-enum joined_pipes {
-	JOINED_PIPES_DEFAULT,
-	JOINED_PIPES_NONE,
-	JOINED_PIPES_BIG_JOINER,
-	JOINED_PIPES_ULTRA_JOINER = 4
-};
-
 uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
 
 void dump_connector_attrs(void);
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
-bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);
 void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 			const struct edid *edid);
 
@@ -1383,26 +1364,9 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool igt_max_bpc_constraint(igt_display_t *display, igt_crtc_t *crtc,
 			    igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
-int intel_get_max_uncompressed_dotclock(int drm_fd, int max_dotclock);
-int intel_get_max_pipe_hdisplay(int drm_fd);
 int igt_get_max_cdclk(int fd);
 int igt_get_current_cdclk(int fd);
-bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
-bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
-			  int max_dotclock, drmModeModeInfo *mode);
-bool intel_boundary_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
-					   int max_dotclock, drmModeModeInfo *mode);
-bool igt_is_joiner_enabled_for_pipe(int drmfd, enum hardware_pipe pipe);
-bool igt_ultrajoiner_possible(int drmfd, drmModeModeInfo *mode, int max_dotclock);
-bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
-			  int max_dotclock, drmModeModeInfo *mode);
-bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
-drmModeModeInfo *igt_get_non_joiner_mode(int drm_fd, igt_output_t *output);
-bool is_joiner_mode(int drm_fd, igt_output_t *output);
-bool igt_check_force_joiner_status(int drmfd, char *connector_name);
-bool igt_check_bigjoiner_support(igt_display_t *display);
 bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
-bool intel_pipe_output_combo_valid(igt_display_t *display);
 bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int igt_crtc_num_scalers(igt_crtc_t *crtc);
diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index 48be830d8..696e89a82 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -41,6 +41,7 @@
 
 #include "drmtest.h"
 #include "igt_debugfs.h"
+#include "igt_joiner.h"
 #include "igt_kms.h"
 #include "igt_pipe_crc.h"
 #include "intel_chipset.h"
-- 
2.43.0

