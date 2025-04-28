Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304C2C369D5
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 16:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB0E10E610;
	Mon, 28 Apr 2025 16:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zfq4fueV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9821910E60C
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 16:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745857290; x=1777393290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aLWzYG3+QYtON0Np4+/D0m5XVrZfeI7E4Yvtj8s3Qmg=;
 b=Zfq4fueVvvwGFUwSHrWIREbVxryNwoP0dAflE24OFMN+awS0CjC99zfX
 Zf8ifoIZAvK/NY430vCPbS2JpCqVIB1Fcs79aEdFjEDg0UeO+oIhJwcRk
 i1h5hmriwA5kl8ko7DWCuTV+iVwM5aHpRcZCRlLsE/NUaKxLa44npeSnK
 ceWEGM0Bjjp7mRZwvDziNlfcgY22kqly363TgtKa2MnDNZG6xGpE7AEr5
 a5ZxKM/oabrs5/mX2dzpT+qBCkfpBRnxfc/LIBoebVJKx5onFiMHehlKa
 +xC45DrOOrdlH/XCTORrRf9qSc4hO3nm5565AjYySccbJsZIIXAken/IQ g==;
X-CSE-ConnectionGUID: wd+B5BHlTbaodBgiqL+XvQ==
X-CSE-MsgGUID: SAIwFxC8RruG99gcQLqrhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47468533"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="47468533"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:21:29 -0700
X-CSE-ConnectionGUID: NURGbHjHS0K31eGRoOb1PA==
X-CSE-MsgGUID: wh815Z5cQqGEJIe4EXP5zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; d="scan'208";a="164653585"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2025 09:21:27 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t] lib/xe/xe_ioctl: Fix compilation on 32-bit armhf
Date: Mon, 28 Apr 2025 18:21:22 +0200
Message-ID: <20250428162122.152829-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Fix some compilation eerors on 32-bit platforms like armhf:

../lib/xe/xe_ioctl.c:443:7: error: conflicting types for xe_bo_map_fixed void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
       ^~~~~~~~~~~~~~~
In file included from ../lib/xe/xe_ioctl.c:46:
../lib/xe/xe_ioctl.h:89:7: note: previous declaration of xe_bo_map_fixed was here
 void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
       ^~~~~~~~~~~~~~~
../lib/xe/xe_ioctl.c: In function xe_bo_map_fixed:
../lib/xe/xe_ioctl.c:449:13: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
  map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
             ^
cc1: some warnings being treated as errors

Fixes: 9eda33fedff7 ("tests/xe: Add system_allocator test")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_ioctl.c | 2 +-
 lib/xe/xe_ioctl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 785fc9184..53a53cd0d 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -446,7 +446,7 @@ void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
 	void *map;
 
 	mmo = xe_bo_mmap_offset(fd, bo);
-	map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
+	map = mmap(from_user_pointer(addr), size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
 	igt_assert(map != MAP_FAILED);
 
 	return map;
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 554a33c9c..522094ae2 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -86,7 +86,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
 void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
 uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
 void *xe_bo_map(int fd, uint32_t bo, size_t size);
-void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
+void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr);
 void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
 int __xe_exec(int fd, struct drm_xe_exec *exec);
 void xe_exec(int fd, struct drm_xe_exec *exec);
-- 
2.49.0

