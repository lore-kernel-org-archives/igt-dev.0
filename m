Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE5C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 09:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406FC10E275;
	Wed, 26 Aug 2026 09:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imjVzDVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558DD10E275
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787737986; x=1819273986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2P6Obey3nFQ+AL+LkJeTIilakvdQ6h6q3Hm2r8oVKPc=;
 b=imjVzDVz7+03rfGMykoriHop8pWV1Z7+irB8lCV7k78LKzFj17TK4xEk
 ScZyA7i5e1/Lg53+Zg/nvOGINmZ9+kVFMXSgZEl2QtYxuWCGPJufftHOp
 DRYjtATWiJaVy15397rvoPHY9bquHbQ4GsDpaQ3+fu5NGM3PDn4+M/2qG
 fsnkSCIJEcG3P3xVQUgDwh3euBa7NPF2tDr8O4BAEpnX9pc1zHFhsRyjC
 0q3YMIoLy5ukTLgd0Lfq9CkoARrZhmzCTw1CbnrcAmzt2TzEJ70BGDxm5
 p0LTV9z/8YQD4sZmYroT6W5P3E0IsbQRYBKnWNjoAsqXaN9LyNk5l5jNI Q==;
X-CSE-ConnectionGUID: arx9qUIlTU2EbeoCmtb/zQ==
X-CSE-MsgGUID: VFHe0tfLS3+neBr/Dk3DpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88344889"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88344889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:53:06 -0700
X-CSE-ConnectionGUID: M/r+IL14SdOolQAOnC8CIA==
X-CSE-MsgGUID: q6ki8ZtjRKyHDDAG1f/m5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="292388908"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 02:53:04 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [RFC 7/7] tests/chamelium/kms_chamelium_hpd: Add HPD from runtime
 suspended D3hot
Date: Wed, 26 Aug 2026 15:36:38 +0530
Message-ID: <20260826100639.273731-8-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826100639.273731-1-pranay.samala@intel.com>
References: <20260826100639.273731-1-pranay.samala@intel.com>
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

Add dp-hpd-after-runtime-suspend-d3hot and
hdmi-hpd-after-runtime-suspend-d3hot, covering a hotplug signalled by a
PME while the device is runtime suspended in D3hot. The existing
*-hpd-after-suspend subtests use system suspend instead.

Checking only that the display comes back would pass whether or not the
driver fell back to the ~10s connector poll, so the subtest runs two
phases against the same suspended device.

Phase 1 parks the device in D3hot with PME_En set and samples the D
state from the PCI Power Management Control/Status register across a
window longer than two poll periods, requiring that it never leaves
D3hot. Any resume there means polling is still enabled.

Phase 2 toggles the HPD from the chamelium and requires a prompt uevent,
an updated connector status, and an increase in
power/wakeup_active_count. The counter is what shows the device
signalled its own resume rather than the host initiating one.

Both phases report the D state, PME_Status and the counter delta on
failure rather than asserting a cause, which separates a device that
never signalled from one whose PME was not delivered and from one that
resumed and dropped the HPD afterwards.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 344 ++++++++++++++++++++++++++++
 1 file changed, 344 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index bd8731c02..0f7411556 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -33,6 +33,7 @@
  */
 
 #include "kms_chamelium_helper.h"
+#include "igt_device.h"
 
 /**
  * SUBTEST: dp-hpd-fast
@@ -114,6 +115,18 @@
  * Description: Toggle HPD during Suspend, check that uevents are sent and
  *              connector status is updated
  *
+ * SUBTEST: dp-hpd-after-runtime-suspend-d3hot
+ * Description: Toggle HPD while runtime suspended in D3hot with PME signalling
+ *              available, check that connector polling stayed disabled, that the
+ *              device woke itself up and that uevents are sent and connector
+ *              status is updated
+ *
+ * SUBTEST: hdmi-hpd-after-runtime-suspend-d3hot
+ * Description: Toggle HPD while runtime suspended in D3hot with PME signalling
+ *              available, check that connector polling stayed disabled, that the
+ *              device woke itself up and that uevents are sent and connector
+ *              status is updated
+ *
  * SUBTEST: common-hpd-after-suspend
  * Description: Toggle HPD during suspend on all connectors, check that uevents
  * 		are sent and connector status is updated
@@ -152,6 +165,33 @@
 #define HPD_TOGGLE_COUNT_DP_HDMI 15
 #define HPD_TOGGLE_COUNT_FAST 3
 
+/*
+ * The KMS helper polls connectors every 10s, so watch for longer than two poll
+ * periods: a single delayed or coalesced poll then cannot make the test pass.
+ */
+#define PME_POLL_PROOF_WINDOW_MS 25000
+/*
+ * How often to sample the D state during that window. Config space reads do not
+ * resume a device suspended into D3hot, so this catches a poll induced resume
+ * that is too brief to stand out in the runtime PM accounting.
+ */
+#define PME_D_STATE_SAMPLE_MS 100
+/*
+ * If the device never leaves D3hot, all elapsed time is accounted to
+ * runtime_suspended_time and runtime_active_time does not move at all. Allow a
+ * small amount for one unrelated wakeup rather than requiring exactly zero,
+ * while staying well under what two or three poll induced resumes would cost.
+ */
+#define PME_ACTIVE_TIME_SLACK_MS 100
+/* Tolerance for accounting granularity and usleep() overshoot. */
+#define PME_POLL_PROOF_SLACK_MS 500
+/*
+ * A PME is delivered as an interrupt, so the wake is expected to be prompt. The
+ * whole point of the feature is that this is not the ~10s a poll would take.
+ */
+#define PME_WAKE_LATENCY_MAX_MS 3000
+#define PME_HPD_TOGGLE_DELAY_MS 1000
+
 enum test_modeset_mode {
 	TEST_MODESET_ON,
 	TEST_MODESET_ON_OFF,
@@ -383,6 +423,302 @@ static void test_suspend_resume_hpd_common(chamelium_data_t *data,
 	igt_cleanup_uevents(mon);
 }
 
+/*
+ * Name a D state read back from config space, for failure messages. PMCS cannot
+ * report D3cold, so an unknown state here means the config space read itself
+ * failed - which on a device that was in D3hot most likely means it dropped to
+ * D3cold and stopped answering.
+ */
+static const char *pme_d_state_name(enum igt_acpi_d_state state)
+{
+	switch (state) {
+	case IGT_ACPI_D0:
+		return "D0";
+	case IGT_ACPI_D1:
+		return "D1";
+	case IGT_ACPI_D2:
+		return "D2";
+	case IGT_ACPI_D3Hot:
+		return "D3hot";
+	case IGT_ACPI_D3Cold:
+		return "D3cold";
+	default:
+		return "an unreadable state";
+	}
+}
+
+static void try_hpd_runtime_suspend_pme(chamelium_data_t *data,
+					struct chamelium_port *port,
+					struct pci_device *pci_dev,
+					struct udev_monitor *mon,
+					bool connected)
+{
+	drmModeConnection target_state = connected ? DRM_MODE_DISCONNECTED :
+						     DRM_MODE_CONNECTED;
+	int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
+	uint64_t susp_before, active_before, wakeups_before, wakeups_after;
+	uint64_t susp_delta, active_delta;
+	struct timespec start, end;
+	int latency;
+
+	igt_flush_uevents(mon);
+
+	igt_assert_f(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED),
+		     "Device did not runtime suspend\n");
+
+	/*
+	 * Intel graphics devices support PME in D3hot but not in D3cold. xe
+	 * chooses the target state itself, from d3cold.capable and the VRAM
+	 * usage threshold, so there is nothing to force from userspace. If the
+	 * device landed in D3cold there is no PME to observe and everything
+	 * below would only exercise the polling fallback, so skip.
+	 */
+	igt_require_f(igt_pm_pci_get_d_state(pci_dev) == IGT_ACPI_D3Hot,
+		      "Device runtime suspended into D3cold, where PME is not "
+		      "supported\n");
+
+	/*
+	 * pci_finish_runtime_suspend() sets PME_En exactly when
+	 * pci_dev_run_wake() is true for the device, which is the same
+	 * condition the driver uses to decide whether it can leave HPD
+	 * polling off. With PME_En clear, PME based hotplug signalling cannot
+	 * work at all and everything below would be measuring the polling
+	 * fallback instead.
+	 */
+	igt_assert_f(igt_pm_pci_pme_enabled(pci_dev),
+		     "PME_En is not set after suspending into D3hot\n");
+
+	/*
+	 * Phase 1: the device must stay in D3hot while idle. If the driver still
+	 * enables HPD polling, the KMS helper resumes the device every ~10s to
+	 * probe connectors.
+	 *
+	 * This is the assertion that covers the power saving the feature exists
+	 * to deliver - a hotplug-only check passes whether or not polling was
+	 * left enabled.
+	 *
+	 * Nothing here may touch drm_fd or debugfs, since that would resume the
+	 * device and invalidate the measurement. The power/runtime_*_time
+	 * attributes are PM core accounting and are safe, as are PCI config
+	 * space reads. The D state is read from config space rather than from
+	 * power/runtime_status because runtime_status only says "suspended" and
+	 * cannot tell D3hot from D3cold.
+	 */
+	susp_before = igt_pm_get_runtime_suspended_time(pci_dev);
+	active_before = igt_pm_get_runtime_active_time(pci_dev);
+	wakeups_before = igt_pm_get_wakeup_active_count(pci_dev);
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	do {
+		enum igt_acpi_d_state d_state = igt_pm_pci_get_d_state(pci_dev);
+
+		/*
+		 * Leaving D3hot is the failure, but the interesting part is who
+		 * caused it, so report that rather than assume. A resume driven
+		 * by the device itself bumps wakeup_active_count, a resume
+		 * driven by the host - the connector poll worker, or any other
+		 * driver taking a display power reference - does not.
+		 */
+		if (d_state != IGT_ACPI_D3Hot) {
+			bool self_woke;
+
+			wakeups_after = igt_pm_get_wakeup_active_count(pci_dev);
+			self_woke = wakeups_after > wakeups_before;
+
+			igt_assert_eq(igt_gettime(&end), 0);
+			igt_assert_f(false,
+				     "Device left D3hot into %s after %.0fms of "
+				     "a %dms idle window.\n"
+				     "wakeup_active_count %" PRIu64 " -> %" PRIu64
+				     ", so the resume was %s.\n%s\n",
+				     pme_d_state_name(d_state),
+				     igt_time_elapsed(&start, &end) * 1000,
+				     PME_POLL_PROOF_WINDOW_MS,
+				     wakeups_before, wakeups_after,
+				     self_woke ? "signalled by the device" :
+						 "initiated by the host",
+				     self_woke ?
+				     "No hotplug was requested yet, so this is a "
+				     "spurious or still pending PME rather than "
+				     "the polling fallback." :
+				     "The polling fallback resumes on a 10s period, "
+				     "or 1s while a delayed event is pending, so "
+				     "compare the elapsed time above: a wake at an "
+				     "unrelated delay is some other client or "
+				     "driver taking a display power reference "
+				     "rather than connector polling.");
+		}
+
+		usleep(PME_D_STATE_SAMPLE_MS * 1000);
+
+		igt_assert_eq(igt_gettime(&end), 0);
+	} while (igt_time_elapsed(&start, &end) * 1000 < PME_POLL_PROOF_WINDOW_MS);
+
+	susp_delta = igt_pm_get_runtime_suspended_time(pci_dev) - susp_before;
+	active_delta = igt_pm_get_runtime_active_time(pci_dev) - active_before;
+
+	igt_info("Idle for %dms in D3hot: suspended +%" PRIu64 "ms, active +%" PRIu64 "ms\n",
+		 PME_POLL_PROOF_WINDOW_MS, susp_delta, active_delta);
+
+	/*
+	 * Belt and braces on top of the D state sampling above, which covers
+	 * resumes shorter than the sample interval: with the device parked in
+	 * D3hot for the whole window, all of the elapsed time is accounted to
+	 * runtime_suspended_time and runtime_active_time should barely move.
+	 */
+	igt_assert_f(active_delta <= PME_ACTIVE_TIME_SLACK_MS,
+		     "Device was active for %" PRIu64 "ms of a %dms idle window, "
+		     "so it resumed for shorter than the %dms sample interval. "
+		     "Something is still waking the device while idle and the "
+		     "feature saves no power\n",
+		     active_delta, PME_POLL_PROOF_WINDOW_MS,
+		     PME_D_STATE_SAMPLE_MS);
+	igt_assert_lte(PME_POLL_PROOF_WINDOW_MS - PME_POLL_PROOF_SLACK_MS,
+		       susp_delta);
+
+	/*
+	 * Phase 2: fire the HPD and check the device wakes up promptly. The
+	 * toggle is scheduled over XMLRPC, which travels over the network and so
+	 * does not disturb the GPU while we wait for the uevent.
+	 */
+	chamelium_schedule_hpd_toggle(data->chamelium, port,
+				      PME_HPD_TOGGLE_DELAY_MS, !connected);
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	if (!chamelium_wait_for_hotplug(mon, &timeout)) {
+		enum igt_acpi_d_state d_state = igt_pm_pci_get_d_state(pci_dev);
+		bool pending = igt_pm_pci_pme_status(pci_dev);
+		const char *cause;
+
+		wakeups_after = igt_pm_get_wakeup_active_count(pci_dev);
+
+		/*
+		 * Three ways to lose a hotplug here, and config space tells them
+		 * apart. If the device is still parked with PME_Status clear it
+		 * never signalled, so the HPD did not reach the PME logic. If it
+		 * is parked with PME_Status set it did signal and nothing
+		 * acknowledged it, which is a platform problem - the PME is
+		 * delivered as an ACPI GPE, so check that the graphics device is
+		 * enabled for wakeup in /proc/acpi/wakeup. If it made it back to
+		 * D0 then the wakeup worked and the HPD was dropped afterwards,
+		 * on the driver's resume path.
+		 */
+		if (d_state == IGT_ACPI_D3Hot)
+			cause = pending ?
+				"The device signalled a PME that was never "
+				"delivered, so the PME is not reaching the OS." :
+				"The device never signalled a PME, so the HPD "
+				"is not reaching the PME logic.";
+		else
+			cause = "The device resumed but sent no uevent, so the "
+				"HPD was dropped on the resume path.";
+
+		igt_assert_f(false,
+			     "No hotplug uevent %ds after an HPD toggle in D3hot.\n"
+			     "Device is in %s, PME_Status is %s, "
+			     "wakeup_active_count %" PRIu64 " -> %" PRIu64 ".\n%s\n",
+			     CHAMELIUM_HOTPLUG_TIMEOUT,
+			     pme_d_state_name(d_state),
+			     pending ? "set" : "clear",
+			     wakeups_before, wakeups_after, cause);
+	}
+	igt_assert_eq(igt_gettime(&end), 0);
+
+	latency = igt_time_elapsed(&start, &end) * 1000 -
+		  PME_HPD_TOGGLE_DELAY_MS;
+
+	/*
+	 * wakeup_active_count incrementing means the resume was signalled by the
+	 * device itself, i.e. by a PME. Unlike PME_Status, which the PCI/PM core
+	 * clears on the way back to D0, this counter survives the resume and so
+	 * is not racy to sample here.
+	 *
+	 * Note this is deliberately not wakeup_count, which the PM core only
+	 * increments while wakeup event checking is armed for a system suspend
+	 * and which therefore never moves for a runtime resume.
+	 */
+	wakeups_after = igt_pm_get_wakeup_active_count(pci_dev);
+
+	igt_info("HPD to uevent latency %dms, wakeup_active_count %" PRIu64 " -> %" PRIu64 "\n",
+		 latency, wakeups_before, wakeups_after);
+
+	igt_assert_f(wakeups_after > wakeups_before,
+		     "power/wakeup_active_count did not increment, so the resume "
+		     "was not triggered by a PME from the device\n");
+	igt_assert_lt(latency, PME_WAKE_LATENCY_MAX_MS);
+
+	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
+	igt_assert_eq(chamelium_reprobe_connector(&data->display,
+						  data->chamelium, port),
+		      target_state);
+}
+
+static const char test_hpd_runtime_suspend_pme_desc[] =
+	"Toggle HPD while runtime suspended in D3hot with PME signalling "
+	"available, check that connector polling stayed disabled, that the "
+	"device woke itself up and that uevents are sent and connector status "
+	"is updated";
+static void test_hpd_runtime_suspend_pme(chamelium_data_t *data,
+					 struct chamelium_port *port)
+{
+	struct pci_device *pci_dev;
+	struct udev_monitor *mon;
+
+	pci_dev = igt_device_get_pci_device(data->drm_fd);
+
+	/*
+	 * Only xe reports PME capability to the display code, so on any other
+	 * driver the device would keep HPD polling enabled and phase 1 below
+	 * would fail rather than skip.
+	 */
+	igt_require(is_xe_device(data->drm_fd));
+
+	igt_require_f(igt_pm_pci_pme_supported(pci_dev, IGT_ACPI_D3Hot),
+		      "Device does not advertise PME support in D3hot\n");
+	igt_require_f(igt_pm_has_wakeup_support(pci_dev),
+		      "Device does not expose power/wakeup\n");
+	igt_require(igt_setup_runtime_pm(data->drm_fd));
+	igt_require_hpd_storm_ctl(data->drm_fd);
+
+	/*
+	 * Not for PME_En, which the runtime suspend path arms on capability
+	 * alone, but for the wakeup accounting: with power/wakeup disabled the PM
+	 * core keeps no wakeup source for the device, so the wakeup event behind
+	 * a PME goes unaccounted and power/wakeup_active_count reads back empty.
+	 */
+	igt_pm_set_wakeup_enabled(pci_dev, true);
+
+	/*
+	 * Save drm_kms_helper.poll so an earlier test cannot leave it disabled
+	 * and fake a pass in phase 1. Note that polling is deliberately left
+	 * *enabled* here: what is under test is that the driver does not
+	 * schedule connector polling when PME is available, so forcing the
+	 * module parameter off would defeat the purpose of the test.
+	 */
+	igt_require(igt_pm_kms_poll_save());
+	igt_pm_kms_poll_set(true);
+
+	/* Don't let our own toggles trip the storm detection into polling. */
+	igt_hpd_storm_set_threshold(data->drm_fd, 0);
+
+	igt_modeset_disable_all_outputs(&data->display);
+
+	mon = igt_watch_uevents();
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+
+	/* Ports are left disconnected by the reset, so plug first. */
+	try_hpd_runtime_suspend_pme(data, port, pci_dev, mon, false);
+
+	/* Now check we notice a disconnect signalled from D3hot too. */
+	try_hpd_runtime_suspend_pme(data, port, pci_dev, mon, true);
+
+	igt_cleanup_uevents(mon);
+	igt_hpd_storm_reset(data->drm_fd);
+	igt_pm_kms_poll_restore();
+	igt_pm_restore_wakeup();
+}
+
 static const char test_hpd_without_ddc_desc[] =
 	"Disable DDC on a VGA connector, check we still get a uevent on hotplug";
 static void test_hpd_without_ddc(chamelium_data_t *data,
@@ -500,6 +836,10 @@ int igt_main()
 	connector_subtest("dp-hpd-after-hibernate", DisplayPort, &data, test_suspend_resume_hpd,
 			  SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
 
+	igt_describe(test_hpd_runtime_suspend_pme_desc);
+	connector_subtest("dp-hpd-after-runtime-suspend-d3hot", DisplayPort,
+			  &data, test_hpd_runtime_suspend_pme);
+
 	igt_describe(test_hpd_storm_detect_desc);
 	connector_subtest("dp-hpd-storm", DisplayPort, &data, test_hpd_storm_detect,
 			  HPD_STORM_PULSE_INTERVAL_DP);
@@ -538,6 +878,10 @@ int igt_main()
 	connector_subtest("hdmi-hpd-after-hibernate", HDMIA, &data, test_suspend_resume_hpd,
 			  SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
 
+	igt_describe(test_hpd_runtime_suspend_pme_desc);
+	connector_subtest("hdmi-hpd-after-runtime-suspend-d3hot", HDMIA,
+			  &data, test_hpd_runtime_suspend_pme);
+
 	igt_describe(test_hpd_storm_detect_desc);
 	connector_subtest("hdmi-hpd-storm", HDMIA, &data, test_hpd_storm_detect,
 			  HPD_STORM_PULSE_INTERVAL_HDMI);
-- 
2.53.0

