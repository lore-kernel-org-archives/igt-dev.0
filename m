Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E991DD69109
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 13:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A840F10EC76;
	Thu, 28 Nov 2024 13:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iznCSrE3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8412110E479
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732799120; x=1764335120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MgFzQUl75ZjJPsj3+bTKzTYYbnZS6EiuVs4JIfXeTDI=;
 b=iznCSrE3QBz5AKfbuCKBLXs7u0bV3iPQwaxuu7w/emzd0dKZbL8jrYnd
 f/stsxMeL1X+sinO0oOivpwYp5ixioxZ4BziJ7sZX+T49vio3jvpiSQg+
 oKdbp/NKJOqUO/O1EwwNKx/8tjeHuih1gClgjZvDLEL3Ur6VWm1n9ncXA
 YcZMBMoJLmVzG4KTtDgRvCpSnOfWg7hElmMTBjHukLzZWDYmD7v4SOI4u
 GT6iy77oKNZfmiWhBLaWmvIYTLXy2VlZxF8+m1EngreE5Zv4DEb0IPmcc
 EbjUkz106eprKHdFwyDGjVOopKb/2WjORAptzALzB2aK9ukl1u0/aBEs0 w==;
X-CSE-ConnectionGUID: rBAI5qXBR/ye9lRhxSQtvA==
X-CSE-MsgGUID: ItRBvbvOSvOzGSJKBHTDpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33183278"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33183278"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:05:20 -0800
X-CSE-ConnectionGUID: IeENur6nQAO7IOHGZEFyMg==
X-CSE-MsgGUID: 7JofJQEaSwiz7vgZOnh/AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="129736127"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:05:18 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 2/3] lib/xe_query: add xe_hwconfig_lookup_value() helper
Date: Thu, 28 Nov 2024 13:05:02 +0000
Message-Id: <20241128130503.241328-3-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128130503.241328-1-jan.maslak@intel.com>
References: <20241128130503.241328-1-jan.maslak@intel.com>
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

Add a new helper function, xe_hw_config_lookup_value(), that
returns a pointer to the value of a given hwconfig attribute.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/xe/xe_query.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 49bed033b..f3731d9d3 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -839,6 +839,45 @@ uint16_t xe_gt_get_tile_id(int fd, int gt)
 	return xe_dev->gt_list->gt_list[gt].tile_id;
 }
 
+/**
+ * xe_hwconfig_lookup_value:
+ * @fd: xe device fd
+ * @attribute: hwconfig attribute id
+ * @len: pointer to store length of the value (in uint32_t sized elements)
+ *
+ * Returns a pointer to the value of the hwconfig attribute @attribute and
+ * writes the number of uint32_t elements indicating the length of the value to @len.
+ */
+uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len)
+{
+	struct xe_device *xe_dev;
+	uint32_t *hwconfig;
+	uint32_t pos, hwconfig_len;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+
+	hwconfig = xe_dev->hwconfig;
+	igt_assert(hwconfig);
+
+	/* Extract the value from the hwconfig */
+	pos = 0;
+	hwconfig_len = xe_dev->hwconfig_size / sizeof(uint32_t);
+	while (pos + 2 < hwconfig_len) {
+		uint32_t attribute_id = hwconfig[pos];
+		uint32_t attribute_len = hwconfig[pos + 1];
+		uint32_t *attribute_data = &hwconfig[pos + 2];
+
+		if (attribute_id == attribute) {
+			*len = attribute_len;
+			return attribute_data;
+		}
+		pos += 2 + attribute_len;
+	}
+
+	return NULL;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index f8836578e..30ea5ad41 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -15,6 +15,7 @@
 #include "igt_aux.h"
 #include "igt_list.h"
 #include "igt_sizes.h"
+#include "intel_hwconfig_types.h"
 
 #define XE_DEFAULT_ALIGNMENT           SZ_4K
 #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
@@ -118,6 +119,7 @@ struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
 bool xe_is_media_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
+uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
-- 
2.34.1

