Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A657FCCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:29:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEF710E88B;
	Thu,  6 Nov 2025 10:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCoy82hc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6BF10E88B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762424946; x=1793960946;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=0YAZ0eopmhVDFkcrp8uYlWPo27+ZvQ5QgVJZE8ZPfsQ=;
 b=CCoy82hcyKl6eeNIYPfxYfZrgnpA/YYodpTgD6j2O2s690XOlawz9rIL
 8mB4j86iUnTRNr0WTpIsapKBV5cEzFId5n+i2oAzWLevgpRclIBjYe8sb
 ylhDAiHIqSCU34ex2PaD5IyU3PnVmPzIdXui0y9ix4tAjbEyfjB2vyawV
 GjkdU2fDM1BW+NMFmuxzi9N1pQ1NsD/hBZ8b3thzREUakoU0cQeB4FIiJ
 OwEXlzICbs6DrTOveDNHDeNDVUcwQnBHIrfDhpw1PWLlukb4OLeC7xNN/
 tUMqeLD//XpI0uVd8dYpSr/lCQqqOMRVglxjXvxrRH89kpbxX9NDg0AqK Q==;
X-CSE-ConnectionGUID: P6jQHVgAS3i95nOxt8+NBw==
X-CSE-MsgGUID: 7V3LQhmvScGL2+6l8/1z0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81960958"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81960958"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:06 -0800
X-CSE-ConnectionGUID: cC2A/z9mQMiIoKVrlJPovg==
X-CSE-MsgGUID: gN90tCEKQ6eoGiefq4cnSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187667942"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:05 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 06 Nov 2025 11:27:30 +0100
Subject: [PATCH 5/7] tests/intel/xe_eudebug_online: use xe_query helpers
 for query GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-xe_query_helpers-v1-5-d761a944c237@intel.com>
References: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
In-Reply-To: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=0YAZ0eopmhVDFkcrp8uYlWPo27+ZvQ5QgVJZE8ZPfsQ=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDHgnPKZgXFfRySRULKXskqaup5obHVUxry8Ew
 TcC2lXra3eJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQx4JwAKCRAjYrKT3hD9
 17XJC/0chsaakgvYpMZNS2aiJdL/tuJSiKu8jf5Tt1wkcFpaI0aAY83LgK0NlE246QB5sY/QVvC
 rao1xrOzpk0lhpjTKFxlub/ArWP/hH5UOgRM5eH3MPTxjJ6i+brwN0u9noQmlMDv67+5Lm7+uBc
 FB/GhnGcBw6wxjRC9SMfse0B9xi6BSuMzXIpNbN+ACp6BKoELvgTb6i/InIxSAnTDv9HY9RoMfy
 skorZyIaM4uN/w/goWVMI1dfzk+JN5oQW7rhfK822X2bHeAZ0BIvIJOy9Kf9UaIAEtxmiVsP21Z
 nnETkoCltrse5iLleP3Vc91jUjjd2lz4YkyBp0NywzPNo0wAwkSfnU5Sze87smd8MzxD0fQ69QC
 8s11135OwpEPebnrFeDoW983C0FHgl+3bHmwzyS64M2eUwBQU6+Lm+ROEK1J85QdB9bRSL5uTAT
 PsRK+AD54CGwRaVnwzE4HSI9bv6loP7/s0UNwfZo3vGkKILbB4ks6ClcBKleJRWzcDJ2c=
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
index ef700c2591291f9a22849c2995c83cc5ec0ac6d9..90bc4361a4c75da6b630ff60e812d785dbf6bead 100644
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
+	topology = xe_query_device(fd, DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, &size);
 
+	xe_for_each_topology_mask(topology, size, topo) {
 		if (topo->gt_id != gt)
 			continue;
 

-- 
2.43.0

