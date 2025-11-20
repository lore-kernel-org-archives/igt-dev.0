Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2740CF8860
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 14:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545BF10E75E;
	Thu, 20 Nov 2025 14:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2cOh4ro";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6901E10E758
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763648890; x=1795184890;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=k+1aGXhyU6t8jOAKA9+yzx+CxzrChS9sd0iESZiVxcU=;
 b=M2cOh4roYBFSbD/32s4lZqiGGdRPpZaAFpjfHtMNEfdolOclb5XrGrGx
 t+xfuhCrQ3/IDEuRkZhpPVrd0wJko5VJOxHoc3O8zpP+VsNQfVTY3gyWt
 jgLR7CTfkSYT3sjYEkQtTM70sKQKvqZMM7lWfgH1HzIJZu8c6rRpLGm5s
 Bjs4WsAXQQI+E4vbE92qBtQaMFfGClRtJRAFOcMNUOA2CeVZzvC+4FAU+
 EJmO3nmw2Wm3qyfSiHUb7sD8jecBfGZmj4B2NCtPD15eNixS16gqeZzI5
 Wz3yYCeWaWSdLTzLmQGBNmCTwztdTR06yPqPWLymleKWbKRXF8AQRJKXn w==;
X-CSE-ConnectionGUID: XNEw+MLATuiS5+xRvJo21w==
X-CSE-MsgGUID: 6hYbvNryTsyGM4HIRuFKMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76824128"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76824128"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:09 -0800
X-CSE-ConnectionGUID: j7B4t+gkQjO1Kdk3qxzDkg==
X-CSE-MsgGUID: jlaZK7YrQYyGk/aFpqN35A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191057640"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:08 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 20 Nov 2025 15:25:39 +0100
Subject: [PATCH v4 2/6] tests/intel/xe_eudebug_online: use helper to get
 hwconfig value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-xe_query_helpers-v4-2-2ed6dc04dd94@intel.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=k+1aGXhyU6t8jOAKA9+yzx+CxzrChS9sd0iESZiVxcU=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpHyUvvRUzX0lMo/M80/cVQiiJD0xdL6Qd+PUde
 AM47d6NC0SJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaR8lLwAKCRAjYrKT3hD9
 10+0C/9+3ErPFADBn2vuSNvV1/vdkX6eMO3w6UMPsJztCcycEhB+qAznAXBqyTKBU/+qhQ7LaAh
 9nZDtYetO8ABwPmXl7FuuXacBW7eiCv1al71eehZ+lHcR4pFLKVJ32e6ha/jbOKMwZU0eXa1e0P
 zE4UU2pu8rnBt92ZYXeFb3oCi7zsBVbDi5+kA62GzWtizXwtSu84/dllrtgabbGqU6EIdcJYhnO
 +Ch9DJ/DUTKfstX68rd+ftXlACV3tF+lFvvJe5CvWZOFpUuZ3iC/xgQdEJO5JwMW3sd05nc+J/M
 XJ8aPb9NbeQGPl8P/6fU5e1H09voorHeRPNz1nZwn6nMMV7GCKI2wkDeBpUHlZyfAN5ux66CSZi
 f3SylZrenM86sAnkFE/i4ZXp5AnZ7qSL/w3NENOCDFSRZFLrUknlF0ZkkQ5RJnVNK438GD0wTsX
 BSwwEQ4Qe0S+8G02GNRu3SMYxv1F51Kx65SCzaXv092y0IOQMhCYAaL4TmlA85NRuwA0I=
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

