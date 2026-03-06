Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F24EF0182F
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C3210ED42;
	Fri,  6 Mar 2026 13:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K+8st9Yu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6730510ED41
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803881; x=1804339881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=abFjUYjjsM4Q49t/N4Coa31AKgt7y+TyjFE98U6wfzE=;
 b=K+8st9YuhvtS0EEwO/UgcKifpuZIS57Uez6RjVxLK5n6pfhdFjEqgw2p
 Nge5w2OxswGer4HLiwSCJoof9NRMc5t64CjRXcagFOvv1/sKhfqdvdAwp
 3N0UAeZLtNgFoXCYRwsnf82luri7h4iPBaGieDd3jvLfxjyL1JIs/SdeW
 YjgWF8fpsBNe9tpNFAKn1zrLG8Bl2hKo0z7rlfbLBT5nmROvLuIScsJ0S
 KcI7O8ZEOfJkNrqvn8xjswdIrA2bKspoeu2h8bQLwB90ITzWfDxzhprv5
 Y01vwDKGyeC9H8GX2tKpJ5OLU6eiwzJ9RkptVUArUnLzq4RaIsp53zVmb A==;
X-CSE-ConnectionGUID: 33ia9wCWRuOtMtwBzo2hPg==
X-CSE-MsgGUID: WAuwGr1XRYuPmlUpqOf+RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84236849"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84236849"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:21 -0800
X-CSE-ConnectionGUID: uV+mB/4uSWWfBHjDIbwumg==
X-CSE-MsgGUID: xCB4tGBXQdavf5MbpEZl/g==
X-ExtLoop1: 1
Received: from abityuts-desk.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.208])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:31:19 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t,
 v2 3/4] tests/intel/xe_exec_system_allocator: Add hw engine argument
 for compute
Date: Fri,  6 Mar 2026 14:29:11 +0100
Message-ID: <20260306133059.859625-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306133059.859625-1-francois.dugast@intel.com>
References: <20260306133059.859625-1-francois.dugast@intel.com>
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

Until now the hardware engine was selected implicitely during execution
of run_intel_compute_kernel(). Instead, allow user to use a specific
hardware engine, which will be helpful when reading GT stats.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index ff85a67dc..7458b8572 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2240,7 +2240,8 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
  * @range-device-host:				touch the whole buffer, from the device then from the host
  */
 static void
-test_compute(int fd, size_t size, unsigned int flags, int loops)
+test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
+	     unsigned int flags, int loops)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -2276,7 +2277,7 @@ test_compute(int fd, size_t size, unsigned int flags, int loops)
 
 		memset(compute_input, rand() % 255 + 1, size);
 
-		run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
+		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
 
 		free(compute_input);
 	}
@@ -2685,15 +2686,23 @@ int igt_main()
 	}
 
 	igt_subtest("compute")
-		test_compute(fd, SZ_2M, 0, svm_compute_loops);
+		xe_for_each_engine(fd, hwe)
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+				test_compute(fd, hwe, SZ_2M, 0, svm_compute_loops);
 
 	for (const struct section *s = csections; s->name; s++) {
 		igt_subtest_f("eu-fault-4k-%s", s->name)
-			test_compute(fd, SZ_4K, s->flags, svm_compute_loops);
+			xe_for_each_engine(fd, hwe)
+				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+					test_compute(fd, hwe, SZ_4K, s->flags, svm_compute_loops);
 		igt_subtest_f("eu-fault-64k-%s", s->name)
-			test_compute(fd, SZ_64K, s->flags, svm_compute_loops);
+			xe_for_each_engine(fd, hwe)
+				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+					test_compute(fd, hwe, SZ_64K, s->flags, svm_compute_loops);
 		igt_subtest_f("eu-fault-2m-%s", s->name)
-			test_compute(fd, SZ_2M, s->flags, svm_compute_loops);
+			xe_for_each_engine(fd, hwe)
+				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
+					test_compute(fd, hwe, SZ_2M, s->flags, svm_compute_loops);
 	}
 
 	igt_fixture() {
-- 
2.43.0

