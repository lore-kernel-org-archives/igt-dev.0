Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6579BCD6E7D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 14:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E1011A915;
	Fri,  5 Jun 2026 14:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kPexpM9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C401211A911
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 14:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780670421; x=1812206421;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EBKMRUS3EtnSgWQ4Ig8UJeu8trtBnK7b/0u4Sz9Ocqo=;
 b=kPexpM9Y5JWwsWYNGNeVAdgYEEfkfhUnu39OlUh4obckBLdAUBACakAP
 vxjjmG+K3+GSir5gyRsE9zI8M+Nz5mKZMvl5IOG845mgYP6/n+Vw1s0vT
 ujRC7Rj89ouWPCk8qJX+BmEZhP1zOuV6h1naTHLEytASCLbh0xEny6L8W
 95dOfn5oJdbqJhpjh3TDBCk+I1lJe6AyK77eLVg3jzoZ14A+3fi7orMxs
 mCOvKGK1bnii1XjAt7hkOXzjdJiL7oQW7bLdLquOLcZZmBVbuvVa3SSnA
 sQ+K/rdG+OpddUmLIkLchAUpZMyiy1u5yZ0CCpO/y+McZ9pwVSZeselqR A==;
X-CSE-ConnectionGUID: US8iCobcR5GqrP4UEgNwiw==
X-CSE-MsgGUID: W46rFGH7Qly4RZ/SFzHrGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81483835"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81483835"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 07:40:05 -0700
X-CSE-ConnectionGUID: 5clJcqHpT3OpfZMiOcvqRA==
X-CSE-MsgGUID: pjRKqP77Qf2uzjtlt5La8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242384445"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 07:40:04 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	stuart.summers@intel.com
Subject: [PATCH i-g-t v1 8/9] tests/intel/xe_exec_reset: add
 gt-stress-reset-pm-transition subtest
Date: Fri,  5 Jun 2026 14:39:52 +0000
Message-ID: <20260605143953.1122688-9-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605143953.1122688-1-nishit.sharma@intel.com>
References: <20260605143953.1122688-1-nishit.sharma@intel.com>
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

This test creates a short idle/transition window before VM/context
teardown-recreate, approximating PM transition timing while
reset+submit pressure is active.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 4b0a6435f..cc2497896 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -133,6 +133,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define RAPID_RESET_STRESS		(0x1 << 19)
 #define DESTROY_VM_CTX_STRESS		(0x1 << 20)
 #define MIXED_ENGINE_STRESS		(0x1 << 21)
+#define PM_TRANSITION_STRESS		(0x1 << 22)
 
 /**
  * SUBTEST: %s-cat-error
@@ -758,7 +759,11 @@ static void submit_jobs(struct gt_thread_data *t)
 		}
 
 		if (((t->flags & INVALIDATE_BO_STRESS) && !(i % 96)) ||
-		    ((t->flags & DESTROY_VM_CTX_STRESS) && !(i % 128))) {
+		    ((t->flags & DESTROY_VM_CTX_STRESS) && !(i % 128)) ||
+		     ((t->flags & PM_TRANSITION_STRESS) && !(i % 160))) {
+			if (t->flags & PM_TRANSITION_STRESS)
+				usleep(20000);
+
 			if (t->flags & MEM_PRESSURE_STRESS) {
 				pressure_bo_destroy(fd, pressure_bos, pressure_count);
 				pressure_count = 0;
@@ -832,6 +837,10 @@ static void *gt_reset_thread(void *data)
  * Description: Stress concurrent GT resets and mixed-engine job submissions
  * Test category: stress test
  *
+ * SUBTEST: gt-stress-reset-pm-transition
+ * Description: Stress concurrent GT resets and job submissions during PM transition windows
+ * Test category: stress test
+ *
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -1054,6 +1063,7 @@ int igt_main()
 		{ "reset-rapid-fire", RAPID_RESET_STRESS },
 		{ "reset-destroy-vm-context", DESTROY_VM_CTX_STRESS },
 		{ "reset-mixed-engine-usage", MIXED_ENGINE_STRESS | RAPID_RESET_STRESS },
+		{ "reset-pm-transition", PM_TRANSITION_STRESS | DESTROY_VM_CTX_STRESS },
 		{ NULL },
 	};
 	int gt;
-- 
2.43.0

