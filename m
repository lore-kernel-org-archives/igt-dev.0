Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC739C5321D
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 23:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579DB10E14B;
	Fri, 23 Aug 2024 23:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8EWjsJi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DF610E14B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 23:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724454178; x=1755990178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0N+XgZ+Z/ECyNmubKQ+3VSaI54B618Q+RO18LnHJwgE=;
 b=l8EWjsJisa5oxIIvQXawATU3I7W8eJY6UnQCRMskawENpljO0eByA+SK
 XvCwc2ld98fDvXKQHLLHtLSGQ8N6tVws8jLhKVn0wIts+ZXdRPZcVF79R
 FDd2aqA1/BQZG2JnbItt3NyEPadGWpwWdfTYUDGp85Y2JZInjtAYnpsIX
 qfbIT/NCo6XWV/4IQknZiTnVEQD6UmGt6UtFhX18YHBBu5p7nNAfu7Oy6
 p+gSC9oxortdHsXazrwNHQtOuIo6x8P8dSWP817TA6b19g5uOeDZnPJmW
 NdGMpis+1cibF0daaoB0qFjvSLBw6HxLpSaVOwBt62CIRS9vh8uxatb+P A==;
X-CSE-ConnectionGUID: GvjpwjOpQRG9Tu7d7ldqpw==
X-CSE-MsgGUID: ziFj9n4HQFOf7qi29DP32g==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="25844098"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="25844098"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 16:02:57 -0700
X-CSE-ConnectionGUID: 1iZ5RDDISym+mzwyqJi81w==
X-CSE-MsgGUID: vQFiHDUhRYGvbxsCZavd/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="61799825"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 16:02:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_drm_fdinfo: Ensure queue destroy
 records load correctly
Date: Fri, 23 Aug 2024 16:02:50 -0700
Message-ID: <20240823230250.1090900-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823230250.1090900-1-lucas.demarchi@intel.com>
References: <20240823230250.1090900-1-lucas.demarchi@intel.com>
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

If the exec queue is destroyed before recording the utilization, make
sure the load is correctly captured: the drm client is still alive, so
it should still have the load recorded.

v2:
- s/measured_usleep/usleep
- remove xe_ prefix from helpers/structures
v3:
- Rebase and remove traces of parallel/virtual (Lucas)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 230deae8d..4696c6495 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -46,6 +46,9 @@
  * SUBTEST: drm-all-busy-idle-check-all
  * Description: Check that all engines show busy when all are loaded
  *
+ * SUBTEST: drm-busy-exec-queue-destroy-idle
+ * Description: Destroy exec queue before idle and ensure load is accurate
+ *
  * SUBTEST: drm-total-resident
  * Description: Create and compare total and resident memory consumption by client
  *
@@ -558,6 +561,32 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
 	xe_vm_destroy(fd, vm);
 }
 
+static void
+single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
+	struct spin_ctx *ctx = NULL;
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, 0, 0);
+	ctx = spin_ctx_init(fd, hwe, vm);
+	spin_sync_start(fd, ctx);
+
+	read_engine_cycles(fd, pceu1);
+	usleep(batch_duration_ns / 1000);
+
+	/* destroy queue before sampling again */
+	spin_sync_end(fd, ctx);
+	spin_ctx_destroy(fd, ctx);
+
+	read_engine_cycles(fd, pceu2);
+
+	xe_vm_destroy(fd, vm);
+
+	check_results(pceu1, pceu2, hwe->engine_class, TEST_BUSY);
+}
+
 static void
 most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
 		    unsigned int flags)
@@ -689,6 +718,10 @@ igt_main
 	igt_subtest("drm-all-busy-idle-check-all")
 		all_busy_check_all(xe, TEST_BUSY | TEST_TRAILING_IDLE);
 
+	igt_subtest("drm-busy-exec-queue-destroy-idle")
+		xe_for_each_engine(xe, hwe)
+			single_destroy_queue(xe, hwe);
+
 	igt_describe("Create and compare total and resident memory consumption by client");
 	igt_subtest("drm-total-resident")
 		test_total_resident(xe);
-- 
2.43.0

