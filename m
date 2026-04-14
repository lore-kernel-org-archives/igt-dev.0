Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37003F45A1C
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 06:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE91710E570;
	Tue, 14 Apr 2026 06:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqMgeM9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703DE10E56B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 06:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776147443; x=1807683443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I5itkU5UgiUlc5J8He+te8UNaRejiMcjMPunxoAP49E=;
 b=hqMgeM9PX8Uh9EOxKtlkaSi5BmzHehx484HUiWCX6THi7/KSQshlLE2n
 pFQYmwd7CIyh0QQvYHbNuPDrgZyTr8hKIhNR0SH/LFdpApberU44UwWXQ
 Tzc+IbIodx6YxxOXPg3IC45OAebmAAzubeWbiScYPJu5K9mEomrGm2dZr
 WFMKINIxqLLNmedCT1BY5UnGHNi9Dx27kcb9lOCXKFiYEYAfIMzWsjVeu
 k3MXsRJzuxUCjXNk1BKQan9SfPOAW2VM+Eee+7XKAUdpEFwu5UAFHND+i
 D6DkhXJxxZi9vBlnQxyDDsaRG5O66tNOEYkJx1yN3YZWf8IBUfbGGy1qX A==;
X-CSE-ConnectionGUID: iDHrOedkTimm/idnl266WQ==
X-CSE-MsgGUID: AwLS+kOLQW6OVGHFnHXNow==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88173117"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88173117"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 23:17:23 -0700
X-CSE-ConnectionGUID: HNsXllKXReKgvTe33AQF9w==
X-CSE-MsgGUID: zBKPvC78SV20pnd2PyAkYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234962815"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 23:17:21 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v10 3/8] tests/intel/xe_madvise: Add purged-mmap-blocked
 subtest
Date: Tue, 14 Apr 2026 11:46:54 +0530
Message-ID: <20260414061703.2604112-4-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414061703.2604112-1-arvind.yadav@intel.com>
References: <20260414061703.2604112-1-arvind.yadav@intel.com>
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

Add a new purged-mmap-blocked subtest that triggers an actual purge
via memory pressure and verifies that mmap() fails with -EINVAL once
the BO backing store has been permanently discarded.

The purgeable check moved from xe_gem_mmap_offset_ioctl()
into a new xe_gem_object_mmap() callback, so the blocking point is now
mmap() itself rather than the mmap offset ioctl:

  - DRM_IOCTL_XE_GEM_MMAP_OFFSET: always succeeds regardless of
    purgeable state (just returns the pre-allocated offset)
  - mmap() on DONTNEED BO: fails with -EBUSY (temporary state)
  - mmap() on purged BO: fails with -EINVAL (permanent, no backing store)

v5:
  - Add purged-mmap-blocked subtest to verify mmap is blocked after
    BO backing store is permanently purged.

v6:
  - DRM_IOCTL_XE_GEM_MMAP_OFFSET always succeeds; the purgeable check
    now happens in xe_gem_object_mmap() at mmap() time. For purged BOs,
    assert mmap() fails with -EINVAL.

v7:
  - Moved trigger_memory_pressure() and purgeable_mark_and_verify_purged()
    here. (Nishit)
  - Use xe_has_vram() instead of checking xe_visible_vram_size() > 0 for
    clearer dGPU/iGPU detection. (Nishit)
  - Fix purgeable_mark_and_verify_purged(): handle retained == 0 from
    DONTNEED (BO already purged) as success instead of incorrectly
    returning false. (Nishit)
  - Drop unused vm parameter from trigger_memory_pressure(). (Nishit)

v10:
  - iGPU: use igt_purge_vm_caches() to trigger shrinker directly
    instead of flooding system RAM (avoids OOM on low-memory machines).
  - Simplified comments in trigger_memory_pressure().

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 139 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 2c8c27fa9..14e39ff96 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -59,6 +59,139 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
 	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
 }
 
+/**
+ * trigger_memory_pressure - Force kernel to reclaim DONTNEED BOs
+ * @fd: DRM file descriptor
+ *
+ * dGPU: over-fill VRAM by ~50 % so TTM evicts purgeable BOs.
+ * iGPU: poke the shrinker via igt_purge_vm_caches() (avoids OOM).
+ */
+static void trigger_memory_pressure(int fd)
+{
+	uint64_t mem_size, overpressure;
+	const uint64_t chunk = 8ull << 20; /* 8 MiB */
+	int max_objs, n = 0;
+	uint32_t *handles;
+	uint64_t total;
+	void *p;
+	uint32_t handle, vm;
+
+	/* iGPU: use the shrinker, no need to flood system RAM */
+	if (!xe_has_vram(fd)) {
+		igt_purge_vm_caches(fd);
+		return;
+	}
+
+	/* dGPU: fill VRAM + 50 % to force TTM eviction */
+	mem_size = xe_visible_vram_size(fd, 0);
+	overpressure = mem_size / 2;
+	if (overpressure < (64 << 20))
+		overpressure = 64 << 20;
+
+	/* Separate VM so pressure BOs don't interfere with the test */
+	vm = xe_vm_create(fd, 0, 0);
+
+	max_objs = (mem_size + overpressure) / chunk + 1;
+	handles = malloc(max_objs * sizeof(*handles));
+	igt_assert(handles);
+
+	total = 0;
+	while (total < mem_size + overpressure && n < max_objs) {
+		uint32_t err;
+
+		err = __xe_bo_create(fd, vm, chunk,
+				     vram_if_possible(fd, 0),
+				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				     NULL, &handle);
+		if (err) /* Out of VRAM — sufficient pressure achieved */
+			break;
+
+		handles[n++] = handle;
+		total += chunk;
+
+		p = xe_bo_map(fd, handle, chunk);
+		igt_assert(p != MAP_FAILED);
+
+		/* Fault in all pages so they actually consume VRAM */
+		memset(p, 0xCD, chunk);
+		munmap(p, chunk);
+	}
+
+	/* Allow shrinker time to process pressure */
+	usleep(100000);
+
+	for (int i = 0; i < n; i++)
+		gem_close(fd, handles[i]);
+
+	free(handles);
+
+	xe_vm_destroy(fd, vm);
+}
+
+/**
+ * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check purged
+ * @fd: DRM file descriptor
+ * @vm: VM handle
+ * @addr: Virtual address of the BO
+ * @size: Size of the BO
+ *
+ * Returns true if the BO was purged under memory pressure.
+ */
+static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, uint64_t addr, size_t size)
+{
+	uint32_t retained;
+
+	/* Mark as DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	if (retained == 0)
+		return true; /* Already purged */
+
+	/* Trigger memory pressure */
+	trigger_memory_pressure(fd);
+
+	/* Verify purged */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	return retained == 0;
+}
+
+/**
+ * SUBTEST: purged-mmap-blocked
+ * Description: After BO is purged, verify mmap() fails with -EINVAL
+ * Test category: functionality test
+ */
+static void test_purged_mmap_blocked(int fd)
+{
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	struct drm_xe_gem_mmap_offset mmo = {};
+	void *ptr;
+
+	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
+	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
+		gem_close(fd, bo);
+		xe_vm_destroy(fd, vm);
+		igt_skip("Unable to induce purge on this platform/config");
+	}
+
+	/*
+	 * Getting the mmap offset is always allowed regardless of purgeable
+	 * state - the blocking happens at mmap() time (xe_gem_object_mmap).
+	 * For a purged BO, mmap() must fail with -EINVAL (no backing store).
+	 */
+	mmo.handle = bo;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
+
+	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
+	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
+	igt_assert_eq(errno, EINVAL);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: dontneed-before-mmap
  * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
@@ -115,6 +248,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("purged-mmap-blocked")
+		xe_for_each_engine(fd, hwe) {
+			test_purged_mmap_blocked(fd);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

