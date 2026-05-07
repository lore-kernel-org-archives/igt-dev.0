Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98CCCD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 06:04:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E4410E18B;
	Thu,  7 May 2026 06:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7OZrCwE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9964910E18B
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 06:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778133832; x=1809669832;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8mgAuORP4PjtdNj3cegE1kHrYKnhRZ/tFanKzv6dFYk=;
 b=H7OZrCwEKEwe0rs5qDr4EMc+dzPnHbPx+W0YUa5cyuaHzBafLOz3ADK2
 r9fowDQlopCGcBkmRHawdjvBJDyZlq2it8FBihDCfdJoV0CDHdG4Z5o8G
 X0rFNe7+GiMfxVuC81giEiCQ/EQWsZcjumra7O9MdlO7btaQSW942+miL
 jZtqYXtm2/N1gMVu4zM5gBuqc51XS/5c5tXZ7zSREaHsOD/RPIvYg0mNj
 P+Xn18Rx06jfDa/IkprXiePU/fwvbP7mS0Fr8U+v8zmrERDirhZJ4cUKI
 1aZ2yz7V8xhGF9dr9UmHnthCifjIn2AWEqhgvIGeEgc9BBclIiJIDOb2D g==;
X-CSE-ConnectionGUID: 27pa26sgT8iECL+90jcTHQ==
X-CSE-MsgGUID: mmGzpdSbQ8iqbjnwFjj1WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79122852"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="79122852"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:03:51 -0700
X-CSE-ConnectionGUID: ZdI0bIB9R2e65+f5rsObrA==
X-CSE-MsgGUID: ayARE+jhRs6VOmiHShbjRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="235367408"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 23:03:49 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [i-g-t] tests/intel/xe_madvise: Add partial-unbind-dontneed subtest
Date: Thu,  7 May 2026 11:33:35 +0530
Message-ID: <20260507060335.3397890-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

A partial unbind on a DONTNEED BO must succeed because remap remnants
inherit the existing DONTNEED VMA state. A fresh bind on the same BO
must fail with -EBUSY so a new mapping cannot promote purgeable memory
back to WILLNEED.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index e9bf55ff5..629c5eb06 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -14,6 +14,7 @@
 #include "igt.h"
 #include "xe_drm.h"
 
+#include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "lib/igt_syncobj.h"
@@ -768,6 +769,64 @@ out:
 		igt_skip("Unable to induce purge on this platform/config");
 }
 
+/**
+ * SUBTEST: partial-unbind-dontneed
+ * Description: Partial unbind on a DONTNEED BO must succeed; a fresh bind
+ *              on the same DONTNEED BO must be rejected with -EBUSY.
+ * Test category: functionality test
+ */
+static void test_partial_unbind_dontneed(int fd)
+{
+	uint32_t vm, bo;
+	uint64_t addr = PURGEABLE_ADDR;
+	uint64_t addr2 = PURGEABLE_ADDR2;
+	size_t page_size = PURGEABLE_BO_SIZE;
+	size_t bo_size = 2 * PURGEABLE_BO_SIZE;
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = PURGEABLE_FENCE_VAL,
+	};
+	uint64_t sync_val = 0;
+	uint32_t retained;
+	int ret;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	sync.addr = to_user_pointer(&sync_val);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &sync_val, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
+
+	/* Mark BO as DONTNEED. */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, bo_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/*
+	 * Partial unbind of the first page must succeed. The remap split
+	 * inherits the parent VMA's DONTNEED attr and must not be rejected.
+	 */
+	sync_val = 0;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, page_size, &sync, 1);
+	xe_wait_ufence(fd, &sync_val, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
+
+	/*
+	 * A fresh bind on the same DONTNEED BO must be rejected with -EBUSY.
+	 * The kernel must not silently promote a DONTNEED BO back to WILLNEED
+	 * through a new bind.
+	 */
+	sync_val = 0;
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr2, bo_size,
+			   DRM_XE_VM_BIND_OP_MAP, 0, &sync, 1, 0,
+			   DEFAULT_PAT_INDEX, 0);
+	igt_assert_eq(ret, -EBUSY);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -822,6 +881,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("partial-unbind-dontneed")
+		xe_for_each_engine(fd, hwe) {
+			test_partial_unbind_dontneed(fd);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

