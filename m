Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3840FED2EB
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 08:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598EB10EA16;
	Thu, 12 Mar 2026 08:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/FdX7yd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B8610EA24
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773304655; x=1804840655;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=B5K9kMvBWPFkArANNFMxjQQ5b3Mxaw388C/6gD4MZ8U=;
 b=n/FdX7ydCnbNEe5yCQ81htdrasWCS/gYLH4Zn4SCKQ3RnivSBZcPRL55
 EU+96NcsBxYRceyfMoPHYhhDTUOM6gPxuoz7vz5J6gZfLV5oEZ4kZ+4Am
 OAz+FicmvXSNmo61qiB4mDo57S2q9emsgk71sRelzX36NjibCOOVJ4hVs
 EUF7V6gSdB5HI6y7t7jt6ntuybkETCug8/+EJq3pySYDaLb/GKHwkR+Rd
 VD+dEvJeE+1aSWqn0eEHtThQbK7iS66lcEELk/5AYAmn83GDTVceeoRKp
 J+je0zrUHfVFrLyT84061J6XPMrvqxuPFoOuQZdEbdmNEPDGFCNvEiEe9 g==;
X-CSE-ConnectionGUID: ZBtQJNktSY6Ggm1PASU8dQ==
X-CSE-MsgGUID: +hZPnGg+RkyNBkxSPPqlFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85089911"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="85089911"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:37:35 -0700
X-CSE-ConnectionGUID: G2QrzlFmRH6HNHQ8YSEM5A==
X-CSE-MsgGUID: MgFjyjf+TcW/56VEhUz7Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225450916"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2026 01:37:33 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, thomas.hellstrom@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v3 1/2] lib/xe: Introduce aligned buffer mapping
Date: Thu, 12 Mar 2026 08:37:30 +0000
Message-Id: <20260312083731.644793-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312083731.644793-1-nishit.sharma@intel.com>
References: <20260312083731.644793-1-nishit.sharma@intel.com>
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
 lib/xe/xe_ioctl.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h |  1 +
 2 files changed, 43 insertions(+)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 16aae05c9..566a08a8f 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -579,6 +579,48 @@ void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
 	return map;
 }
 
+/**
+ * xe_bo_map_aligned: Maps a buffer object (bo) into
+ * CPU address space with a specified alignment
+ * @fd: The device file-descriptor
+ * @bo: The buffer object
+ * @size: The size of the map
+ * @alignment: The requested map alignment
+ *
+ * Return: pointer to CPU-Mapped BO with requested alignment
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
+	igt_assert(((uintptr_t)map % alignment) == 0);
+
+	/* Unreserve part of the virtual range (if any) *before* the bo map */
+	hole_size = map_addr - anon_addr;
+	if (hole_size)
+		igt_assert(munmap(anon_map, hole_size) == 0);
+
+	/* Unreserve part of the virtual range (if any) *after* the bo map */
+	hole_size = anon_size - hole_size - size;
+	if (hole_size)
+		igt_assert(munmap(map + size, hole_size) == 0);
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

