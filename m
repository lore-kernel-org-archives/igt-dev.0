Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D83DC5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 04:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFC210E9D4;
	Tue, 18 Aug 2026 04:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5RlQ9Ra";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBB310E4F6
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 04:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787026135; x=1818562135;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=kmeIa22Md6EIezTk8GOxgKhYB52nP7OZNZc3wANBofM=;
 b=Y5RlQ9RaJaqs95hPKkfq+AA+xuUDNbqIxoGHvG81icQmXXoHdPYDRUYE
 q27tIpTiCqtVS0KGz03YI/wiJbB5SHqXWN1O1DP4OJi2o54ZACk7jKY2v
 hrqx4qsaKvNSGAz9k0/vnibtVa3hylIOCCHlT1XrAw8W4fD7VbqbluSyC
 IFbz5XjRV1zHUuUyQmjsW/lEnl4Vuqy6RhkkopnsGnwNluoEm89heGHYU
 MIMwG8dGi5P333jgz+d9XfFbExhuK4qlxkFJlsuXKuN91colW3aadPYtg
 Ie0YoNkDrxbkmy/CJrwqsOMz1eAZPZ2+BnyUz7NsgRReWpw7Vjz+imucU A==;
X-CSE-ConnectionGUID: 47+sY3SxThyneyIXp03MDA==
X-CSE-MsgGUID: DsM8LcVvSgayUHnywVsn+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98870380"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98870380"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 21:08:54 -0700
X-CSE-ConnectionGUID: wFQw4aIcRc+eB9sz+/ADSA==
X-CSE-MsgGUID: l5L3lJWyR4u0haSCgpaaHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="262477285"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa008.fm.intel.com with ESMTP; 17 Aug 2026 21:08:54 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH v2 6/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-destroy-vm-context subtest
Date: Tue, 18 Aug 2026 04:08:42 +0000
Message-ID: <20260818040845.548727-7-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818040845.548727-1-nishit.sharma@intel.com>
References: <20260818040845.548727-1-nishit.sharma@intel.com>
MIME-Version: 1.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

This test destroy VM context while reset/submission is active, The BO/VM
is periodically torn down and recreated while the reset thread continues
running.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a9c3b593d..8fac53180 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -137,6 +137,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define MEM_PRESSURE_STRESS		(0x1 << 17)
 #define INVALIDATE_BO_STRESS		(0x1 << 18)
 #define RAPID_RESET_STRESS		(0x1 << 19)
+#define DESTROY_VM_CTX_STRESS		(0x1 << 20)
 
 /**
  * SUBTEST: %s-cat-error
@@ -781,7 +782,8 @@ static void submit_jobs(struct gt_thread_data *t)
 			pressure_bo_create(fd, vm, t->gt, pressure_bos, &pressure_count);
 		}
 
-		if (((t->flags & INVALIDATE_BO_STRESS) && !(i % 96))) {
+		if (((t->flags & INVALIDATE_BO_STRESS) && !(i % 96)) ||
+		    ((t->flags & DESTROY_VM_CTX_STRESS) && !(i % 128))) {
 			if (t->flags & MEM_PRESSURE_STRESS) {
 				pressure_bo_destroy(fd, pressure_bos, pressure_count);
 				pressure_count = 0;
@@ -847,6 +849,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and job submissions with rapid-cycle resets
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-destroy-vm-context
+ * Description: Stress concurrent GT resets and job submissions while destroying and recreating VM context
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -1069,6 +1075,7 @@ int igt_main()
 		{ "reset-memory-pressure", MEM_PRESSURE_STRESS },
 		{ "reset-bo-invalidation", INVALIDATE_BO_STRESS },
 		{ "reset-rapid-cycle", RAPID_RESET_STRESS },
+		{ "reset-destroy-vm-context", DESTROY_VM_CTX_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

