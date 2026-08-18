Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456AAC5DF70
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 10:37:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54FD10E4B7;
	Tue, 18 Aug 2026 10:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LE0ciJ2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC1010E4B5
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787049360; x=1818585360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vpxKTbuAe0IkDpO6AJUtCQ2CpNIxyKtF1w//S3uvihE=;
 b=LE0ciJ2GtPoztwR4L296RN74BKy4G1u4Fh3sSc9F521NxMQnSkf8BgZZ
 c8tHQAWfFC60HZX5GoOY29t5zu/y8UsEP5BLII1kL9lrWw9kmf1SvjWP/
 Si/yz8UHGr43saRhB6X8xm1xZ1rgyZvOZrHicsQEEeBPhuMtMQyMKI4aM
 FHgAYN1x0YM2s7ZupyFR9eabe5GPNFhZZnRkb1uRQz7x1+IQI9LzPG61q
 +KhUBd4C7IBbjOp5YIK4Hv6Pd4aKZVG6rpC+yo8zDPtm9cLwhz+piiE8r
 1JLkZhUrbZzKSSwK3b6XivAmQBRl0s4n+EUYPcmKIqr6HHdYmalDyXF8+ w==;
X-CSE-ConnectionGUID: k1XyJEm2RNWBN8Lgwnt0pA==
X-CSE-MsgGUID: 7477PuY9RoqqBTuZH6bb4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75068345"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="75068345"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:35:57 -0700
X-CSE-ConnectionGUID: z8uLAmmaTtOmkaShFOpzqQ==
X-CSE-MsgGUID: MnyeOD1WRdCk+Qmmjq4EHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263458367"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 03:35:56 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v2 1/2] tests/intel/xe_prefetch_fault: refactor test to
 accept shader function pointer
Date: Tue, 18 Aug 2026 16:05:44 +0530
Message-ID: <20260818103543.231667-5-varun.gupta@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818103543.231667-4-varun.gupta@intel.com>
References: <20260818103543.231667-4-varun.gupta@intel.com>
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

