Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06ADC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 09:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E253C10E811;
	Wed, 12 Jun 2024 09:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGo7ciKb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8FC10E80B
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718185164; x=1749721164;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=a67L0E/1/ZBI6WIG3t/Bo15Tlw94Ljn2CHuIx4+NjBY=;
 b=KGo7ciKbmvI7g6j+m3xi+o9pYLtU15RqkQew0i7ZufMTQuJevw5ewjbP
 2PGKxhpL1c53L6Dm7V9Zz8dj/8aM9GrirX5wc8/Z4z8q1hBqKp+jN/4Xt
 riPOvk3PGEutUseJGOQEqgEe9Y/0IzWnQ/ZZLlPgtdrr3cCS1ydln4GT5
 N3PgOm5LkjC2ZU/X/XexahRYq+7G/b+OArxG0CdhYVar/NwEXbiqcCvnP
 awrmwWrgm2/JCmFJCeqRofKfhKVGxn+W/avmItxoMFx/P7tTR7ni2d7R3
 zGO6YoTk98iE0Ug7WzUDbtMkpjTrv2OxVE9dm91rWmf+iszxRxTbSPgie g==;
X-CSE-ConnectionGUID: 2mqGLttwRJmd99+/N2KABg==
X-CSE-MsgGUID: lsCt5rrDSneMA8dDmZtwdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14901174"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="14901174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:39:24 -0700
X-CSE-ConnectionGUID: EYbAGvPXRyel9/wswOwENQ==
X-CSE-MsgGUID: Nzlp3hVrR5SfJadnu2kO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39795078"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:39:22 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 12 Jun 2024 11:39:02 +0200
Subject: [PATCH v7 4/5] lib/igt_sysfs: add helpers to access engine sysfs
 directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-iga64_inline_ups-v7-4-0d4b840498c7@intel.com>
References: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
In-Reply-To: <20240612-iga64_inline_ups-v7-0-0d4b840498c7@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=a67L0E/1/ZBI6WIG3t/Bo15Tlw94Ljn2CHuIx4+NjBY=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmaWzCHP8qLKxvc32Exhkev48pE2oqDgkvU3hC/er8
 6P8fI5GJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZmlswgAKCRAjYrKT3hD91237C/
 9K1jTvL87GPugVf1a4haiohQrZg9d4pHZPuZGx3c5ZZREDsLqDBIQoNH2ozCV/l8ok4ix/31OfAs3v
 /NSbuuGwo4JsTJvrnkZf86zpcirTPMWmwGknAiORNICveyKpSuRYrWJVQJ/+6gHr92pxIeLnUIynQY
 +xIIvihjQdhEUi8gTHtitw66OAKPGvEKOCbb65SmLy81rSDmqaQrBYjyVI5h7EDgWetL7ZbtEIMVFc
 xTQqNQhRoeI/Rv2+32j5szrTx9WN/LNBx2mQi7Qq3MR1Mz6f5tOQ12IW+BAQoFi3INAOKtsWqwyssZ
 GNknhEgkLvA5mcwSM2/Im4NRKAWGcfhVCf/MZ3xr4zkfRQo5Dpr+6JivZBnPHeLvO1tn4MirDKN7TR
 PJYK6TPCqiQIbxQD0F+6eOVMFl+/mvMllc6KXWlkWfhuSbrMZV47FcXZOI0/OBhlPP4fptzKTP2V1x
 vAz6IRWrGJAqITp+AUFO6i2Gg0dih/CdEIqb+6OFnVeuI=
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

v7:
  - staticize local const array

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 74 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 0c5817eb1580..90b923a99a26 100644
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
+	static const char * const str[] = {
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

