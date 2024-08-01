Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5C9C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 22:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C523610E0DB;
	Thu,  1 Aug 2024 22:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/kqCGj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDDC10E0DB
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 22:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722552750; x=1754088750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XJZxiVyw88hE0WIiryQDiusOu0um/S9EuUqX4Rj6Zyo=;
 b=P/kqCGj4iiNzprM560FNgR6ceDHSm7Efv59/olJHay5RssBAkb1D6khe
 XEglj8Pxig+zDaylOgAlK/4a7ZiW5hM2+XUXFlTunfVp4L+zpKjs94JaF
 hIcx9xbnYay0HLIwOE0RNSuUQwvi/2Nk7bZ9DBpHXceFCg9TjcCEIH6UK
 O4a/CpasQd+sKRLN09aPmjJCpLWGMwYXAbcc+pxTL8ooyfDHgPEV0D3BL
 dQa762D9JOA0czu0DNhE71y+REFhnQkvCNjVepgYNstWIBxUwtqFDq5+G
 H1e/bKweqmUzoGS5gv2zFMBThVR6jVtB8/lig3T0p1HoXnvTG1sWMComR w==;
X-CSE-ConnectionGUID: WMqOeBukR06Bbb0wDdS9Lw==
X-CSE-MsgGUID: N27u2Mk0TRWQp6nx+9X0UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20495342"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20495342"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:52:29 -0700
X-CSE-ConnectionGUID: 3q/qgdIwQoifQmWz68kyvQ==
X-CSE-MsgGUID: pB5YTXENSZ+p0L3ApkQIAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55803221"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 15:52:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] tests/intel: Drop unused local variables
Date: Thu,  1 Aug 2024 15:52:24 -0700
Message-ID: <20240801225224.3744479-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
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

After applying igt.cocci to the Intel tests, several open-coded swap
implementations were replaced with calls to igt_swap, leaving behind
unused local variables.  Drop those variables to eliminate the compiler
warnings.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Fixes: dd461382e ("tests/intel: Apply igt.cocci transforms")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/gem_ctx_create.c        | 4 ++--
 tests/intel/gem_exec_big.c          | 1 -
 tests/intel/gem_exec_gttfill.c      | 1 -
 tests/intel/gem_softpin.c           | 1 -
 tests/intel/gem_tiled_fence_blits.c | 2 +-
 5 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/intel/gem_ctx_create.c b/tests/intel/gem_ctx_create.c
index 0332ecbb9..5c2b0ef65 100644
--- a/tests/intel/gem_ctx_create.c
+++ b/tests/intel/gem_ctx_create.c
@@ -295,14 +295,14 @@ static void active(int fd, const intel_ctx_cfg_t *cfg,
 
 static void xchg_u32(void *array, unsigned i, unsigned j)
 {
-	uint32_t *a = array, tmp;
+	uint32_t *a = array;
 
 	igt_swap(a[i], a[j]);
 }
 
 static void xchg_ptr(void *array, unsigned i, unsigned j)
 {
-	void **a = array, *tmp;
+	void **a = array;
 
 	igt_swap(a[i], a[j]);
 }
diff --git a/tests/intel/gem_exec_big.c b/tests/intel/gem_exec_big.c
index 86849f322..cdefce5db 100644
--- a/tests/intel/gem_exec_big.c
+++ b/tests/intel/gem_exec_big.c
@@ -141,7 +141,6 @@ static void xchg_reloc(void *array, unsigned i, unsigned j)
 	struct drm_i915_gem_relocation_entry *reloc = array;
 	struct drm_i915_gem_relocation_entry *a = &reloc[i];
 	struct drm_i915_gem_relocation_entry *b = &reloc[j];
-	struct drm_i915_gem_relocation_entry tmp;
 
 	igt_swap(*a, *b);
 }
diff --git a/tests/intel/gem_exec_gttfill.c b/tests/intel/gem_exec_gttfill.c
index ff600e0ca..3f0501777 100644
--- a/tests/intel/gem_exec_gttfill.c
+++ b/tests/intel/gem_exec_gttfill.c
@@ -64,7 +64,6 @@ struct batch {
 static void xchg_batch(void *array, unsigned int i, unsigned int j)
 {
 	struct batch *batches = array;
-	struct batch tmp;
 
 	igt_swap(batches[i], batches[j]);
 }
diff --git a/tests/intel/gem_softpin.c b/tests/intel/gem_softpin.c
index c542bf741..d8b99a2ae 100644
--- a/tests/intel/gem_softpin.c
+++ b/tests/intel/gem_softpin.c
@@ -967,7 +967,6 @@ struct batch {
 static void xchg_batch(void *array, unsigned int i, unsigned int j)
 {
 	struct batch *batches = array;
-	struct batch tmp;
 
 	igt_swap(batches[i], batches[j]);
 }
diff --git a/tests/intel/gem_tiled_fence_blits.c b/tests/intel/gem_tiled_fence_blits.c
index f5a3d9311..c11eb73e3 100644
--- a/tests/intel/gem_tiled_fence_blits.c
+++ b/tests/intel/gem_tiled_fence_blits.c
@@ -156,7 +156,7 @@ update_batch(int fd, uint32_t bb_handle,
 
 static void xchg_u32(void *array, unsigned i, unsigned j)
 {
-	uint32_t tmp, *base = array;
+	uint32_t *base = array;
 
 	igt_swap(base[i], base[j]);
 }
-- 
2.45.2

