Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5F5C28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 15:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB38810E637;
	Thu, 20 Mar 2025 15:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFZOtX78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F4410E637
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742485035; x=1774021035;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jGnTQuA7syOrks7pkohAD3w86OtdZQHWfkxTaabe9rE=;
 b=TFZOtX7853TpD54tYQhBcyCIPXy5VrgRUsPrriIFcY2/axE3Lryc166D
 KCU2gtHPEArplkIG12xVmsN3ZpQgUS4vytmjNMTfqaZSV3HeMVGB1js0n
 E2i/ablKSVAxJpqORMIy0dOOV9egxZ9Cy2SM/1VxBSGRV/rM26MvMSvBj
 5BRS3BcRleo04Y9hV7i+zw1lYq8JVm/gDqZ2jHUS18bJpGZJxnJHFR+ty
 wYVrixqRA2kkB1Zsyn7MJOj1E/ps2XLC5rPlDNnuUxrJwkdBKqSkNxZPZ
 vmn8EvkpFfkKMiAOMYINVzUT56nzwF3nioC2rTY8iYMkutgG+W3RPFFRB Q==;
X-CSE-ConnectionGUID: Q3Hiyl3PRRyUgK8+fr2N6g==
X-CSE-MsgGUID: Sxn7tDMwRzmUL0HAnsYReQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="55108912"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="55108912"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 08:37:11 -0700
X-CSE-ConnectionGUID: nSwoXbLxTO6pSr2rkjboag==
X-CSE-MsgGUID: C7aFDhFRTEy5ESgNGKIGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123584722"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.226])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 08:37:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/intel/xm_vm: add coverage for userptr THP
Date: Thu, 20 Mar 2025 15:36:59 +0000
Message-ID: <20250320153659.161002-1-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 55 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fdf74c114..4b5fbe9f3 100644
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
+ * @large-userptr-thp-split-binds: large-userptr-split-binds with thp
+ * @large-userptr-thp-misaligned-binds: large-userptr-misaligned-binds with thp
+ * @large-userptr-thp-split-misaligned-binds: large-userptr-split-misaligned-binds with thp
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
+			/* Ensure we try to partially map a huge-page! */
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

