Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0936C27C50
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 14:05:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BE111231C;
	Tue, 28 May 2024 14:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sal9ylQD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629711122F1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 14:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716905113; x=1748441113;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=AIJomWTUGwFXAw4IA9bOE77H/XSqZN9E+G6fWSPoFRM=;
 b=Sal9ylQDoI3hdnyB2zD8XBMsJZO2oIRgBeh+UZw5SqGlRpf0NsfNcUVj
 iqSDAhrils2Aj6GQ7EOeq2Ux1O1ge/2NmWNAhjvyekA90pNZUJld0KaXe
 ot+IugfZ2yfyCCOQGRccD4I5WL+r02kDM/OKmZl0hajG2fnYqYLvlBI60
 /IKQ+KbYD/0z17ND3GGLA+rrxrbLKaA0X+ba91Xi5AN3SrykYHTyh6O8a
 RvVeyUjHj2yajHu47VMhRJ/q7Ex2txheSm1Ro71QQAXSvAhZmdzgj3j4V
 EV4a5gzgQIsqYh6cMg43sUj1t95haDAMnvP2M/M72sgXbkMiKIojHg4W5 Q==;
X-CSE-ConnectionGUID: Sp71K8MTTJWRE4FelQPU8A==
X-CSE-MsgGUID: yuU5kt/0R0isofqaWqV6uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13074960"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13074960"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:05:11 -0700
X-CSE-ConnectionGUID: ZBeBd31pSfOOc1FwuHhrKA==
X-CSE-MsgGUID: HaQbNNEtS1uebrF1tImsqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="58273596"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:05:09 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 28 May 2024 16:04:50 +0200
Subject: [PATCH v5 4/5] lib/igt_sysfs: add helpers to access engine sysfs
 directory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-iga64_inline_ups-v5-4-fdd8e9dcd64c@intel.com>
References: <20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com>
In-Reply-To: <20240528-iga64_inline_ups-v5-0-fdd8e9dcd64c@intel.com>
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
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmVeSMfsccQGJedQXrt42Yortb+5gMVncR6jL6lmIo
 pbd/0t+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlXkjAAKCRAjYrKT3hD910Y1C/
 sFQ67LAPK5uN3OvEifBQT1m8SuA7yQzwOW7TcB7yltMBvi5VCATp8DLY4C+zECAEz+02azeiaWAmJo
 1PbFQ+kefSdHbV59bjfmijXEf3LgFgw+KpfTLPJhTnuo8E+WIvKEauG14+mflcZwogVVMgT2Jbi8gv
 XfRqmqs9AnPw87Dx2f3/KsuIKvaJiIzlcoTe9s7ZDSlk9JKc5ftXwpKlLHNmK1q4Qk1/mCYAxMaPSf
 oYh8nIs0+wIo4IdN8Eml7s0WVhMQiA8g4EUCobOCQW5yI13ydBllydI5KVw0+GAZGiCHvpjeOIt0Te
 WvkglrW1K3GWFuu/ynPwyB/eYaIImtJ/LzA8TQ7HBnV6ySsDm5Ra+N5nQpv2M5mI585nrEmRGxJOIk
 3i5XhqMqbvUVv30wLI2eBH9ldG/BBvQZl6wyOErw9GaL+64cFp9LoXw9yic00oVmb+q24CqCwcmxy4
 pPyXhzGwDrpA+RBht6lPphE+y4eXxxz+FhSpsEkNXrpsQ=
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

