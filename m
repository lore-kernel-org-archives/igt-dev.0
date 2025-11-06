Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DC9CCFA18
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948A410E884;
	Thu,  6 Nov 2025 10:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZGGc65Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB0B10E884
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762424943; x=1793960943;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=VMfG//4JfULIXyJicJK1QoO3UoVIkX1yAm9E0wucDdM=;
 b=MZGGc65YAlL+WA53RHhcjrWuSdm5o8O5kEsMa8pogEVAGxpLf3apVZhQ
 iTmwVp/tOr0XqP3tPa4UU45N/vOxA8KvHVhuaGbVj/haWqtEQrSBeev/W
 xvGO8tgwoU5q4CdqrLrOM9Sok8lkyfARbod84YB9fUUfYZSv4VV0kaVj4
 hoRkhYwZzJGYT3j0a1E//jAlFvVtnqTZ7b5TNdB+9eMyzoOn8136It0Ql
 a/uE8u4+eqCcrwu4HMI/e8oYQCY2AtmhGTouuU6UN4xyFwUP6ZPVkMJ9O
 hMmZzGqzlwAeGxog51pKREKribMCgg2Q0e/IV9mn8KQHjOE7dPV2nVIXK w==;
X-CSE-ConnectionGUID: Qigeq0+iT/OX0hXGxQMhCw==
X-CSE-MsgGUID: rHJ2kMqsSxSXxK+jEDThKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="81960954"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="81960954"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:03 -0800
X-CSE-ConnectionGUID: QCNsl/z0RMKTDZdmu2tpng==
X-CSE-MsgGUID: G7Fk3X78SWSuZMVh8bS9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187667913"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:29:02 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 06 Nov 2025 11:27:27 +0100
Subject: [PATCH 2/7] tests/intel/xe_eudebug_online: use helper to get
 hwconfig value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-xe_query_helpers-v1-2-d761a944c237@intel.com>
References: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
In-Reply-To: <20251106-xe_query_helpers-v1-0-d761a944c237@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=VMfG//4JfULIXyJicJK1QoO3UoVIkX1yAm9E0wucDdM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpDHgmwJ+3ksmOxbdBnYxPypM5OxIeASi5fLaat
 JYr7O/nPXeJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaQx4JgAKCRAjYrKT3hD9
 103kC/oCi99Q7L2LEGhxQR4KsqPMvOqiwWnWzlnsARxh5WX7duODrX+irgRxF9CjnMm8BuyxY3H
 E4Rn3JD3f8OB29ZIvHQPOALAB3IOiFHimXDLvOrEWSvNyicRd6Ufkt7a9BjKGFgkdUdWDPl2Tj5
 Wx3QN/Y35lWlL7RooTdO6UwIVkEpXzqyztBRo8ZvYWNj/Xbfh4zIYub+XrD67mbNWV8f/8Ybu4E
 o9ufcbw6s9mBLcgLyxAR8sq637O4J+a6FSHb7yMR0VXg42B/QvOe8VEnm4/UlrUKhzjzpG0gzew
 iHHEWaHFl3AHUwBL60R/N3K7kjodNbSJAlEdvSAl9XAY7qXuxAxaGilsTDu2+RAOMAH67D52+h7
 B2HoT8xlu5HgwkLNsskIxc/OvdyT6KQhuch3u3qWATSJi2O8TqrYMUQotFf2EdddoMFTrdXEGG4
 wkxuhgTfHgCj6Z9vDrM+vJCrZzuSkyWh/juSen/mSBcFV1xJmkkAz9l2kwc8ORwrnrFrk=
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

