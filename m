Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC69AE9905D
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 09:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FB310E920;
	Fri, 10 Apr 2026 09:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0lDExqc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E0F10E918
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775813746; x=1807349746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kc74JVqYqOTDRUqkYMc0JYROBmPfR5aIak+p2KXzwvc=;
 b=M0lDExqco3X9n8DzRkGbhHu4ddQ6OK63mTisOQKmX8ZU3Pb9kcMTlTrB
 OriGLVwngB92VziWxaniKMWwmJswNf28/jMTl1FznEcCkmHwG3aj/roZG
 IeV3QRB474XYa7JoogZcWVvZio6vVGu/8H9/GqDaf6z7ISsyHFP7Nq+Hn
 sDO/8TSxpXUlcECfS1OSZeiVc6B9cO8JjcnO8l+rlAuHz2hfESSzie9cV
 tNqWuTHfpkNbQVcOp1yoC5l8NAQcAT9nYu3ZbXI+OmEVC3EtMpPZL96vv
 HDeLSyJC8GWbIv4ZHUg3wu7GFcP4xXGzOm+gCwV+Y9SryihONY4XUPIX0 A==;
X-CSE-ConnectionGUID: 0+JD1SCFR5ihxNxR9chunQ==
X-CSE-MsgGUID: IcFPaH3jTDWjUAlBQQi7ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76904879"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76904879"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 02:35:46 -0700
X-CSE-ConnectionGUID: rANia9WPTnCTjnOyRq4bIw==
X-CSE-MsgGUID: 6CfwWXYkT7umO1vKZbjaYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="259506750"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 02:35:44 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v9 4/8] tests/intel/xe_madvise: Add dontneed-after-mmap
 subtest
Date: Fri, 10 Apr 2026 15:05:17 +0530
Message-ID: <20260410093525.2409612-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410093525.2409612-1-arvind.yadav@intel.com>
References: <20260410093525.2409612-1-arvind.yadav@intel.com>
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

v7:
  - Move sigtrap/jmp_buf in this patch. (Nishit)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 71 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 619d64b46..2d5acc347 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -153,6 +153,13 @@ static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, uint64_t addr,
 	return retained == 0;
 }
 
+static jmp_buf jmp;
+
+__noreturn static void sigtrap(int sig)
+{
+	siglongjmp(jmp, sig);
+}
+
 /**
  * SUBTEST: purged-mmap-blocked
  * Description: After BO is purged, verify mmap() fails with -EINVAL
@@ -227,6 +234,64 @@ static void test_dontneed_before_mmap(int fd)
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
@@ -251,6 +316,12 @@ int igt_main()
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

