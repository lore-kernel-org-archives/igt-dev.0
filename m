Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934E1C25B7A
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 13:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D7E10F340;
	Fri, 24 May 2024 13:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blJhpo3K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF3110EA84
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 13:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716557541; x=1748093541;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=AIJomWTUGwFXAw4IA9bOE77H/XSqZN9E+G6fWSPoFRM=;
 b=blJhpo3KQDCCyDDjB3qR4ZMbFWBYFFLCbUltqkmqUCB9k7vRgBEMudgS
 V28ojwUjloHfVdkdVFKuyYiNpjKdxAr6TSjqF0iWyMMdbSdAYkxNgBzeb
 QZ7gQmyIve5QdT5Hvgpwsv/pP8hkPkBok9pn3GCnd3lCWq6+9YYMxl091
 6pdN6+fP2k3MJ5F7YeyM+Zo0+eNa9nDsIGgaOyV9H7Frfk5t4mfAq7ks7
 OlgXMDKN4FwBhQYPCH8CJ81b/FbS1q0qvPWoaPrfDHvJE0mu1KY48yOGb
 5sodLuCbkEUj20mI7YkJEy9ycDFHWpOmeLNoyLrfVmFn/EPS5K2LKMaeZ A==;
X-CSE-ConnectionGUID: KG4UJiIrS0icv6L9bgKzfg==
X-CSE-MsgGUID: D0V/WfaVRyGlhTcnqB3zHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30441286"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="30441286"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:32:20 -0700
X-CSE-ConnectionGUID: 1r38xrujTeWDcxeKdQW9PA==
X-CSE-MsgGUID: eEtBgCg2TAW4QFIz30t7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34040916"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 06:32:18 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 24 May 2024 15:32:02 +0200
Subject: [PATCH v4 4/5] lib/igt_sysfs: add helpers to access engine sysfs
 directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-iga64_inline_ups-v4-4-c2e31c55e083@intel.com>
References: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
In-Reply-To: <20240524-iga64_inline_ups-v4-0-c2e31c55e083@intel.com>
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
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmUJbafwyfZ/WkuADfECH3Q7HPjImHEwTGswTYMSEY
 gFN0N8WJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlCW2gAKCRAjYrKT3hD91wP2C/
 0ZEt4V8ElnDOkiAgaN0FGBjUHmeYy9LDGWutlIAd9f+nHqczOKbEKfsXQentNKGwGDhAU98GXEZh/V
 yc6B9+gG7M2mVO5WwjEnRe3IP0Hn3JDTog2tFA9hHi4+0440PFadevM+KhkbCT3GRYq9h9M6V3RTPn
 ysLTZwi5reHQm+9rboE3+MmhSfZbCOVZ2qztbte2tWvlb5GUYudIekdLzjEClPtrEo8pjWzo8sN+Hn
 MnJcQmDjKpxwN1XxYhUmdmweDmiA1HKC7Nx1Txgf2G7v7s9o3aPqMfPily13qfYkV+9GfpRz6STpJa
 rQi9DId8pbtAz8YMqzc7I+pirTzGXyzb2aQHZISv8BunZl/44rM1j8FLsHgPeRtiG/a+fuNNgGq7WJ
 cVtReTxhscA7WT8Oyb1YQOvIdQsynNJklWwgUuHMNg1cbUt3w0M1qhgsS7gdeBGNl90g830gjNW9gO
 uPz+/uXUQUo2A1O08EcsBvQIBD6FMlVciYRG/sLnhp9cw=
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

