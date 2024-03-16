Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F6C54E60
	for <igt-dev@archiver.kernel.org>; Sat, 16 Mar 2024 22:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1CD10E029;
	Sat, 16 Mar 2024 22:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="n0BGhB1r";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D3810E029
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Mar 2024 22:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710626563;
 bh=28Wf/z5UM1A+Ckp1+L1yfYHlBRImKKaZjmeBIGt+IYQ=;
 h=From:To:Cc:Subject:Date:From;
 b=n0BGhB1rzAhCU0iO/HOMjkQYB0VDY8g6jFX+kPFUa9+tp3lPK2j2axrQTPCtVkr6h
 wnaYggxo5hTVgmMBpK5xrlfOWN/KcrRmnsP9FeSYmenGKEQ50dPA2dwEpP9w3muXGZ
 f9WDXMpbsSNmMU/a8/bZ9YGx3xsgxUlxjiX/5aSrDqh1UPTd4nBXIX2HSYv3bgP5bq
 szpDvo2G5YMqAA1znFklpcynLo80U2eSlpuJIYW3KK0DaeOQf5vScARrIbA9nkDWzX
 XG+LLU/GjEfV5i8pyCoR+vI4cQzs4aOSCVNDeTfTFLJlCfcjeW/pwcwRnwWIPcnp/4
 mMHOYjHQ/pYMQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 402C43781FCD;
 Sat, 16 Mar 2024 22:02:43 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tvrtko.ursulin@intel.com, daniel@ffwll.ch, boris.brezillon@collabora.com,
 igt-dev@lists.freedesktop.org
Cc: adrian.larumbe@collabora.com
Subject: [PATCH 1/2] lib: Add DRM driver sysfs profiling knob toggling
 functions
Date: Sat, 16 Mar 2024 22:00:37 +0000
Message-ID: <20240316220229.249119-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 lib/igt_device_scan.c | 45 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_device_scan.h |  7 +++++++
 lib/igt_profiling.c   | 47 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_profiling.h   | 31 ++++++++++++++++++++++++++++
 lib/meson.build       |  1 +
 5 files changed, 131 insertions(+)
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
index 000000000000..63a2dd949dbc
--- /dev/null
+++ b/lib/igt_profiling.c
@@ -0,0 +1,47 @@
+/*
+ * Copyright © 2024 Collabora Ltd.
+ * Copyright 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
+ * Copyright 2024 Amazon.com, Inc. or its affiliates.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include "igt_core.h"
+#include "igt_sysfs.h"
+#include "igt_device_scan.h"
+#include "igt_profiling.h"
+
+#include <fcntl.h>
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
index 000000000000..e00345b46e3f
--- /dev/null
+++ b/lib/igt_profiling.h
@@ -0,0 +1,31 @@
+/*
+ * Copyright (C) 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
+ * Copyright 2024 Collabora Ltd.
+ * Copyright 2024 Amazon.com, Inc. or its affiliates.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ */
+
+#include <stdbool.h>
+
+struct igt_profiled_device;
+
+void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable);
diff --git a/lib/meson.build b/lib/meson.build
index 6122861d8b7a..70a6fe4485a2 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -24,6 +24,7 @@ lib_sources = [
 	'igt_device_scan.c',
 	'igt_drm_clients.h',
 	'igt_drm_fdinfo.c',
+        'igt_profiling.c',
 	'igt_aux.c',
 	'igt_gt.c',
 	'igt_halffloat.c',
-- 
2.43.0

