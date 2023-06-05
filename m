Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7939F10E17C
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 05:46:53 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Jun 2023 11:20:59 +0530
Message-Id: <20230605055059.2942855-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t, 1/1] Uevent listener for fake gt reset failure.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This test is to cause the fake reset failure and capture the uevent
sent in case of gt reset failure.

The sending of Uevent is taken care by series:
drm/xe: Notify Userspace when engine/gt reset fails.

The infra to cause fake reset failure is in series:
drm/xe: Add a debugfs for faking gt reset failure.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/meson.build                             |   1 +
 .../xe_uevent_listener_fake_reset_failure.c   | 128 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 tests/xe/xe_uevent_listener_fake_reset_failure.c

diff --git a/tests/meson.build b/tests/meson.build
index f71be1db..cc5843d7 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -268,6 +268,7 @@ xe_progs = [
 	'xe_query',
 	'xe_vm',
 	'xe_waitfence',
+	'xe_uevent_listener_fake_reset_failure',
 ]
 
 msm_progs = [
diff --git a/tests/xe/xe_uevent_listener_fake_reset_failure.c b/tests/xe/xe_uevent_listener_fake_reset_failure.c
new file mode 100644
index 00000000..dd22e4c2
--- /dev/null
+++ b/tests/xe/xe_uevent_listener_fake_reset_failure.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: cause fake gt reset failure and listen uevent from KMD
+ * SUBTEST:fake_reset_uevent_listener
+ * Description:
+ *		Test creates uevent listener and causes fake reset failure for gt0
+ *		and returns success if uevent is sent by driver and listened by listener.
+ */
+
+#include "igt.h"
+#include "xe_drm.h"
+#include "xe/xe_query.h"
+#include <string.h>
+#include <libudev.h>
+#include <sys/stat.h>
+
+static bool xe_force_gt_fake_reset(int fd, int gt)
+{
+	char reset_string[128];
+	struct stat st;
+
+	igt_assert_eq(fstat(fd, &st), 0);
+	snprintf(reset_string, sizeof(reset_string),
+		 "cat /sys/kernel/debug/dri/%d/gt%d/fake_reset_failure", minor(st.st_rdev), gt);
+
+	if (system(reset_string))
+		return false;
+
+	return true;
+}
+
+static bool listen_reset_fail_uevent(struct udev_device *device, const char *source, int gt_id)
+{
+	struct udev_list_entry *list_entry;
+	bool reset_failed = false;
+	bool reset_unit_is_gt = false;
+	bool gt_id_matches = false;
+	const char *name, *val;
+
+	udev_list_entry_foreach(list_entry, udev_device_get_properties_list_entry(device))
+	{
+		name = udev_list_entry_get_name(list_entry);
+		val = udev_list_entry_get_value(list_entry);
+
+		if (!strcmp(name, "RESET_FAILED") && !strcmp(val, "1")) {
+			printf("%s = %s\n", name, val);
+			reset_failed = true;
+			continue;
+		}
+
+		if (!strcmp(name, "RESET_UNIT") && !strcmp(val, "gt")) {
+			printf("%s = %s\n", name, val);
+			reset_unit_is_gt = true;
+			continue;
+		}
+
+		if (!strcmp(name, "RESET_ID") && (atoi(val) == gt_id)) {
+			printf("%s = %s\n", name, val);
+			gt_id_matches = true;
+			continue;
+		}
+	}
+
+	return (reset_failed && reset_unit_is_gt && gt_id_matches);
+}
+
+static void fake_reset_uevent_listener(int fd, int gt_id)
+{
+	struct udev *udev;
+	struct udev_device *dev;
+	struct udev_monitor *mon;
+	bool event_recieved = false;
+	bool event_sent = false;
+
+	/* create udev object */
+	udev = udev_new();
+	if (!udev) {
+		fprintf(stderr, "Can't create udev\n");
+		goto no_udev;
+	}
+
+	mon = udev_monitor_new_from_netlink(udev, "kernel");
+	udev_monitor_filter_add_match_subsystem_devtype(mon, "drm", "drm_minor");
+	udev_monitor_enable_receiving(mon);
+	igt_until_timeout(5) {
+			dev = udev_monitor_receive_device(mon);
+
+			if (dev) {
+				event_recieved = listen_reset_fail_uevent(dev, "kernel", gt_id);
+				udev_device_unref(dev);
+			}
+
+			if (event_sent)
+				goto free_udev;
+
+		event_sent = xe_force_gt_fake_reset(fd, gt_id);
+		usleep(50 * 1000);
+	}
+
+free_udev:
+	udev_unref(udev);
+no_udev:
+	igt_assert(event_recieved);
+}
+
+igt_main
+{
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	usleep(50 * 1000);
+
+	igt_subtest("fake_reset_uevent_listener")
+		fake_reset_uevent_listener(fd, 0);
+
+	igt_fixture {
+		xe_device_put(fd);
+		close(fd);
+	}
+}
-- 
2.25.1
