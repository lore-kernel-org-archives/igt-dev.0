Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BB1CA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B7910F5B1;
	Thu,  1 Oct 2026 07:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YX6kBaGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEE810F598
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838998; x=1822374998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2yDO3dOjjlZ2FsLa9vgh1mDzR57SE8y7zS8DVyKN1ao=;
 b=YX6kBaGPbLqJ8p8G1JN5AjFv0n7FbaPodvcLfobvLl+jvGk8MAsBpwix
 VJ9RSRuVtB6VHOLFUWXWWpM7fiUe247oTjTMCgoLRz6UY5JmJrPmOzQS+
 8htBMkN1CDOS2YnCx/i37ky9WySTP5637gXlKMpNeM1CGzzwdZNyHBnbX
 G9FIRBfEsZALJ4Uq7WsDQxuiTDpJf/+MHE8cPRdw9h4MF1WohmWvAbXEE
 yT5FHEx2IssNd7tYG3SFM999OBvxXT/LoELc2jUo+OLLTHFsY6gCMixaQ
 1Qig+ZVxsXm97H8uncdwrzwVQKxkapVLqA/BmtWQckEBk2wCcSthDuKBH A==;
X-CSE-ConnectionGUID: psnDt8L/QmuyeU7+53pv2w==
X-CSE-MsgGUID: 9v1X9TeJSmWdohyF29gwIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605998"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605998"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:58 -0700
X-CSE-ConnectionGUID: +XsPw0PYS+ObpSWfjoMl/Q==
X-CSE-MsgGUID: SEAmeDVHRzmdsPgF1GzXmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138341"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:57 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t 11/13] lib/igt_dp: add DPCD read helpers
Date: Thu,  1 Oct 2026 13:07:01 +0530
Message-Id: <20261001073703.5067-12-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001073703.5067-1-kunal1.joshi@intel.com>
References: <20261001073703.5067-1-kunal1.joshi@intel.com>
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

Add igt_dp_aux_open() for opening the AUX channel device of a
connector, and igt_dp_dpcd_read() and igt_dp_dpcd_read_byte() for
reading DPCD through it. We'll be adding a user in follow-up.

Only add reads, as DPCD writes from userspace would race with the
driver. The AUX device only exists with
CONFIG_DRM_DISPLAY_DP_AUX_CHARDEV=y, so return errors instead of
asserting, and let the callers decide what to do.

kms_dp_aux_dev, amd_assr, amd_replay and amd_multidisplay_modeset have
local copies of the same, which could be converted later.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Sowmiya S <sowmiya.s@intel.com>
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

