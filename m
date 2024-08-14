Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C24C52D7D
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 15:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A159110E4DB;
	Wed, 14 Aug 2024 15:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQiO3fMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B1110E4DB
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 15:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723651083; x=1755187083;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cHRiN5ijiBrmR8976QFrPN6/ZJLQbZpQSg+pxZPFRhM=;
 b=hQiO3fMr5XNV8N2uGt/7puVEvqSvK2VoLRpV/QYJAucO7FqGc8gLmL/q
 8OWNQwKHikvDjEeKPt4gNRIkHiQfm+c9DkjK6VdzazyzD8/qUPHof/y0b
 MzL1ov8jPNFCAuuOCb+VW7gtcgelr+aCvMZS6fWeLc6qeacLO3qbWoBnh
 gI00/2ienNuD7bwcl6v6BiAiFeoqdS/i+5fezLMaUei3pOfgVLgStnZNg
 P0GcIH+KLjESOJ3FxpTV2nbU5ijlOWS4lMAw4lwgENNS2VM7xkatmTXav
 chfh3ukKdxZQh3VvZlCcpSzK9vxrijiM3e4qPhq6h1+OnQtieN6Fuuowc A==;
X-CSE-ConnectionGUID: RDx7zQ0sQoyfy5oN9/VAXw==
X-CSE-MsgGUID: gKffRirpQRGnuIV/67ZPTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21522975"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="21522975"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 08:58:03 -0700
X-CSE-ConnectionGUID: BA4L5EgASiKIOBIckyTLvQ==
X-CSE-MsgGUID: OuyYhbRSRD6PV8ghWdYRhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="58693255"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 08:58:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/xe_vm: Add BO partial mmap test
Date: Wed, 14 Aug 2024 08:58:54 -0700
Message-Id: <20240814155854.3846990-1-matthew.brost@intel.com>
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

Ensure BO partial mmap works by setting a BO to 0, partially mmap BO and
setting to a canned value, and then mmap entire BO ensure data
integrity.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index c3960fedee..57534a2a8c 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -106,6 +106,56 @@ test_scratch(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: bo-mmap-partial
+ * Description: Test partially mmap of a BO
+ * Functionality: BO mmap
+ * Test category: functionality test
+ */
+
+static void test_bo_mmap_partial(int fd, size_t bo_size)
+{
+#define MMAP_VALUE(idx)	((0xdeadull << 32) | idx)
+	uint32_t bo;
+	uint64_t offset;
+	uint64_t *ptr;
+	size_t partial_size = bo_size / 2;
+	void *map;
+	int i, j;
+
+	bo = xe_bo_create(fd, 0, bo_size, vram_if_possible(fd, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	/* Set to zero */
+	map = xe_bo_map(fd, bo, bo_size);
+	memset(map, 0, bo_size);
+	munmap(map, bo_size);
+
+	/* Partial map */
+	offset = xe_bo_mmap_offset(fd, bo);
+	map = mmap(NULL, partial_size, PROT_WRITE, MAP_SHARED, fd,
+		   offset + partial_size);
+	igt_assert(map != MAP_FAILED);
+	ptr = map;
+	for (i = 0, j = partial_size / sizeof(uint64_t);
+	     j < bo_size / sizeof(uint64_t); ++i, ++j)
+		ptr[i] = MMAP_VALUE(j);
+	munmap(map, partial_size);
+
+	/* Map entire BO and check */
+	map = xe_bo_map(fd, bo, bo_size);
+	ptr = map;
+	for (i = 0; i < bo_size / sizeof(uint64_t); ++i) {
+		if (i < partial_size / sizeof(uint64_t))
+			igt_assert_eq(ptr[i], 0);
+		else
+			igt_assert_eq(ptr[i], MMAP_VALUE(i));
+	}
+	munmap(map, bo_size);
+	gem_close(fd, bo);
+#undef MMAP_VALUE
+}
+
 static void
 __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
 {
@@ -2354,6 +2404,9 @@ igt_main
 			}
 	}
 
+	igt_subtest("bo-mmap-partial")
+		test_bo_mmap_partial(fd, SZ_2M);
+
 	igt_subtest("bind-once")
 		test_bind_once(fd);
 
-- 
2.34.1

