Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7182D68B37
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 16:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8555210E821;
	Thu, 14 Nov 2024 16:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/dzaHPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AE510E821
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731601777; x=1763137777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=becKpWe0JkLrtMF8iPnUQmzDCPQ30m9eFKg/HP2E0QU=;
 b=Y/dzaHPMS2tDZZD0erlAqeYMK7pk0XaHYKU0yo/orqRa7fIS+gfhQTya
 wEIpklaQL11GZuRmcUBBp9lI4zDT3fPtaVyGw+DSQUg4XYI5cmJsLLfyE
 ubHecX4W+aa/Ra4oRgIM1Jt/7IbkT/sOgtf3xXgrFnTIVuG8sOAjY/TLu
 sBHfEZtR/ulajosUPVRrr0hm9NlTwm3DXniNWUahcVYJAOyn+8J/sz/Xe
 +2k7zphiJce9hasx58vAo4i8Kw/P5nAgjtYOP/VZRD0rQPJQjUcIzDT1z
 Tznxx7hnyAoY88WHKvNgF90VNcc+JpAN18g+puHGO+0QXWmTRQVPamx5t A==;
X-CSE-ConnectionGUID: qm+OQG/TSIyJWkqfdFmIMg==
X-CSE-MsgGUID: 2DEeqnKySv+YFggRrPsb0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42180180"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="42180180"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:29:37 -0800
X-CSE-ConnectionGUID: zRFBvyjdSamCo/ZgqZxhYQ==
X-CSE-MsgGUID: osyfxk9nTHGdKXz71gceuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93334276"
Received: from art-dev-395.igk.intel.com ([10.102.138.231])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:29:36 -0800
From: "Maslak, Jan" <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com,
	"Maslak, Jan" <jan.maslak@intel.com>
Subject: [PATCH 1/2] lib/xe_query: add xe_hwconfig_lookup_value() helper
Date: Thu, 14 Nov 2024 16:28:42 +0000
Message-Id: <20241114162843.1210570-2-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114162843.1210570-1-jan.maslak@intel.com>
References: <20241114162843.1210570-1-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

---
 lib/xe/xe_query.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 0c9cff066..07d790f37 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -811,6 +811,62 @@ uint16_t xe_gt_get_tile_id(int fd, int gt)
 	return xe_dev->gt_list->gt_list[gt].tile_id;
 }
 
+/**
+ * xe_hwconfig_lookup_value:
+ * @fd: xe device fd
+ * @attribute: hwconfig attribute id
+ * @len: pointer to store length of the value
+ *
+ * Returns a pointer to the value of the hwconfig attribute @attribute and
+ * writes the length of the value to @len.
+ * The caller is responsible for freeing the returned pointer.
+ */
+uint32_t* xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t* len)
+{
+	uint32_t *hwconfig;
+	uint32_t pos, hwconfig_len;
+	uint32_t *value = NULL;
+
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_HWCONFIG,
+		.size = 0,
+		.data = 0,
+	};
+
+	/* Perform the initial query to get the size */
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+	igt_assert_neq(query.size, 0);
+
+	hwconfig = malloc(query.size);
+	igt_assert(hwconfig);
+
+	query.data = to_user_pointer(hwconfig);
+
+	/* Perform the query to get the actual data */
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	/* Extract the value from the hwconfig */
+	pos = 0;
+	hwconfig_len = query.size / 4;
+	while (pos + 2 < hwconfig_len) {
+		uint32_t attribute_id = hwconfig[pos];
+		uint32_t attribute_len = hwconfig[pos + 1];
+		uint32_t* attribute_data = &hwconfig[pos + 2];
+		if (attribute_id == attribute) {
+			value = malloc(attribute_len * sizeof(uint32_t));
+			igt_assert(value);
+			memcpy(value, attribute_data, attribute_len * sizeof(uint32_t));
+			*len = attribute_len;
+			break;
+		}
+		pos += 2 + attribute_len;
+	}
+	
+	free(hwconfig);
+	return value;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index cabb8078c..580f82958 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -15,6 +15,7 @@
 #include "igt_aux.h"
 #include "igt_list.h"
 #include "igt_sizes.h"
+#include "intel_hwconfig_types.h"
 
 #define XE_DEFAULT_ALIGNMENT           SZ_4K
 #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
@@ -112,6 +113,7 @@ struct drm_xe_engine *xe_find_engine_by_class(int fd, uint16_t engine_class);
 bool xe_has_media_gt(int fd);
 bool xe_is_media_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
+uint32_t* xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t* len);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
-- 
2.34.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

