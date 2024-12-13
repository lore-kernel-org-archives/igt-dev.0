Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B51E7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 09:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40AE10EF79;
	Fri, 13 Dec 2024 09:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L+jfpBkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB4610EF79
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 09:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734081842; x=1765617842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GHIMU/wlaE4UK/f1YXErDF5PWXwqT49qfn773CdMrt0=;
 b=L+jfpBkNiQCUfuLi9r9VfLQTpll1VeJTtQ9kLjrzzt68pvWUOAq+70rB
 ahkkuuoym8jMptamc2sbsQ6hCbaYI5zqlpUMRAooXwz+3i2GxJKL7PFHy
 gGzsnm4oWBCkMg85QN7HAYVQA2I7d8kJRbg+IZ9M2CK0fyQL/DynR52dR
 qkIexaCwm6n1r6wQbuR2OvWxD+rSgd+I+oBsdWGF8cFIXVMYKg3iH+/i4
 ABbJUrqIc78tH6KriQjttZTIA4J0qIDlODsgAB6wgAzQtN7Y+9BdeLWYb
 H/JWK7Ozt1Dl8Tdz5rwa1B+XEWXCcO886+nSobRs4r7/AbqjEzmIZtiyp Q==;
X-CSE-ConnectionGUID: edr8g0/XTByBLuIeavgbHQ==
X-CSE-MsgGUID: KhHNfH+TSQanNO4CCjdzEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34433512"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34433512"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 01:24:02 -0800
X-CSE-ConnectionGUID: CmCIeyVCSP62Qy8wGdF6Xg==
X-CSE-MsgGUID: +cOHIIbiS0mKpMDqkUD2jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="96371980"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.245.235])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 01:23:58 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jan.maslak@intel.com,
	Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t] xe_eudebug_online: Add default threads_per_eu value for
 platforms without hwconfig.
Date: Fri, 13 Dec 2024 10:23:39 +0100
Message-Id: <20241213092339.18038-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

There are hardware platforms which are not supporting
hwconfig table, for example ADLS. Since [1] queried number of threads per eu
can be NULL, accept it and use 8 as default.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

[1] https://patchwork.freedesktop.org/series/142282/

---
 tests/intel/xe_eudebug_online.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index bf53b44ce..8fdd071a5 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1155,7 +1155,7 @@ static int query_attention_bitmask_size(int fd, int gt)
 {
 	uint32_t thread_count_len;
 	uint32_t *thread_count_ptr;
-	uint32_t thread_count;
+	uint32_t threads_per_eu = 8;
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
 	struct drm_xe_query_topology_mask *topology;
 	struct drm_xe_device_query query = {
@@ -1169,9 +1169,10 @@ static int query_attention_bitmask_size(int fd, int gt)
 
 	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU,
 						    &thread_count_len);
-	igt_assert(thread_count_ptr);
-	igt_assert(thread_count_len == 1);
-	thread_count = *thread_count_ptr;
+	if (thread_count_ptr) {
+		igt_assert(thread_count_len == 1);
+		threads_per_eu = *thread_count_ptr;
+	}
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
@@ -1222,7 +1223,7 @@ static int query_attention_bitmask_size(int fd, int gt)
 	free(any_dss);
 	free(topology);
 
-	return eus * DIV_ROUND_UP(thread_count, 8);
+	return eus * DIV_ROUND_UP(threads_per_eu, 8);
 }
 
 static struct drm_xe_eudebug_event_exec_queue *
-- 
2.34.1

