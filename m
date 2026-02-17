Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AD7E83831
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 02:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675B610E420;
	Tue, 17 Feb 2026 02:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKIYm1P1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA1D10E1CC
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 02:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771295748; x=1802831748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XfV1nZdjOLAco0dRI/db1Zhxw/uiWCQjvI9j3Rwl5xk=;
 b=gKIYm1P1mieGAv5phRbyA4qQPW8gUF+CRupH5alO0JD9EoFmAxtFeEw/
 pg3gIak6fVD9pvpCMCaT2BtvO8fASsRuvNI/FeOyUkTFSdrZJLmexLnAp
 fncl3AAMN7YxWK2l4fiJFiUhwiw0JqTGESwg2onqbrczjimcw6id0xw4e
 nsE4wLRI+JCr4yWkvTdkmU90nT7u9HS/tvszs5MLQ84Jn1hEsLgfbaR9/
 sNZTY2nJbu5cv+tJR9puYyUlxHMkbrBtsM6ftwuozfMTBNUzTaMZAk3Uc
 YqdzFRxFNPQlFc5/S2NoFcBDApeqOvpZu7/2DeINPW1ICgWpQ9Lv8zxrc Q==;
X-CSE-ConnectionGUID: zKKNinC0QGSBJvhVfan+mQ==
X-CSE-MsgGUID: 72dRHFVKQxanpAP5jiMWcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72358376"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="72358376"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 18:35:47 -0800
X-CSE-ConnectionGUID: AwtdDtoBRT+/dxExoXjUYg==
X-CSE-MsgGUID: hqwDwHzmTcWlJcxmJSMD3g==
X-ExtLoop1: 1
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 18:34:41 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add dontneed-after-mmap
 subtest
Date: Tue, 17 Feb 2026 08:04:15 +0530
Message-ID: <20260217023423.2632617-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260217023423.2632617-1-arvind.yadav@intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
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

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 54 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 7dbe70f42..5c6a24553 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -196,6 +196,54 @@ static void test_dontneed_before_mmap(int fd, struct drm_xe_engine_class_instanc
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: dontneed-after-mmap
+ * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on accessing purged mapping
+ * Test category: functionality test
+ */
+static void test_dontneed_after_mmap(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	void *map;
+
+	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
+
+	map = xe_bo_map(fd, bo, bo_size);
+	memset(map, 0xAB, bo_size);
+
+	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
+		igt_skip("Unable to induce purge on this platform/config");
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
+		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
+		if (sig == SIGBUS || sig == SIGSEGV) {
+			/* Expected - purged mapping access failed */
+		} else if (sig == 0) {
+			*ptr = 0;
+			igt_assert_f(false, "Access to purged mapping should trigger signal\n");
+		} else {
+			igt_assert_f(false, "unexpected signal %d\n", sig);
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
@@ -212,6 +260,12 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("dontneed-after-mmap")
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_after_mmap(fd, hwe);
+			break;
+		}
+
 	igt_fixture() {
 		xe_device_put(fd);
 		drm_close_driver(fd);
-- 
2.43.0

