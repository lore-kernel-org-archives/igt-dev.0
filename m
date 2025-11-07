Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D40CCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 12:24:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B26C10EAAE;
	Fri,  7 Nov 2025 12:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTKUw0ZN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C4010EAAD
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 12:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762518276; x=1794054276;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/7h/G8nYf0kprIles8S066+irxVsyqMo48fbrxsidIU=;
 b=LTKUw0ZNoHS3yD3rp+8k/bW+UkYT/lsRobblz+4IierDUzWYbgQed9v+
 oMU49lgIMB8oNRpJFqFKHnSIUt/6zRZ0psSS05whGNBSwiAmrJ4g9H+1I
 PRBS5cT2wc7D8F67bO3d2CxcEnj0sBkxi7ou/D/BzKV+anyj/nn/b8FlX
 zHzJ91bPwVPxoniLXklVY2V6EbrSEEXW//P1VVgu0QCS30z6UgeyvcIEk
 4iDcpuBvHPWbbCbfdxlSPKDZPlgB7xradJpsQNRtByZtPGPoqxE1vemy7
 /zQeMx4NpgO0TQCWMkQ7QkH/WGHzC2Vrer8YifvlKiFXZI66eaI5DO8wG A==;
X-CSE-ConnectionGUID: eBYf3GldTum5NZG17rG6IA==
X-CSE-MsgGUID: wObxVGQWShmxxkK7FvFxyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64365674"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64365674"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:35 -0800
X-CSE-ConnectionGUID: 82P5fKDPTKaZBpsBkX8dcQ==
X-CSE-MsgGUID: TaFH6DVsRluppPL2lSUrcQ==
X-ExtLoop1: 1
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:35 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 07 Nov 2025 13:23:16 +0100
Subject: [PATCH v2 3/8] lib/xe/xe_query: introduce helper for device query
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-xe_query_helpers-v2-3-ec66ba6af1c1@intel.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
In-Reply-To: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2710;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=/7h/G8nYf0kprIles8S066+irxVsyqMo48fbrxsidIU=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDeS7YdE/m2A3TBTDGJyKCh58kLR4W1HKsuy1x
 unCtDTtf1KJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQ3kuwAKCRAjYrKT3hD9
 19SQC/96r9RRX0ReNRw8Wdjh8v0lpSIaC5c73rsqsXHvjGovEgMmNtkq/sZTjveO1BuMGjt2l+Z
 CVuNV25wQPm0KxeMyXc8YnS3DmteG4AB9Bm2p4oX8ubJd4mHtQNYKnzSPJ+m2p7lxrxV1onZvP6
 1tXGAFqVOSAaG8YEVacJC2zt8SzMTg4/bzwVa7eXqPOVPgKZlCHmVr1vNBfGRfowfv9zC4oOXEi
 kEDc9GzjEBfGK846xPc1b8+ZRoyUuIkHsfmurbY99tpp2ZK2C3VSuNg6D6snXpPg31K6vIizWq9
 A0+FWGiPJ8zD7Ib1h9gMcBqOBme8bv38xNGT7IggZK4N+/+Ds/cyNqXV6LXFnHSvwHraJIwBnQu
 5PakgoP6oRfUGYJaFSFFP8mfjcyeuhkNIyw9oUCyUD/sZUM0UdKjAphUCQz2KPKICuXuPlE3pgp
 wnbsR8ln5l8Ix2AuP/5JqpI4grzyRRuh8sP1M/DfVCbnWjVPsiHkeZmFNwStoPqIIKsd0=
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
 lib/xe/xe_query.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 44 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index d8ea79108d67dbbb8c859762b1f56d954ee749c3..4d268fa5242e78c93e3ae0087379f6253029d475 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -25,6 +25,49 @@
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
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
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
index acf3291b07968e829e6e72ebcbf08f00e847e27a..2c2c07f34af0b5de306cd70d83f0f2aa51b65d76 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -137,6 +137,7 @@ bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
 uint32_t xe_hwconfig_get_u32(int fd, enum intel_hwconfig attribute, uint32_t default_value);
+void *xe_query_device(int fd, uint32_t type, uint32_t *size, bool can_fail);
 int xe_query_pxp_status(int fd);
 int xe_wait_for_pxp_init(int fd);
 

-- 
2.43.0

