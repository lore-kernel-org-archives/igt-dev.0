Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7752CCFA1C
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 12:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551F510EAB1;
	Fri,  7 Nov 2025 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AY9Yzi3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A5E10EAB1
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 12:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762518279; x=1794054279;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=JkgMMrMHKK1xt/UclahFdmZJ++AftOYcCuoZYqQMWfQ=;
 b=AY9Yzi3YCiu21ObF1b3geQ9TReYKOxF9Q1gSALJoV2FSfY4zY2mlFNjo
 BQrg0LsfZbMDgZEFkvjo0cUUKZyrFrdC9u1Uyot5dhllWTpzpABJXohTR
 wrR3zcKNM9I8o3uFJetQyfDOO6mjJOIUX8+renkisi7d1NthMpJwA4gAx
 5S3M8vwnn4ie5nDxno7Y9ly0vlIwJbKGWrf8D5Xw1VcIp0l1n/+VdZrB2
 rgBB4azyAKO9zbLjjlpcLOk51UW30KTh/yOFAdpyp+r8kJ2IBQjmfq10L
 hm8BVIh6+9tJnmlJPhkGc4jVhSKQ0NJ6GPH4ABz2PkSZbkl3AC9hQntbs w==;
X-CSE-ConnectionGUID: VHeRpND3TnqjZ1kF7oOTrg==
X-CSE-MsgGUID: kd8uPafDSEOROP3B5ckeDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64365677"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="64365677"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:38 -0800
X-CSE-ConnectionGUID: ka+utDmORB+JJ6yd/S4/sQ==
X-CSE-MsgGUID: YhvZnXQGRBethFdnxU/rJw==
X-ExtLoop1: 1
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 04:24:38 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 07 Nov 2025 13:23:19 +0100
Subject: [PATCH v2 6/8] tests/intel/xe_eudebug_online: use xe_query helpers
 for query GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-xe_query_helpers-v2-6-ec66ba6af1c1@intel.com>
References: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
In-Reply-To: <20251107-xe_query_helpers-v2-0-ec66ba6af1c1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=JkgMMrMHKK1xt/UclahFdmZJ++AftOYcCuoZYqQMWfQ=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDeS8XrAgg3Er6QoNR3SalxkwklPiECEf84FqM
 vC4snOC8VqJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQ3kvAAKCRAjYrKT3hD9
 10GxC/4tSwdNQuldozGsJ4K8ddc9xXIyc+nYgNbq8/FacBpv0FMlSydcmeihtN8vGZDp958B1Xa
 QzQS23ETUMKkx0LLBQ11ifNqO+gLVwor2lr5bvvOZD9pmd3LN6wlfbyNKfYPKpPDPjW8hcZY1r/
 Sk2+x6ye4ZgPu69Ly0XutuoIHzK073Bf3OiaEsFwFkgK6ej0w8tF2ErIWzJpTQtxSC8hF71k1pC
 7n6CQFByWZBA3VN+yzqnnUwk3V+w8IgfxoFipreKO8DyC5bSM7KQ4erReyOjUQpBUCuMXQsmB+2
 PLr0Zvo5Z0JEBFTSYoE219pOHSvdZ0Fa4PVfAsY5cl4tjEMd6rB7DUBKKfyVvoCO5YdsMTzjDCT
 gV10LRlRLIMXkQCPcmjf5BeZ1OO7AG5Zehc7LkRFr4sYp950To5gJxYbN5yeTUJoNRH6DUNXx9x
 va71zXiJpPahhBsjgPLlOGYXaM+ncIrcx15XLU4j6K332WctfEcjvsQ1roG/qLgyjb9P0=
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

