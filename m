Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478BACFA776
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 11:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F10F10E851;
	Fri, 21 Nov 2025 11:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfxbny/D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9F210E851
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763722831; x=1795258831;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5X+6jyYhCCfb+ojGWvKque8tFUM81xOLRRe/lpJz1EI=;
 b=dfxbny/DkcVc/C7co9sZFD8w1X82OleiWMwSvGP6rzLcYPPToFh7xhdX
 BTPSb3T02+XMlA9Ay7wGjiFn6UHEKQx7/rSbzN5VLJl6XqE0kNm8D78U1
 GdqoEJDAQ/B99KjYrisY5qcP0TCi8QGGHpsicRJ9BCighlSMTj3iO87+f
 47jWUvpN4bweG1HefTu610Rgta0s+Iv7MgrWgi7M2NBbcgrs6uOze5Zgt
 RrzxzQs7mTTiCf2bg9uu1Dc/EmRO+x2g1IRfGwHweS8jCTsWBO5VcqrxF
 Su8USn2BdAQPCK/i536BtzGPKDODPcjml2k/xpRY55j8jpUT0nrg4yoWL g==;
X-CSE-ConnectionGUID: oV2lcFeiR2Kas9TgANhx8Q==
X-CSE-MsgGUID: 4P+/Z1GESfGPD69wlZ+CEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83203549"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83203549"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:31 -0800
X-CSE-ConnectionGUID: xj949KSDQmm+Ht+sMy4+fQ==
X-CSE-MsgGUID: V6AFVp2RSZG3Da5jdHRvqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="195953848"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:30 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 21 Nov 2025 11:59:01 +0100
Subject: [PATCH v5 2/5] lib/xe/xe_query: introduce helpers for device query
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-xe_query_helpers-v5-2-d69c1c160e96@intel.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
In-Reply-To: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3547;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=5X+6jyYhCCfb+ojGWvKque8tFUM81xOLRRe/lpJz1EI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpIEYFft0tYjJIkKy0pTqPveYFYeUohmjxNxxE2
 xia+ASHkFKJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSBGBQAKCRAjYrKT3hD9
 1znmC/9UZcb/K03h1de11oONtbti5wmFRAgRXpEb5Jf3l+o4yXuGeO+Yd2dXYNTqbq48L8Gv4Uj
 QsvcCBSQOuZayuudRycO+EkDXo3EYk2P5Zkkd7HMpbyEhdcWH2Iyc23ZGi22SZLiaw7RdoNHkBN
 5w9UGdODIvZi06sCJv11QUeJBMFAytVa9QtZjJccL+342U6FjE+3UrxRFXcbCuPQC1qioj+BETr
 vBOMaR2vv9FFvNcN1dUbtSOMBf8FI7hn9AyXk0HZ8G9BsA8iq3yfkJGBEKIjngmza5YhJjLqghq
 qD5GJGQQjbW8ARmwxAislYU9g+yp0ILznddFihf7koCrNqZsZLJzNlAk6gQiRnhAo9PRl1u2Wv2
 rx4RKipxU4JHabyVYwAryZwM9t8jd3xWm+kGu+3QV6Yozq0silZNMZND5jUAjAVAORtsQXEjPnv
 FeN/wJPL1u7mI17kqLif7U6zk2NDUnDCZ02gdaZF+77xav82jimlzB35v74By8ND7oT+c=
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

Helpers abstracts out common bits of DRM_XE_DEVICE_QUERY_HWCONFIG ioctl:
- query data size,
- alloc memory,
- get data,
- error checks,
- valgrind annotations.

There are two flawors, to fulfill current usage patterns:
- xe_query_device_may_fail - returns NULL if query is not supported,
- xe_query_device - asserts on error otherwise returns valid pointer.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_query.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h | 20 ++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 53af86a99378dfda6f988e01a4d842b266e94a80..a185b852e19b87e393f4bc6edbf9e0952439d518 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -25,6 +25,49 @@
 #include "xe_query.h"
 #include "xe_ioctl.h"
 
+/**
+ * xe_query_device_may_fail:
+ * @fd: xe device fd
+ * @type: query type, one of DRM_XE_DEVICE_QUERY_* values
+ * @size: pointer to get size of returned data, can be NULL
+ *
+ * Calls DRM_IOCTL_XE_DEVICE_QUERY ioctl to query device information
+ * about specified @type. Returns pointer to malloc'ed data, which
+ * should be freed later by the user. If @query is not supported
+ * function returns NULL. On any other error it asserts.
+ */
+void *xe_query_device_may_fail(int fd, uint32_t type, uint32_t *size)
+{
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = type,
+		.size = 0,
+		.data = 0,
+	};
+	void *data = NULL;
+
+	/* In case of unsupported query xe driver usually returns error,
+	 * but in case of HWCONFIG it can also return query.size == 0
+	 * on older platforms.
+	 */
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) || !query.size)
+		goto skip_query;
+
+	data = malloc(query.size);
+	igt_assert(data);
+
+	query.data = to_user_pointer(data);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	VG(VALGRIND_MAKE_MEM_DEFINED(data, query.size));
+
+skip_query:
+	if (size)
+		*size = query.size;
+
+	return data;
+}
+
 static struct drm_xe_query_config *xe_query_config_new(int fd)
 {
 	struct drm_xe_query_config *config;
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 6a97d384a364979e1a3fa4e0785397236068d0fc..15d5c26baf5be6e107495247ca1aaefea551d821 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -143,9 +143,29 @@ uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 uint32_t xe_hwconfig_lookup_value_u32(int fd, enum intel_hwconfig attribute);
+void *xe_query_device_may_fail(int fd, uint32_t type, uint32_t *size);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 
+/**
+ * xe_query_device:
+ * @fd: xe device fd
+ * @type: query type, one of DRM_XE_DEVICE_QUERY_* values
+ * @size: pointer to get size of returned data, can be NULL
+ *
+ * Calls DRM_IOCTL_XE_DEVICE_QUERY ioctl to query device information
+ * about specified @type. Returns pointer to malloc'ed data, which
+ * should be freed later by the user. If @query is not supported
+ * or on any other error it asserts.
+ */
+static inline void *xe_query_device(int fd, uint32_t type, uint32_t *size)
+{
+	void *data = xe_query_device_may_fail(fd, type, size);
+
+	igt_assert(data);
+	return data;
+}
+
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
 

-- 
2.43.0

