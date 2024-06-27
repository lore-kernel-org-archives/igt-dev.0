Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E8AC2BD09
	for <igt-dev@archiver.kernel.org>; Thu, 27 Jun 2024 07:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8AE10EA5B;
	Thu, 27 Jun 2024 07:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MydtEAPG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87F810EA57
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jun 2024 07:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719473128; x=1751009128;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=TTszHYYpvtNdV/9VQje3j7/mkWW9CWpNF2tCqUWydBM=;
 b=MydtEAPGoNbLLnB7qfZ8qj7ggVEiUx/fKSyIHgn68h09EqWSokE8Ar5Z
 TEC2YYfeA9rCaFCrieGe/tzkSYGQjNRMTnxESqC0bUI+8HmOCn1nnAIkU
 mncsgV1/d/OeTtme+/omn4aZABC+ZnTtKT4S1tLW3/D28yfQF3+oMOzwy
 wRkiGzia8QXT5FqRY9YH+AZJsy54zuwaJP+iU7kgbkj/w3tPJBx4TC8lN
 iO8mLXOXOhf99NUfJpHBaOOVVxg89FXP+vv7L+uWs3+rgUXTsRJHHaQQo
 57tQyTLaLV4b6Sdx5piQXG/WtpmqAaB5XXgIh1xxWRCgfelhsT9Gv3W+Y Q==;
X-CSE-ConnectionGUID: tIv3oCUDRGORkk6FuHTrpg==
X-CSE-MsgGUID: eWYg1Mb/QqmFoONfoE97hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20466246"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="20466246"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:25:27 -0700
X-CSE-ConnectionGUID: pz1En9PyR5OgPrGsdwBeyQ==
X-CSE-MsgGUID: GYAxO8ArSGmLTX/oaqdYxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="49221730"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 00:25:26 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 27 Jun 2024 09:25:03 +0200
Subject: [PATCH v8 4/5] lib/igt_sysfs: add helpers to access engine sysfs
 directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-iga64_inline_ups-v8-4-08605c9360d3@intel.com>
References: <20240627-iga64_inline_ups-v8-0-08605c9360d3@intel.com>
In-Reply-To: <20240627-iga64_inline_ups-v8-0-08605c9360d3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3243;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=TTszHYYpvtNdV/9VQje3j7/mkWW9CWpNF2tCqUWydBM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmfRPdt4SArFe8Leju2XeUdqpN4FKTJLHQ/5svR/Kw
 ZGbaXa6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZn0T3QAKCRAjYrKT3hD917XqDA
 Czn47TPBaqmh7f8yk/+DvqF5iXDcVtLKRu1yFqvuu43/uisQeEKxsNGDIn+mB0+yaiaHgrSVmTY9Uv
 MdZA/T7T43fSqJU+lfisnFgGCGqfoF1dIWbk5fUwze+nLTfVVwC7xK2/laHne46VTJDgLmyQqqiyoW
 bnsox8YINOdQD14IzdMoTF3be0MOyki+RnpMdUgwlvj0pz597lKqAq0owkbSlZ+wxdsUv5rL1HGkvM
 ZQpSFql4j7MAyOtO10wAqs9/T8izSi+dYMn9pwecd1ygqHc57AyUxTF7kgvbts+y/8XbuyNGp6Hc0B
 CXZ8U5BQPhwb3m6Rk7m1NHrN11UkGqQi4X1Ntgp0mFxadB3q/9DRl9840tfNIz1a+zwclTrlagOEF8
 TgYxo10kniaF0cKJHUoKlIqBpmOqFUddshPVpv4DooffTuAt3Ae0X4LdH+fizWp51zNTKNS3Ndy7jW
 1TTBswoiGjWolhsZU7zbEFZtjdPRVOoyEb9jVOBW9hCjw=
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
v8:
  - added xe_prefix to local helper

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_sysfs.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sysfs.h |  3 +++
 2 files changed, 74 insertions(+)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 0c5817eb1580..ffeec1ca2132 100644
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
 
+static const char *xe_engine_class_to_str(__u16 class)
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
+		 major(st.st_rdev), minor(st.st_rdev), tile, gt, xe_engine_class_to_str(class));
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

