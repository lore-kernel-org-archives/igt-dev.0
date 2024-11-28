Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED67CD69108
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 13:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26B910EC7C;
	Thu, 28 Nov 2024 13:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yd8f8Dzx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D5910EC7C
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732799122; x=1764335122;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s3TMp3/03IO3j1GyIlmmo3YvjNUHTsGdDzecX1CtxJ8=;
 b=Yd8f8DzxTnnFkm+lZy+qbWN0V/p2BrwV8QKXuOWEXx2FBmUJPIzJUXC1
 eFOrsdXhcbNZV8Si+Qf9B/r2Jb+P+2szgGBOuh0iE0j8adR/aKT+0pqvB
 47VItzQ3abOz/HBKfnlWeoRWOtdDVROyTdkpHkX6vSGGEmm5fQ16nLXKu
 Jv3Tk5Bhbv3bYKJTZvazLUFtv9hukYfH8IaQ0wbt6O/u2VfsmosDNSmdv
 +EyxEPPVahYmegDGZmUZhzziXcVr28A148/Wqyqy+JGvmutClIeLgVqVM
 yZzEvGOfAGHnVegJpauXz/bdBzDja5Nckw//yJkmhD0nnz4QAt+PeNYvp Q==;
X-CSE-ConnectionGUID: dkmFuCbHRpyiY0L1PeyrrQ==
X-CSE-MsgGUID: iFr4Gh9QQqu3b+7fGRcmpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33183285"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33183285"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:05:22 -0800
X-CSE-ConnectionGUID: 0fgQmOJ/RvmK+UYqYmG9Fw==
X-CSE-MsgGUID: PoGfKjVJQzSjrblm909d+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="129736139"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 05:05:19 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 3/3] tests/xe_eudebug_online: update thread count handling in
 query_attention_bitmask_size()
Date: Thu, 28 Nov 2024 13:05:03 +0000
Message-Id: <20241128130503.241328-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128130503.241328-1-jan.maslak@intel.com>
References: <20241128130503.241328-1-jan.maslak@intel.com>
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
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug_online.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index a4850c916..750350556 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -1151,7 +1151,9 @@ static bool intel_gen_has_lockstep_eus(int fd)
 
 static int query_attention_bitmask_size(int fd, int gt)
 {
-	const unsigned int threads = 8;
+	uint32_t thread_count_len;
+	uint32_t *thread_count_ptr;
+	uint32_t thread_count;
 	struct drm_xe_query_topology_mask *c_dss = NULL, *g_dss = NULL, *eu_per_dss = NULL;
 	struct drm_xe_query_topology_mask *topology;
 	struct drm_xe_device_query query = {
@@ -1163,6 +1165,12 @@ static int query_attention_bitmask_size(int fd, int gt)
 	int pos = 0, eus;
 	uint8_t *any_dss;
 
+	thread_count_ptr = xe_hwconfig_lookup_value(fd, INTEL_HWCONFIG_NUM_THREADS_PER_EU,
+						    &thread_count_len);
+	igt_assert(thread_count_ptr);
+	igt_assert(thread_count_len == 1);
+	thread_count = *thread_count_ptr;
+
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 	igt_assert_neq(query.size, 0);
 
@@ -1212,7 +1220,7 @@ static int query_attention_bitmask_size(int fd, int gt)
 	free(any_dss);
 	free(topology);
 
-	return eus * threads / 8;
+	return eus * DIV_ROUND_UP(thread_count, 8);
 }
 
 static struct drm_xe_eudebug_event_exec_queue *
-- 
2.34.1

