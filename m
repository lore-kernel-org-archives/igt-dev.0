Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33219106B526
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 12:45:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35B810E7B7;
	Wed, 25 Mar 2026 12:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AT3+XMzY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C903610E230
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 12:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774442690; x=1805978690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0rGGNeaVwzAL4rZs1nS701WHP/DwNMh7gZ9f6LZArFg=;
 b=AT3+XMzYVjCeWBkUX1rS5rVijVEtrwE4egh/Moejjj1xZJaF4WM0Sf5T
 j3AEigyd6nP6eMloCzA0V4DizRrVtsVGRC7YEwNx7eJ20MVM6XOHri7LJ
 8QXYyK97+OrHMQHWjj9YER4AkPrVoYN7ymq/NwbQroivFKY0pPtC977Wu
 AFSstYgRnOoIf8iS8Wkuth5aek+UrD2sOhb7DOmsW1+TbetjpoD4rpIsS
 XByabVWY2IyrjQnurOvtxCF9x3cMXlrKTTVlMJsGlKOg6OC0t2wNPWgIS
 YQRTHV1ovOSGcGoZ3dfRTgccIXs9hrcxGaD8/GMX2WvIGuUldeKaLqTOJ Q==;
X-CSE-ConnectionGUID: mh0EVISGSIaSGIWziH56Zg==
X-CSE-MsgGUID: 2hcJzXM5SxqzA/NmS+UZgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86555511"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86555511"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:50 -0700
X-CSE-ConnectionGUID: TpylalMMTtqUphgNausNMA==
X-CSE-MsgGUID: hSKseK8RTB6NWbj1L6zA/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="223876376"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 05:44:49 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v6 5/9] tests/intel/xe_madvise: Add dontneed-after-mmap
 subtest
Date: Wed, 25 Mar 2026 18:14:19 +0530
Message-ID: <20260325124426.3265234-6-arvind.yadav@intel.com>
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

This test verifies that an existing mmap becomes invalid after the BO
is marked as purgeable and purged. The test creates a BO, maps it,
writes data, then marks it DONTNEED and triggers memory pressure.
Accessing the previously valid mapping should now trigger SIGBUS or
SIGSEGV, confirming that existing mappings are correctly invalidated
when the backing store is purged.

v4:
  - Added proper resource cleanup before calling igt_skip(). (Nishit)
  - Added assertion for xe_bo_map. (Nishit)

v6:
  - Fix sigsetjmp(jmp, SIGBUS | SIGSEGV) to sigsetjmp(jmp, 1). The
    second argument is a plain boolean savemask, not a signal set.

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 64 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 81e05b6d4..9a157de1d 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -244,6 +244,64 @@ static void test_dontneed_before_mmap(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: dontneed-after-mmap
+ * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on accessing purged mapping
+ * Test category: functionality test
+ */
+static void test_dontneed_after_mmap(int fd)
+{
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	void *map;
+
+	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
+
+	map = xe_bo_map(fd, bo, bo_size);
+	igt_assert(map != MAP_FAILED);
+	memset(map, 0xAB, bo_size);
+
+	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
+		munmap(map, bo_size);
+		gem_close(fd, bo);
+		xe_vm_destroy(fd, vm);
+		igt_skip("Unable to induce purge on this platform/config");
+	}
+
+	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
+	{
+		sighandler_t old_sigsegv, old_sigbus;
+		char *ptr = (char *)map;
+		int sig;
+
+		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
+		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
+
+		sig = sigsetjmp(jmp, 1); /* savemask=1: save/restore signal mask */
+		switch (sig) {
+		case SIGBUS:
+		case SIGSEGV:
+			/* Expected - purged mapping access failed */
+			break;
+		case 0:
+			*ptr = 0;
+		default:
+			igt_assert_f(false,
+				     "Access to purged mapping should trigger SIGBUS, got sig=%d\n",
+				     sig);
+			break;
+		}
+
+		signal(SIGBUS, old_sigbus);
+		signal(SIGSEGV, old_sigsegv);
+	}
+
+	munmap(map, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -268,6 +326,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("dontneed-after-mmap")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_after_mmap(fd);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

