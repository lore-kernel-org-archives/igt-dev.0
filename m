Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F0606A327
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kPHfvAM8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B1210F498;
	Tue,  3 Nov 2026 09:36:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9DF10F497
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793698533; x=1825234533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9rQC8ufhbspzDeESKqPbwpF86B420BSAZ62jNny3/p4=;
 b=kPHfvAM8m/Bo9HAV2GuRaa6jvN+fNR0aGf50vN0oV0XfuaK5I3+u3pud
 q8D96n12K7+grEbLtwhIlCHS7kuJxmKLImbcwTcP38bu3mxjmryP/aMEp
 kQdBFzKNA7zSW2z/G3dRIVjnAZ2EEdUCgi7g3QvzdfyhYLXQ9QzegO8r7
 VBqH9YAK0GpiGfJWEwfoMeWx+IKHmtGPv6MSy+RfVAdwKCOb2mQiDR/sZ
 RjrosVWo6+f7BcrGm/21BKpbbf2ZVSDHpUZsnQJcS4bL0jYR/EUgpraVo
 1Dxr2G40fI3fvT+LZdbnuQIaq3HWS5cnRx7zKmjEHhQ56CQjzXLIANAce Q==;
X-CSE-ConnectionGUID: DEcXDiJtS86cMyLmKGjF1g==
X-CSE-MsgGUID: 1y4Utf1fRsKluC2oAKE0xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2427953"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2427953"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 01:35:32 -0800
X-CSE-ConnectionGUID: H1MMuXwlTFKdCd/KaD6xuA==
X-CSE-MsgGUID: acLJe7PJThivVeB4nOV9ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6278908"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 01:35:31 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_hpd: Name the host waker
 when no PME is seen
Date: Tue,  3 Nov 2026 15:05:21 +0530
Message-ID: <20261103093521.1428284-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On CI the d3hot subtest fails the unplug: the uevent comes in ~95ms and
power/wakeup_active_count does not change. This is not a missing PME.
Something on the host woke the device first, so the HPD was handled as a
normal interrupt. On the NVL DUT this was fwupd reading /dev/drm_dp_aux*,
but it can be any userspace or kernel path that takes a display power
reference, and nothing in sysfs says which.

Record rpm:rpm_resume for the device with a stack trace, in a private
ftrace instance so that any tracing already running on the system is
not disturbed. Trace only while waiting for the hotplug, and when
the device was woken by the host print the first resume, which names
the task and the call path. Without ftrace the test runs as before.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_hpd.c | 154 +++++++++++++++++++++++++++-
 1 file changed, 151 insertions(+), 3 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index a8592ef01..ba0f5366a 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -32,8 +32,12 @@
  * Mega feature: General Display Features
  */
 
+#include <fcntl.h>
+#include <sys/stat.h>
+
 #include "kms_chamelium_helper.h"
 #include "igt_device.h"
+#include "igt_sysfs.h"
 
 /**
  * SUBTEST: dp-hpd-fast
@@ -469,7 +473,144 @@ static const char *pme_d_state_name(enum igt_acpi_d_state state)
 static struct {
 	struct udev_monitor *mon;
 	bool storm_set;
-} pme_hpd;
+	int trace_dir;
+	char trace_path[PATH_MAX];
+} pme_hpd = { .trace_dir = -1 };
+
+/*
+ * A resume that is not signalled by a PME was started by something on the
+ * host, and nothing in sysfs says what. To name it in the failure message,
+ * record rpm_resume for the device with a stack trace. Use a private ftrace
+ * instance so that the global trace buffer is left alone.
+ */
+static void pme_trace_open(struct pci_device *pci_dev)
+{
+	static const char * const roots[] = {
+		"/sys/kernel/tracing", "/sys/kernel/debug/tracing",
+	};
+	char filter[64];
+
+	snprintf(filter, sizeof(filter), "name == \"%04x:%02x:%02x.%x\"",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	for (int i = 0; i < ARRAY_SIZE(roots); i++) {
+		char *path = pme_hpd.trace_path;
+		int dir;
+
+		snprintf(path, PATH_MAX, "%s/instances/igt_pme_hpd", roots[i]);
+		if (mkdir(path, 0755) && errno != EEXIST)
+			continue;
+
+		dir = open(path, O_RDONLY | O_DIRECTORY);
+		if (dir < 0)
+			continue;
+
+		/*
+		 * Only the first resume is read back, so stop recording when
+		 * the buffer fills rather than overwriting it, and keep the
+		 * buffer small. Each resume taken once the device is awake is
+		 * also recorded, with its stack.
+		 */
+		if (igt_sysfs_set(dir, "tracing_on", "0") &&
+		    igt_sysfs_set(dir, "options/overwrite", "0") &&
+		    igt_sysfs_set(dir, "buffer_size_kb", "64") &&
+		    igt_sysfs_set(dir, "events/rpm/rpm_resume/filter", filter) &&
+		    igt_sysfs_set(dir, "options/stacktrace", "1") &&
+		    igt_sysfs_set(dir, "events/rpm/rpm_resume/enable", "1")) {
+			pme_hpd.trace_dir = dir;
+			return;
+		}
+
+		close(dir);
+		rmdir(path);
+	}
+
+	pme_hpd.trace_path[0] = '\0';
+	igt_info("ftrace is unavailable, so a host wake cannot be traced\n");
+}
+
+static void pme_trace_close(void)
+{
+	if (pme_hpd.trace_dir >= 0) {
+		close(pme_hpd.trace_dir);
+		pme_hpd.trace_dir = -1;
+	}
+
+	if (pme_hpd.trace_path[0]) {
+		rmdir(pme_hpd.trace_path);
+		pme_hpd.trace_path[0] = '\0';
+	}
+}
+
+/* Empty the trace buffer and start recording. */
+static void pme_trace_start(void)
+{
+	int fd;
+
+	if (pme_hpd.trace_dir < 0)
+		return;
+
+	fd = openat(pme_hpd.trace_dir, "trace", O_WRONLY | O_TRUNC);
+	if (fd >= 0)
+		close(fd);
+	igt_sysfs_set(pme_hpd.trace_dir, "tracing_on", "1");
+}
+
+static void pme_trace_stop(void)
+{
+	if (pme_hpd.trace_dir >= 0)
+		igt_sysfs_set(pme_hpd.trace_dir, "tracing_on", "0");
+}
+
+/*
+ * The device was suspended when the trace started, so the first rpm_resume
+ * recorded is the one that woke it. Copy that line and its stack into @buf.
+ */
+static const char *pme_trace_first_resume(char *buf, size_t size)
+{
+	char line[512];
+	size_t len = 0;
+	bool found = false;
+	FILE *f;
+	int fd;
+
+	snprintf(buf, size, "Trace rpm:rpm_resume with stacktrace to find "
+		 "who woke it.");
+	if (pme_hpd.trace_dir < 0)
+		return buf;
+
+	fd = openat(pme_hpd.trace_dir, "trace", O_RDONLY);
+	if (fd < 0)
+		return buf;
+	f = fdopen(fd, "r");
+	if (!f) {
+		close(fd);
+		return buf;
+	}
+
+	while (fgets(line, sizeof(line), f) && len < size) {
+		if (!found) {
+			if (line[0] == '#' || !strstr(line, "rpm_resume:"))
+				continue;
+			found = true;
+			len = snprintf(buf, size, "First resume:\n");
+		} else if (strstr(line, "<stack trace>")) {
+			continue;
+		} else if (strncmp(line, " => ", 4)) {
+			break;
+		}
+		len += snprintf(buf + len, size - len, "%s", line);
+	}
+	/* Drop the last newline, the caller adds its own. */
+	if (found && len < size && len && buf[len - 1] == '\n')
+		buf[len - 1] = '\0';
+	fclose(f);
+
+	if (!found)
+		snprintf(buf, size, "No rpm_resume was traced.");
+
+	return buf;
+}
 
 static void pme_hpd_cleanup(int drm_fd)
 {
@@ -483,6 +624,7 @@ static void pme_hpd_cleanup(int drm_fd)
 		pme_hpd.storm_set = false;
 	}
 
+	pme_trace_close();
 	igt_kms_poll_restore();
 	igt_pm_restore_wakeup();
 }
@@ -636,6 +778,7 @@ static void try_hpd_runtime_suspend_pme(chamelium_data_t *data,
 	struct timespec start, end;
 	int pme_en, pending, woke_ms, latency;
 	const char *cause = NULL;
+	char waker[2048];
 	bool hotplugged;
 
 	pme_wait_settled();
@@ -730,11 +873,13 @@ static void try_hpd_runtime_suspend_pme(chamelium_data_t *data,
 	wakeups_before = pme_wakeup_count(pci_dev);
 	igt_flush_uevents(mon);
 
+	pme_trace_start();
 	igt_assert_eq(igt_gettime(&start), 0);
 	chamelium_schedule_hpd_toggle(data->chamelium, port,
 				      PME_HPD_TOGGLE_DELAY_MS, !connected);
 	hotplugged = chamelium_wait_for_hotplug(mon, &timeout);
 	igt_assert_eq(igt_gettime(&end), 0);
+	pme_trace_stop();
 
 	d_state = IGT_ACPI_UNKNOWN_STATE;
 	pending = -1;
@@ -784,8 +929,10 @@ static void try_hpd_runtime_suspend_pme(chamelium_data_t *data,
 		 " -> %" PRId64 "\n", latency, wakeups_before, wakeups_after);
 
 	igt_assert_f(wakeups_after > wakeups_before,
-		     "power/wakeup_active_count did not increment, so the resume "
-		     "was not triggered by a PME from the device\n");
+		     "power/wakeup_active_count did not increment, so no PME "
+		     "woke the device. The uevent came %dms after the HPD: "
+		     "something on the host woke it first.\n%s\n", latency,
+		     pme_trace_first_resume(waker, sizeof(waker)));
 	igt_assert_lte(0, latency);
 	igt_assert_lt(latency, PME_WAKE_LATENCY_MAX_MS);
 
@@ -869,6 +1016,7 @@ static void test_hpd_runtime_suspend_pme(chamelium_data_t *data,
 	pme_hpd.storm_set = true;
 
 	pme_hpd.mon = igt_watch_uevents();
+	pme_trace_open(pci_dev);
 
 	active_limit_ms = min_t(uint64_t, PME_ACTIVE_TIME_SLACK_MS,
 				pme_measure_poll_wake(data, port, pci_dev));
-- 
2.53.0

