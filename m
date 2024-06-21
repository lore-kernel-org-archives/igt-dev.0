Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA009C2D0CE
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 23:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AD910EBEF;
	Fri, 21 Jun 2024 23:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DyPReaok";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0C10EB5D
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719010914; x=1750546914;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=U9IevB30Jcuo31YRz+zHAhD5iwX5fw5POqADpyDIBoU=;
 b=DyPReaokuFlgu+nQNrT2nwoy5uGsG52UtSNbR3FaNaDA3z9TJZAaUJEX
 UBww7ixVhfqUp/f3LLiiTKcbDZTFpuMIG6z4XX0GodMfEkjcbuP3q6qu6
 dRdziHGHz62gC5GRS5IXqCRvvKLrThx+txHuIiKBz5V3CsWqLYG8sx9RS
 HGy5lPByuQtJunEJzGfkc9q7UyBo60Ws71KEF8aiGDIv1tjq2gg/gtg9J
 Mdw0OvPV//bXkjgjQAaZ6CHoAWwRbDz34TbbehqctEupjzGwsl0yhA225
 0q0H55Lwey6iuecX+eLDfg/CAwUm69hO0gS9rlS+LaxvY61yUhLwI7Lgk w==;
X-CSE-ConnectionGUID: ER2xlouuS7iF36IC2wjNVA==
X-CSE-MsgGUID: Hz3n86LfQiK+pIGVzY72hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16204934"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="16204934"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:07 -0700
X-CSE-ConnectionGUID: /MsmJ98aTGWsAu8yc/gIiQ==
X-CSE-MsgGUID: S0QQxwOUS5uDao0FrXFv+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; d="scan'208";a="42597335"
Received: from xpumcyp04.jf.intel.com ([10.75.202.213])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 16:01:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 7/8] tests/intel/xe_drm_fdinfo: Add tests for virtual
 engines
Date: Sat, 22 Jun 2024 07:01:01 +0800
Message-Id: <20240621230102.238397-8-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
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

Add tests to verify utilization on virtual engines.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 77 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 2d25c2fbd..96b246364 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -43,6 +43,18 @@
  * SUBTEST: drm-all-busy-idle-check-all
  * Description: Check that all engines show busy when all are loaded
  *
+ * SUBTEST: drm-virtual-idle
+ * Description: Check that virtual engines show no load when idle
+ *
+ * SUBTEST: drm-virtual-busy-idle
+ * Description: Check that virtual engines show load when idle after busy
+ *
+ * SUBTEST: drm-virtual-all-busy-idle-check-all
+ * Description: Check that all virtual engines show busy when loaded
+ *
+ * SUBTEST: drm-virtual-busy-idle-isolation
+ * Description: Check that virtual engine load does not spill over to other drm clients
+ *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
  *
@@ -714,12 +726,60 @@ all_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, int width,
 	if (flags & TEST_ISOLATION)
 		close(local_fd);
 }
+
+static void
+multi_all_busy_check_all(int fd, unsigned int flags)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct xe_spin_ctx *ctx[DRM_XE_ENGINE_CLASS_COMPUTE + 1] = {};
+	struct drm_xe_engine_class_instance *hwe;
+	int local_fd = fd, count, class;
+	uint32_t vm;
+
+	if (flags & TEST_ISOLATION)
+		local_fd = drm_reopen_driver(fd);
+
+	vm = xe_vm_create(local_fd, 0, 0);
+	if (flags & TEST_BUSY) {
+		xe_for_each_multi_engine(local_fd, hwe, count) {
+			class = hwe->engine_class;
+			ctx[class] = xe_spin_ctx_init(local_fd, hwe, vm,
+						      1,
+						      count);
+			xe_spin_sync_start(local_fd, ctx[class]);
+		}
+	}
+
+	read_engine_cycles(local_fd, pceu1);
+	measured_usleep(batch_duration_ns / 1000);
+	if (flags & TEST_TRAILING_IDLE) {
+		xe_for_each_multi_engine(local_fd, hwe, count) {
+			xe_spin_sync_end(local_fd, ctx[hwe->engine_class]);
+		}
+	}
+	read_engine_cycles(local_fd, pceu2);
+
+	xe_for_each_multi_engine(local_fd, hwe, count) {
+		class = hwe->engine_class;
+		check_results(pceu1, pceu2, class,
+			      1,
+			      flags);
+		xe_spin_sync_end(local_fd, ctx[class]);
+		xe_spin_ctx_destroy(local_fd, ctx[class]);
+	}
+	xe_vm_destroy(local_fd, vm);
+
+	if (flags & TEST_ISOLATION)
+		close(local_fd);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
 	unsigned int num_engines = 0, num_classes = 0;
 	unsigned int classes[16] = { };
-	int xe;
+	int xe, count;
 
 	igt_fixture {
 		struct drm_client_fdinfo info = { };
@@ -772,6 +832,21 @@ igt_main
 	igt_subtest("drm-all-busy-idle-check-all")
 		all_busy_check_all(xe, hwe, 1, 1, TEST_BUSY | TEST_TRAILING_IDLE);
 
+	igt_subtest("drm-virtual-idle")
+		xe_for_each_multi_engine(xe, hwe, count)
+			single(xe, hwe, 1, count, 0);
+
+	igt_subtest("drm-virtual-busy-idle")
+		xe_for_each_multi_engine(xe, hwe, count)
+			single(xe, hwe, 1, count, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-virtual-all-busy-idle-check-all")
+		multi_all_busy_check_all(xe, TEST_BUSY | TEST_TRAILING_IDLE);
+
+	igt_subtest("drm-virtual-busy-idle-isolation")
+		xe_for_each_multi_engine(xe, hwe, count)
+			single(xe, hwe, 1, count, TEST_BUSY | TEST_TRAILING_IDLE | TEST_ISOLATION);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.34.1

