Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1321CC83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 17:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D56510E2A9;
	Mon, 14 Jul 2025 17:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="io+QwElA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F1410E02E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752512491; x=1784048491;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DnuaK2rWxi1DIMOwF3lVHKkaFVwzGcm45jes0MAKsdg=;
 b=io+QwElA7qDAUWH8WPznjk7f6FY7g6gcQYke0IKow2KqrHDhpttKiA6P
 8cU/gsr59LmtgP807lBw9VG0Ud5J5PVupf5/db4ksRlqhYWEhFCTqTzzI
 763xEU2wGD02WIa0ddhwMLAKEPvVbR3c9Wr9JUVXk6ZjXe9a7rmvwlhqY
 6+2zts+/AKyn6NIgHZwV0ZyaWmbUYDttx+xpsNPk/kUMOxlxD6d+FvvT6
 QfX2h089PZtlmeNtFE2uhXbd0kPxZ55Ol3UV7lR83m29Ixwt2Ga76mhZn
 Zf2x/OI5CMnoyazx1DoU6P+0/b6M5Uvdalk5ecgJZgbSzqQyfrscMpSJf A==;
X-CSE-ConnectionGUID: xxGnRCi3T4mtye9SXecqeg==
X-CSE-MsgGUID: 5ymgnm7eTuWszPsQfxJ2FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54802186"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54802186"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:30 -0700
X-CSE-ConnectionGUID: cuaJjszXR3qZWRV0syrorA==
X-CSE-MsgGUID: R9EZOsc4TsOkW5EjMvcl9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161306015"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 4/5] tests/intel/xe_exec_system_allocator: Set data to
 non-zero value
Date: Mon, 14 Jul 2025 10:03:08 -0700
Message-Id: <20250714170309.2949211-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714170309.2949211-1-matthew.brost@intel.com>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
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

The compiler seems to optimize out memset of value 0, set to non-zero
value to fault in the pages.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 006a3dc920..dd5303855d 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -294,7 +294,7 @@ static void touch_all_pages(int fd, uint32_t exec_queue, void *ptr,
 			   PROT_WRITE, MAP_SHARED |
 			   MAP_ANONYMOUS, -1, 0);
 	igt_assert(exec_ufence != MAP_FAILED);
-	memset(exec_ufence, 0, SZ_4K);
+	memset(exec_ufence, 5, SZ_4K);
 	sync[0].addr = to_user_pointer(exec_ufence);
 
 	for (i = 0; i < n_writes; ++i, addr += stride) {
@@ -678,7 +678,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 	data = mmap(alloc.ptr, bo_size, PROT_READ | PROT_WRITE,
 		    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
 	igt_assert(data != MAP_FAILED);
-	memset(data, 0, bo_size);
+	memset(data, 5, bo_size);
 	old = data;
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
@@ -692,7 +692,7 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
 			   PROT_WRITE, MAP_SHARED |
 			   MAP_ANONYMOUS, -1, 0);
 	igt_assert(exec_ufence != MAP_FAILED);
-	memset(exec_ufence, 0, SZ_4K);
+	memset(exec_ufence, 5, SZ_4K);
 
 	for (i = 0; i < 2; i++) {
 		uint64_t addr = to_user_pointer(data);
@@ -1109,7 +1109,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			igt_assert(data);
 		}
 		if (!(flags & SKIP_MEMSET))
-			memset(data, 0, bo_size);
+			memset(data, 5, bo_size);
 		if (flags & LOCK) {
 			igt_assert(!(flags & NEW));
 			mlock(data, bo_size);
@@ -1151,7 +1151,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				   PROT_WRITE, MAP_SHARED |
 				   MAP_ANONYMOUS, -1, 0);
 		igt_assert(exec_ufence != MAP_FAILED);
-		memset(exec_ufence, 0, SZ_4K);
+		memset(exec_ufence, 5, SZ_4K);
 	}
 
 	aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
@@ -1351,7 +1351,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					igt_assert_eq(data[idx].data,
 						      READ_VALUE(&data[idx]));
 					if (flags & PREFETCH_BENCHMARK)
-						memset(data, 0, bo_size);
+						memset(data, 5, bo_size);
 
 					if (flags & MULTI_FAULT) {
 						for (j = 1; j < N_MULTI_FAULT; ++j) {
@@ -1432,7 +1432,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			}
 			addr = to_user_pointer(data);
 			if (!(flags & SKIP_MEMSET))
-				memset(data, 0, bo_size);
+				memset(data, 5, bo_size);
 		}
 
 		prev_idx = idx;
@@ -1586,7 +1586,7 @@ threads(int fd, int n_exec_queues, int n_execs, size_t bo_size,
 		alloc = aligned_alloc(SZ_2M, alloc_size);
 		igt_assert(alloc);
 
-		memset(alloc, 0, alloc_size);
+		memset(alloc, 5, alloc_size);
 		flags &= ~SHARED_ALLOC;
 	}
 
-- 
2.34.1

