Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF955606A325
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pd6S/WCS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F10A10E270;
	Tue, 20 Oct 2026 14:16:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C3C10E270
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792505534; x=1824041534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1msm4NpwNI87E2I3Ds677diSxww9PAd08syI9bMv+cs=;
 b=Pd6S/WCStgKBJ2St69Nz3h6QEGsla7gmYS0O0j5NURMuXPNAl0Ui1wG8
 ftkR955ZC2l6JR22aV7Zn+BZ5cTHRXC7TRCNlD29ZDawmXEbMLVqEnE5B
 Vysr39xgHH57i/x6/Yn3ZO+fVFKO+rSoLqhVrBED/BgCLCwoQFl6P7kjv
 Cz7la/pjH3FB1Bax+41t+VsFbu/hkX2sRqoUM8U19o7fXYxT1ChYTBsJG
 2RTQtEMg8uRePul+EIfmRgT6ZGFtsPPTqhBfgVKbi4lHCp2LAnp2qQVPd
 2mKajhQTzZm104IaudjwZUkICkDwoTAZBA1KFztBU7w4nWUjzt8E4dwXY w==;
X-CSE-ConnectionGUID: oxvYxTPcRPqFTa3emS8k1g==
X-CSE-MsgGUID: 2bMNY4YOQautI4LKF8K+uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1309593"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1309593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:13 -0700
X-CSE-ConnectionGUID: fyCginL8Teivxqgvahz5BQ==
X-CSE-MsgGUID: bK1/PUAmQ0mN6h2TyskMMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2775767"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:12:12 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 7/7] tests/chamelium/kms_chamelium_hpd: Add HPD from
 runtime suspended D3hot
Date: Tue, 20 Oct 2026 19:41:51 +0530
Message-ID: <20261020141151.753331-8-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020141151.753331-1-pranay.samala@intel.com>
References: <20261020141151.753331-1-pranay.samala@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add dp-hpd-after-runtime-suspend-d3hot and
hdmi-hpd-after-runtime-suspend-d3hot, covering a hotplug signalled by a
PME while the device is runtime suspended in D3hot.

Checking only that the display comes back would pass even if the driver
fell back to the ~10s connector poll, so the subtest also checks that
polling stays off:

- Control: with power/wakeup disabled, so PME is not armed, the device
  must be seen to wake from polling within two poll periods. This
  proves polling is live and the wake detection works, and measures
  what one poll wake costs. Skip if polling is not running.
- Phase 1: with PME armed, the device must stay in D3hot for 25s.
- Phase 2: an HPD plug and unplug must each give a prompt uevent, an
  updated connector status and an increment of
  power/wakeup_active_count, showing the device woke itself.

D3hot is decided once up front, skipping if the device suspends into
D3cold. On failure the D state, PME_Status and counter delta are
reported. All state changed by the subtest is restored on success,
failure and skip.

v3:
- Decide D3hot once and assert it per try (Kunal)
- Settle before baselines, watch the idle window once (Kunal)
- Add the control run without PME (Kunal)
- Flush uevents right before the toggle, assert latency >= 0 (Kunal)
- Check requirements before changing state, restore on failure (Kunal)
- igt_fail_on_f(), igt_assert_lte_u64(), intel_graphics_ver()/IP_VER(),
  fix the latency, D3cold and IP version comments (Kunal)
- Follow the lib changes: error returns, int64_t wakeup count,
  igt_kms_poll_*() names, xe notes moved here

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 528 ++++++++++++++++++++++++++++
 1 file changed, 528 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index bd8731c02..a8592ef01 100644
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
@@ -152,6 +165,47 @@
 #define HPD_TOGGLE_COUNT_DP_HDMI 15
 #define HPD_TOGGLE_COUNT_FAST 3
 
+/*
+ * The KMS helper polls connectors every 10s, so watch for longer than two poll
+ * periods: a single delayed or coalesced poll then cannot make the test pass.
+ */
+#define PME_POLL_PROOF_WINDOW_MS 25000
+/*
+ * How long the control run, with PME not armed, waits for a poll induced
+ * resume: two poll periods.
+ */
+#define PME_POLL_CONTROL_WINDOW_MS 20000
+/*
+ * How often to sample the D state and runtime_active_time while watching a
+ * suspended device. Config space reads do not resume a device in D3hot.
+ */
+#define PME_D_STATE_SAMPLE_MS 100
+/*
+ * Upper bound on the runtime_active_time the device may accrue while idle, to
+ * allow for one unrelated wakeup rather than requiring exactly zero. The bound
+ * actually applied is the lower of this and the cost of one poll induced
+ * resume, as measured by the control run, so that the two or more polls a
+ * still polling driver makes during the window always exceed it.
+ */
+#define PME_ACTIVE_TIME_SLACK_MS 100
+/* Tolerance for accounting granularity and usleep() overshoot. */
+#define PME_POLL_PROOF_SLACK_MS 500
+/*
+ * How long to leave the device suspended before measuring anything, so that
+ * work left over from the previous step, such as the 1s HPD retry or a resume
+ * of a linked device like HDA, is not blamed on polling.
+ */
+#define PME_SETTLE_MS 3000
+/*
+ * A PME reaches the PCI core either as an interrupt, through native PCIe PME
+ * or an ACPI GPE, or, without either route, through the PCI core's own PME
+ * poll, which runs every 1s. Either way the wake is expected within a couple of
+ * seconds. The whole point of the feature is that this is not the ~10s a
+ * connector poll would take.
+ */
+#define PME_WAKE_LATENCY_MAX_MS 3000
+#define PME_HPD_TOGGLE_DELAY_MS 1000
+
 enum test_modeset_mode {
 	TEST_MODESET_ON,
 	TEST_MODESET_ON_OFF,
@@ -383,6 +437,466 @@ static void test_suspend_resume_hpd_common(chamelium_data_t *data,
 	igt_cleanup_uevents(mon);
 }
 
+/*
+ * Name a D state for failure messages. igt_pm_pci_get_d_state() reports D3cold
+ * from the kernel's power_state without touching config space, so an unknown
+ * state here means the config space read failed, i.e. the device has gone away.
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
+/*
+ * State changed by the PME subtest that has no exit handler of its own.
+ * pme_hpd_cleanup() puts it back, together with power/wakeup and
+ * drm_kms_helper.poll, both at the end of the subtest and from a fixture after
+ * it, so that a failure or skip does not leave the next subtest running with it.
+ */
+static struct {
+	struct udev_monitor *mon;
+	bool storm_set;
+} pme_hpd;
+
+static void pme_hpd_cleanup(int drm_fd)
+{
+	if (pme_hpd.mon) {
+		igt_cleanup_uevents(pme_hpd.mon);
+		pme_hpd.mon = NULL;
+	}
+
+	if (pme_hpd.storm_set) {
+		igt_hpd_storm_reset(drm_fd);
+		pme_hpd.storm_set = false;
+	}
+
+	igt_kms_poll_restore();
+	igt_pm_restore_wakeup();
+}
+
+/*
+ * Read power/wakeup_active_count. It only exists while power/wakeup is enabled,
+ * which the test keeps it from before it takes any baseline, so a missing count
+ * means something else disabled it and no comparison would mean anything.
+ */
+static int64_t pme_wakeup_count(struct pci_device *pci_dev)
+{
+	int64_t count = igt_pm_get_wakeup_active_count(pci_dev);
+
+	igt_assert_f(count >= 0,
+		     "power/wakeup_active_count is unavailable, so power/wakeup "
+		     "was disabled during the test\n");
+
+	return count;
+}
+
+/*
+ * Wait for the device to runtime suspend, leave it alone for PME_SETTLE_MS so
+ * that work left over from the previous step can finish, and wait again in case
+ * that work resumed it.
+ */
+static void pme_wait_settled(void)
+{
+	igt_assert_f(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED),
+		     "Device did not runtime suspend\n");
+	usleep(PME_SETTLE_MS * 1000);
+	igt_assert_f(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED),
+		     "Device did not runtime suspend\n");
+}
+
+/*
+ * Whether PME is armed, and so whether the driver polls connectors, is decided
+ * on every runtime suspend. After changing power/wakeup, resume the device once
+ * so that the next suspend picks up the new value. Probing the connector takes
+ * a display power reference, which does exactly that.
+ */
+static void pme_cycle_runtime_pm(chamelium_data_t *data,
+				 struct chamelium_port *port)
+{
+	chamelium_reprobe_connector(&data->display, data->chamelium, port);
+	pme_wait_settled();
+}
+
+/*
+ * Watch a runtime suspended device for up to @window_ms, sampling every
+ * PME_D_STATE_SAMPLE_MS. The device counts as woken once it is seen outside
+ * D3hot, or once it has accrued more than @active_limit_ms of
+ * runtime_active_time, which also catches resumes too brief to be sampled.
+ *
+ * Returns the time in ms at which the device was seen to wake, or -1 if it did
+ * not. @d_state and @active_ms hold the last sample.
+ */
+static int pme_watch_for_wake(struct pci_device *pci_dev, int window_ms,
+			      uint64_t active_limit_ms,
+			      enum igt_acpi_d_state *d_state,
+			      uint64_t *active_ms)
+{
+	uint64_t active_before = igt_pm_get_runtime_active_time(pci_dev);
+	struct timespec start, now;
+	int elapsed;
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	for (;;) {
+		*d_state = igt_pm_pci_get_d_state(pci_dev);
+		*active_ms = igt_pm_get_runtime_active_time(pci_dev) -
+			     active_before;
+
+		igt_assert_eq(igt_gettime(&now), 0);
+		elapsed = igt_time_elapsed(&start, &now) * 1000;
+
+		if (*d_state != IGT_ACPI_D3Hot || *active_ms > active_limit_ms)
+			return elapsed;
+		if (elapsed >= window_ms)
+			return -1;
+
+		usleep(PME_D_STATE_SAMPLE_MS * 1000);
+	}
+}
+
+/*
+ * Control run, with PME not armed. The driver then falls back to polling
+ * connectors while runtime suspended, so the device has to be seen to wake
+ * within two poll periods. That proves polling is live on this setup and that
+ * pme_watch_for_wake() catches a poll induced resume, so that the same check
+ * passing with PME armed means something. The only difference between the two
+ * runs is whether PME is armed.
+ *
+ * Returns the runtime_active_time in ms that one poll induced resume costs.
+ */
+static uint64_t pme_measure_poll_wake(chamelium_data_t *data,
+				      struct chamelium_port *port,
+				      struct pci_device *pci_dev)
+{
+	enum igt_acpi_d_state d_state;
+	uint64_t active_before, active_ms;
+	int pme_en, woke_ms;
+
+	/*
+	 * xe arms PME from its runtime suspend hook with pci_enable_wake(), which
+	 * refuses unless device_may_wakeup(), i.e. unless power/wakeup is
+	 * enabled. xe also saves the PCI state itself, so the PCI/PM core does
+	 * not arm PME on its behalf either. Disabling power/wakeup is therefore
+	 * enough to runtime suspend without PME.
+	 */
+	igt_pm_set_wakeup_enabled(pci_dev, false);
+	pme_cycle_runtime_pm(data, port);
+
+	pme_en = igt_pm_pci_pme_enabled(pci_dev);
+	igt_assert_f(pme_en == 0, "PME_En is %s with power/wakeup disabled\n",
+		     pme_en < 0 ? "unreadable" : "set");
+
+	active_before = igt_pm_get_runtime_active_time(pci_dev);
+	woke_ms = pme_watch_for_wake(pci_dev, PME_POLL_CONTROL_WINDOW_MS, 0,
+				     &d_state, &active_ms);
+	igt_skip_on_f(woke_ms < 0,
+		      "Device stayed suspended for %dms with PME not armed, so "
+		      "connector polling is not running and cannot be told apart "
+		      "from PME\n", PME_POLL_CONTROL_WINDOW_MS);
+
+	/* Let the resume complete, so that its whole cost is accounted. */
+	igt_assert_f(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED),
+		     "Device did not runtime suspend again after a poll\n");
+	active_ms = igt_pm_get_runtime_active_time(pci_dev) - active_before;
+
+	igt_info("Without PME the device woke after %dms, %s, and one poll "
+		 "costs %" PRIu64 "ms active\n", woke_ms,
+		 d_state != IGT_ACPI_D3Hot ? "seen outside D3hot" :
+					     "seen as active time",
+		 active_ms);
+
+	return active_ms;
+}
+
+static void try_hpd_runtime_suspend_pme(chamelium_data_t *data,
+					struct chamelium_port *port,
+					struct pci_device *pci_dev,
+					struct udev_monitor *mon,
+					bool connected, bool check_idle,
+					uint64_t active_limit_ms)
+{
+	drmModeConnection target_state = connected ? DRM_MODE_DISCONNECTED :
+						     DRM_MODE_CONNECTED;
+	int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
+	enum igt_acpi_d_state d_state;
+	int64_t wakeups_before, wakeups_after;
+	uint64_t susp_before, susp_delta, active_ms;
+	struct timespec start, end;
+	int pme_en, pending, woke_ms, latency;
+	const char *cause = NULL;
+	bool hotplugged;
+
+	pme_wait_settled();
+
+	/*
+	 * Whether the device suspends into D3hot at all was decided up front, so
+	 * finding it anywhere else now means something woke it, which is a
+	 * failure rather than a reason to skip.
+	 */
+	d_state = igt_pm_pci_get_d_state(pci_dev);
+	igt_assert_f(d_state == IGT_ACPI_D3Hot,
+		     "Device is in %s rather than D3hot after runtime suspending\n",
+		     pme_d_state_name(d_state));
+
+	/*
+	 * PME_En is the direct sign that the feature engaged; without it, the test
+	 * would only be measuring the polling fallback.
+	 */
+	pme_en = igt_pm_pci_pme_enabled(pci_dev);
+	igt_assert_f(pme_en == 1, "PME_En is %s after suspending into D3hot\n",
+		     pme_en < 0 ? "unreadable" : "not set");
+
+	if (check_idle) {
+		bool self_woke;
+
+		/*
+		 * Phase 1: ensure the device stays in D3hot while idle. If polling
+		 * remains on, the KMS helper will resume it to probe connectors.
+		 */
+		wakeups_before = pme_wakeup_count(pci_dev);
+		susp_before = igt_pm_get_runtime_suspended_time(pci_dev);
+
+		woke_ms = pme_watch_for_wake(pci_dev, PME_POLL_PROOF_WINDOW_MS,
+					     active_limit_ms, &d_state,
+					     &active_ms);
+
+		/*
+		 * Distinguish self-woken resumes from host-driven ones. A
+		 * self-wakeup bumps wakeup_active_count; a host-driven resume
+		 * does not.
+		 */
+		wakeups_after = pme_wakeup_count(pci_dev);
+		self_woke = wakeups_after > wakeups_before;
+
+		igt_fail_on_f(woke_ms >= 0,
+			      "Device woke after %dms of a %dms idle window: it "
+			      "is in %s and was active for %" PRIu64 "ms, %" PRIu64
+			      "ms allowed.\n"
+			      "wakeup_active_count %" PRId64 " -> %" PRId64
+			      ", so the resume was %s.\n%s\n",
+			      woke_ms, PME_POLL_PROOF_WINDOW_MS,
+			      pme_d_state_name(d_state), active_ms,
+			      active_limit_ms, wakeups_before, wakeups_after,
+			      self_woke ? "signalled by the device" :
+					  "initiated by the host",
+			      self_woke ?
+			      "No hotplug was requested yet, so this is a "
+			      "spurious or still pending PME rather than the "
+			      "polling fallback." :
+			      "The polling fallback resumes on a 10s period, or "
+			      "1s while a delayed event is pending, so compare "
+			      "the elapsed time above: a wake at an unrelated "
+			      "delay is some other client or driver taking a "
+			      "display power reference rather than connector "
+			      "polling.");
+
+		susp_delta = igt_pm_get_runtime_suspended_time(pci_dev) -
+			     susp_before;
+
+		igt_info("Idle for %dms in D3hot: suspended +%" PRIu64
+			 "ms, active +%" PRIu64 "ms\n",
+			 PME_POLL_PROOF_WINDOW_MS, susp_delta, active_ms);
+
+		igt_assert_lte_u64(PME_POLL_PROOF_WINDOW_MS -
+				   PME_POLL_PROOF_SLACK_MS, susp_delta);
+	}
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
+	 *
+	 * Flush uevents only now, right before the toggle, so that one sent
+	 * during the steps above cannot satisfy the wait, and start the clock
+	 * before the XMLRPC call, so that the latency cannot come out negative.
+	 */
+	wakeups_before = pme_wakeup_count(pci_dev);
+	igt_flush_uevents(mon);
+
+	igt_assert_eq(igt_gettime(&start), 0);
+	chamelium_schedule_hpd_toggle(data->chamelium, port,
+				      PME_HPD_TOGGLE_DELAY_MS, !connected);
+	hotplugged = chamelium_wait_for_hotplug(mon, &timeout);
+	igt_assert_eq(igt_gettime(&end), 0);
+
+	d_state = IGT_ACPI_UNKNOWN_STATE;
+	pending = -1;
+	wakeups_after = -1;
+	if (!hotplugged) {
+		d_state = igt_pm_pci_get_d_state(pci_dev);
+		pending = igt_pm_pci_pme_status(pci_dev);
+		wakeups_after = igt_pm_get_wakeup_active_count(pci_dev);
+
+		/*
+		 * If the device stays in D3hot, the wake is from PME. If it
+		 * returns to D0, the HPD was handled by the driver resume path.
+		 */
+		if (d_state != IGT_ACPI_D3Hot)
+			cause = "The device resumed but sent no uevent, so the "
+				"HPD was dropped on the resume path.";
+		else if (pending < 0)
+			cause = "PME_Status could not be read, so whether the "
+				"device signalled a PME is unknown.";
+		else if (pending)
+			cause = "The device signalled a PME that was never "
+				"delivered, so the PME is not reaching the OS.";
+		else
+			cause = "The device never signalled a PME, so the HPD "
+				"is not reaching the PME logic.";
+	}
+	igt_fail_on_f(!hotplugged,
+		      "No hotplug uevent %ds after an HPD toggle in D3hot.\n"
+		      "Device is in %s, PME_Status is %s, "
+		      "wakeup_active_count %" PRId64 " -> %" PRId64 ".\n%s\n",
+		      CHAMELIUM_HOTPLUG_TIMEOUT, pme_d_state_name(d_state),
+		      pending < 0 ? "unreadable" : pending ? "set" : "clear",
+		      wakeups_before, wakeups_after, cause);
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
+	wakeups_after = pme_wakeup_count(pci_dev);
+
+	igt_info("HPD to uevent latency %dms, wakeup_active_count %" PRId64
+		 " -> %" PRId64 "\n", latency, wakeups_before, wakeups_after);
+
+	igt_assert_f(wakeups_after > wakeups_before,
+		     "power/wakeup_active_count did not increment, so the resume "
+		     "was not triggered by a PME from the device\n");
+	igt_assert_lte(0, latency);
+	igt_assert_lt(latency, PME_WAKE_LATENCY_MAX_MS);
+
+	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
+	igt_assert_eq(chamelium_reprobe_connector(&data->display,
+						  data->chamelium, port),
+		      target_state);
+}
+
+/*
+ * Mirror of HAS_PM_PME_SUPPORT() in xe_pm.c: only xe reports PME capability to
+ * the display code, and only from graphics IP 35.00 on.
+ */
+static bool pme_hpd_supported(int fd)
+{
+	return is_xe_device(fd) &&
+	       intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0);
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
+	enum igt_acpi_d_state d_state;
+	uint64_t active_limit_ms;
+
+	pci_dev = igt_device_get_pci_device(data->drm_fd);
+
+	/*
+	 * Check everything that can make the subtest skip before changing any
+	 * state. Without driver support the device keeps HPD polling enabled
+	 * and phase 1 would fail rather than skip, so gate on the platform
+	 * before looking at the hardware capability at all.
+	 */
+	igt_require_f(pme_hpd_supported(data->drm_fd),
+		      "Driver does not use PME for HPD on this platform\n");
+	igt_require_f(igt_pm_pci_pme_supported(pci_dev, IGT_ACPI_D3Hot),
+		      "Device does not advertise PME support in D3hot\n");
+	igt_require_f(igt_pm_has_wakeup_support(pci_dev),
+		      "Device does not expose power/wakeup\n");
+	igt_require_hpd_storm_ctl(data->drm_fd);
+	igt_require(igt_kms_poll_save());
+	igt_require(igt_setup_runtime_pm(data->drm_fd));
+
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, port,
+			      data->ports, data->port_count);
+
+	/*
+	 * xe only arms PME for D3hot, and only when D3cold is not allowed. An
+	 * integrated device is never D3cold capable, since xe requires a PCIe
+	 * root port above the device and an RCiEP has none. A discrete device
+	 * can drop to D3cold unless its vram_d3cold_threshold is set to 0, which
+	 * this test does not do. Decide once, here, whether the device suspends
+	 * into D3hot: in D3cold there is no PME to observe, so skip, and from
+	 * here on finding it in any other state is a failure.
+	 * igt_pm_pci_get_d_state() reports D3cold without resuming the device.
+	 */
+	pme_wait_settled();
+	d_state = igt_pm_pci_get_d_state(pci_dev);
+	igt_require_f(d_state == IGT_ACPI_D3Hot,
+		      "Device runtime suspends into %s rather than D3hot, so "
+		      "there is no PME to observe\n", pme_d_state_name(d_state));
+
+	/*
+	 * Polling must be enabled, so that a previous test cannot leave it
+	 * disabled and fake a pass: the test checks that the driver does not
+	 * use it when PME is available. Setting the parameter does not restart
+	 * a poll worker that a previous test already stopped, which is why the
+	 * control run below checks that polling actually happens.
+	 */
+	igt_kms_poll_set(true);
+
+	/* Don't let our own toggles trip the storm detection into polling. */
+	igt_hpd_storm_set_threshold(data->drm_fd, 0);
+	pme_hpd.storm_set = true;
+
+	pme_hpd.mon = igt_watch_uevents();
+
+	active_limit_ms = min_t(uint64_t, PME_ACTIVE_TIME_SLACK_MS,
+				pme_measure_poll_wake(data, port, pci_dev));
+
+	/*
+	 * Now arm PME. Need both: PME is only armed when device_may_wakeup() is
+	 * true, and without a wakeup source the PM core never records the PME
+	 * wakeup. Enabling power/wakeup creates a new wakeup source, so
+	 * wakeup_active_count restarts from 0; every baseline is taken after
+	 * this.
+	 */
+	igt_pm_set_wakeup_enabled(pci_dev, true);
+	pme_cycle_runtime_pm(data, port);
+
+	/*
+	 * Ports are left disconnected by the reset, so plug first. The idle
+	 * window only needs to be watched once.
+	 */
+	try_hpd_runtime_suspend_pme(data, port, pci_dev, pme_hpd.mon, false,
+				    true, active_limit_ms);
+
+	/* Now check we notice a disconnect signalled from D3hot too. */
+	try_hpd_runtime_suspend_pme(data, port, pci_dev, pme_hpd.mon, true,
+				    false, active_limit_ms);
+
+	pme_hpd_cleanup(data->drm_fd);
+}
+
 static const char test_hpd_without_ddc_desc[] =
 	"Disable DDC on a VGA connector, check we still get a uevent on hotplug";
 static void test_hpd_without_ddc(chamelium_data_t *data,
@@ -500,6 +1014,13 @@ int igt_main()
 	connector_subtest("dp-hpd-after-hibernate", DisplayPort, &data, test_suspend_resume_hpd,
 			  SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
 
+	igt_describe(test_hpd_runtime_suspend_pme_desc);
+	connector_subtest("dp-hpd-after-runtime-suspend-d3hot", DisplayPort,
+			  &data, test_hpd_runtime_suspend_pme);
+
+	igt_fixture()
+		pme_hpd_cleanup(data.drm_fd);
+
 	igt_describe(test_hpd_storm_detect_desc);
 	connector_subtest("dp-hpd-storm", DisplayPort, &data, test_hpd_storm_detect,
 			  HPD_STORM_PULSE_INTERVAL_DP);
@@ -538,6 +1059,13 @@ int igt_main()
 	connector_subtest("hdmi-hpd-after-hibernate", HDMIA, &data, test_suspend_resume_hpd,
 			  SUSPEND_STATE_DISK, SUSPEND_TEST_DEVICES);
 
+	igt_describe(test_hpd_runtime_suspend_pme_desc);
+	connector_subtest("hdmi-hpd-after-runtime-suspend-d3hot", HDMIA,
+			  &data, test_hpd_runtime_suspend_pme);
+
+	igt_fixture()
+		pme_hpd_cleanup(data.drm_fd);
+
 	igt_describe(test_hpd_storm_detect_desc);
 	connector_subtest("hdmi-hpd-storm", HDMIA, &data, test_hpd_storm_detect,
 			  HPD_STORM_PULSE_INTERVAL_HDMI);
-- 
2.53.0

