Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EA8106B527
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 12:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA55910E560;
	Wed, 25 Mar 2026 12:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcO2QZmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDCF10E560
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774442688; x=1805978688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yMLV0/g7B2qTZdSPoCUWzFfoKaEgZpdDPXZL+49AVmE=;
 b=VcO2QZmr+lwbzWFiNWi1E0NQL425hEpuiEDjnr3hqNp4g6nvYLeTCiyC
 dqD8VODyU2Tri1DWERmzHxvx9PhdExqyItrBle9AYxNPsP++vZ8/5DROB
 v6CAt8eOdlPCVfZQx+jtm2iVUhEyFVafbZUSs/0hCyqHB19alnilUwEI2
 qeoqoWJci7+2cHthXVH4/MoRYQ/uLpoASzWbXIJEKCz1MxjxKqwYA1n7Y
 RseyN3iKPgwQxRV/mUk2rHhLGyNWS71Vm2geUXyQE4PdqyGOIg4yORVJd
 CyYe8ss8Je0idFyQ7DNzrZnjrKwYzibEkR+x+EbMkL/PVEHryAQxtahIS w==;
X-CSE-ConnectionGUID: /opfAToGQ46Gr8udluZNkg==
X-CSE-MsgGUID: JoQC46+0R6uHbx6R8hrDgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86555509"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86555509"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:48 -0700
X-CSE-ConnectionGUID: xrAj3AWPRC6cROaaptsxcQ==
X-CSE-MsgGUID: kW66xszqSYCBUivWiHme7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="223876368"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:47 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v6 4/9] tests/intel/xe_madvise: Add purged-mmap-blocked
 subtest
Date: Wed, 25 Mar 2026 18:14:18 +0530
Message-ID: <20260325124426.3265234-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325124426.3265234-1-arvind.yadav@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
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

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index de4a6e34c..81e05b6d4 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -170,6 +170,42 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
 	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
 }
 
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
@@ -226,6 +262,12 @@ int igt_main()
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

