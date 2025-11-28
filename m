Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF90CFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A1210E904;
	Fri, 28 Nov 2025 14:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ee21fths";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAF210E8FA
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339263; x=1795875263;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=wDf1LpTBMgveT9lJn4ATC1BzaqIcL7w0mzgiJfUrE1U=;
 b=ee21fths8eKfrcatpwSNzTBEakbcGr2sqeCq6g6xkRXA/Ne+ruMDuywz
 KBzJu54wE4HWMB7eN26piVznl30pMj1NtHDzr35TLtNm29vs2BR+ffF0i
 VeiLkHDY92iqEN50KEOEpTqlPVelQmMyogx0N1G/xyJprQwM8/ep4RMAU
 Il263FRKK0btfiQHzar5MLPwRLn5mw4rY35ZT54ojSyneCAHYPlwcIv4q
 QJag2kIhEC06/jwq5ko2WWiM4hFGD8/rKUwT1Qe2OfO2XlYUhpuYP1b8J
 ziIfKm7BgdZv1KSYLXHUxJ5i7dmxy/sPInhaUHIQRoh/gambBOSn8wCRV Q==;
X-CSE-ConnectionGUID: ChVj78t6RFCrM26QgSSMwA==
X-CSE-MsgGUID: Ik5FT0KESlq8uA1zWFRpNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261599"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261599"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:23 -0800
X-CSE-ConnectionGUID: Im5DVfkISMealMVB+COfig==
X-CSE-MsgGUID: 8VmJVHMHRgeb4lBvp/jpPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173622"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:22 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:06 +0100
Subject: [PATCH 02/11] lib/xe/xe_query: add helpers to return count of EUs
 and EU threads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-2-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2500;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=wDf1LpTBMgveT9lJn4ATC1BzaqIcL7w0mzgiJfUrE1U=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpKa3zg/ihKntdCCTTi3S5D450VvOVzEjBBOSf1
 taPU/eSmuWJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt8wAKCRAjYrKT3hD9
 14RgDACTsiQ7VuE5NQWKy9o8nOEeNNkErX/Arsylb/rSQoO+rcQ4VAun8Lx22hoJaTzid47nuBy
 Lmt4AKxiunfBf8jfZsSwM7W9k2MnwlieSnHEOlmre2n+evQ1WzmJOtoG6Rwh6Oxo1U3gT4XfiPt
 NqQnJ+J8lSLAo9QCQ74mcbgHf8vhdDkf471IEeBRNQ0lKNReO/dQvCBpKnNRWp/nJGQ7JCNSPBY
 MzyMFJAzlUpUeC2UQDXPQWDQJXHf0a18E31Ja2KqojaPZuR92E/DcYaK2/DBk7JD10rINfVWLUz
 5xP2wPoCEU7MGh49Mb7Tc/QELojEsA2/KUYGYZklImOc9Grmm9Jf5tuFn4kEFdRk2/lWim1i99K
 InqrXVgV7lLzzATWHpF0hFtZNquQ7uDyjmHGpExamZDTKnxRLLXgx1/wtoFigALJwt1p/rH3Qfr
 rlwu6GEdl7iXJ5s99qIxQhn8EN7s+VwLnbzhllIjPGJHQ2JkYIW1res4L2X0CR4j/v9Nw=
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

These helpers will be useful for compute tests.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe/xe_query.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h |  3 +++
 2 files changed, 60 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3f3ee9b96594..38f8f5595060 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -1047,6 +1047,63 @@ int xe_wait_for_pxp_init(int fd)
 	return -ETIMEDOUT;
 }
 
+/**
+ * xe_query_eu_count:
+ * @fd: xe device fd
+ * @gt: GT id
+ *
+ * Return count of EUs for given GT.
+ */
+int xe_query_eu_count(int fd, int gt)
+{
+	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
+	struct drm_xe_query_topology_mask *topology, *topo;
+	uint32_t size;
+	int eu_count;
+
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
+	xe_for_each_topology_mask(topology, size, topo) {
+		if (topo->gt_id != gt)
+			continue;
+
+		if (topo->type == DRM_XE_TOPO_DSS_GEOMETRY) {
+			g_dss = topo;
+		} else if (topo->type == DRM_XE_TOPO_DSS_COMPUTE) {
+			c_dss = topo;
+		} else if (topo->type == DRM_XE_TOPO_EU_PER_DSS ||
+			 topo->type == DRM_XE_TOPO_SIMD16_EU_PER_DSS) {
+			eu_per_dss = topo;
+			break;
+		}
+	}
+
+	igt_assert(g_dss && c_dss && eu_per_dss);
+	igt_assert_eq_u32(c_dss->num_bytes, g_dss->num_bytes);
+
+	for (int i = 0; i < c_dss->num_bytes; i++)
+		c_dss->mask[i] |= g_dss->mask[i];
+
+	eu_count = igt_bitmap_hweight(c_dss->mask, c_dss->num_bytes * 8);
+	eu_count *= igt_bitmap_hweight(eu_per_dss->mask, eu_per_dss->num_bytes * 8);
+
+	free(topology);
+
+	return eu_count;
+}
+
+/**
+ * xe_query_eu_thread_count:
+ * @fd: xe device fd
+ * @gt: GT id
+ *
+ * Return count of EU threads for given GT.
+ */
+int xe_query_eu_thread_count(int fd, int gt)
+{
+	return xe_query_eu_count(fd, gt) *
+		xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 3eb05a6c0535..8c57bb21df55 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -175,4 +175,7 @@ static inline void *xe_query_device(int fd, uint32_t type, uint32_t *size)
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
 
+int xe_query_eu_count(int fd, int gt);
+int xe_query_eu_thread_count(int fd, int gt);
+
 #endif	/* XE_QUERY_H */

-- 
2.43.0

