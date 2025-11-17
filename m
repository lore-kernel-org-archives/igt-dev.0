Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B7ACEBF61
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:49:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E47A10E1BE;
	Mon, 17 Nov 2025 10:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jW1A9cTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91DA10E1B3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376565; x=1794912565;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=JkgMMrMHKK1xt/UclahFdmZJ++AftOYcCuoZYqQMWfQ=;
 b=jW1A9cToLlbbvRgx/3IBmoAEw3TjaB4bI4U9DmNCY9mf7z2XexUx3j5Y
 oG2gAXKgZIrtOyJ5iG++zIsWbs7w/WWntaVDh5R7TxVkSXe18+RBtCSlI
 AZqrVJjN3VDAMAiejE+o/vxqtGrqxXlQuBapLQn+jMsxdvFMYR5mP7UtL
 oduGWSxNEhQ9oQ7y0VNZCx7AvVIdkn+xEYTFEExARvlrkUvTayFlV5xWm
 INI6OS3+EJtYRQS3AtJgYNqChLNL2S/2lIfc+fXCWR9xfSd+Ai5QbvQWt
 2ADtuXKd1MMb69ScJKISBgMoZ4uk1Ai6pZDxtKfuaNV9x+9cPS6pqB19D A==;
X-CSE-ConnectionGUID: dxVUbggHQfumoDMHg2UBKA==
X-CSE-MsgGUID: C5AR+ozwRcSN3nBFSQOd5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65306111"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65306111"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:24 -0800
X-CSE-ConnectionGUID: QdK6dkYnTtWjycy8yeDYLA==
X-CSE-MsgGUID: RpcGjKn8TgysQL2RPmms5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213818005"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:22 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Nov 2025 11:47:44 +0100
Subject: [PATCH v3 6/8] tests/intel/xe_eudebug_online: use xe_query helpers
 for query GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-xe_query_helpers-v3-6-25d984ae58cb@intel.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=JkgMMrMHKK1xt/UclahFdmZJ++AftOYcCuoZYqQMWfQ=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpGv1k9Ea7pwzhKb2n0MzxZu8HwvEe5kevz2mLH
 624w7a9hIGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaRr9ZAAKCRAjYrKT3hD9
 1xKLC/wIm1a+NAb3IxC5liOPqXWLBsERPmGymPmn1gyD18nE0ooM9bJMH/ECog9dK6c6n/Jvcdv
 n1Udr7F9F+hWpiA1SpNXB392SPZwkXXz61f3g12fwUw+RNRTzU9ToRbbk6svvn3YapA328QgEFV
 0V+FQwq6hZeKsu024HGBUIbzXTo9EcPoRKXnc2IIhaIfkOw5ifbfNI9urAO8wCsys1rNTKKP5Ej
 blAPMlUfCnaI7BtfCbFWd6f1BPVoGS4fgcs8jPz3ovkD8u9nYkDIDcFCQW9Mesams94+hxcjXau
 pH3Lk9O6B8PJVB0B7YTBBX6qCDNhghbm10pKVoPzzzTAOeFL0+3MUxA8V7IT28Hpa0s586nZzR9
 YavxLLXiJDtdsYJC7GsjuIooCXyu47LGUKk5yjcKkaPdh+kHhRpMM34f9OML0WSjR38dyu6e6Ay
 vSbVCz4lBDtdJ2o5ouKMOx2wSJkbLfGSZqgYw3jP3OS3ZZK9sgFblVrVHW9fwaKI8IElE=
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

Using xe_query_device and xe_for_each_topology_mask simplifies the code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_eudebug_online.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index ef700c2591291f9a22849c2995c83cc5ec0ac6d9..d7db8e2a13df04e96d867e48c510decabfd1eaac 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1184,36 +1184,14 @@ static int query_attention_bitmask_size(int fd, int gt)
 {
 	uint32_t threads_per_eu = xe_hwconfig_get_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU, 8);
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
-	struct drm_xe_query_topology_mask *topology;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_GT_TOPOLOGY,
-		.size = 0,
-		.data = 0,
-	};
+	struct drm_xe_query_topology_mask *topology, *topo;
 	uint8_t dss_mask, last_dss;
-	int pos = 0;
+	uint32_t size;
 	int i, last_dss_idx;
 
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
-
-	topology = malloc(query.size);
-	igt_assert(topology);
-
-	query.data = to_user_pointer(topology);
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	while (query.size >= sizeof(struct drm_xe_query_topology_mask)) {
-		struct drm_xe_query_topology_mask *topo;
-		int sz;
-
-		topo = (struct drm_xe_query_topology_mask *)((unsigned char *)topology + pos);
-		sz = sizeof(struct drm_xe_query_topology_mask) + topo->num_bytes;
-
-		query.size -= sz;
-		pos += sz;
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size, false);
 
+	xe_for_each_topology_mask(topology, size, topo) {
 		if (topo->gt_id != gt)
 			continue;
 

-- 
2.43.0

