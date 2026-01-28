Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3040D46BE3
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 17:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6366910E2D2;
	Wed, 28 Jan 2026 17:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElBYbhUI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3155410E752
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769621675; x=1801157675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UZGL1suWAt6s5/g+9eUB9Q+oCeOmAwhKDPNMFdY/8lc=;
 b=ElBYbhUIvLglYS9mDNgT8cCN9m2h2IoP7RLsqO1dSV83Q4YoPiprZG6y
 rdzzq/w3jo0AlTJBfrJlqbmlCshwlC7ZawMcWe9KtivbrdguqTW6BjlMH
 ulDxH0GSjqbJ+efo429SIfVP8oUaRixqznZASudHeIn+KqOQlMpaPIN/u
 97rbL3qq+IChBOavk0KJRU/SWfvpnNJEei2ErjaKfEKe9hE4rrxRy8Ha+
 aWawKKWciysK0qXh3yEiUUMz1eDyav9aefObvewXT4+eeBASYtwqEZsfg
 +avj2ZgZ+Jnj8naTMk6R7OHW+cVQJjf44LAKuZtlYAEFxzPrgv+aOB6FJ A==;
X-CSE-ConnectionGUID: sSxpBM2DTGG0uDDHpd5HCA==
X-CSE-MsgGUID: ++xZVSBdRMS8YT3o4UmpXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="82213463"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="82213463"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:33 -0800
X-CSE-ConnectionGUID: 5DdFRYcuTcaCNP9AYCpXVg==
X-CSE-MsgGUID: PmcP8kXMRCeUoOVejEk8yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="245927197"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.244.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 09:34:32 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/xe_exec_system_allocator: Add hw engine
 argument for compute
Date: Wed, 28 Jan 2026 18:29:08 +0100
Message-ID: <20260128173412.1319610-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128173412.1319610-1-francois.dugast@intel.com>
References: <20260128173412.1319610-1-francois.dugast@intel.com>
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

Until now the hardware engine was selected implicitely during execution
of run_intel_compute_kernel(). Instead, allow user to use a specific
hardware engine, which will be helpful when reading GT stats.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index c5193f81e..d577eb4f3 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2202,7 +2202,8 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
  * @range-device-host:				touch the whole buffer, from the device then from the host
  */
 static void
-test_compute(int fd, size_t size, unsigned int flags, int loops)
+test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
+	     unsigned int flags, int loops)
 {
 	struct drm_xe_sync sync = {
 		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
@@ -2238,7 +2239,7 @@ test_compute(int fd, size_t size, unsigned int flags, int loops)
 
 		memset(compute_input, (rand() & 0xff), size);
 
-		run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
+		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
 
 		free(compute_input);
 	}
@@ -2647,15 +2648,23 @@ int igt_main()
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

