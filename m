Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87573CEBF8D
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335FC10E1BD;
	Mon, 17 Nov 2025 10:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLey7ImW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA13A10E1B9
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376560; x=1794912560;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Z1fS+ZWvsGZu4JSBmY6dctr5c++laBgLQuuTiiAzvMU=;
 b=XLey7ImW5XY7DgMck8a6aTvDIhPRp+yr9N4lxCfBSeQ22sy1BD0kqkd2
 WHS3EX0w5lSttmetUxsY0KpAMqkuxsqHD595oCuGjFJGeAFI0o7WRID0q
 om2+yz7KeS7lu3cym3jb4kc+DnbAvRhhN+HVNHJWxuVeT6GLEj9PHFIkk
 efCwMZmWqhVfrjqxFSM41UUW6aTfQY4C1tbkTioV3+uN8kCKHj6xRRm9t
 n3RKLlTOkLrECe70DKT92BoI5avHJBtvsiPzhZG6FJSqbe33eK2rBzJNs
 fO4C7HHsoG7/1nvKysFbKWYxvF9FQyKXVUbtF4nAxEeNEZ2Z1zQDwsYyF w==;
X-CSE-ConnectionGUID: 0LrEu9YITLeCQ68fV/EpBg==
X-CSE-MsgGUID: 4LQMMrV+TKeHi+xsLXLEAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65306093"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65306093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:19 -0800
X-CSE-ConnectionGUID: wcuCbyx3RvOwZh2hcZD0FA==
X-CSE-MsgGUID: MD2kNya3RQ2kEUVGbGbymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213817980"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:17 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Nov 2025 11:47:41 +0100
Subject: [PATCH v3 3/8] lib/xe/xe_query: introduce helper for device query
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-xe_query_helpers-v3-3-25d984ae58cb@intel.com>
References: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
In-Reply-To: <20251117-xe_query_helpers-v3-0-25d984ae58cb@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2914;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=Z1fS+ZWvsGZu4JSBmY6dctr5c++laBgLQuuTiiAzvMU=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpGv1jlMKZP7J9aAP7W76YdHO3cxPg0PUHN06P8
 6yEs3qt8NuJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaRr9YwAKCRAjYrKT3hD9
 14K3C/9bszlwvLoGr6yd6zfZGYcGHpPsnegq1t3ijbTj6bDGHVoUC01+N9Hc1ElPw+mF8LYM1Oj
 9s+lEvtB8wc7H4UTRMVmrKWXxGQzGI9pdAuc48RZeL84jysh7jRoNUm5TBr0YY7mrtgBXu5g0c1
 yGGpxwh/g5dxNTxg2OXBNF++yRetMFTsIa3/c20xBiTLBSIGXfVbq+BFWPEZ7UXHHl0wiYwNbL4
 htiSa/6Z0BgAPT+An9NvxSBWVud+XQhrvfIBk21abs0YmPRA/87+ljq2MbAJyjBDyXS89h0kcp4
 favSjfHFXK9tC7imyvjOCjCJUCW1iUc3/Q3y+rpb6qIJx+DtUSUJKGzKUPDURQ8ZjFob4lgnore
 RDK8OBi8lKyEP+THfyWQM64xMCKvD2tGPK28bNW4MMRHJln0xhNJD/CE8hSoidRy2QWND6iLW02
 LtnXItiKY9zFMVMFRkHv1X3KLC9J8p7G352onw/gdgAsLJC/8o7HzjpyXF0eOVBav2WSg=
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

The helper abstracts out common bits of DRM_XE_DEVICE_QUERY_HWCONFIG ioctl:
- query data size,
- alloc memory,
- get data,
- error checks,
- valgrind annotations.

Since almost all users of DRM_XE_DEVICE_QUERY_HWCONFIG use asserts for
error checking helper uses them as well.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_query.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index a3fab133e6c4d9f949564b47cc817383bee7a568..4d46b36fa9754fc48e50633dd79f06b935ce8300 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -25,6 +25,53 @@
 #include "xe_query.h"
 #include "xe_ioctl.h"
 
+/**
+ * xe_query_device:
+ * @fd: xe device fd
+ * @type: query type, one of DRM_XE_DEVICE_QUERY_* values
+ * @size: pointer to get size of returned data, can be NULL
+ * @can_fail: bool indicating if query can fail
+ *
+ * Calls DRM_IOCTL_XE_DEVICE_QUERY ioctl to query device information
+ * about specified @type. Returns pointer to malloc'ed data, which
+ * should be freed later by the user. @can_fail indicates if function
+ * should return NULL or assert if @query is not supported.
+ * On any other error it asserts.
+ */
+void *xe_query_device(int fd, uint32_t type, uint32_t *size, bool can_fail)
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
+		igt_assert(can_fail);
+	if (!query.size)
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
index 4f1c0687133c03b81ba53f95457c55860e5ce194..b1483f5eb6ac330454e719423dee52013b4b6137 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -143,6 +143,7 @@ uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value);
+void *xe_query_device(int fd, uint32_t type, uint32_t *size, bool can_fail);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 

-- 
2.43.0

