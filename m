Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2726DC6FD1F
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 22:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C5610E5B4;
	Tue,  2 Apr 2024 22:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pVLh+FgL";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E88C1120FC
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2024 22:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712096920;
 bh=b3iCnc7bsmUEm0B+7YIit+XOfzAwInbtEzrW0m9g200=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pVLh+FgLWanQHn/xXnS+Zy+GsbRAPSAjg7XX8AL/BMKXpjvet5u+kxETDX3ZYhJrN
 CJUeTydvls6gPMrjKQk05HXJ30uAxXiIZRHjzWZT5LWzq3AhiGdRyzMRoojT60GdzX
 ICY0O1/H6sE4Uxo5Ex2jTO+dyiCbBeX3g1TNH8rKAWYP81lGVQfJXc8/vB31SIBdaN
 OqQdU5lXtEKulcw8L3HJ5ycjkj8EItoalLZtfoRRVLd67t9wYJr/7BlE/zmpDThe1o
 OjWg8+V3GN6BhfzGxZO9SU8EuoKwNJJJowoRfTXqOqnD8yYzoa16V8raqYMhbaaOwi
 qRIaJzWeVZjkQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7ECFC3782017;
 Tue,  2 Apr 2024 22:28:39 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tursulin@ursulin.net, daniel@ffwll.ch, boris.brezillon@collabora.com,
 kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org, healych@amazon.com
Cc: adrian.larumbe@collabora.com,
	kernel@collabora.com
Subject: [PATCH v2 1/2] lib: Add DRM driver sysfs profiling knob toggling
 functions
Date: Tue,  2 Apr 2024 23:27:44 +0100
Message-ID: <20240402222813.277470-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402222813.277470-1-adrian.larumbe@collabora.com>
References: <20240402222813.277470-1-adrian.larumbe@collabora.com>
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

Some DRM drivers need to have their accounting HW toggled on demand from
user space so that fdinfo's drm-engine and drm-cycles tags can be updated
upon job completion.

A profiler such as gputop should be able to check which DRM devices have
such a sysfs knob, record its original state, toggle-enable it and revert
this operation right before exiting.

A new igt library igt_profiling.c file was added because using igt lib's
sysfs access functions would've triggered a cascade of linking dependencies
in intel_gpu_top, which only statically links a very small subset of the
igt library.

Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 lib/igt_device_scan.c | 45 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  7 +++++++
 lib/igt_profiling.c   | 28 +++++++++++++++++++++++++++
 lib/igt_profiling.h   | 17 ++++++++++++++++
 lib/meson.build       |  1 +
 5 files changed, 98 insertions(+)
 create mode 100644 lib/igt_profiling.c
 create mode 100644 lib/igt_profiling.h

diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
index fbf3fa482e21..e5b126cc5448 100644
--- a/lib/igt_device_scan.c
+++ b/lib/igt_device_scan.c
@@ -1105,6 +1105,51 @@ void igt_devices_scan(bool force)
 	igt_devs.devs_scanned = true;
 }
 
+struct igt_profiled_device *igt_devices_profiled(void)
+{
+	struct igt_profiled_device *profiled_devices;
+	struct igt_device *dev;
+	unsigned int devlist_len;
+	unsigned int i = 0;
+
+	if (!igt_devs.devs_scanned)
+		return NULL;
+
+	devlist_len = igt_list_length(&igt_devs.all);
+	if (devlist_len == 0)
+		return NULL;
+
+	profiled_devices = malloc(devlist_len * sizeof(struct igt_profiled_device));
+	if (!profiled_devices)
+		return NULL;
+
+	memset(profiled_devices, 0, devlist_len * sizeof(struct igt_profiled_device));
+
+	igt_list_for_each_entry(dev, &igt_devs.all, link) {
+		char path[PATH_MAX];
+		int sysfs_fd;
+
+		if (!get_attr(dev, "profiling"))
+			continue;
+
+		snprintf(path, sizeof(path), "%s/%s", dev->syspath, "profiling");
+		sysfs_fd = open(path, O_RDONLY);
+		if (sysfs_fd < 0)
+			continue;
+
+		profiled_devices[i].syspath = dev->syspath;
+		profiled_devices[i++].original_state =
+			strtoul(get_attr(dev, "profiling"), NULL, 10);
+	}
+
+	if (i == 0) {
+		free(profiled_devices);
+		profiled_devices = NULL;
+	}
+
+	return profiled_devices;
+}
+
 static inline void _pr_simple(const char *k, const char *v)
 {
 	printf("    %-16s: %s\n", k, v);
diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
index 48690e236c01..6c725d9081b2 100644
--- a/lib/igt_device_scan.h
+++ b/lib/igt_device_scan.h
@@ -63,8 +63,15 @@ struct igt_device_card {
 	uint16_t pci_vendor, pci_device;
 };
 
+struct igt_profiled_device {
+	char *syspath;
+	bool original_state;
+};
+
 void igt_devices_scan(bool force);
 
+struct igt_profiled_device *igt_devices_profiled(void);
+
 void igt_devices_print(const struct igt_devices_print_format *fmt);
 void igt_devices_print_vendors(void);
 void igt_device_print_filter_types(void);
diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
new file mode 100644
index 000000000000..9ba114b4d78d
--- /dev/null
+++ b/lib/igt_profiling.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Collabora Ltd.
+ * Copyright © 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
+ * Copyright © 2024 Amazon.com, Inc. or its affiliates.
+ *
+ */
+
+#include <fcntl.h>
+
+#include "igt_device_scan.h"
+#include "igt_profiling.h"
+#include "igt_sysfs.h"
+
+void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable)
+{
+	for (unsigned int i = 0; devices[i].syspath; i++) {
+		int sysfs_fd = open(devices[i].syspath, O_RDONLY);
+
+		if (sysfs_fd < 0)
+			continue;
+
+		igt_sysfs_set_boolean(sysfs_fd, "profiling",
+				      enable ? true : devices[i].original_state);
+
+		close(sysfs_fd);
+	}
+}
diff --git a/lib/igt_profiling.h b/lib/igt_profiling.h
new file mode 100644
index 000000000000..af0b9366b797
--- /dev/null
+++ b/lib/igt_profiling.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Collabora Ltd.
+ * Copyright © 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
+ * Copyright © 2024 Amazon.com, Inc. or its affiliates.
+ */
+
+#ifndef IGT_PROFILING_H
+#define IGT_PROFILING_H
+
+#include <stdbool.h>
+
+struct igt_profiled_device;
+
+void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable);
+
+#endif /* IGT_PROFILING_H */
diff --git a/lib/meson.build b/lib/meson.build
index 6122861d8b7a..0fcc5f1cf5a1 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -36,6 +36,7 @@ lib_sources = [
 	'igt_pipe_crc.c',
 	'igt_power.c',
 	'igt_primes.c',
+        'igt_profiling.c',
 	'igt_pci.c',
 	'igt_rand.c',
 	'igt_sriov_device.c',
-- 
2.44.0

