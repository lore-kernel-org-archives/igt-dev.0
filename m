Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BCDC83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 09:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09F310E3F3;
	Thu, 17 Jul 2025 09:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/x/rCtJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0574710E3F3
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 09:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752743307; x=1784279307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WJLmHVzM6iRC2OU+81+XvsRRo4083YtCq7j1GzT5hYI=;
 b=b/x/rCtJMgYGeyyxFHMNv6lJGFzsFsxbY9aO/kUSMwYTbfqiDtrthHNv
 1iwSM4LULbwPGol4YxJnGgYTC6mnyNkDEiK3FoBj9RQ7tg4tgrEvSZpzd
 N/bjhIaWuX2fbJ80x74bwhnv1QFZL82g7PBTLP6DnfALA8IhrZFNc/JL1
 YM8s8K9MtUEYQWX8o/KMq+dY/L3XFzgUbINYzoL+Q1MH3mbmmajxMUF4f
 /7V8IqQ0PZ1wwZ1GW2WUPnfvJz4OjNEbrFVESQKqtkmtMHo0WhMNCpj3e
 hRTnDgPCWKqGOgAa8KYkNS1f2mOwbgZHlWGCmVS+Sg0f7DzCGvg8zFP5M A==;
X-CSE-ConnectionGUID: SyobtYbVRIC2C33UpuFrNA==
X-CSE-MsgGUID: 2E2fBT8QTeupjgRja0GPCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55129524"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="55129524"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 02:08:27 -0700
X-CSE-ConnectionGUID: 1JspHdeSTtO2O+eIWwk42Q==
X-CSE-MsgGUID: 4fgjDo/FRX+PGg1ane9jzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="158444308"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 02:08:24 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, satyanarayana.k.v.p@intel.com,
 adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t 2/4] lib/intel_vram: Add library for VRAM accesses
Date: Thu, 17 Jul 2025 11:08:10 +0200
Message-Id: <20250717090812.28628-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250717090812.28628-1-lukasz.laguna@intel.com>
References: <20250717090812.28628-1-lukasz.laguna@intel.com>
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

Prepare a library with helpers to map and unmap VRAM BAR region and
perform read/write operations.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/intel_vram.c | 183 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_vram.h |  22 ++++++
 lib/meson.build  |   1 +
 3 files changed, 206 insertions(+)
 create mode 100644 lib/intel_vram.c
 create mode 100644 lib/intel_vram.h

diff --git a/lib/intel_vram.c b/lib/intel_vram.c
new file mode 100644
index 000000000..38e2ccf36
--- /dev/null
+++ b/lib/intel_vram.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+
+#include "igt_core.h"
+#include "igt_sriov_device.h"
+#include "intel_vram.h"
+
+static int intel_vram_open_bar(int pf_fd, unsigned int vf_num, int mode)
+{
+	int sysfs, fd;
+
+	sysfs = igt_sriov_device_sysfs_open(pf_fd, vf_num);
+	if (sysfs < 0) {
+		igt_debug("Failed to open sysfs for VF%d: %s\n", vf_num, strerror(errno));
+		return -1;
+	}
+
+	fd = openat(sysfs, "resource2", mode | O_SYNC);
+	if (fd < 0)
+		igt_debug("Failed to open resource2 for VF%d: %s\n", vf_num, strerror(errno));
+
+	close(sysfs);
+
+	return fd;
+}
+
+/**
+ * intel_vram_bar_size - Get the size of the VRAM BAR
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number (1-based), or 0 for the PF
+ *
+ * Opens the VRAM BAR file descriptor for the specified device and retrieves
+ * its size by using fstat().
+ *
+ * Return: The size of the VRAM BAR in bytes on success,
+ *         or negative value on failure.
+ */
+ssize_t intel_vram_bar_size(int pf_fd, unsigned int vf_num)
+{
+	int fd;
+	struct stat st;
+
+	fd = intel_vram_open_bar(pf_fd, vf_num, O_RDONLY);
+	if (fd < 0)
+		return fd;
+
+	if (fstat(fd, &st)) {
+		igt_debug("Failed to stat resource2 for VF%u: %s\n", vf_num, strerror(errno));
+		close(fd);
+		return -1;
+	}
+
+	close(fd);
+
+	return st.st_size;
+}
+
+/**
+ * intel_vram_mmap - Map VRAM BAR region
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number (1-based), or 0 for the PF
+ * @length: Number of bytes to map
+ * @prot: Memory protection flags
+ * @offset: Offset (in bytes) within the BAR to begin the mapping
+ *
+ * Maps a PF or VF VRAM BAR into user space using mmap().
+ *
+ * Return: A vram_mapping struct with the mapped address and size on success,
+ *         or NULL address and zero size on failure.
+ */
+struct vram_mapping intel_vram_mmap(int pf_fd, unsigned int vf_num, size_t length, int prot,
+				    off_t offset)
+{
+	int open_flags = ((prot & PROT_WRITE) != 0) ? O_RDWR : O_RDONLY;
+	struct vram_mapping m = { .addr = NULL, .size = 0 };
+	ssize_t vram_bar_size;
+	int vram_bar_fd;
+	void *addr;
+
+	vram_bar_size = intel_vram_bar_size(pf_fd, vf_num);
+	if (vram_bar_size < 0) {
+		igt_debug("Failed to get VRAM BAR size for VF%u: %s\n", vf_num, strerror(errno));
+		return m;
+	}
+
+	if (vram_bar_size < length) {
+		igt_debug("Mapping length (%zu) exceeds VRAM BAR size (%" PRIu64 ")\n",
+			  length, (uint64_t)vram_bar_size);
+		return m;
+	}
+
+	vram_bar_fd = intel_vram_open_bar(pf_fd, vf_num, open_flags);
+	if (vram_bar_fd < 0) {
+		igt_debug("Failed to open VRAM BAR file for VF%u: %s\n", vf_num, strerror(errno));
+		return m;
+	}
+
+	addr = mmap(NULL, length, prot, MAP_SHARED, vram_bar_fd, offset);
+	close(vram_bar_fd);
+	if (addr == MAP_FAILED) {
+		igt_debug("Failed to map VRAM BAR for VF%u: %s\n", vf_num, strerror(errno));
+		return m;
+	}
+
+	m.addr = addr;
+	m.size = length;
+	return m;
+}
+
+/**
+ * intel_vram_munmap - Unmap previously mapped VRAM region
+ * @m: Pointer to a vram_mapping struct representing the mapped region
+ *
+ * Unmaps the user-space memory region previously mapped by intel_vram_mmap().
+ *
+ * Return: 0 on success, or negative value on failure.
+ */
+int intel_vram_munmap(struct vram_mapping *m)
+{
+	int ret;
+
+	ret = munmap(m->addr, m->size);
+	if (ret < 0)
+		igt_debug("Failed munmap %p: %s\n", m->addr, strerror(errno));
+
+	return ret;
+}
+
+/**
+ * intel_vram_read8 - Read 8-bit value from a mapped VRAM region
+ * @m: Pointer to a vram_mapping struct representing the mapped region
+ * @offset: Offset (in bytes) to read from
+ *
+ * Reads a single 8-bit value from the specified offset in the mapped VRAM.
+ *
+ * Return: The 8-bit value read from the given offset.
+ */
+uint8_t intel_vram_read8(struct vram_mapping *m, size_t offset)
+{
+	igt_assert(offset < m->size);
+
+	return READ_ONCE(*((uint8_t *)m->addr + offset));
+}
+
+/**
+ * intel_vram_write8 - Write 8-bit value to a mapped VRAM region
+ * @m: Pointer to a vram_mapping struct representing the mapped region
+ * @offset: Offset (in bytes) to write to
+ * @value: The 8-bit value to write
+ *
+ * Writes a single 8-bit value to the specified offset in the mapped VRAM.
+ */
+void intel_vram_write8(struct vram_mapping *m, size_t offset, uint8_t value)
+{
+	igt_assert(offset < m->size);
+
+	WRITE_ONCE(*((uint8_t *)m->addr + offset), value);
+}
+
+/**
+ * intel_vram_write_readback8 - Write and then read back an 8-bit value
+ * @m: Pointer to a vram_mapping struct representing the mapped region
+ * @offset: Offset (in bytes) to write to and read from
+ * @value: The 8-bit value to write
+ *
+ * Writes an 8-bit value to the specified offset in the mapped VRAM and
+ * reads it back to verify if the write was successful.
+ *
+ * Return: The 8-bit value read back from the given offset.
+ */
+uint8_t intel_vram_write_readback8(struct vram_mapping *m, size_t offset, uint8_t value)
+{
+	intel_vram_write8(m, offset, value);
+	return intel_vram_read8(m, offset);
+}
diff --git a/lib/intel_vram.h b/lib/intel_vram.h
new file mode 100644
index 000000000..b93f915e9
--- /dev/null
+++ b/lib/intel_vram.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef __INTEL_VRAM_H__
+#define __INTEL_VRAM_H__
+
+struct vram_mapping {
+	void *addr; /* Pointer to the mapped VRAM */
+	size_t size; /* Size of the mapped VRAM region */
+};
+
+ssize_t intel_vram_bar_size(int pf_fd, unsigned int vf_num);
+struct vram_mapping intel_vram_mmap(int pf_fd, unsigned int vf_num, size_t length, int prot,
+				    off_t offset);
+int intel_vram_munmap(struct vram_mapping *m);
+uint8_t intel_vram_read8(struct vram_mapping *m, size_t offset);
+void intel_vram_write8(struct vram_mapping *m, size_t offset, uint8_t value);
+uint8_t intel_vram_write_readback8(struct vram_mapping *m, size_t offset, uint8_t value);
+
+#endif	/* INTEL_VRAM_H */
diff --git a/lib/meson.build b/lib/meson.build
index 2eaca42a4..25c68011d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -70,6 +70,7 @@ lib_sources = [
 	'intel_mocs.c',
 	'igt_multigpu.c',
 	'intel_pat.c',
+	'intel_vram.c',
 	'ioctl_wrappers.c',
 	'media_spin.c',
 	'media_fill.c',
-- 
2.40.0

