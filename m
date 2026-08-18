Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9707C5DF7D
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 17:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8646210EC0D;
	Tue, 18 Aug 2026 17:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Njc9W310";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB3510E4F2
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787073173; x=1818609173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vpxKTbuAe0IkDpO6AJUtCQ2CpNIxyKtF1w//S3uvihE=;
 b=Njc9W310caQjIglLzoflIKM7DD0JOKmuEDlRYsFgA1LV1bHjj+RpAivO
 u+Ztyy4gxeZIL2Z+ae1VeNHST6sb6PUcyzA3Wi62y0J863oCs9yCAicWb
 qmBFmdDo5WsTM7CbUVSVUjJ2RJQRXWHdV7Hdp5UgB97fwO8T87xd6v+0w
 LDA8wvsqYYadTvfMnK4d/nwNMGQIARDIhCV+jiM6yFGmojVMKHpDgTIHT
 72G53ZrAHULjzN+r8o/TCtQYgMdkWm7UcBw0mVV3AWibwy+y/PJuqeQR9
 m6D2URABFQ6Hyymxkm6uYemVgLrECsgiDkaX5QvUBnAt6uACPagLrWtaR g==;
X-CSE-ConnectionGUID: FRiiZTVBT1uTXIO7+JkbLg==
X-CSE-MsgGUID: Y1eWS7h5Qi2iTAehBX9ntQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91257009"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="91257009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:12:53 -0700
X-CSE-ConnectionGUID: Mvg7mCQWRua7x6i1ahGc3w==
X-CSE-MsgGUID: mYvPO3S2QrutkbzvjzZhLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263968109"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 10:12:52 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com,
	andrzej.hajda@intel.com
Subject: [PATCH i-g-t v3 1/2] tests/intel/xe_prefetch_fault: refactor test to
 accept shader function pointer
Date: Tue, 18 Aug 2026 22:42:41 +0530
Message-ID: <20260818171239.277897-5-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818171239.277897-4-varun.gupta@intel.com>
References: <20260818171239.277897-4-varun.gupta@intel.com>
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

Parameterize test_prefetch_fault() to accept a shader getter function
pointer instead of hardcoding get_prefetch_shader(). This enables reuse
of the same test logic with different shader configurations (e.g., L2
prefetch fault shaders) without duplicating the test function.

No functional change for existing subtests.

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_prefetch_fault.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
index d3b5aff47..e86cd68d9 100644
--- a/tests/intel/xe_prefetch_fault.c
+++ b/tests/intel/xe_prefetch_fault.c
@@ -117,9 +117,11 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
 	return ibb;
 }
 
+typedef struct gpgpu_shader *(*get_shader_fn)(int fd);
+
 static struct gpgpu_shader *get_prefetch_shader(int fd)
 {
-	static struct gpgpu_shader *shader;
+	struct gpgpu_shader *shader;
 
 	shader = gpgpu_shader_create(fd);
 	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));
@@ -130,14 +132,17 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
 
 /**
  * SUBTEST: prefetch-fault
- * Description: Validate prefetch fault and hit-under-miss behavior
+ * Description: Validate L1 prefetch fault and hit-under-miss behavior with
+ *		L1 cached, L2 cached cache policy (fault source: LSC)
  * Run type: FULL
  *
  * SUBTEST: prefetch-fault-svm
- * Description: Validate prefetch fault and hit-under-miss behavior in SVM mode
+ * Description: Validate L1 prefetch fault and hit-under-miss behavior in SVM
+ *		mode with L1 cached, L2 cached cache policy (fault source: LSC)
  * Run type: FULL
  */
-static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe, bool svm)
+static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe,
+				bool svm, get_shader_fn get_shader)
 {
 	uint64_t bb_offset = BB_OFFSET;
 	/*
@@ -191,7 +196,7 @@ static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe
 	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset, bb_size);
 	intel_bb_set_lr_mode(ibb, true);
 
-	shader = get_prefetch_shader(fd);
+	shader = get_shader(fd);
 	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
 	gpgpu_shader_destroy(shader);
 	intel_bb_sync(ibb);
@@ -225,7 +230,7 @@ static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe
 	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset2, bb_size);
 	intel_bb_set_lr_mode(ibb, true);
 
-	shader = get_prefetch_shader(fd);
+	shader = get_shader(fd);
 	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
 	gpgpu_shader_destroy(shader);
 	intel_bb_sync(ibb);
@@ -271,7 +276,8 @@ int igt_main()
 			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
 				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
 					      hwe->engine_instance)
-					test_prefetch_fault(fd, hwe, false);
+					test_prefetch_fault(fd, hwe, false,
+							    get_prefetch_shader);
 			}
 		}
 	}
@@ -284,7 +290,8 @@ int igt_main()
 			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
 				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
 					      hwe->engine_instance)
-					test_prefetch_fault(fd, hwe, true);
+					test_prefetch_fault(fd, hwe, true,
+							    get_prefetch_shader);
 			}
 		}
 	}
-- 
2.43.0

