Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E5BC3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D4810E5DD;
	Tue, 13 May 2025 18:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ru3M0ARu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5758910E5DD
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162705; x=1778698705;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cb/TP7P6gckr8cjen8CW8Uvn6wavdgJnet8oq+m6bDw=;
 b=Ru3M0ARuZs2duzoX1VeiEt2UU70fmsM0gKwef0fcWpx+CXuG0+WANcbg
 WKZoxVdghiDY2+lnqweoPdAKgK3angmStVItd8ItSyu0HJemO92+YIccO
 3I1TD8e3N/ylO+HFOjDOsrgshxK9c9SiZmSFwyrV104pl28e+BDvl23xE
 VqhD59+tqsS98S8dfUpUG/VmR/+zvEBPkDeBUqDbsep0hyq9f0mXhGItc
 3i/x4JSgY217DWbB+o2Q91pTj0eRlCeZqTWgJ4VmMYuR9NK+f113dQy9Z
 y8bEMii85nXlQZ/vxVgahwh1wx6bxohY8jPsYwhrmfYQ3A1pYB55jGvSC g==;
X-CSE-ConnectionGUID: Uikd1akETqWhWNpwYjYjpQ==
X-CSE-MsgGUID: 1pu+xU5sQoGxrIDNpF8lmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48960587"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="48960587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:25 -0700
X-CSE-ConnectionGUID: do4rEgCLRQiKI7bLbVWjVQ==
X-CSE-MsgGUID: bJyZMt5KQjCV041+ve/akQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137679117"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:23 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 02/15] tests/xe_render_copy: change width and pitch to
 be in valid range
Date: Tue, 13 May 2025 20:57:57 +0200
Message-ID: <20250513185811.897232-3-zbigniew.kempczynski@intel.com>
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
 tests/intel/xe_render_copy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index fadfd162ce..9f16537c1e 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -445,7 +445,7 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
 			  uint64_t ahnd, uint32_t region, struct xe_spin **spin,
 			  pthread_mutex_t *lock_init_spin)
 {
-	uint32_t copy_size = SZ_4M;
+	uint32_t copy_size = SZ_256K;
 	/* Keep below 5 s timeout */
 	uint64_t duration_ns = NSEC_PER_SEC * 4.5;
 	intel_ctx_t *ctx;
@@ -468,10 +468,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
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

