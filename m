Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4342C79F9E
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 14:12:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0BF8905A;
	Mon,  7 Sep 2026 14:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ic7Df+SR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B28710E851
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788790161; x=1820326161;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0vTjPGznJ1Q2ffnbP8VMPsCptHt9Z+RBk33ZB+9qdQE=;
 b=Ic7Df+SRibPSk9+T1/5Ji/bXTKkQHHIFegDWT7gzodejmJWTqL9R358D
 YwzR9VuS/dkjppfbR8CMYwHVMGdxbtRcYOBzCax9Z9iIPLa8AnSaAzBr+
 T7ZNB6YNwaRf/8gj+4epDOy+KD62bNAK46W4UP0Rko+0jSIzrwFpYGw7H
 s1rYJFlGRImUobHRyYw8jPPG3nwxuyfNybJYdRgeWOAjDLN+mhPirqIud
 y8MnH+UPuGlKEcBeeHmSvbi8POuABkjfk5o+3ZYgNfCIcvY1LAhxs0bP6
 BsX3KdXs23YvPZMyy54ShfeT8iIXS8aTK/+TvK/SG6qNKsH2YIIv4CkJ8 w==;
X-CSE-ConnectionGUID: 3pInvqN3QdW7JfuRNyR/6A==
X-CSE-MsgGUID: NWQqu4PNQyWG5aOTCX5ucg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100355110"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="100355110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 07:09:21 -0700
X-CSE-ConnectionGUID: /ufDCXpHTnSR7TA/UMkQqw==
X-CSE-MsgGUID: M+2M1n5vR7aXuHjSLRaG6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274522354"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 07:09:18 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 7/7] tests/chamelium/kms_chamelium_hpd: Add HPD from
 runtime suspended D3hot
Date: Mon,  7 Sep 2026 19:52:59 +0530
Message-ID: <20260907142259.750528-8-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907142259.750528-1-pranay.samala@intel.com>
References: <20260907142259.750528-1-pranay.samala@intel.com>
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
index bd8731c02..1135019c4 100644
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
+ * report D3cold - a device in D3cold is resumed by the read itself and answers
+ * as D0 - so an unknown state here means the read failed outright, i.e. the
+ * device has gone away.
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
+	uint64_t wakeups_at_toggle;
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
+	 * Intel graphics devices support PME in D3hot but not in D3cold, and xe
+	 * chooses the target state itself, so there is nothing to force from
+	 * userspace. In practice an integrated device always lands in D3hot,
+	 * since xe needs an ACPI _PR3 power resource on the upstream port before
+	 * it considers D3cold at all. Check anyway: on a device that did drop to
+	 * D3cold there is no PME to observe and everything below would only
+	 * exercise the polling fallback, so skip.
+	 *
+	 * A device in D3cold answers this read as D0 rather than as D3cold, for
+	 * the reason described above pme_d_state_name(), which fails the check
+	 * just the same.
+	 */
+	igt_require_f(igt_pm_pci_get_d_state(pci_dev) == IGT_ACPI_D3Hot,
+		      "Device is not suspended in D3hot, so there is no PME to "
+		      "observe\n");
+
+	/*
+	 * PME_En is the direct sign that the feature engaged; without it, the test
+	 * would only be measuring the polling fallback.
+	 */
+	igt_assert_f(igt_pm_pci_pme_enabled(pci_dev),
+		     "PME_En is not set after suspending into D3hot\n");
+
+	/*
+	 * Phase 1: ensure the device stays in D3hot while idle. If polling remains on,
+	 * the KMS helper will resume it to probe connectors.
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
+		 * Distinguish self-woken resumes from host-driven ones. A self-wakeup bumps
+		 * wakeup_active_count; a host-driven resume does not.
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
+	 *
+	 * Take a fresh wakeup baseline rather than reusing the one from phase 1,
+	 * which is a whole idle window old by now. Phase 1 only requires that
+	 * the device stayed in D3hot, which a PME that resumed nothing at all
+	 * would not violate, so the counter is not guaranteed to be unchanged.
+	 */
+	wakeups_at_toggle = igt_pm_get_wakeup_active_count(pci_dev);
+
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
+		 * If the device stays in D3hot, the wake is from PME. If it returns to D0,
+		 * the HPD was handled by the driver resume path.
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
+			     wakeups_at_toggle, wakeups_after, cause);
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
+	 */
+	wakeups_after = igt_pm_get_wakeup_active_count(pci_dev);
+
+	igt_info("HPD to uevent latency %dms, wakeup_active_count %" PRIu64 " -> %" PRIu64 "\n",
+		 latency, wakeups_at_toggle, wakeups_after);
+
+	igt_assert_f(wakeups_after > wakeups_at_toggle,
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
+/*
+ * Mirror of the driver's own HAS_PM_PME_SUPPORT(): only xe reports PME
+ * capability to the display code, and only from graphics IP 35.10 on.
+ */
+#define PME_HPD_MIN_GRAPHICS_VERX100 3500
+
+static bool pme_hpd_supported(int fd)
+{
+	const struct intel_device_info *info;
+
+	if (!is_xe_device(fd))
+		return false;
+
+	info = intel_get_device_info(intel_get_drm_devid(fd));
+
+	return info->graphics_ver * 100 + info->graphics_rel >=
+	       PME_HPD_MIN_GRAPHICS_VERX100;
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
+	 * Without driver support the device keeps HPD polling enabled and phase
+	 * 1 would fail rather than skip, so gate on the platform before looking
+	 * at the hardware capability at all.
+	 */
+	igt_require_f(pme_hpd_supported(data->drm_fd),
+		      "Driver does not use PME for HPD on this platform\n");
+
+	igt_require_f(igt_pm_pci_pme_supported(pci_dev, IGT_ACPI_D3Hot),
+		      "Device does not advertise PME support in D3hot\n");
+	igt_require_f(igt_pm_has_wakeup_support(pci_dev),
+		      "Device does not expose power/wakeup\n");
+	igt_require(igt_setup_runtime_pm(data->drm_fd));
+	igt_require_hpd_storm_ctl(data->drm_fd);
+
+	/*
+	 * Need both: PME is only armed when device_may_wakeup() is true, and
+	 * without wakeup support the PM core never records the PME wakeup.
+	 */
+	igt_pm_set_wakeup_enabled(pci_dev, true);
+
+	/*
+	 * Save the poll setting so a previous test cannot leave it disabled and
+	 * fake a pass. Polling must stay enabled; the test checks that the driver
+	 * does not use it when PME is available.
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

