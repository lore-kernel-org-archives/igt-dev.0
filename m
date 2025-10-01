Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D43CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 10:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9108F10E309;
	Wed,  1 Oct 2025 10:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhAQtyCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5AA10E309
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759313945; x=1790849945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IKox8d+l2QBf5uhNr572sjAWgJhe+wq31fGmFVn3i8o=;
 b=nhAQtyCLFOHuKMtBagbMWNQCo34+2mtETPpPlXuRS6oC0NjNVnQrwel3
 S/5LyZYfAIHEKhmWbcCxfb+oRibPASUg/toGGEuMfqQZASeVY0Qq/vUY6
 Ry/+OU3wubkS7sJ1hvopx9ccXT6HygzIcv6+/catrVxZJeLXIf2ufN3gl
 eq6/zN6xgRq6V9UIgn+AwGeD757mu68pFhdWww6mN8ba6nt2dmFUA67sN
 HU/diQxZwllK5G/h7Ww0goVW9/k7MpHinoHfWLpnS9z1l6oav0KFBT7XW
 vMV/4eqfHI48kB8YBvdsB77uEOaQ8vCuCZjc26vq1kcDQsjJ+f2Bc2TSK Q==;
X-CSE-ConnectionGUID: Kna9FCnaTyKB4yUDYx4w9A==
X-CSE-MsgGUID: timxbB99Qg2ShcGiPOLOjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60798366"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60798366"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:19:05 -0700
X-CSE-ConnectionGUID: QyYec3BIRCqiBKo9kkZawg==
X-CSE-MsgGUID: 8IsUpOnoTFGJuK7FepD+Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178036809"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:19:03 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t v4 2/4] lib/intel_vram: Add library for VRAM accesses
Date: Wed,  1 Oct 2025 12:18:48 +0200
Message-Id: <20251001101850.25299-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251001101850.25299-1-lukasz.laguna@intel.com>
References: <20251001101850.25299-1-lukasz.laguna@intel.com>
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
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/intel_vram.c | 189 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_vram.h |  22 ++++++
 lib/meson.build  |   1 +
 3 files changed, 212 insertions(+)
 create mode 100644 lib/intel_vram.c
 create mode 100644 lib/intel_vram.h

diff --git a/lib/intel_vram.c b/lib/intel_vram.c
new file mode 100644
index 0000000000..6b555825e9
--- /dev/null
+++ b/lib/intel_vram.c
@@ -0,0 +1,189 @@
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
+	fd = openat(sysfs, "resource2", mode);
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
+ * @size: pointer to store VRAM BAR size
+ *
+ * Opens the VRAM BAR file descriptor for the specified device and retrieves
+ * its size by using fstat().
+ *
+ * Return: 0 on success, or negative value on failure.
+ */
+int intel_vram_bar_size(int pf_fd, unsigned int vf_num, uint64_t *size)
+{
+	int fd, ret = 0;
+	struct stat st;
+
+	if (!size)
+		return -EINVAL;
+
+	fd = intel_vram_open_bar(pf_fd, vf_num, O_RDONLY);
+	if (fd < 0)
+		return fd;
+
+	if (fstat(fd, &st))
+		ret = -errno;
+	else
+		*size = (uint64_t)st.st_size;
+
+	close(fd);
+
+	return ret;
+}
+
+/**
+ * intel_vram_mmap - Map VRAM BAR region
+ * @pf_fd: PF device file descriptor
+ * @vf_num: VF number (1-based), or 0 for the PF
+ * @offset: Offset (in bytes) within the BAR to begin the mapping
+ * @length: Number of bytes to map
+ * @prot: Memory protection flags
+ * @map: pointer to vram_mapping struct to store address and size of the mapping
+ *
+ * Maps a PF or VF VRAM BAR into user space using mmap(). On error, it sets the
+ * mapping address to NULL and the mapping size to 0.
+ *
+ * Return: 0 on success, or negative value on failure.
+ */
+int intel_vram_mmap(int pf_fd, unsigned int vf_num, uint64_t offset, size_t length,
+		    int prot, struct vram_mapping *map)
+{
+	uint64_t bar_size, end;
+	int fd, ret = 0;
+	void *addr;
+
+	if (!map)
+		return -EINVAL;
+
+	map->addr = NULL;
+	map->size = 0;
+
+	if (!length)
+		return 0;
+
+	ret = intel_vram_bar_size(pf_fd, vf_num, &bar_size);
+	if (ret)
+		return ret;
+
+	end = offset + length;
+	if (end < offset || end > bar_size)
+		return -EINVAL;
+
+	fd = intel_vram_open_bar(pf_fd, vf_num, (prot & PROT_WRITE) ? O_RDWR : O_RDONLY);
+	if (fd < 0)
+		return fd;
+
+	addr = mmap(NULL, length, prot, MAP_SHARED, fd, (off_t)offset);
+	if (addr == MAP_FAILED) {
+		ret = -errno;
+		goto end;
+	}
+
+	map->addr = addr;
+	map->size = length;
+end:
+	close(fd);
+
+	return ret;
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
+uint8_t intel_vram_read8(const struct vram_mapping *m, size_t offset)
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
+void intel_vram_write8(const struct vram_mapping *m, size_t offset, uint8_t value)
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
+uint8_t intel_vram_write_readback8(const struct vram_mapping *m, size_t offset, uint8_t value)
+{
+	intel_vram_write8(m, offset, value);
+	return intel_vram_read8(m, offset);
+}
diff --git a/lib/intel_vram.h b/lib/intel_vram.h
new file mode 100644
index 0000000000..3f5b56e982
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
+int intel_vram_bar_size(int pf_fd, unsigned int vf_num, uint64_t *size);
+int intel_vram_mmap(int pf_fd, unsigned int vf_num, uint64_t offset, size_t length,
+		    int prot, struct vram_mapping *map);
+int intel_vram_munmap(struct vram_mapping *m);
+uint8_t intel_vram_read8(const struct vram_mapping *m, size_t offset);
+void intel_vram_write8(const struct vram_mapping *m, size_t offset, uint8_t value);
+uint8_t intel_vram_write_readback8(const struct vram_mapping *m, size_t offset, uint8_t value);
+
+#endif	/* __INTEL_VRAM_H__ */
diff --git a/lib/meson.build b/lib/meson.build
index f50a8d44b4..725a46e98e 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -71,6 +71,7 @@ lib_sources = [
 	'intel_mocs.c',
 	'igt_multigpu.c',
 	'intel_pat.c',
+	'intel_vram.c',
 	'ioctl_wrappers.c',
 	'media_spin.c',
 	'media_fill.c',
-- 
2.40.0

