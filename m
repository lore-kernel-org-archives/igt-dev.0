Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4AFE9DE43
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 07:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B47710E74E;
	Thu,  9 Apr 2026 07:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iz0Nl090";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DF210E74A
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 07:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775718112; x=1807254112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jD29nN7tls3M1XKo4V+KwLkt3rJV6LEM7VEVHrcso9Y=;
 b=iz0Nl090METinKoxCRvvWNxWhtdkBndiN14fS48LmqfBoK4zoE2JDbhF
 TDiqKXYOWe8z92vKS7LPY34mJrTP9DBT6l3oiJQZwavjdHj2jOvaKzUaw
 /ShuGyfp6e5IIqnbwmlA8dgRv3bcZl5B3O0tek6AJJBM+1apY6QAy3e2N
 0lENsJ93dE9d7kvtELlHiKyVLQA3Y0jwRCm6xLclnfb+x7BVJpgKkAByP
 m9+FmgWPSzP5jlf9l9GXVR+JAZuPdtEjqzTEEHEYPFvv/CeW22fe7m+Dj
 6VvBg4FjaqZEq6eKhAd/U53NCE3G1pIv5XZ/4YfZlw1aZVsDCzHinZ2xO g==;
X-CSE-ConnectionGUID: 5NSgJuZDSUy3n83jo9Yrdw==
X-CSE-MsgGUID: 6nuYlHc+SAmXKNT5Hskriw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88165077"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="88165077"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 00:01:50 -0700
X-CSE-ConnectionGUID: h9CIOXG/RUexrvVatGnDcw==
X-CSE-MsgGUID: GRlU1cX1QJ6+vJWtli/pgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="224384143"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 00:01:48 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v7 9/9] tests/intel/xe_madvise: Add per-vma-protection
 subtest
Date: Thu,  9 Apr 2026 12:31:18 +0530
Message-ID: <20260409070118.2211602-10-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070118.2211602-1-arvind.yadav@intel.com>
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
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

This test validates that a WILLNEED VMA protects a shared BO from being
purged even when other VMAs are marked DONTNEED. The test creates a BO
shared across two VMs, marks VMA1 as DONTNEED while keeping VMA2 as
WILLNEED, then triggers memory pressure. The BO should survive and GPU
execution should succeed. After marking both VMAs as DONTNEED and
triggering pressure again, the BO should be purged, demonstrating that
all VMAs must be DONTNEED for the BO to be purgeable.

v4:
  - Added syncobj_wait() after the second exec. (Nishit)

v6:
  - Move resource cleanup before igt_skip() to avoid leaking VM and BO
    handles on platforms where memory pressure cannot be induced; replace
    igt_assert_eq(retained, 0) with a graceful skip. (Nishit)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 127 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 28a77e938..8d952070f 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -644,6 +644,127 @@ static void test_per_vma_tracking(int fd)
 
 }
 
+/**
+ * SUBTEST: per-vma-protection
+ * Description: WILLNEED VMA protects BO from purging; both DONTNEED makes BO purgeable
+ * Test category: functionality test
+ */
+static void test_per_vma_protection(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t vm1, vm2, exec_queue, bo, batch_bo, bind_engine;
+	uint64_t data_addr1 = PURGEABLE_ADDR;
+	uint64_t data_addr2 = PURGEABLE_ADDR2;
+	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
+	size_t data_size = PURGEABLE_BO_SIZE;
+	size_t batch_size = PURGEABLE_BO_SIZE;
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = PURGEABLE_FENCE_VAL },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync[1]),
+	};
+	uint32_t *data, *batch;
+	uint64_t vm_sync = 0;
+	uint32_t retained, syncobj;
+	int b, ret;
+
+	/* Create two VMs and bind shared data BO */
+	data = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
+						 data_addr1, data_addr2,
+						 data_size, true);
+	memset(data, 0, data_size);
+	bind_engine = xe_bind_exec_queue_create(fd, vm2, 0);
+
+	/* Create and bind batch BO in VM2 */
+	batch_bo = xe_bo_create(fd, vm2, batch_size, vram_if_possible(fd, 0),
+				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	batch = xe_bo_map(fd, batch_bo, batch_size);
+	igt_assert(batch != MAP_FAILED);
+
+	sync[0].addr = to_user_pointer(&vm_sync);
+	vm_sync = 0;
+	xe_vm_bind_async(fd, vm2, bind_engine, batch_bo, 0, batch_addr, batch_size, sync, 1);
+	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
+
+	/* Mark VMA1 as DONTNEED, VMA2 stays WILLNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm1, data_addr1, data_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Trigger pressure - BO should survive */
+	trigger_memory_pressure(fd);
+
+	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	igt_assert_eq(retained, 1);
+
+	/* GPU workload - should succeed */
+	b = 0;
+	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
+	batch[b++] = data_addr2;
+	batch[b++] = data_addr2 >> 32;
+	batch[b++] = PURGEABLE_TEST_PATTERN;
+	batch[b++] = MI_BATCH_BUFFER_END;
+
+	syncobj = syncobj_create(fd, 0);
+	sync[1].handle = syncobj;
+	exec_queue = xe_exec_queue_create(fd, vm2, hwe, 0);
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	ret = __xe_exec(fd, &exec);
+	igt_assert_eq(ret, 0);
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+
+	munmap(data, data_size);
+	data = xe_bo_map(fd, bo, data_size);
+	igt_assert(data != MAP_FAILED);
+	igt_assert_eq(data[0], PURGEABLE_TEST_PATTERN);
+
+	/* Mark both VMAs DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	igt_assert_eq(retained, 1);
+
+	/* Trigger pressure - BO should be purged */
+	trigger_memory_pressure(fd);
+
+	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+
+	if (retained != 0)
+		goto out;
+
+	/* GPU workload - should fail or succeed with NULL rebind */
+	batch[3] = PURGEABLE_DEAD_PATTERN;
+
+	ret = __xe_exec(fd, &exec);
+	if (ret == 0) {
+		/* Exec succeeded, wait for completion before cleanup */
+		syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
+	}
+
+out:
+	munmap(data, data_size);
+	munmap(batch, batch_size);
+	gem_close(fd, bo);
+	gem_close(fd, batch_bo);
+	syncobj_destroy(fd, syncobj);
+	xe_exec_queue_destroy(fd, bind_engine);
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm1);
+	xe_vm_destroy(fd, vm2);
+
+	if (retained != 0)
+		igt_skip("Unable to induce purge on this platform/config");
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -692,6 +813,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("per-vma-protection")
+		xe_for_each_engine(fd, hwe) {
+			test_per_vma_protection(fd, hwe);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

