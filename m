Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258FAC5DF67
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 05:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EBF10E4A3;
	Tue, 18 Aug 2026 05:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVYMZE3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19B10E49F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 05:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787030851; x=1818566851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vpxKTbuAe0IkDpO6AJUtCQ2CpNIxyKtF1w//S3uvihE=;
 b=dVYMZE3DYzHfRqyOxzFIqgzKSRJ7MOuW7x1+NzNGHYnepOWSuB2IuzcT
 m0JLrAmFlrJ2vZaAnNVg7wQQ3r+3meE6odoZI1fCSNmDV7rxZVRwyQ1Tg
 Ns/jbodRzBLIn0OgGqx83n+gucVPtagTaRqP1EewF82yYC8GxVswtm6Pw
 DL7edSVNXFMzwz6/5Cp/NXdtkxPuQlnL2eynBNVSHYxYPIpOvSWn34/pW
 gr1cwjv2JDjWwdyclg1CPYyEZpGILoOwXLR6ckNQkrH5exaK25q9Ts3Q3
 oEQHa5fJSOq6vuAg87zFHeD3dohetXHdhqG8kMSotoZeWI1KBqVNJ5zeY Q==;
X-CSE-ConnectionGUID: ZnkcmhvFTNSNK2PMpiqbug==
X-CSE-MsgGUID: WVOaRndsQWirPPDHFa6XFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87426813"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87426813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 22:27:31 -0700
X-CSE-ConnectionGUID: DwgVyOfUQwam6Sgc/mP2Zw==
X-CSE-MsgGUID: lX4Wml/HQ1uvbb6qVtGx2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="288611369"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 22:27:30 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/xe_prefetch_fault: refactor test to
 accept shader function pointer
Date: Tue, 18 Aug 2026 10:57:15 +0530
Message-ID: <20260818052716.156973-2-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818052716.156973-1-varun.gupta@intel.com>
References: <20260818052716.156973-1-varun.gupta@intel.com>
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

