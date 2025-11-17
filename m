Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DC1CEBF93
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 10:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9A210E1B9;
	Mon, 17 Nov 2025 10:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRX0WHr6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F7F10E1B9
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 10:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376558; x=1794912558;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=k+1aGXhyU6t8jOAKA9+yzx+CxzrChS9sd0iESZiVxcU=;
 b=WRX0WHr6xzhOV6kmb/CCGZZN3Knh0QUUxeNvCv2kOvD48Edke3KOVGBA
 aM3MlevV/UpTiJW9D32quA+RtPi7j1zAEcjyQxwOGP2ojzkIJZ+qOg5cT
 J9AwApM9tAIQc8B6INl5F02nslW0WFuzc2Ga5y/z/HCxPVvcj427e3JBM
 KGu+lDC6lr4DLgF41tSBLJaCSG61KqR/ulzPeG+3SDx5JSQ1jUfoaABK/
 CpbvCqzw3rEem3qvevbWNKU21O4CjbWsBsmNhakdE33h58vR7XQo4uXKi
 gDR/glIo7o962taJdDA/cmRTLwhGtb9hNzPaqbv73fno5ZgoI061/I8UT Q==;
X-CSE-ConnectionGUID: YLRxuBwtQ+yNbjuRc/kvWA==
X-CSE-MsgGUID: MjimLPfCRQq6k7uzBZPmCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65306084"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65306084"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:18 -0800
X-CSE-ConnectionGUID: +mpWveExQX2lbC6PhHFR5w==
X-CSE-MsgGUID: g1KZILUrTbSCcFKHTV0HgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213817969"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:49:15 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Nov 2025 11:47:40 +0100
Subject: [PATCH v3 2/8] tests/intel/xe_eudebug_online: use helper to get
 hwconfig value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-xe_query_helpers-v3-2-25d984ae58cb@intel.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=k+1aGXhyU6t8jOAKA9+yzx+CxzrChS9sd0iESZiVxcU=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpGv1jwCLFLtSzDUZzkmqzffOuO9Rxma3Ig6Yi8
 JwKB872gY6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaRr9YwAKCRAjYrKT3hD9
 17ksC/9VV9SpujdW8p6cxRoIjZS6DWn+EubSI6c4I7ieD0WxybZNiPhr4HfjBuOtFXnSCSpjXf6
 J6fK6SaNPf0mtc8u0oaGki1uj9SmsMNw3EVht7L3jlG3MV+bsZO3LvaLd29th7/jVGWeblENt5e
 U8k4564rgmKaz/XehCxXH70FK68Z8Jb+ehW4MAEK1QzYdVyr1cqBna8sn7zn8oAPpQsTMHbLJjs
 yuib5BC1/cupAAN+5Vkk+KrkQOJBCG4ucnWvFgaT6dNPgzT6iq4CO7sTKUgE0Ik3jWNkbmcPzxO
 d4NVpFq6h83L2HhQgbxKfK7Hdmom13a7kfmY9K7Q/8pwY2ixnLjP1VqobOda1wKMyz0UJHrUNh0
 bxpipKSHtRB52+nhMp8gYfYroEtg/2+5+vPl9GMdopQzaXWuRPauXgUkQ2pH0wWxbQ+9Rb+nUxx
 3NLpl/M7dIKqXb/vI1ZYuDlgvXFm038jhXrcdPDwCvjLIrHJK5WGhtH7We2V3qRuAIxPk=
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

Recently introduced helper makes the code cleaner.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_eudebug_online.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index e1516c202f15d9bb90d3cf0f6ed30700b5479af9..ef700c2591291f9a22849c2995c83cc5ec0ac6d9 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1182,9 +1182,7 @@ static bool intel_gen_has_lockstep_eus(int fd)
 
 static int query_attention_bitmask_size(int fd, int gt)
 {
-	uint32_t thread_count_len;
-	uint32_t *thread_count_ptr;
-	uint32_t threads_per_eu = 8;
+	uint32_t threads_per_eu = xe_hwconfig_get_u32(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU, 8);
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
 	struct drm_xe_query_topology_mask *topology;
 	struct drm_xe_device_query query = {
@@ -1197,13 +1195,6 @@ static int query_attention_bitmask_size(int fd, int gt)
 	int pos = 0;
 	int i, last_dss_idx;
 
-	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU,
-						    &thread_count_len);
-	if (thread_count_ptr) {
-		igt_assert(thread_count_len == 1);
-		threads_per_eu = *thread_count_ptr;
-	}
-
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 

-- 
2.43.0

