Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3727CFD37A
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 09:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A2710E3A3;
	Tue, 25 Nov 2025 09:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7t34bWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C643F10E3A7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063537; x=1795599537;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=zAi/UwPre50L60ZBd4lB4q/RJ9o/0ot/WclEoWL3uJc=;
 b=e7t34bWk7gXWai/CM5wRo2bIQrqJconTIZUFACEQaDWrLdTEdypivUP9
 bzJAchv1KcMkPNAHhrfHfVN5v5D5SFbeBmrRhbtuNbLOpl1Z5tr/c3Lpc
 mk8V58sYQBQ3QL8MjQDci5GMMwj4vTRceVyiVhO7Emw2rXMLPcW9v5gN6
 pIgRXvyJNOG8zFZIHeolJ+DxlZzhNiBkxMrJz/WXIBbHFfNw0M+EwSRaW
 owXLtjtIyfy7kV8NsxWWsWlNqS5FwDNuNTP9MtjoK8C/7GpXBhRHPRiK7
 Y7F+rU67/TUhE4MC0K7IT4Yy5GbAvJCBHuAZyjzqZewROLdU8+oM1WXMN w==;
X-CSE-ConnectionGUID: 2huPVL2uQGWQaS3pl17ccA==
X-CSE-MsgGUID: 8PKWw7TaRTmxtxNrC7rVwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66022179"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66022179"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:38:57 -0800
X-CSE-ConnectionGUID: VR8oOmcgRfCQwi6UDKVC4Q==
X-CSE-MsgGUID: xeAZf5PQSsqQFEBTA5VZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="215943983"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:38:55 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 25 Nov 2025 10:37:22 +0100
Subject: [PATCH v6 2/7] lib/xe/xe_query: introduce helpers for device query
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-xe_query_helpers-v6-2-97686fac1b77@intel.com>
References: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
In-Reply-To: <20251125-xe_query_helpers-v6-0-97686fac1b77@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3611;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=zAi/UwPre50L60ZBd4lB4q/RJ9o/0ot/WclEoWL3uJc=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpJXjl287j5r7VhJqrTZVQmSf9h/D7hHpmYAN9v
 stHHRrKGB+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSV45QAKCRAjYrKT3hD9
 185HC/9weFdBmzvGgFrvs9VfDzfZHmxchHx+rYcfmyDazKr2pFOehAHTN/5AFmxKYrlpE9f4LId
 wogxG4ii0TU0ZQaTVv3nZsPcq10t3jraYgzQo17dN3G/sT7oaqgbTsARcVJmrwlI30Ui2j7AKOD
 kYucLss9R5PTdr82GSvV19lE43SkOnzSQtxM7onowAYKT1cZ2q4yNpsQJvNqemdLWd4FVgNWSeK
 ffXVoXTmjqfbPa2MjA62I3FdXHYmfWG3wOgRLgriJF3rZLPGCsbx0nlm8ME+HU1kDlTz0Kdhr5N
 znmMLh/JOdHFxPCx/SVoPAh482GIAw02GAxzTghjVdiDDAtye8jMO0c8ImgFJMvAS9f0V/s1Sle
 3PeEL1BxyadIuERkzdtK7zbcQcUZsT3OsxPmDi3sY5oAJiCvmDHdN8MqTYxyJ6HdLmS22wCoE7p
 1Bw7oUyhpJHpZofsz/xANSNTHGQ7F7tAt9nSnRgR4tRDVLGO5/qR4GiHqHMmMz+DLVDRs=
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

