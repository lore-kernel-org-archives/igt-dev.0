Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5033ED10379
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 03:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F381910E0F7;
	Wed, 26 Nov 2025 03:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hC3PanNd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64ED410E4FF
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764129020; x=1795665020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=npiQPnBejkFmmucm0uPMHsVn8NwxpHsFC4VGZM2tZyw=;
 b=hC3PanNdWK7i7GgoihnGaCSr9IL0EZYHjDFpInMSGS37uynVHMcv1J1Q
 Iw/txCnJtEoaNZN2j0k7Gal5/f+M6mKKo6CYHrLTzWHuYN+wYKlEpyDe7
 VKN8thZTLx4rtKtFZYsep0De8DmYoM4MvIrPOhWniTv1/YACh+1VtOiB5
 sFcEL2+/xuMuLRgSpWl2UsnnuT+DpKBtkR5RQrR9jV4jAbwGNZdElK7kY
 ep+WSmee2Po2OnbAj6ZXiredPTTp7HjM6YD3sHpYFpqCLqUV/dpEeH0sg
 bOLLqjp/S4SQjNcmBCoPIRJK5PZjhKBdeomUfFWfMUqYA8CHGGwYnKNbk w==;
X-CSE-ConnectionGUID: oKmXkMOQRD2R0G3xfS8gMg==
X-CSE-MsgGUID: sca142L8Syem+tqYuGpgag==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76840036"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76840036"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:50:19 -0800
X-CSE-ConnectionGUID: MJPbAqMyQPulW/c+WdYNIQ==
X-CSE-MsgGUID: Ff7E1sF5Sg6+fpRWXYtH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193639488"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:50:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel/xe_oa: Drop
 oa-unit-exclusive-stream-exec-q
Date: Tue, 25 Nov 2025 19:50:08 -0800
Message-ID: <20251126035012.12967-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126035012.12967-1-ashutosh.dixit@intel.com>
References: <20251126035012.12967-1-ashutosh.dixit@intel.com>
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

In the kernel we have restricted exec_queue's to be specified only for the
OAG unit. Therefore the "oa-unit-exclusive-stream-exec-q" IGT test needs to
be modified. However, the main purpose of the "oa-unit-exclusive-stream"
tests is to ensure that only a single OA stream can be opened on an OA
unit. For this an exec_queue is not needed, just the sampling mode is
sufficient. Therefore, discontinue oa-unit-exclusive-stream-exec-q test. It
can be added back later if it is determined that it is really needed.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 70 +++++++--------------------------------------
 1 file changed, 10 insertions(+), 60 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 0c9e693f7d..9302d1c83a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4254,111 +4254,64 @@ test_sysctl_defaults(void)
 }
 
 /**
- * SUBTEST: oa-unit-exclusive-stream-sample-oa
- * Description: Check that only a single stream can be opened on an OA unit (with sampling)
- *
- * SUBTEST: oa-unit-exclusive-stream-exec-q
- * Description: Check that only a single stream can be opened on an OA unit (for OAR/OAC)
+ * SUBTEST: oa-unit-exclusive-stream
+ * Description: Check that only a single stream can be opened on an OA unit
 */
 /*
  * Test if OA buffer streams can be independently opened on OA unit. Once a user
  * opens a stream, that oa unit is exclusive to the user, other users get -EBUSY on
  * trying to open a stream.
  */
-static void
-test_oa_unit_exclusive_stream(bool exponent)
+static void test_oa_unit_exclusive_stream(void)
 {
 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
-	const struct drm_xe_engine_class_instance *hwe;
 	const struct drm_xe_oa_unit *oau;
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(0),
-		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, 0,
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	uint32_t *exec_q = calloc(qoa->num_oa_units, sizeof(u32));
 	uint32_t *perf_fd = calloc(qoa->num_oa_units, sizeof(u32));
-	u32 vm = xe_vm_create(drm_fd, 0, 0);
 	struct intel_xe_perf_metric_set *test_set;
 	uint32_t i;
 
-	/* for each oa unit, open one random perf stream with sample OA */
+	/* for each oa unit, open one stream with sample OA */
 	for (i = 0; i < qoa->num_oa_units; i++) {
 		oau = oa_unit_by_id(drm_fd, i);
-		hwe = oa_unit_engine(oau);
-
-		if (!hwe)
-			continue;
 		test_set = oa_unit_metric_set(oau);
 
-		igt_debug("opening OA buffer with c:i %d:%d\n",
-			  hwe->engine_class, hwe->engine_instance);
-		exec_q[i] = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
-		if (!exponent) {
-			properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
-			properties[11] = exec_q[i];
-		}
+		igt_debug("Opening OA stream on OA unit id:type %d:%d\n", i, oau->oa_unit_type);
 
 		properties[1] = oau->oa_unit_id;
 		properties[5] = test_set->perf_oa_metrics_set;
 		properties[7] = __ff(test_set->perf_oa_format);
-		properties[9] = hwe->engine_instance;
 		perf_fd[i] = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
 		igt_assert(perf_fd[i] >= 0);
 	}
 
-	/* Xe KMD holds reference to the exec_q's so they shouldn't be really destroyed */
-	for (i = 0; i < qoa->num_oa_units; i++)
-		if (exec_q[i])
-			xe_exec_queue_destroy(drm_fd, exec_q[i]);
-
 	/* for each oa unit make sure no other streams can be opened */
 	for (i = 0; i < qoa->num_oa_units; i++) {
-		int err;
-
 		oau = oa_unit_by_id(drm_fd, i);
-		hwe = oa_unit_engine(oau);
-
-		if (!hwe)
-			continue;
 		test_set = oa_unit_metric_set(oau);
 
-		igt_debug("try with exp with c:i %d:%d\n",
-			  hwe->engine_class, hwe->engine_instance);
+		igt_debug("Try on OA unit id:type %d:%d\n", i, oau->oa_unit_type);
+
 		/* case 1: concurrent access to OAG should fail */
 		properties[1] = oau->oa_unit_id;
 		properties[5] = test_set->perf_oa_metrics_set;
 		properties[7] = __ff(test_set->perf_oa_format);
-		properties[9] = hwe->engine_instance;
-		properties[10] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
-		properties[11] = oa_exponent_default;
 		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EBUSY);
-
-		/* case 2: concurrent access to non-OAG unit should fail */
-		igt_debug("try with exec_q with c:i %d:%d\n",
-			  hwe->engine_class, hwe->engine_instance);
-		exec_q[i] = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
-		properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
-		properties[11] = exec_q[i];
-		errno = 0;
-		err = intel_xe_perf_ioctl(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param);
-		igt_assert_lt(err, 0);
-		igt_assert(errno == EBUSY || errno == ENODEV);
 	}
 
-	for (i = 0; i < qoa->num_oa_units; i++) {
+	for (i = 0; i < qoa->num_oa_units; i++)
 		if (perf_fd[i])
 			close(perf_fd[i]);
-		if (exec_q[i])
-			xe_exec_queue_destroy(drm_fd, exec_q[i]);
-	}
 }
 
 /**
@@ -5151,11 +5104,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 	}
 
 	igt_subtest_group {
-		igt_subtest("oa-unit-exclusive-stream-sample-oa")
-			test_oa_unit_exclusive_stream(true);
-
-		igt_subtest("oa-unit-exclusive-stream-exec-q")
-			test_oa_unit_exclusive_stream(false);
+		igt_subtest("oa-unit-exclusive-stream")
+			test_oa_unit_exclusive_stream();
 
 		igt_subtest("oa-unit-concurrent-oa-buffer-read") {
 			igt_require(!igt_run_in_simulation());
-- 
2.48.1

