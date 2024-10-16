Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2369D1AD40
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 10:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C10D10E6EC;
	Wed, 16 Oct 2024 10:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3udT+0e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207D510E6EC
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729074044; x=1760610044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7c7wv/Zx3Q9aPG5d/cDo6AVCjhPh8nN/qC0QXn8TdTg=;
 b=D3udT+0e841xsKS+A/H/+Surl+QJ/U2NScqTTEfGXMeORnco3ViTqGSz
 ahEXL4boLtM3MSMcz/SOK9RrU+P8SBrwCuk/4lY3gvyP8B0BgCbBwS6d7
 5tKBxniy7b86qaHSMrdAWl+Y560fTEOO1pZe/PC95L+w1tFOjbH7BToYA
 cc4+CyBUZdXsbQUTg32uEcWC2jBAhFcUr4Jium+DApJhnAH/Wy/rdg8HZ
 b3AwS1eA/GB41RtxWrXEfRzZfL43wlWBFuYouloIaApHiA2YO/9HhIrtp
 eRHchbyeZmiH7sogWlbMnhSHKpy5L/QomQYkH3fzOWSJAzjaeoOcBkuud g==;
X-CSE-ConnectionGUID: ETu87dIiRjG2t7cmw2a6lQ==
X-CSE-MsgGUID: r8y75/DkTuWZiM1n5DjDvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39091626"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="39091626"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 03:20:44 -0700
X-CSE-ConnectionGUID: NhaKoaibQhqUu4ZWe8j80w==
X-CSE-MsgGUID: 2BKfY8M7TUylNUZQCLKpuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="79018393"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa008.jf.intel.com with ESMTP; 16 Oct 2024 03:20:42 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com, katarzyna.piecielska@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: Use
 xe_find_engine_by_class
Date: Wed, 16 Oct 2024 15:49:33 +0530
Message-Id: <20241016101933.4191790-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016101933.4191790-1-pravalika.gurram@intel.com>
References: <20241016101933.4191790-1-pravalika.gurram@intel.com>
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

Use 'xe_find_engine_by_class' helper to get the engine info with the
required engine class.  Stop assuming engine id is equal to 1

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 82e607848..b238503ea 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -461,7 +461,10 @@ static void lr_mode_workload(int fd)
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
 	bo_size = xe_bb_size(fd, sizeof(*spin));
-	engine = xe_engine(fd, 1);
+
+	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COPY);
+	igt_assert(engine);
+
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
 	spin = xe_bo_map(fd, bo, bo_size);
 
-- 
2.34.1

