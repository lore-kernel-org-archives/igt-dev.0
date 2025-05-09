Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD402C3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 07:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951EE10E9D3;
	Fri,  9 May 2025 07:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oJKFFDpN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1496710E9D3
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746776819; x=1778312819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OVmGQFunBwLQWIlV+5pUhUJXEkTPX3aAMvzDWFEL0nI=;
 b=oJKFFDpNWjbBwc5OSULe1iUteSl7aepzThArh4/PE4WXHKqFQK6fQ2Mw
 q5mP0KLuzSiqYw6Po9G+sx/Nqz+bNEwGe1c/ryd9rnE97soNY1h9aC+gK
 SIFpwSl60uFv2hHqWDQ87UZ+nUVlHz9Bm+Kq+4vmTGwuwxscgz8vWkVVt
 xL6TdvUqjm0c73sj59X9cxm1TqDOIzbUe2OTvsrOIHhdRp4nXHMRibGZl
 oJllCtOdlR4NSJJ174cfv9yOFE5fEHzWByEDMUW/0QFJ+TJk9ztDonDp9
 TDcQQHBwBAg13L1XcFUt5ImAzvltSQCMQgy2dJFYeZqIfygJMfE+ZUtvx g==;
X-CSE-ConnectionGUID: KKU85X8USua0EJmyvQSjxA==
X-CSE-MsgGUID: L+aU/3ejQTm2X/2HVnyUXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52249085"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="52249085"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:46:59 -0700
X-CSE-ConnectionGUID: jyh5IK31QpKliF4NNHwVWA==
X-CSE-MsgGUID: ldh7TsHsQ8yp6PbDE93gFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136931793"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.131])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:46:57 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_render_copy: change width and pitch to be
 in valid range
Date: Fri,  9 May 2025 09:46:45 +0200
Message-ID: <20250509074645.56169-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509074645.56169-1-zbigniew.kempczynski@intel.com>
References: <20250509074645.56169-1-zbigniew.kempczynski@intel.com>
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
Limit them avoiding setting inappropriate bits in mem-copy operation.

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

