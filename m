Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F90C3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7461910E5DE;
	Tue, 13 May 2025 18:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvTVaqAu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0366610E5DE
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162709; x=1778698709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qrLNkJk6/uxmcMxoCpRIYddl4TIvkVyF/xCAlblBVPQ=;
 b=gvTVaqAuq0fSfdWR5OIUIrnCW4WWkmszNK4la5kdTsFkMK80mvXCx/yH
 9fwsPtPVVXCK11zt6RKD6Oqhto59FWqHnZ6cXDis5bKfeFCefSuR4dIwM
 IEm9vJuzNt2ognRcXAG59iW3u4HRu8o+649YtC52uQ3G2M6LMOYnhw1H2
 A7+u+sXRFQ8DxOMAj9sDICTrbLU1uHBiy0z/vF77BknQDhMDnESJeXejf
 O+C1vHOJrgIy7KHAS43/MyJJ97Z2DFRpCXEdYV0rGWAGGIuaYox0MO+ya
 2zGuyEI0bwkZwfSQ5F+W7e7eLyNlZJpF0T3E05JO1S353P0wVr5GJ7gMw Q==;
X-CSE-ConnectionGUID: OGbJuivuSv6tVNjfzbuKqw==
X-CSE-MsgGUID: 8IJQhlmPSliFqwdCEwQrCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48960598"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="48960598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:28 -0700
X-CSE-ConnectionGUID: NtQnQveTSQ+U7vlL7tZQIA==
X-CSE-MsgGUID: 6zl+nJjLRGmcDEgyertJMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137679128"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:27 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 03/15] tests/xe_spin_batch: change width and pitch to be
 in valid range
Date: Tue, 13 May 2025 20:57:58 +0200
Message-ID: <20250513185811.897232-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
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

For mem-copy (byte mode) width and pitch must be lesser or equal 256K.
Limit them, avoiding setting inappropriate bits in mem-copy operation.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_spin_batch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index f83f4ba722..4fff34a092 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -318,7 +318,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance *hwe,
 				    uint32_t region)
 {
-	uint32_t copy_size = SZ_4M;
+	uint32_t copy_size = SZ_256K;
 	uint64_t duration_ns = NSEC_PER_SEC / 10;
 	intel_ctx_t *ctx;
 	uint32_t vm, exec_queue;
@@ -349,10 +349,10 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
 	/* Create source and destination objects used for the copy */
 	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
 	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
-	blt_set_mem_object(mem_copy.src, src_handle, copy_size, 0, width, height, region,
+	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
 			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
 			   M_LINEAR, COMPRESSION_DISABLED);
-	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, 0, width, height, region,
+	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
 			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
 			   M_LINEAR, COMPRESSION_DISABLED);
 	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
-- 
2.43.0

