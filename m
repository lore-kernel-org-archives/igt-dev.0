Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2304CC25B7D
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E51F10E223;
	Fri, 24 May 2024 08:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsbPO+ba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADA010E13E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716540560; x=1748076560;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=AIJomWTUGwFXAw4IA9bOE77H/XSqZN9E+G6fWSPoFRM=;
 b=EsbPO+baJd4KgqNpEacn7ns38nMfrFgOSeQuwTp+g+wqJ5YrF2Wfk8DH
 3GGNP84eBOqWmy1PBW1slmJ1xhurhcNKbqCz47UVtJqTw7QDeG6R8p9xy
 MZTeylPBiw0dtAAP8uFJeEO5v68IYRN/cSZc0kTBFV0IK3XEBbiuJSQuo
 a/7vpZH7aW63sUILkahtHSt+fq3u+Ae0C7y3VpZENErUw6yiwaaErQ72k
 1qNstOLtNBytV6vetJgLE7W67aHQMLwoIuomRel4sF8G2y2limYSRkpr6
 pbIY8WKM4ept+H8HH9Rt+zpNg8Y26A4wUjdsVOo95LQtqDmtI0wTBd/3S w==;
X-CSE-ConnectionGUID: qTbROL4WTOqWWlxjQIeIGg==
X-CSE-MsgGUID: GNlTbTwJTcaAMmBrOqD1RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12692331"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12692331"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:19 -0700
X-CSE-ConnectionGUID: CSHpaYWGSkSsrRtaYgaPnQ==
X-CSE-MsgGUID: s818Ts4XS9+N9eeRS01M2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33940915"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:18 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 24 May 2024 10:49:04 +0200
Subject: [PATCH v3 4/5] lib/igt_sysfs: add helpers to access engine sysfs
 directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-iga64_inline_ups-v3-4-62427617ced3@intel.com>
References: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
In-Reply-To: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=AIJomWTUGwFXAw4IA9bOE77H/XSqZN9E+G6fWSPoFRM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmUFSFB0Av3frg2TAFZfBYgtBMvLrg0CZTrUwot8t3
 gBHySp+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlBUhQAKCRAjYrKT3hD91znMC/
 oCk10WlmGSE0vgTnzWIQJ1XynanvhwQYoBkpVqCpQ6WXEvNQKT0SqdjbRHJaT8zhsa9hrrE4IfdFlH
 IIPnUp1y8W+PpeoWOnFy+6xcpha57oRltFslQd2P/DiuDxCG7G/B8YPKr+txZuhRaM9pPX6prTXZIL
 ERURLwLaKZ9GMK+InhrbqLU8b7jFCfZxmUcb68kKVO3/6e9Qad7KBZZQzCYX0ElpxKzRjCucLBoWHB
 jucOHsP5FJVBHkjsOtqiLseuTDEuvFkpoqqWGJeAvOjN3p8/hxNbjk9VowC+sjiB4/XuAdyGCxHv3V
 kvmIYEnZei3Z/goEHq8d1IVyYHn0NfxAuke+HCPCFN6q9AnmM/NRBLXNB4BujXSfYv4YCBgimK7rSf
 TxfsM7WEl/mxISiLPHqb19CwbJ1gv5de4DykOn3VBjEKumJNEikhsoqj7XZNAINGB/1tAKwKJfAFPY
 ygpb7dbDloTRcfUGUfZrzmswGzGZJdOg9CFb3kmxfqstY=
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

