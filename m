Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5332BC5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 14:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED15C10E572;
	Wed, 19 Aug 2026 14:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imLYik5H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11E610E142
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787151185; x=1818687185;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=L0ushFmI6qDmLvcFy25OLL6osxmBsjb2BVdzu7rDBl8=;
 b=imLYik5H332IgRh+R1PGsY1VGb6HldP24cOsceYR3dLt0bqNevLLh1KC
 Z6wNfGQxCRMHw8c1RKDCef6F5+UWZhmNBMDu4TYh0KeclhmBy3AGu48jv
 eUUmgITvmCDgBlBC+vH4XsS6ohaOhLRJGhTx4BxIVfW6Pj0S39am5qMMz
 yKNcl0kixpI0YtEfVbke/SBudI5errXKc8pABV0+9ouaxtMH0D136X3V8
 g1qYa6bY2eAK7vs/m9Fips1lziPOr4DZz23vaRnTwACw6Yd0b1mo8rDqI
 iwe9b3JHy+ce0WpPXnvrXLPZxVGuW1naSqbJIHodimLoRpu/FAikmkR5A A==;
X-CSE-ConnectionGUID: GGCV7pYFRy6XVZC+zL8icQ==
X-CSE-MsgGUID: qE6dKJl3R5+GDxvumUboeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87588151"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87588151"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:53:05 -0700
X-CSE-ConnectionGUID: GJZpaejSQ+mnWigD9bxKJQ==
X-CSE-MsgGUID: 5Ds0cmHkQL2py/49JPLTzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="270791038"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa005.fm.intel.com with ESMTP; 19 Aug 2026 07:53:03 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v1 1/2] tests/intel/xe_exec_system_allocator: fix
 prefetch-change-attr flow
Date: Wed, 19 Aug 2026 14:53:00 +0000
Message-ID: <20260819145302.18068-2-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819145302.18068-1-nishit.sharma@intel.com>
References: <20260819145302.18068-1-nishit.sharma@intel.com>
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

These changes fixes the prefetch-change-attr test flow so the intended
prefetch and atomic-attribute transition execute in the correct path.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 6ca53aa5f..476470be7 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -1395,6 +1395,9 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 
 		xe_vm_madvise_migrate_pages(fd, vm, to_user_pointer(data), bo_size / 2);
 
+		/* free 1st allocation in mem_attrs */
+		free(mem_attrs);
+
 		mem_attrs = xe_vm_get_mem_attr_values_in_range(fd, vm, addr, bo_size, &num_ranges);
 		if (!mem_attrs) {
 			igt_info("Failed to get memory attributes\n");
@@ -1426,13 +1429,14 @@ madvise_prefetch_op(int fd, uint32_t vm, uint64_t addr, size_t bo_size,
 		if (!mem_attrs) {
 			igt_info("Failed to get memory attributes\n");
 			return;
+		}
 
 		xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, NULL, 0,
 				     DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
 
 		xe_vm_madvise_atomic_attr(fd, vm, to_user_pointer(data), bo_size,
 					  DRM_XE_ATOMIC_DEVICE);
-		}
+
 		free(mem_attrs);
 	}
 }
-- 
2.43.0

