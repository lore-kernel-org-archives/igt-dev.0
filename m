Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81034F3C997
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 15:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3549110E5B6;
	Tue, 24 Feb 2026 15:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhDj/Hy0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E881E10E5B6
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 15:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771946917; x=1803482917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lwtAn4unH/Nqmfinj8nL8t/sxrie8p3CV8G8x9EpSPI=;
 b=mhDj/Hy0H2CT2SxWiX8cEkDv70SBut66iEp0IQAkK7FLIn0r//IGSeWj
 4BVzP+LTA5kqWu19lkRz9HY1734OgN9jbUt+flys4YMLrB63ow4TbeVyL
 dWt2mvdPP+JJni3s+yGV+C4KNV8+tD1yn/gc+SNX3PioNvqFapAmke9BQ
 PemH6UVX8GXh6wvzS7a2udIZv0oSM50o7oB2Oi/ky437Yz+e06qfUJg17
 xm93BGGU+cAo3gqbR4+w3j97CT6VuFGudRfHjqoOY9gz/vpJseaS8A3Zq
 JPqv5sPh6l70LDUlwUGjEJqLGIvzQH4JdN2GZZXHwt+q7gexSZG2icLc+ A==;
X-CSE-ConnectionGUID: AVkyoydyS6yc2Q+yfXhTZA==
X-CSE-MsgGUID: P0FMiYh3QUiVJpOaAlDQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72868281"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="72868281"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:28:36 -0800
X-CSE-ConnectionGUID: o5M9+alRTEKe+rd9sIHdtg==
X-CSE-MsgGUID: /jXmy7AgQiSZylloehzvug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213165938"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 07:28:35 -0800
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [PATCH i-g-t v4 4/8] tests/intel/xe_madvise: Add dontneed-after-mmap
 subtest
Date: Tue, 24 Feb 2026 20:57:52 +0530
Message-ID: <20260224152804.1940820-5-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224152804.1940820-1-arvind.yadav@intel.com>
References: <20260224152804.1940820-1-arvind.yadav@intel.com>
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

Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 tests/intel/xe_madvise.c | 64 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
index 25d544c28..2e5f6157f 100644
--- a/tests/intel/xe_madvise.c
+++ b/tests/intel/xe_madvise.c
@@ -199,6 +199,64 @@ static void test_dontneed_before_mmap(int fd, struct drm_xe_engine_class_instanc
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
+		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
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
@@ -215,6 +273,12 @@ int igt_main()
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

