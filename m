Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764CA10E4DF
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 13:06:05 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jun 2023 18:37:54 +0530
Message-Id: <20230615130754.3406104-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] [PATCH v1 1/1] tests/xe/xe_uevent: add new test
 for uevent gt reset failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This test is to cause the fake reset failure and capture the uevent
sent in case of gt reset failure. We are relying on debugfs to
cause fake reset failure because there is no hardware mechanism using
which we can force gt to fail its reset.

The sending of Uevent is taken care by series:
drm/xe: Notify Userspace when engine/gt reset fails.
https://patchwork.freedesktop.org/series/117504/

The infra to cause fake reset failure is in series:
drm/xe: Add a debugfs for faking gt reset failure.
https://patchwork.freedesktop.org/series/119375/

v2:
- Make fake reset for all GT's in platform.
- Add test names in order (Rahul)
- Add headers in order.
- Instead of system call use igt helper for reading debugfs.
- Use igt_debug instead of prints.
- Use break instead of unnecessary goto.
- Change test name.
- Define values as constants. (Kamil)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/meson.build    |   1 +
 tests/xe/xe_uevent.c | 129 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 tests/xe/xe_uevent.c

diff --git a/tests/meson.build b/tests/meson.build
index 61dcc076..27abc13f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -267,6 +267,7 @@ xe_progs = [
 	'xe_pm',
 	'xe_prime_self_import',
 	'xe_query',
+	'xe_uevent',
 	'xe_vm',
 	'xe_waitfence',
 ]
diff --git a/tests/xe/xe_uevent.c b/tests/xe/xe_uevent.c
new file mode 100644
index 00000000..6326896d
--- /dev/null
+++ b/tests/xe/xe_uevent.c
@@ -0,0 +1,129 @@
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
+#include <libudev.h>
+#include <string.h>
+#include <sys/stat.h>
+
+#include "igt.h"
+
+#include "xe_drm.h"
+#include "xe/xe_query.h"
+
+static bool xe_force_gt_fake_reset(int fd, int gt)
+{
+	char rst_fail[32];
+
+	snprintf(rst_fail, sizeof(rst_fail), "gt%d/fake_reset_failure", gt);
+	__igt_debugfs_read(fd, rst_fail, rst_fail, sizeof(rst_fail));
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
+			igt_debug("%s = %s\n", name, val);
+			reset_failed = true;
+			continue;
+		}
+
+		if (!strcmp(name, "RESET_UNIT") && !strcmp(val, "gt")) {
+			igt_debug("%s = %s\n", name, val);
+			reset_unit_is_gt = true;
+			continue;
+		}
+
+		if (!strcmp(name, "RESET_ID") && (atoi(val) == gt_id)) {
+			igt_debug("%s = %s\n", name, val);
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
+	bool event_received = false;
+	bool event_sent = false;
+	const u32 listener_timeout = 5;
+	const u32 reset_completed = 50000;
+
+	/* create udev object */
+	udev = udev_new();
+	if (!udev)
+		igt_assert_f(false, "New udev object creation failed");
+
+	mon = udev_monitor_new_from_netlink(udev, "kernel");
+	udev_monitor_filter_add_match_subsystem_devtype(mon, "drm", "drm_minor");
+	udev_monitor_enable_receiving(mon);
+	igt_until_timeout(listener_timeout) {
+			dev = udev_monitor_receive_device(mon);
+
+			if (dev) {
+				event_received = listen_reset_fail_uevent(dev, "kernel", gt_id);
+				udev_device_unref(dev);
+			}
+
+			if (event_sent)
+				break;
+
+		event_sent = xe_force_gt_fake_reset(fd, gt_id);
+		usleep(reset_completed);
+	}
+	udev_unref(udev);
+	igt_assert_f(event_received, "Event not received");
+}
+
+igt_main
+{
+	int fd;
+	int gt;
+	const u32 settle_xe_load_uevents = 50000;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	/* Ensures uevents triggered in case of driver
+	 * load are settled down.
+	 */
+	usleep(settle_xe_load_uevents);
+
+	igt_subtest("fake_reset_uevent_listener")
+		xe_for_each_gt(fd, gt) {
+			fake_reset_uevent_listener(fd, gt);
+		}
+
+	igt_fixture {
+		xe_device_put(fd);
+		close(fd);
+	}
+}
-- 
2.25.1
