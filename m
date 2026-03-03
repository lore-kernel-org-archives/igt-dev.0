Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE73EEDA68D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 15:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF0710E83B;
	Tue,  3 Mar 2026 15:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eg7K/yU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590C310E839
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 15:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772551768; x=1804087768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DoCRtimN4d2gbS8fvJxfT6k1vENwgx2P5O21MOnGgps=;
 b=eg7K/yU6U/nijQO9sDuFWoN0LLFWT4KSQ0CHG4ZMiR/IHft8cu5RgDvP
 oG9BIPUyqqNuDABCk1aYtxaUN9PkiteBX+S+wnSNDNw2KKZQeYuP7WZij
 UJd1Dx1bh9kV3ZKBkq+RW7QNYCTvRNoYvwzFaoE5EbyTQM90+Dz8YkYtI
 rcIjTOZOdrIfDNfxdbeIP4utrGScknQc2ML7R1PtdcpgvDE7GByShZOiY
 kEYL+lQSH5Rfqka7C30MWVRfJ2O/9980gBmcdRVRlf2F0EPkcyiRz+N2m
 Jp+djgDHb0EEsetG6RrqGD4I5ToPzWRBrDmlq3ITDe47xssR1Mp0LKyVl Q==;
X-CSE-ConnectionGUID: 7buu/LTxTyCTIL9tnd/iNw==
X-CSE-MsgGUID: z77B+sZPQUmztpJsB713nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76193152"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76193152"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:29:28 -0800
X-CSE-ConnectionGUID: bQe/atu9S/yjzhvTT5Xw/w==
X-CSE-MsgGUID: 9+En+NWwS+uQZ6cp8g0V7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="215098698"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:29:26 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v5 4/9] tests/intel/xe_madvise: Add purged-mmap-blocked
 subtest
Date: Tue,  3 Mar 2026 20:58:57 +0530
Message-ID: <20260303152909.3503461-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303152909.3503461-1-arvind.yadav@intel.com>
References: <20260303152909.3503461-1-arvind.yadav@intel.com>
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
via memory pressure and verifies that DRM_IOCTL_XE_GEM_MMAP_OFFSET
returns -EINVAL once the BO backing store has been permanently
discarded.

  - DONTNEED BOs: return -EBUSY (temporary purgeable state, BO still
    has backing store but can be purged at any time)
  - Purged BOs: return -EINVAL (permanent, backing store discarded)

v5:
  - Add purged-mmap-blocked subtest to verify
    DRM_IOCTL_XE_GEM_MMAP_OFFSET returns -EINVAL after BO
    backing store is permanently purged.

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 435dd939e..8dc568a92 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -152,6 +152,34 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
 	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
 }
 
+/**
+ * SUBTEST: purged-mmap-blocked
+ * Description: After BO is purged, verify mmap offset fails with -EINVAL
+ * Test category: functionality test
+ */
+static void test_purged_mmap_blocked(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	struct drm_xe_gem_mmap_offset mmo = {};
+
+	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
+	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
+		gem_close(fd, bo);
+		xe_vm_destroy(fd, vm);
+		igt_skip("Unable to induce purge on this platform/config");
+	}
+
+	/* Attempt to get mmap offset for purged BO - should fail with EINVAL */
+	mmo.handle = bo;
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), -1);
+	igt_assert_eq(errno, EINVAL);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: dontneed-before-mmap
  * Description: Mark BO as DONTNEED before mmap, verify mmap offset fails with -EBUSY
@@ -203,6 +231,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("purged-mmap-blocked")
+		xe_for_each_engine(fd, hwe) {
+			test_purged_mmap_blocked(fd, hwe);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

