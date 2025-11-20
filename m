Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0516CF8860
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 14:28:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BBB10E75A;
	Thu, 20 Nov 2025 14:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8OMJ9UI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB3F10E761
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763648891; x=1795184891;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=nbzWUyqFt9ms85E42TVpzLbmVkPoyYHM6r7qt6sQI3g=;
 b=J8OMJ9UIF671WpYS13t6+7r8e8AcYxziW++T8hGo1qJZGNtrxiHI2k+/
 S94/rJBZ+M3LkrmAwFm0KwIyd26+IUkEjipwQ/npSPKeVhze798v/AtAo
 6kITJkn9rPlnNN3w7IXd9DaHvZoiBSdxg6lREz09E9irxqT8ofCNXuZih
 M4L901AJecO2NnEW05uldxFuIoQ7ynW8bzoW2vKmB3NtLiVftffHciAhs
 uRVF2zu+l2TeyDFe4+uzgal41temYdBVBV7FeuQh/Az7fDqWQA69YjKN2
 9mhc6fMkIt6Vl1sPLppiv+THR5Bd9E+hmQud8b0rGTmW2nE7Wgvv3djO7 A==;
X-CSE-ConnectionGUID: aNJS55bnSjCjaVQFj14AtA==
X-CSE-MsgGUID: 46WbkPamR/OWkcnJiTOgew==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76824132"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76824132"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:11 -0800
X-CSE-ConnectionGUID: x9Urfp1WTSm5WohAdEeJBw==
X-CSE-MsgGUID: Rofdj7GsQ7Whl+x4slDeMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191057652"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:09 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 20 Nov 2025 15:25:40 +0100
Subject: [PATCH v4 3/6] lib/xe/xe_query: introduce helpers for device query
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-xe_query_helpers-v4-3-2ed6dc04dd94@intel.com>
References: <20251120-xe_query_helpers-v4-0-2ed6dc04dd94@intel.com>
In-Reply-To: <20251120-xe_query_helpers-v4-0-2ed6dc04dd94@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3562;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=nbzWUyqFt9ms85E42TVpzLbmVkPoyYHM6r7qt6sQI3g=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpHyUv6JYMCtQ9RuubGdWrrcFmzPEbzc/cDCO7d
 ce1s/FtR6GJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaR8lLwAKCRAjYrKT3hD9
 1yM8DACeMnuGQjVhO3hB8IRPqNrp3P+wZ6Pt5MP/Te+vXtks7wtm7nkVKEX/f/xNPh2P0zdDBQC
 8T2OKa9s5mUPh5VUzZ9a0BrgkM/L6ISuVXCHoS9xhhD2i9zQxkgvpQmbjoR4ugz2qJzYq8Z2QtY
 w0uls+6dYanEQpkD49sKJhYx0h3OSFj2NdxVCD+W+b8ZZjFAuzUlyNtmzJdHx57+PFxUNIluqIM
 sQ6FiSJJ4dBANzxWiTVCw+nmixCL9Wk2sJvHKGAMchvVSqclzPbNGXegg5K2pVY3AsHD/O3el4f
 kYpN9ptD5nTQTwEEhYWyo7zVfw5y+apjjAKhcvFLwKlO3BQyynoljtbEisZAYBpnUqFJZ7OILdx
 rBUxJEvuE5x1MTm3EwWzMPC4LKS82sCxuktfjCbcUfkifPkWa+YaPtprsDRm0toW09JP3Tgrwbw
 bV+T1flFqk0VI6ydqSZ6SnkJDXXT2MPsVLGu5LIcUyhM8boXcT6BmgMcODXwOgZ+9hDdA=
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
index a3fab133e6c4d9f949564b47cc817383bee7a568..f3c9de4aa219162610af6becb6c3c02500187099 100644
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
index 4f1c0687133c03b81ba53f95457c55860e5ce194..3e4d73e01b922b47f29731d3cbccc72f67b4c4e1 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -143,9 +143,29 @@ uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint16_t xe_tile_get_main_gt_id(int fd, uint8_t tile);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value);
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

