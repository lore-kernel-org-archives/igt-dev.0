Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFD8C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 19:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C0410E0E7;
	Fri, 10 May 2024 19:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KZrAuvKM";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F7A10E0E7
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 19:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715368658;
 bh=MvVe6XwtlD/07ErDGOqOnWe84Z6h42v294LGh1F/ywE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KZrAuvKMi/dBo8DoN5/+VU/t0s1IAIkSyY7RHUoviesVkkL52OmdqgBzVr4kADo5q
 8Z9ISsrNFmOLhu8mVnXrdZFmUkWwVMgyQVoc+c3XcRvzjSxwNYH19tl0jreffS72Th
 /ezaqm1ZfLuFVFNghu9mTakmCYCKfWTo8YgcdLnhrZy8sLtdoHJLs8Dop96Oeda7PR
 fSo1Db9U0KKzBIVei56JBjmCNdFBWMUcObLmNOYaDxKphiJcTLK4OYdn8bjQE5TgML
 nobxPvK0yXg+LfDIkAfJFtnCCzwiGcIGVsdzte0hQa+Bt3X0KET9m1UAYIOOgfRaeu
 6Nez9EcUC1mnw==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9B9B23782189;
 Fri, 10 May 2024 19:17:37 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: tvrtko.ursulin@intel.com, robdclark@chromium.org,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com,
 igt-dev@lists.freedesktop.org
Cc: healych@amazon.com, adrian.larumbe@collabora.com, kernel@collabora.com,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH v3 1/2] lib: Add DRM driver sysfs profiling knob toggling
 functions
Date: Fri, 10 May 2024 20:15:20 +0100
Message-ID: <20240510191716.282644-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510191716.282644-1-adrian.larumbe@collabora.com>
References: <20240510191716.282644-1-adrian.larumbe@collabora.com>
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

Also create a new static library dependency for this family of functions so
that it can later be linked against gputop.

Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 lib/igt_profiling.c | 141 ++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_profiling.h |  21 +++++++
 lib/meson.build     |   8 +++
 3 files changed, 170 insertions(+)
 create mode 100644 lib/igt_profiling.c
 create mode 100644 lib/igt_profiling.h

diff --git a/lib/igt_profiling.c b/lib/igt_profiling.c
new file mode 100644
index 000000000000..f5ac40d072ac
--- /dev/null
+++ b/lib/igt_profiling.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Collabora Ltd.
+ * Copyright © 2024 Adrian Larumbe <adrian.larumbe@collabora.com>
+ * Copyright © 2024 Amazon.com, Inc. or its affiliates.
+ *
+ */
+
+#include <fcntl.h>
+#include <unistd.h>
+#include <dirent.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <assert.h>
+#include <stdbool.h>
+
+#include "igt_profiling.h"
+
+#define SYSFS_DRM	"/sys/class/drm"
+#define NUM_DEVICES	10
+
+struct igt_profiled_device *igt_devices_profiled(void)
+{
+	struct igt_profiled_device *profiled_devices;
+	unsigned int devlist_len = NUM_DEVICES;
+	unsigned int i = 0;
+	struct dirent *entry;
+	DIR *dev_dir;
+
+	/* The return array will be resized in case there are too many devices */
+	profiled_devices = malloc(devlist_len * sizeof(struct igt_profiled_device));
+	if (!profiled_devices)
+		return NULL;
+
+	dev_dir = opendir(SYSFS_DRM);
+	if (!dev_dir) {
+		free(profiled_devices);
+		return NULL;
+	}
+
+	while ((entry = readdir(dev_dir)) != NULL) {
+		char path[PATH_MAX];
+		char orig_state;
+		int sysfs_fd;
+
+		/* All DRM device entries are symlinks to other paths within sysfs */
+		if (entry->d_type != DT_LNK)
+			continue;
+
+		/* We're only interested in render nodes */
+		if (strstr(entry->d_name, "render") != entry->d_name)
+			continue;
+
+		snprintf(path, sizeof(path), "%s/%s/device/%s",
+			 SYSFS_DRM, entry->d_name, "profiling");
+
+		if (access(path, F_OK))
+			continue;
+
+		sysfs_fd = open(path, O_RDONLY);
+		if (sysfs_fd == -1)
+			continue;
+
+		if (read(sysfs_fd, &orig_state, 1) <= 0) {
+			close(sysfs_fd);
+			continue;
+		}
+
+		if (i == (devlist_len - 1)) {
+			devlist_len += NUM_DEVICES;
+			profiled_devices = realloc(profiled_devices, devlist_len);
+		}
+
+		profiled_devices[i].syspath = strdup(path);
+		profiled_devices[i++].original_state = orig_state;
+
+		close(sysfs_fd);
+	}
+
+	if (i == 0) {
+		free(profiled_devices);
+		profiled_devices = NULL;
+	} else
+		profiled_devices[i].syspath = NULL; /* Array terminator */
+
+	return profiled_devices;
+}
+
+
+void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable)
+{
+	assert(devices);
+
+	for (unsigned int i = 0; devices[i].syspath; i++) {
+
+		int sysfs_fd = open(devices[i].syspath, O_WRONLY);
+
+		if (sysfs_fd < 0)
+			continue;
+
+		write(sysfs_fd, enable ? "1" : &devices[i].original_state, 1);
+		close(sysfs_fd);
+	}
+}
+
+void igt_devices_free_profiling(struct igt_profiled_device *devices)
+{
+	assert(devices);
+
+	for (unsigned int i = 0; devices[i].syspath; i++)
+		free(devices[i].syspath);
+
+	free(devices);
+}
+
+void igt_devices_update_original_profiling_state(struct igt_profiled_device *devices)
+{
+	assert(devices);
+
+	for (unsigned int i = 0; devices[i].syspath; i++) {
+		char new_state;
+		int sysfs_fd;
+
+		sysfs_fd = open(devices[i].syspath, O_RDWR);
+		if (sysfs_fd == -1)
+			continue;
+
+		if (!read(sysfs_fd, &new_state, 1)) {
+			close(sysfs_fd);
+			continue;
+		}
+
+		if (new_state == '0') {
+			write(sysfs_fd, "1", 1);
+			devices[i].original_state = new_state;
+		}
+
+		close(sysfs_fd);
+	}
+}
diff --git a/lib/igt_profiling.h b/lib/igt_profiling.h
new file mode 100644
index 000000000000..fd0835d9a699
--- /dev/null
+++ b/lib/igt_profiling.h
@@ -0,0 +1,21 @@
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
+struct igt_profiled_device {
+	char *syspath;
+	char original_state;
+};
+
+void igt_devices_toggle_profiling(struct igt_profiled_device *devices, bool enable);
+struct igt_profiled_device *igt_devices_profiled(void);
+void igt_devices_free_profiling(struct igt_profiled_device *devices);
+void igt_devices_update_original_profiling_state(struct igt_profiled_device *devices);
+
+#endif /* IGT_PROFILING_H */
diff --git a/lib/meson.build b/lib/meson.build
index e2f740c116f8..6f61ed5c558b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -291,6 +291,14 @@ lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
 
 lib_igt_drm_fdinfo = declare_dependency(link_with : lib_igt_drm_fdinfo_build,
 				  include_directories : inc)
+
+lib_igt_profiling_build = static_library('igt_profiling',
+	['igt_profiling.c'],
+	include_directories : inc)
+
+lib_igt_profiling = declare_dependency(link_with : lib_igt_profiling_build,
+				        include_directories : inc)
+
 i915_perf_files = [
   'igt_list.c',
   'i915/perf.c',
-- 
2.44.0

