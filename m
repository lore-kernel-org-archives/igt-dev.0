Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B453C36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 18:20:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFAA10E132;
	Fri, 28 Mar 2025 18:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPUUpEgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC3110E132
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743186003; x=1774722003;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=851KNBD4OW5/xnLIkD6HWpOLvUemXblre+UA/zyBME4=;
 b=NPUUpEggsMm5lEvhPtyH8UJMQH/ab3UcTyqZaLcg4qxozGHQmzGMzrCH
 r1mrRsn0zPEjnQ7WyShPywjVLU06xGlivN8z5yVRgUtcmwMayT7YTQnBN
 G7J07r5iHXeSY2idRx4U6m6/IfH/jqgHxdcQiyYTKbdrfxiZMZUSn9Xr5
 H+hXv7rWAW/iw2/ktYuvMPJxbB+LFt69w+D/ipgmZw5SJj4EM9/uA0X3B
 KUHMAtwWctWzUHXmPQwfUqBvFL69jAqaRzm6O+tkb4S9ijK+sbjWsZW54
 fDGkTA0MUniS/DO0Qe2BJftAzoxwGHUQvUsO7jXwOQ851tD83AOBEhoKE Q==;
X-CSE-ConnectionGUID: jDkH0l88RDGfZlYlTFj9+A==
X-CSE-MsgGUID: 4ont86foQHKIgQI16o3JZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44740710"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="44740710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:20:02 -0700
X-CSE-ConnectionGUID: oKeeN5olQYaB3rMDpICvzw==
X-CSE-MsgGUID: Sb6GS3KYSCKJgT/7QkbkhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="156507660"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.28])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:20:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xm_vm: add coverage for userptr
 transparent huge pages
Date: Fri, 28 Mar 2025 18:19:37 +0000
Message-ID: <20250328181937.293014-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In particular we are missing something to test partially mapping a
huge-page, including being misaligned, such that the mm start and end
address don't sit on the huge-page boundary.

v2:
  - Fully expand thp term (Kamil)

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 55 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fdf74c114..af4013f5e 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1281,6 +1281,7 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
 #define LARGE_BIND_FLAG_MISALIGNED	(0x1 << 0)
 #define LARGE_BIND_FLAG_SPLIT		(0x1 << 1)
 #define LARGE_BIND_FLAG_USERPTR		(0x1 << 2)
+#define LARGE_BIND_FLAG_USERPTR_THP	(0x1 << 3)
 
 /**
  * SUBTEST: %s-%ld
@@ -1312,6 +1313,9 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
  * @large-userptr-split-binds: large-userptr-split-binds
  * @large-userptr-misaligned-binds: large-userptr-misaligned-binds
  * @large-userptr-split-misaligned-binds: large-userptr-split-misaligned-binds
+ * @large-userptr-thp-split-binds: large-userptr-split-binds with transparent-huge-page
+ * @large-userptr-thp-misaligned-binds: large-userptr-misaligned-binds with transparent-huge-page
+ * @large-userptr-thp-split-misaligned-binds: large-userptr-split-misaligned-binds with transparent-huge-page
  *
  * arg[2].values: 2097152, 4194304, 8388608, 16777216, 33554432
  * arg[2].values: 67108864, 134217728, 268435456, 536870912, 1073741824
@@ -1363,7 +1367,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		.num_syncs = 2,
 		.syncs = to_user_pointer(sync),
 	};
-	size_t bo_size_prefetch, padding;
+	size_t bo_size_prefetch, padding, map_padding = 0;
 	uint64_t addr = 0x1ull << 30, base_addr = 0x1ull << 30;
 	uint32_t vm;
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
@@ -1387,8 +1391,23 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 
 	if (flags & LARGE_BIND_FLAG_USERPTR) {
 		bo_size_prefetch = xe_bb_size(fd, bo_size);
-		map = aligned_alloc(xe_get_default_alignment(fd), bo_size_prefetch);
-		igt_assert(map);
+
+		if (flags & LARGE_BIND_FLAG_USERPTR_THP) {
+			/* Ensure we try to partially map a transparent-huge-page */
+			if (flags & LARGE_BIND_FLAG_MISALIGNED)
+				map_padding = xe_get_default_alignment(fd);
+
+			map = aligned_alloc(xe_get_default_alignment(fd),
+					    bo_size_prefetch + map_padding * 2);
+			igt_assert(map);
+			madvise(map, bo_size_prefetch + map_padding * 2,
+				MADV_HUGEPAGE);
+			map += map_padding;
+		} else {
+			map = aligned_alloc(xe_get_default_alignment(fd),
+					    bo_size_prefetch);
+			igt_assert(map);
+		}
 	} else {
 		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size >
 			    xe_visible_vram_size(fd, 0));
@@ -1500,7 +1519,7 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		munmap(map, bo_size);
 		gem_close(fd, bo);
 	} else {
-		free(map);
+		free(map - map_padding);
 	}
 	xe_vm_destroy(fd, vm);
 }
@@ -2620,6 +2639,34 @@ igt_main
 						 LARGE_BIND_FLAG_USERPTR);
 				break;
 			}
+		igt_subtest_f("large-userptr-thp-split-binds-%lld",
+			      (long long)bind_size)
+			xe_for_each_engine(fd, hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_SPLIT |
+						 LARGE_BIND_FLAG_USERPTR |
+						 LARGE_BIND_FLAG_USERPTR_THP);
+				break;
+			}
+		igt_subtest_f("large-userptr-thp-misaligned-binds-%lld",
+			      (long long)bind_size)
+			xe_for_each_engine(fd, hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_MISALIGNED |
+						 LARGE_BIND_FLAG_USERPTR |
+						 LARGE_BIND_FLAG_USERPTR_THP);
+				break;
+			}
+		igt_subtest_f("large-userptr-thp-split-misaligned-binds-%lld",
+			      (long long)bind_size)
+			xe_for_each_engine(fd, hwe) {
+				test_large_binds(fd, hwe, 4, 16, bind_size,
+						 LARGE_BIND_FLAG_SPLIT |
+						 LARGE_BIND_FLAG_MISALIGNED |
+						 LARGE_BIND_FLAG_USERPTR |
+						 LARGE_BIND_FLAG_USERPTR_THP);
+				break;
+			}
 	}
 
 	bind_size = (0x1ull << 21) + (0x1ull << 20);
-- 
2.48.1

