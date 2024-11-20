Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02045D743E8
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 22:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC11410E1AD;
	Wed, 20 Nov 2024 22:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbfwsxQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922D310E1AD
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 22:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732141751; x=1763677751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HCUsTeEyd1YCPL7ODsuv8vC/lA760Cw/5WBZgzW4xoU=;
 b=hbfwsxQN7kcICwVw/eWm6WFKn0muaKjCsfNElagRAk+mgKS+Yd0EL0pV
 xhJG0scS+ZgJcrOoJt1mWMkVk0TusN46JOWYU85deZfgVHVUV+SP3pB04
 rnqpIgj6pyNMgLd+PKnqqUvk+g5L/jJOkR/sDoldTvTNKhKYWmVXqj+bH
 afcm78qzo9kQjhJNwqeQe2dsNqn1L0mbjUAzYEH4drx2zRlHMqiGUuLEF
 eNHJBAvobS+4/x4dpxTLPSdWhXWfAQpcAyynrnHialSrY1/bHGenhJh86
 CnGrJpO6ROvhNGVs4zsIWtp/pG5w2ptuvZfGNNPj6FPJRe+xzrtdGOrdE A==;
X-CSE-ConnectionGUID: LbpCjKA6SXmqh7lw9Mg1aA==
X-CSE-MsgGUID: A+Ikz4/mTS6SxR9WRCSUeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54727920"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="54727920"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 14:29:11 -0800
X-CSE-ConnectionGUID: vR7rOgIvRTG6iqNuBuAm1A==
X-CSE-MsgGUID: 77Z2Wl0GQRajuUdvXRQi8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="89850285"
Received: from art-dev-395.igk.intel.com ([10.102.138.231])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 14:29:10 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 3/3] tests/xe_eudebug_online: update thread count handling in
 query_attention_bitmask_size()
Date: Wed, 20 Nov 2024 22:28:50 +0000
Message-Id: <20241120222850.1497784-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241120222850.1497784-1-jan.maslak@intel.com>
References: <20241120222850.1497784-1-jan.maslak@intel.com>
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

Update query_attention_bitmask_size() function to fetch the EU thread
count from hwconfig, instead of being hardcoded.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 tests/intel/xe_eudebug_online.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 0ef0d8093..78d9d4bc3 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1118,7 +1118,9 @@ static bool intel_gen_has_lockstep_eus(int fd)
 
 static int query_attention_bitmask_size(int fd, int gt)
 {
-	const unsigned int threads = 8;
+	uint32_t thread_count_len;
+	uint32_t *thread_count_ptr;
+	uint32_t thread_count;
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
 	struct drm_xe_query_topology_mask *topology;
 	struct drm_xe_device_query query = {
@@ -1130,6 +1132,11 @@ static int query_attention_bitmask_size(int fd, int gt)
 	int pos = 0, eus;
 	uint8_t *any_dss;
 
+	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU,
+						    &thread_count_len);
+	igt_assert(thread_count_ptr);
+	thread_count = *thread_count_ptr;
+
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
@@ -1178,8 +1185,9 @@ static int query_attention_bitmask_size(int fd, int gt)
 
 	free(any_dss);
 	free(topology);
+	free(thread_count_ptr);
 
-	return eus * threads / 8;
+	return eus * DIV_ROUND_UP(thread_count, 8);
 }
 
 static struct drm_xe_eudebug_event_exec_queue *
-- 
2.34.1

