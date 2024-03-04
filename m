Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86341C48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 16:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC0210EA13;
	Mon,  4 Mar 2024 16:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQXlX1NY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D8510EA13
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 16:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709570641; x=1741106641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sk4ZPiHomKMbsaWxXxfgjHn91oP2bGYyJgwSEj8OYuQ=;
 b=OQXlX1NYoirhwiNEPvbgFaVBMoZ0cIx6OwCz1Q9VAF0jq5fiPQ2bhu4+
 2lL90ECd8cfRUoFbXuLY/zodmMdLhGLjqmcC7OpP+PEStVODY/PdIeIyz
 6YfaT/NCEVDeYmfe/Qhk2xFLiXVhcL2wNA3S18bWllQivu3ezSzztfCmD
 xw2IOB43TRzQGn7f2Bbet8HGzhd/Sha/Vif2mrt7zvQd/SRUsOVKLcrUs
 8aANtsFWyHazq2gYA5WlGtcRnzPXsBGW3PyA5J4TD6BOHP1f8MDVh3NXn
 bMOKfUbYHGtoxsIV3sKECsogiFU56bamIZJTv22KMNj4DmW2QhYD6MeUh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3957515"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3957515"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9223273"
Received: from unknown (HELO localhost) ([10.245.244.105])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:43:58 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_atomic: fix musl compilation
Date: Mon,  4 Mar 2024 17:43:54 +0100
Message-ID: <20240304164354.112440-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

On musl there is already defined PAGE_SIZE and it is casing
compilation error:

../tests/kms_atomic.c: In function 'crtc_invalid_params_fence'
../tests/kms_atomic.c:893:25: error: expected identifier or '(' before numeric constant
  893 |         const ptrdiff_t PAGE_SIZE = sysconf(_SC_PAGE_SIZE);

Change this variable name in order to fix it.

Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/138
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_atomic.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 96cd58571..489b0d709 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -890,7 +890,7 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 {
 	int timeline, fence_fd;
 	void *map;
-	const ptrdiff_t PAGE_SIZE = sysconf(_SC_PAGE_SIZE);
+	const ptrdiff_t page_size = sysconf(_SC_PAGE_SIZE);
 	uint64_t old_mode_id = data->pipe->values[IGT_CRTC_MODE_ID];
 
 	igt_require_sw_sync();
@@ -898,28 +898,28 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 	timeline = sw_sync_timeline_create();
 
 	/* invalid out_fence_ptr */
-	map = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	map = mmap(NULL, page_size, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
 	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
 	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
-	munmap(map, PAGE_SIZE);
+	munmap(map, page_size);
 
 	/* invalid out_fence_ptr */
-	map = mmap(NULL, PAGE_SIZE, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	map = mmap(NULL, page_size, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
 	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
 	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
-	munmap(map, PAGE_SIZE);
+	munmap(map, page_size);
 
 	/* invalid out_fence_ptr */
-	map = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	map = mmap(NULL, page_size, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
 	igt_pipe_obj_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
 	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
-	munmap(map, PAGE_SIZE);
+	munmap(map, page_size);
 
 	/* valid in fence but not allowed prop on crtc */
 	fence_fd = sw_sync_timeline_create_fence(timeline, 1);
-- 
2.42.0

