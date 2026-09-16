Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AA2C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:36:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0EF10E0D8;
	Wed, 16 Sep 2026 04:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EAE20Vwm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A04110E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532806; x=1821068806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OjxqRsAR96xE4S+z3/0ZZFx1V+K7t30p0p3zxRZg5Z8=;
 b=EAE20VwmyUgnIw+SH8/PoIOloTrlS2EIKoAko3OJgIbZncdSZ2OyWY0W
 bmR1VRYlWqhiBW5pdvkPeClvfJoAg773/axhSmgy1akiolYUBzZcspdfF
 Bsx0oB55rje/Z087rxDIjY8sbkoXZRcnFyVgEFAxpEpjUwDpHA/GFcvN1
 GkfladrdM9yybFEDKAKk3TciD229UH58L5s9O3FSQxb/aG06gBwGWuXog
 dpH9C99BEC0NnL0z59mksI/Tf2e1GSQOLPKMS9Fk+TRlBAjY1Rvd/yZ7D
 eaPqMiujt0KQWO4UuiRKDFnHnpwxJNwM/DLgv6ZHgF0z2VHq30vxycPDK A==;
X-CSE-ConnectionGUID: g/X/ytaPQ9qn6SexjMFbxw==
X-CSE-MsgGUID: VOoDOA1wQtGXoKMdjTLQKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503258"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503258"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:46 -0700
X-CSE-ConnectionGUID: AeE50ANcT++zfVB0FwA9og==
X-CSE-MsgGUID: 6WhjKCDmRGS7UXQKkYU7MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765068"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:45 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 11/13] lib/igt_dp: Add DPCD read helpers
Date: Wed, 16 Sep 2026 10:17:59 +0530
Message-Id: <20260916044801.1279102-12-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260916044801.1279102-1-kunal1.joshi@intel.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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

Reading the DPCD of a connector means finding the drm_dp_aux child of
its sysfs directory and reading from the matching character device.
Four tests already carry their own copy of that: kms_dp_aux_dev,
amd_assr, amd_replay and amd_multidisplay_modeset.

Add the AUX channel lookup and the DPCD read to the library so that new
tests do not have to add a fifth. The helpers are read only, since
writing DPCD from userspace races with the driver doing the same.

Use pread() rather than lseek() plus read(), which is both shorter and
free of the failure the amd_assr copy has, where the lseek() return
value is asserted to be non-zero and a read at DPCD offset 0 would
therefore fail.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_dp.c | 108 +++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_dp.h |   9 +++++
 2 files changed, 117 insertions(+)

diff --git a/lib/igt_dp.c b/lib/igt_dp.c
index 9f71c9e72..0b1fe73de 100644
--- a/lib/igt_dp.c
+++ b/lib/igt_dp.c
@@ -6,7 +6,13 @@
  *   Louis Chauvet <louis.chauvet@bootlin.com>
  */
 
+#include <dirent.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
 #include <stdint.h>
+#include <string.h>
+#include <unistd.h>
 
 #include "drmtest.h"
 #include "i915/i915_dp.h"
@@ -173,3 +179,105 @@ void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output)
 	}
 	igt_assert_f(false, "Timeout waiting for pending retrain to complete\n");
 }
+
+/**
+ * igt_dp_aux_open: Open the AUX channel device of a display port
+ * @drm_fd: DRM file descriptor
+ * @output: igt_output_t object representing the display port
+ *
+ * The AUX channel of a connector is exposed as a character device when the
+ * kernel is built with CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV. The device is
+ * parented to the connector, so it is the connector's own sysfs directory
+ * which is scanned here and not /dev, and there is at most one entry in it to
+ * match. /dev is only where the matched entry is then opened from.
+ *
+ * Returns:
+ * A file descriptor for the AUX channel device, or a negative error code on
+ * failure.
+ */
+int igt_dp_aux_open(int drm_fd, igt_output_t *output)
+{
+	struct dirent *entry;
+	int aux_fd = -ENOENT;
+	int dir_fd;
+	DIR *dir;
+
+	dir_fd = igt_connector_sysfs_open(drm_fd, output->config.connector);
+	if (dir_fd < 0)
+		return -ENOENT;
+
+	dir = fdopendir(dir_fd);
+	if (!dir) {
+		/* Save the error before close() gets a chance to overwrite it. */
+		int err = -errno;
+
+		close(dir_fd);
+		return err;
+	}
+
+	errno = 0;
+
+	while ((entry = readdir(dir))) {
+		char path[NAME_MAX + sizeof("/dev/")];
+
+		if (strncmp(entry->d_name, "drm_dp_aux", strlen("drm_dp_aux")))
+			continue;
+
+		snprintf(path, sizeof(path), "/dev/%s", entry->d_name);
+
+		aux_fd = open(path, O_RDONLY);
+		if (aux_fd < 0)
+			aux_fd = -errno;
+
+		break;
+	}
+
+	/* readdir() reports both the end of the directory and an error as NULL. */
+	if (!entry && errno)
+		aux_fd = -errno;
+
+	closedir(dir);
+
+	return aux_fd;
+}
+
+/**
+ * igt_dp_dpcd_read: Read from the DPCD of a display port
+ * @aux_fd:	AUX channel device file descriptor from igt_dp_aux_open()
+ * @offset:	DPCD offset to read from
+ * @buf:	Buffer to read into
+ * @size:	Number of bytes to read
+ *
+ * Returns:
+ * The number of bytes read, or a negative error code on failure.
+ */
+int igt_dp_dpcd_read(int aux_fd, unsigned int offset, void *buf, size_t size)
+{
+	ssize_t ret;
+
+	ret = pread(aux_fd, buf, size, offset);
+	if (ret < 0)
+		return -errno;
+
+	return ret;
+}
+
+/**
+ * igt_dp_dpcd_read_byte: Read a single byte from the DPCD of a display port
+ * @aux_fd:	AUX channel device file descriptor from igt_dp_aux_open()
+ * @offset:	DPCD offset to read from
+ * @val:	Location to store the value read
+ *
+ * Returns:
+ * 0 on success, or a negative error code on failure.
+ */
+int igt_dp_dpcd_read_byte(int aux_fd, unsigned int offset, uint8_t *val)
+{
+	int ret;
+
+	ret = igt_dp_dpcd_read(aux_fd, offset, val, sizeof(*val));
+	if (ret < 0)
+		return ret;
+
+	return ret == 1 ? 0 : -EIO;
+}
diff --git a/lib/igt_dp.h b/lib/igt_dp.h
index 0c56ad2ec..44f3b11a1 100644
--- a/lib/igt_dp.h
+++ b/lib/igt_dp.h
@@ -9,6 +9,9 @@
 #ifndef _IGT_DP_H_
 #define _IGT_DP_H_
 
+#include <stddef.h>
+#include <stdint.h>
+
 #include "igt_kms.h"
 
 int igt_dp_get_current_link_rate(int drm_fd, igt_output_t *output);
@@ -27,4 +30,10 @@ int igt_dp_get_pending_retrain(int drm_fd, igt_output_t *output);
 
 void igt_dp_wait_pending_retrain(int drm_fd, igt_output_t *output);
 
+int igt_dp_aux_open(int drm_fd, igt_output_t *output);
+
+int igt_dp_dpcd_read(int aux_fd, unsigned int offset, void *buf, size_t size);
+
+int igt_dp_dpcd_read_byte(int aux_fd, unsigned int offset, uint8_t *val);
+
 #endif
-- 
2.25.1

