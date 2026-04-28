Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E84FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 06:55:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D34310E06A;
	Tue, 28 Apr 2026 06:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjjHuvCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FD810E06A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 06:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777359278; x=1808895278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=luMmaXxdS2YNiSyfOo2OvYs4UhaFfMza36CzZKiLnks=;
 b=fjjHuvCDHLayr7KzWN36LgnILWzjAQ+Mh9jK2bq6KPJiYQAPWz/gggKi
 IHsdca4rVNimSJJCes9m0Gu/JCTmTN1dlExoLfpAZeLLDutg4TRDM56qG
 pFeqfXeUmveor4StdHSInCMR0PGwtt+conwN7HxIdyfkbkFhEe0+NVKoQ
 3ID7uLEaiXdJj/OcHLnw5RrMj+DKrKyT9A74vuaisTOi+IfP+U6LI8CGz
 OJ/8448HrdWbggqtr8UyD7oLqb8w+CGDM0EDT52vNVLjEOEXXn40tP5qn
 B5y7RRxvfHdiWSxQxpbZraxfvRJKLg7wiM/RQeTYtJb9iyn5lLDRzrAs9 g==;
X-CSE-ConnectionGUID: BvMWao32QhSV54o3141gGg==
X-CSE-MsgGUID: StMx1A7QTfaFAabpf0C7YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78137879"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78137879"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:38 -0700
X-CSE-ConnectionGUID: ai9N09C9Q8iC/pepzfxgGA==
X-CSE-MsgGUID: hQw5r8e+QF+OTAoq8LjerA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="232863014"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.161])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 23:54:38 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t 6/6] tests/xe_cgroups: add write_eviction_nonblock
 subtest
Date: Tue, 28 Apr 2026 08:54:11 +0200
Message-ID: <20260428065411.4222-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428065411.4222-1-thomas.hellstrom@linux.intel.com>
References: <20260428065411.4222-1-thomas.hellstrom@linux.intel.com>
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

Add write_eviction_nonblock to exercise the O_NONBLOCK path of the dmem
cgroup max interface.  After filling VRAM to the cgroup limit, each
limit-lowering step writes dmem.max with O_NONBLOCK so that synchronous
eviction is skipped.  The test then verifies that usage has not yet
dropped below the new limit, allocates a small BO to trigger eviction
explicitly, and finally confirms that usage falls within bounds.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_cgroups.c | 43 ++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_cgroups.c b/tests/intel/xe_cgroups.c
index 8b0f4381f..aa7a8c3b2 100644
--- a/tests/intel/xe_cgroups.c
+++ b/tests/intel/xe_cgroups.c
@@ -35,6 +35,7 @@
 #define BIND_BASE		0x100000000ULL	/* 4 GiB VA base */
 
 #define TEST_INTERRUPTIBLE	(1 << 0)
+#define TEST_NONBLOCK		(1 << 1)
 
 /**
  * SUBTEST: write_eviction
@@ -62,6 +63,18 @@
  * REQUIREMENTS: must run as root; xe device with at least one VRAM region
  */
 
+/**
+ * SUBTEST: write_eviction_nonblock
+ * DESCRIPTION:
+ *   Same fill phase as write_eviction.  In the limit-lowering phase dmem.max
+ *   is written with O_NONBLOCK, which causes the kernel to skip synchronous
+ *   eviction.  After each nonblock write the test verifies that usage has not
+ *   yet dropped below the new limit, then triggers eviction explicitly by
+ *   allocating a small BO.  Finally verifies that usage falls within bounds
+ *   after the forced eviction.
+ * REQUIREMENTS: must run as root; xe device with at least one VRAM region
+ */
+
 static atomic_int signal_count;
 static struct sigaction sigcont_oldact;
 
@@ -146,7 +159,7 @@ static void test_write_eviction(int fd, unsigned int flags)
 	uint64_t region;
 	uint32_t *handles = NULL;
 	int n_bo = 0, max_bo;
-	uint64_t current, capacity, cg_max, limit, after;
+	uint64_t current, capacity, cg_max, limit, after, before;
 
 	/* Check dmem cgroup controller is available before doing anything else */
 	igt_require_f(igt_cgroup_dmem_available(),
@@ -207,18 +220,35 @@ static void test_write_eviction(int fd, unsigned int flags)
 	while (limit >= EVICT_STEP) {
 
 		limit -= EVICT_STEP;
-		igt_cgroup_dmem_set_max(cg, cg_region, limit, false);
+
+		if (flags & TEST_NONBLOCK)
+			igt_cgroup_dmem_get_current(cg, cg_region, &before);
+
+		igt_cgroup_dmem_set_max(cg, cg_region, limit,
+					!!(flags & TEST_NONBLOCK));
 
 		igt_cgroup_dmem_get_current(cg, cg_region, &after);
 		igt_debug("Lowered max to %"PRIu64" MiB: usage = %"PRIu64" MiB\n",
 			  limit / SZ_1M, after / SZ_1M);
 
+		if (flags & TEST_NONBLOCK) {
+			/*
+			 * O_NONBLOCK skips eviction: verify usage has not
+			 * dropped below the new limit yet.
+			 */
+			igt_assert_f(after == before,
+				     "Expected no eviction with O_NONBLOCK, but "
+				     "usage dropped from %"PRIu64" MiB to %"PRIu64" MiB "
+				     "(limit %"PRIu64" MiB)\n",
+				     before / SZ_1M, after / SZ_1M, limit / SZ_1M);
+		}
+
 		if (limit > EVICT_STEP) {
-			if ((flags & TEST_INTERRUPTIBLE) && after > limit) {
+			if ((flags & (TEST_INTERRUPTIBLE | TEST_NONBLOCK)) && after > limit) {
 				uint32_t handle;
 
-				/* Let a new bo creation trigger eviction. */
-				handle = xe_bo_create(fd, 0, BO_SIZE / 8, vram_region, 0);
+				handle = xe_bo_create(fd, 0, BO_SIZE / 8,
+						      vram_region, 0);
 				gem_close(fd, handle);
 
 				igt_cgroup_dmem_get_current(cg, cg_region, &after);
@@ -252,8 +282,9 @@ static const struct {
 	const char *name;
 	unsigned int flags;
 } subtests[] = {
-	{ "write_eviction",		0 },
+	{ "write_eviction",			0 },
 	{ "write_eviction_interruptible",	TEST_INTERRUPTIBLE },
+	{ "write_eviction_nonblock",		TEST_NONBLOCK },
 	{ }
 };
 
-- 
2.53.0

