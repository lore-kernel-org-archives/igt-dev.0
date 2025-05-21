Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5CDC54E92
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 05:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B6710E08D;
	Wed, 21 May 2025 05:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EW2Weijk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7921F10E08D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 05:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747806038; x=1779342038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GAnUpiKITZjxoPYvXt99iEG+Rv94EzBj8Z7PqIOxrkc=;
 b=EW2Weijk0CtHPZSFCNwVqIVB+B6Xm2jz7CUYR+LO2NY0GRnOhYEZWgO6
 S0dBY5+i6bQRKoBfWHAdwiPR5lZbElTxfVmNl8wDMvV/oJqpg7yGmpd22
 dcVsMI/JXbiuJKtK7te+Skxs/Z05WJ9qlmf/8XdP3M/5qWyhcWZXJu384
 mPXw+u1jDJkQ7ufVVootLd0FRXvp3NI+72vj2lc+oblvI7UbsxgT7ebnP
 fUexHK5jU2USjSvv2R8ofm5YBwwKFoW5cKB8x6GLn28xfyT4AbkrLujMa
 DZogduaKuI1Uxo2slDWabsqHKu/bky8OjHVxT3A0yrk46Y2s/sQjyPOnD A==;
X-CSE-ConnectionGUID: 8KB2e8EgTkah7jxVSPdnkw==
X-CSE-MsgGUID: tY2F9vfLQi6RqM+V+9mpww==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49693913"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49693913"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:40:37 -0700
X-CSE-ConnectionGUID: tCRWvn1yQlG1+qqmygFH1Q==
X-CSE-MsgGUID: owoNUwi0T+CtLe7eV8y3Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139758260"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 22:40:36 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 2/2] tests/intel/kms_usb4_switch: add test to validate
 dock/undock and switch
Date: Wed, 21 May 2025 11:26:19 +0530
Message-Id: <20250521055619.1961965-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521055619.1961965-1-kunal1.joshi@intel.com>
References: <20250521055619.1961965-1-kunal1.joshi@intel.com>
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

Add test suite that validates docking/undocking
of TBT hubs and switch from DP-ALT to TBT or vice-versa.

tbt-dock-undock : dock/undock each *Thunderbolt* port × 3,
		  checking HPD, EDIDs and a green fullscreen fb
tbt-switch-alt  : start on TBT → switch to DP-ALT → verify HPD/EDIDs/modeset                             |
alt-switch-tbt  : start on DP-ALT → switch to TBT → verify HPD/EDIDs/modeset
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_usb4_switch.c | 299 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 300 insertions(+)
 create mode 100644 tests/intel/kms_usb4_switch.c

diff --git a/tests/intel/kms_usb4_switch.c b/tests/intel/kms_usb4_switch.c
new file mode 100644
index 000000000..05a6d3651
--- /dev/null
+++ b/tests/intel/kms_usb4_switch.c
@@ -0,0 +11,304 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: kms usb4 switch
+ * Category: Display
+ * Description: Validate docking/undocking of TBT Hub and switch
+ *		from TBT mode to DP-ALT mode and vice-versa
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ */
+
+/**
+ * SUBTEST: tbt-dock-undock
+ * Description: Repeatedly dock and undock each Thunderbolt (TBT) port
+ *              `DOCK_UNDOCK_COUNT` times, verifying hot-plug events,
+ *              EDID (re)appearance and successful full modesets.
+
+ * SUBTEST: tbt-switch-alt
+ * Description: Start on a TBT port, switch the USB4 switch to a
+ *              DisplayPort-Alt-Mode (DP-ALT) port, and validate hot-plug,
+ *              EDIDs and modeset on the new path.
+
+ * SUBTEST: alt-switch-tbt
+ * Description: Start on a DP-ALT port, switch the USB4 switch back to a
+ *              TBT port, and validate hot-plug, EDIDs and modeset on the
+ *              restored path.
+ */
+
+#include <string.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <sys/types.h>
+#include <libudev.h>
+#include <drm_fourcc.h>
+#include <xf86drmMode.h>
+
+#include "igt.h"
+#include "igt_kms.h"
+#include "igt_fb.h"
+#include "igt_usb4_switch.h"
+
+#define DOCK_UNDOCK_COUNT 3
+#define HOTPLUG_TIMEOUT 20
+
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	struct udev_monitor *hotplug_mon;
+	usb4_switch_t sw;
+	struct usb4_switch_port_info *ports;
+	size_t n_ports;
+	int n_pipes;
+	int current_port;
+} data_t;
+
+static bool fit_modes_in_bw(data_t *d)
+{
+	int ret = igt_display_try_commit_atomic(&d->display,
+						DRM_MODE_ATOMIC_TEST_ONLY |
+						DRM_MODE_ATOMIC_ALLOW_MODESET,
+						NULL);
+	if (ret != 0) {
+		bool ok = igt_override_all_active_output_modes_to_fit_bw(&d->display);
+
+		igt_require_f(ok, "Cannot fit modes in available BW\n");
+	}
+	return true;
+}
+
+static void setup_pipe_on_outputs(data_t *d,
+				  igt_output_t *outputs[],
+				  int output_count)
+{
+	int i = 0;
+	enum pipe pipe;
+
+	igt_require_f(d->n_pipes >= output_count,
+		      "Need %d pipes for %d outputs\n",
+		      d->n_pipes, output_count);
+
+	for_each_pipe(&d->display, pipe) {
+		if (i >= output_count)
+			break;
+		igt_info("Assigning pipe %s → %s\n",
+			 kmstest_pipe_name(pipe),
+			 igt_output_name(outputs[i]));
+		igt_output_set_pipe(outputs[i++], pipe);
+	}
+}
+
+static bool modeset_on_edid_connectors(data_t *d,
+				       char **edids,
+				       int n_edids)
+{
+	igt_output_t *output;
+	igt_output_t *outputs[IGT_MAX_PIPES];
+	int out_cnt = 0;
+	drmModeModeInfo * modes[IGT_MAX_PIPES];
+	struct igt_fb fbs[IGT_MAX_PIPES];
+	struct igt_plane *primaries[IGT_MAX_PIPES];
+	int i;
+
+	/* Find all connected outputs whose EDID matches this port */
+	for_each_connected_output(&d->display, output) {
+		for (i = 0; i < n_edids; i++) {
+			if (usb4_switch_port_has_edid(d->drm_fd,
+						      d->current_port,
+						      edids[i])) {
+				outputs[out_cnt++] = output;
+				igt_info("Port %d → connector %s (EDID %s)\n",
+					 d->current_port, igt_output_name(output),
+					 edids[i]);
+				break;
+			}
+		}
+	}
+	igt_require_f(out_cnt > 0, "No connectors found for EDIDs on port %d\n",
+		      d->current_port);
+
+	/* Reset display and assign pipes */
+	igt_display_reset(&d->display);
+	setup_pipe_on_outputs(d, outputs, out_cnt);
+
+	/* Create simple color framebuffers on each plane */
+	for (i = 0; i < out_cnt; i++) {
+		modes[i] = igt_output_get_mode(outputs[i]);
+		primaries[i] = igt_output_get_plane_type(outputs[i],
+							 DRM_PLANE_TYPE_PRIMARY);
+		igt_create_color_fb(d->drm_fd,
+				    modes[i]->hdisplay,
+				    modes[i]->vdisplay,
+				    DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_LINEAR,
+				    0.0, 1.0, 0.0,
+				    &fbs[i]);
+		igt_plane_set_fb(primaries[i], &fbs[i]);
+	}
+
+	/* Fit modes in available bandwidth */
+	igt_require_f(fit_modes_in_bw(d),
+		      "Failed BW fit on port %d\n",
+		      d->current_port);
+
+	/* Commit the atomic modeset */
+	igt_display_commit2(&d->display, COMMIT_ATOMIC);
+	return true;
+}
+
+/**
+ * Returns the index of the first port whose .type matches 'type', or -1.
+ */
+static int find_port_by_type(data_t *d, const char *type)
+{
+	for (size_t i = 0; i < d->n_ports; i++)
+		igt_info("Configured port: %s (looking for %s)\n",
+			 d->ports[i].type, type);
+
+	for (size_t i = 0; i < d->n_ports; i++) {
+		if (strcmp(d->ports[i].type, type) == 0)
+			return i;
+	}
+	return -1;
+}
+
+/**
+ * Perform a dock/undock or switch action on @port_id:
+ *  - set the switch
+ *  - wait for hotplug
+ *  - verify EDID presence/absence
+ *  - full modeset on connectors for that port (only on dock)
+ */
+static void port_action(data_t *d, int port_id,
+			char **edids, int n_edids,
+			bool connect, bool reset)
+{
+	const char *verb = connect ? "Docking" : "Undocking";
+
+	d->hotplug_mon = igt_watch_uevents();
+	igt_assert(d->hotplug_mon);
+	igt_info(" → %s (port %d)\n", verb, port_id);
+
+	/* Trigger the switch */
+	igt_assert_eq(usb4_switch_set_port(&d->sw, port_id), 0);
+	if (!reset)
+		igt_assert(igt_hotplug_detected(d->hotplug_mon, HOTPLUG_TIMEOUT));
+	igt_flush_uevents(d->hotplug_mon);
+	for (int e = 0; e < n_edids; e++) {
+		bool present = usb4_switch_port_has_edid(d->drm_fd, port_id, edids[e]);
+
+		if (!reset) {
+			if (connect)
+				igt_assert_f(present, "EDID %s not found after dock on port %d\n",
+					     edids[e], port_id);
+			else
+				igt_assert_f(!present, "EDID %s still present after undock on port %d\n",
+					     edids[e], port_id);
+		}
+	}
+
+	if (connect) {
+		d->current_port = port_id;
+		igt_assert_f(modeset_on_edid_connectors(d, edids, n_edids),
+			     "Modeset failed for port %d after EDID check\n",
+			     port_id);
+	}
+}
+
+/**
+ * For a single port @p, repeat dock/undock DOCK_UNDOCK_COUNT times.
+ */
+static void test_dock_undock(data_t *d,
+			     struct usb4_switch_port_info *p)
+{
+	/* initial undock */
+	port_action(d, 0, p->edids, p->n_edids, false, true);
+
+	for (int rep = 0; rep < DOCK_UNDOCK_COUNT; rep++) {
+		igt_info("Iteration %d/%d on %s\n", rep+1, DOCK_UNDOCK_COUNT, p->name);
+		port_action(d, p->port_id, p->edids, p->n_edids, true, false);
+		port_action(d, 0, p->edids, p->n_edids, false, false);
+	}
+}
+
+/**
+ * Switch from src to dst port, verifying connectors at each step.
+ */
+static void test_switch(data_t *d,
+			struct usb4_switch_port_info *src,
+			struct usb4_switch_port_info *dst)
+{
+	/* dock src, then switch to dst */
+	port_action(d, src->port_id, src->edids, src->n_edids, true, false);
+	port_action(d, dst->port_id, dst->edids, dst->n_edids, true, false);
+}
+
+igt_main
+{
+	data_t data = {};
+
+	igt_fixture {
+		enum pipe p;
+
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		igt_assert(data.drm_fd >= 0);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+		data.n_pipes = 0;
+		for_each_pipe(&data.display, p)
+			data.n_pipes++;
+
+		if (!usb4_switch_load_config())
+			igt_skip("No USB4Switch section in ~/.igtrc\n");
+
+		data.ports = usb4_switch_list_ports(&data.n_ports);
+		igt_require(data.n_ports > 0);
+
+		igt_assert_eq(usb4_switch_open(&data.sw), 0);
+	}
+
+	igt_subtest_with_dynamic("tbt-dock-undock") {
+		bool saw = false;
+
+		for (size_t i = 0; i < data.n_ports; i++) {
+			if (strcmp(data.ports[i].type, "TBT") != 0)
+				continue;
+			saw = true;
+			igt_dynamic_f("%s", data.ports[i].name)
+				test_dock_undock(&data, &data.ports[i]);
+		}
+		if (!saw)
+			igt_skip("No TBT ports configured\n");
+	}
+
+	igt_subtest("tbt-switch-alt") {
+		int tbt = find_port_by_type(&data, "TBT");
+		int alt = find_port_by_type(&data, "DP-ALT");
+
+		igt_require_f(tbt != -1 && alt != -1,
+			      "Need one TBT and one DP-ALT port configured\n");
+		test_switch(&data, &data.ports[tbt], &data.ports[alt]);
+	}
+
+	igt_subtest("alt-switch-tbt") {
+		int tbt = find_port_by_type(&data, "TBT");
+		int alt = find_port_by_type(&data, "DP-ALT");
+
+		igt_require_f(tbt != -1 && alt != -1,
+			      "Need one TBT and one DP-ALT port configured\n");
+		test_switch(&data, &data.ports[alt], &data.ports[tbt]);
+	}
+
+	igt_fixture {
+		usb4_switch_close(&data.sw);
+		usb4_switch_free_port_info(data.ports, data.n_ports);
+		usb4_switch_unload_config();
+
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+		udev_monitor_unref(data.hotplug_mon);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 55bcf57ec..19a7a5ad6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -270,6 +270,7 @@ intel_kms_progs = [
 	'kms_psr2_su',
 	'kms_psr_stress_test',
 	'kms_pwrite_crc',
+        'kms_usb4_switch',
 ]
 
 intel_xe_progs = [
-- 
2.25.1

