Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121AA1067021
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 13:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBDD10EA0C;
	Thu, 12 Mar 2026 13:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f2z1AfDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB5310EA0C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773323336; x=1804859336;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yvmL92wNUol/h8q74LVNEOF6TnUiGYvpBnZhq5dA4tM=;
 b=f2z1AfDmahJdKKAm2reRAK183JooWmV4R/3vbK/CmEb3wGTcKRiTQBDk
 f22i83TAmlEINpAu9aARbI/eMBH3UMkcPXca/hBozuacN9bxy1LZGWR/0
 Dz3VMscSsH6KjvxptoygypCoasxPf3b6Fc/3jA96gRjWtn9PIYJCFCObw
 9groEKMzv7jFNoQ/SVi3O5AiiMDcaU0lvab8jJp9dCY9eLkRmSCL3L7PM
 Y4W6LwlTQQfKsbkPhmZOicvIsgFPVSWH6n63LSrNCUoelNu5HPv3dCKj0
 YkrNaTQGx6s1FZSATH5VHUmk+QkPZvHBUxXFVbeP3jTJrOobcsTdi+0bC Q==;
X-CSE-ConnectionGUID: ZEHRYmVHSn+KUbJJ3jisQw==
X-CSE-MsgGUID: Vk14ZGtbQBewvOuieYdSww==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78268092"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="78268092"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:48:56 -0700
X-CSE-ConnectionGUID: QDryUJsUTruw36JHAe/Zrw==
X-CSE-MsgGUID: uSOWLWzNT+uOu15XeUotEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220767530"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by orviesa009.jf.intel.com with ESMTP; 12 Mar 2026 06:48:54 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v4 1/2] lib/xe: Introduce aligned buffer mapping
Date: Thu, 12 Mar 2026 13:48:50 +0000
Message-Id: <20260312134851.647568-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312134851.647568-1-nishit.sharma@intel.com>
References: <20260312134851.647568-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Added aligned buffer mapping which is providing an interface for mapping
buffer objects with a specified alignment. This API improves
cross-platform compatibility and simplifies batch buffer setup by
eliminating the need for platform-specific address handling.

Signed-off-by: Thomas Hellstrom <thomas.hellstrom@intel.com>
Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 lib/xe/xe_ioctl.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 16aae05c9..ea3f2fcaa 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -579,6 +579,52 @@ void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
 	return map;
 }
 
+/**
+ * xe_bo_map_aligned: Maps a buffer object (bo) into CPU address space with a specified alignment
+ * @fd: The device file-descriptor
+ * @bo: The buffer object
+ * @size: The size of the map
+ * @alignment: The requested map alignment
+ *
+ * This function reserves a virtual memory range, computes the first aligned address,
+ * maps the buffer object at that address, and asserts on errors. It unmaps any unused
+ * regions before and after the mapped buffer, freeing up memory and leaving only the
+ * aligned mapping.
+ *
+ * Return: Pointer to CPU-Mapped BO with requested alignment
+ */
+void *xe_bo_map_aligned(int fd, uint32_t bo, size_t size, size_t alignment)
+{
+	size_t anon_size = size + alignment;
+	uint64_t anon_addr;
+	void *anon_map, *map;
+	uint64_t map_addr;
+	size_t hole_size;
+
+	/* Reserve a range of virtual space where we can fit an aligned map */
+	anon_map = mmap(NULL, anon_size, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	igt_assert(anon_map != MAP_FAILED);
+	anon_addr = to_user_pointer(anon_map);
+
+	/* Compute the first aligned address within the virtual space. */
+	map_addr = ALIGN(anon_addr, alignment);
+	/* Map the bo there, replacing part of the reserved virtual range. */
+	map = xe_bo_map_fixed(fd, bo, size, map_addr);
+	igt_assert_eq((uintptr_t)map % alignment, 0);
+
+	/* Unreserve part of the virtual range (if any) *before* the bo map */
+	hole_size = map_addr - anon_addr;
+	if (hole_size)
+		igt_assert_eq(munmap(anon_map, hole_size), 0);
+
+	/* Unreserve part of the virtual range (if any) *after* the bo map */
+	hole_size = anon_size - hole_size - size;
+	if (hole_size)
+		igt_assert_eq(munmap(map + size, hole_size), 0);
+
+	return map;
+}
+
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot)
 {
 	return __xe_bo_map(fd, bo, size, prot);
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 3ea651063..b62d259fd 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -91,6 +91,7 @@ void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
 void *xe_bo_map(int fd, uint32_t bo, size_t size);
 void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr);
+void *xe_bo_map_aligned(int fd, uint32_t bo, size_t size, size_t alignment);
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
 int __xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec(int fd, struct drm_xe_exec *exec);
-- 
2.34.1

