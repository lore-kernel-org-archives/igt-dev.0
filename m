Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E63CCFD315
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 09:39:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0143610E39C;
	Tue, 25 Nov 2025 09:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKbjuHXA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7985E10E39D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764063551; x=1795599551;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ooZ9eUf7LJ2scjMtNlU6Cu5Enlwm0EIxOXzMeOsi+rE=;
 b=RKbjuHXA4UYeGXHPsswHN6DUAROoz3aMDABYavR2BaMEq0ZCCixvk8C5
 wvqwA4Slu6VbuFMqng0U0GR/l2ertoMS7mFUKnxpFxEiVUTgmmNZj++W/
 wx05L0VaQUvBLyTmr6VVGfv5TxDVcb9gxzKck1PAp0eqijGur08Ql9E1o
 SaDYpRJCUByKiJIGlSCP+q4qBHTo7Tb1L9mwxuyuWeiTnv35bGWsMJmEs
 wvD+qaiBCJe5PtLB8ggzzCMj6EvVOY+eP8geKJ24lrudZxcoxPRL/C9QQ
 7DYHKGV0qEXpcF+lrfRVw/nig5XXGMPPg3jbBAM/yFxwDzGIkuOEaxuCY Q==;
X-CSE-ConnectionGUID: WJEomWmNR56vU8b7gGMSjQ==
X-CSE-MsgGUID: 8pDYa8tESYCkU2djqDJbGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66022197"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66022197"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:39:06 -0800
X-CSE-ConnectionGUID: kS3TGb+oSey/rZSt7FT6YQ==
X-CSE-MsgGUID: 6Q+NtsCKSW6bul8HAGODFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="215944025"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 01:39:03 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 25 Nov 2025 10:37:27 +0100
Subject: [PATCH v6 7/7] tests/intel/xe_eudebug_online: use xe_query helpers
 for query GT topology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-xe_query_helpers-v6-7-97686fac1b77@intel.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=ooZ9eUf7LJ2scjMtNlU6Cu5Enlwm0EIxOXzMeOsi+rE=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpJXjo3z/3VNFl08+bft7XNW2aVs9WBDVB0zfKT
 9qmHm3cBs6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSV46AAKCRAjYrKT3hD9
 1/CpDACPXHAAMxc0GdnXRr+ySLVH70xu+Ud4YX21yJb94qMjINJV2eKRV6XbsIWjHcdiQiduNhl
 O/uAZk+QI7j5NLKvYSM0D0NliULx4vYuvcPy1koVRZZiNIALjrEzmEC5rVpDOABNHKWABgwakqb
 9+wv5w+kOsyotZwrA7M7aibATybJQxHgqldTUvDUPoMKKqvPk2+QmetWHTBjCLppSWlyANYbL7/
 Yzynm0LaDrORIb1nO2b8XIYnDMTnBJbHRH594No4NwBaoUXJ90NBRQnAyZkWl5NqkppbrR4YbNt
 Ov/ADeCUesbYpLh5zpMKJtppLcOLTQ+dh18+twx1H+gMQEnmC/UqfZCKs0easpJ8+yQZ4OPWClK
 g7ncpeurkwS9G6Gx6HCQx3r7BARzdAqugFraptl3KDuHtLiY+LQSovgxo4RJMHml8gjO5TL4baE
 mADRBA2vsBVMXKwI8zxSu2woFd2KxMD4bjsVnfKT8sjREyibDNeYPdxlJOYVe22sdibs8=
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_eudebug_online.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index a5b2864a47a34b9051756174f73667bbc602e00b..1e160b0c3d8a3d616bfd99e2a99fb6b0d042f021 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1208,36 +1208,14 @@ static int query_attention_bitmask_size(int fd, int gt)
 {
 	uint32_t threads_per_eu = xe_hwconfig_lookup_value_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU);
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

