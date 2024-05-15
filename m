Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18945C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 09:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F2B10E4E1;
	Wed, 15 May 2024 09:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQCyTVX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC8A10E4E1
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715764525; x=1747300525;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=AIJomWTUGwFXAw4IA9bOE77H/XSqZN9E+G6fWSPoFRM=;
 b=PQCyTVX0Pn7NBCVYHndFiDhTku1scHGD2IpqfLmwKPVpGpYl9aah9rDd
 6nNE6RvCUoumqv05jMkClEOFZtqZERD8VNFf/VH2Jo8RWHf5jqjMO0Dn3
 Wx8YOxHGv9OKLejaYk0cOSZlgFSNBD2wUg712bcjTXpzbKIBu0GKE+4jZ
 zrtKmQ89eGnCuUrwFc5sUWNGksJv4CoqlefxxxIsOQidC44x9z/hUMILE
 y4qLGuegT15/uuSrWtsI/4Fr0pOrHeAHUpw2mct+P7bA7JpztXPbhD1uZ
 wkvhgVzAOB0t/HyEG1R0Q1jLwT9AkH5cAb7vu/q9UepirwJjgU5EYgGzd A==;
X-CSE-ConnectionGUID: PV1AA06OSnO7lGpQBhsTqQ==
X-CSE-MsgGUID: EHe5n+ozQyao0DhqdWGyuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11632068"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11632068"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 02:15:24 -0700
X-CSE-ConnectionGUID: moucyiuwSl6UETPbHH0xNA==
X-CSE-MsgGUID: cwguO0xPRUqzaX4WmBVmGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="35776220"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 02:15:22 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 15 May 2024 11:15:03 +0200
Subject: [PATCH v2 4/5] lib/igt_sysfs: add helpers to access engine sysfs
 directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-iga64_inline_ups-v2-4-693743cb0985@intel.com>
References: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
In-Reply-To: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=AIJomWTUGwFXAw4IA9bOE77H/XSqZN9E+G6fWSPoFRM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmRH0i4WZB3yTuldjeEop2gLv0KvSAV1K9kE5OR9mF
 hIej4WeJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZkR9IgAKCRAjYrKT3hD918IcC/
 9Oc3PEqvW60Qecjzzn0SxYkrL1E+z1GJySGq4pZGRG/oPdxmyb6VFtCqyeamGf4gFod6WVVFfCdfrZ
 BYZwhtfgplPvv7vjPOXvVoxYlCZZI5nZyw1fUAdHqJdV6cyFLaQX1KefWM94iILVFVyCWdHE1ZkOIy
 ww488/o1een153oKrvtNsUFV+MfvMilBDOITnykdm0sAQOdAR+dVx5QmCin6ZsLfgllc1ULBPLU8Yb
 KGj9OMdTgcIC9ixYNj6ajRUVFO01WJqz9idg5/N1DsogkoZE14Z5iaCRS2U47KgG6Lwx9MOWKQwC/+
 00f7QAeF9TcZRinISvSMKDzSkQJNTC9Q1FLXOu0J3OVSYHDISKp0KFKpE+iTYtTdnNyIabD9n5fPZB
 VYlhs5fHYP8DXFejwS+0Uxt8h7PDDqNLwFqfbwRctK62IKTGXEjICdYGqRXv3TXKFwwlt9Ys09ibSu
 SA6psD+Sr9YUv7vEfpyfFmcTFpe7806W1Fmp01uZCgLuk=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Helpers follow convention of xe_sysfs_gt_(path|open).

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 74 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 0c5817eb1580..e11eecc25aa1 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -40,7 +40,9 @@
 #include <dirent.h>
 #include <unistd.h>
 #include <fcntl.h>
+#include <xe_drm.h>
 
+#include "drmtest.h"
 #include "igt_core.h"
 #include "igt_sysfs.h"
 #include "igt_device.h"
@@ -263,6 +265,75 @@ int xe_sysfs_gt_open(int xe_device, int gt)
 	return open(path, O_RDONLY);
 }
 
+static const char *engine_class_to_str(__u16 class)
+{
+	const char *str[] = {
+		[DRM_XE_ENGINE_CLASS_RENDER] = "rcs",
+		[DRM_XE_ENGINE_CLASS_COPY] = "bcs",
+		[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = "vcs",
+		[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
+		[DRM_XE_ENGINE_CLASS_COMPUTE] = "ccs",
+	};
+
+	if (class < ARRAY_SIZE(str))
+		return str[class];
+
+	return "unk";
+}
+
+/**
+ * xe_sysfs_engine_path:
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @class: engine class
+ * @path: buffer to fill with the sysfs gt path to the device
+ * @pathlen: length of @path buffer
+ *
+ * Returns:
+ * The directory path, or NULL on failure.
+ */
+char *
+xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen)
+{
+	struct stat st;
+	int tile = IS_PONTEVECCHIO(intel_get_drm_devid(xe_device)) ? gt : 0;
+
+	if (xe_device < 0)
+		return NULL;
+
+	if (igt_debug_on(fstat(xe_device, &st)) || igt_debug_on(!S_ISCHR(st.st_mode)))
+		return NULL;
+
+	snprintf(path, pathlen, "/sys/dev/char/%d:%d/device/tile%d/gt%d/engines/%s",
+		 major(st.st_rdev), minor(st.st_rdev), tile, gt, engine_class_to_str(class));
+
+	if (!access(path, F_OK))
+		return path;
+
+	return NULL;
+}
+
+/**
+ * xe_sysfs_engine_open:
+ * @xe_device: fd of the device
+ * @gt: gt number
+ * @class: engine class
+ *
+ * This opens the sysfs gt directory corresponding to device and tile for use
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int xe_sysfs_engine_open(int xe_device, int gt, int class)
+{
+	char path[96];
+
+	if (!xe_sysfs_engine_path(xe_device, gt, class, path, sizeof(path)))
+		return -1;
+
+	return open(path, O_RDONLY);
+}
+
 /**
  * igt_sysfs_gt_path:
  * @device: fd of the device
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index f37d80ec130e..6c604d939013 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -166,4 +166,7 @@ int xe_sysfs_gt_open(int xe_device, int gt);
 char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int pathlen);
 int xe_sysfs_tile_open(int xe_device, int tile);
 int xe_sysfs_get_num_tiles(int xe_device);
+char *xe_sysfs_engine_path(int xe_device, int gt, int class, char *path, int pathlen);
+int xe_sysfs_engine_open(int xe_device, int gt, int class);
+
 #endif /* __IGT_SYSFS_H__ */

-- 
2.34.1

