Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79C8C36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 12:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711CD10E179;
	Fri,  4 Apr 2025 12:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0Y0CFgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7010E179
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743769925; x=1775305925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MFeyTfw6VkM0ndlGm1LHek7RUcaerSP7Eas4xp4clSE=;
 b=B0Y0CFgYagvNL50r3FS0zxYAIEM5C4esIC8JsHX3JDR8MxKSNKCjWtm+
 Pzl5wjci+zXjhPcmn55BS7jXRr0F/MtM+JhTr7dMVwJEhIHsLlzaL8c9r
 jutjogN/2zfT9HL/aL47MQZdIdvBhWqjPxrM4SwzD4DXcciIrRAZUEUsW
 fZn0fgSMZWuCAaiHNjqUE8Q4b0TnwtxcKa0X7lKJ/3rhjT0/wFjpVFG8R
 4XXMRK8oU4e1FbSLtMBGHOO3mZ/hT+VdXSSB2rK5q4OoK07nrEKNU2Ra0
 R69FRB2d/LoyuNsrOLDRlLGHOYa6chwdWUh8BxTd4+J5FTmz8G4ez2m82 Q==;
X-CSE-ConnectionGUID: Djix6cOGRH2md+JEIoIGzg==
X-CSE-MsgGUID: ske++3JkQJWc6mcQK/zwQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45348201"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="45348201"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 05:32:05 -0700
X-CSE-ConnectionGUID: rLdjyYAaQL2dMVvSB4vM2Q==
X-CSE-MsgGUID: lx//RZ4cTzqQiK4f7m5BLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="128207104"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.53])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 05:32:03 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v2 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Date: Fri,  4 Apr 2025 14:31:39 +0200
Message-Id: <20250404123140.260143-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
References: <20250404123140.260143-1-zbigniew.kempczynski@intel.com>
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

Setting arbitrary number or children is prone to oom scenario and
getting test to be killed.

Single job with sip turned on takes ~100MB for Xe2 tasks so adjust
number of children to consume ~50% ram.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_compute_preempt.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index 876e538237..f07e87d4c4 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -40,13 +40,18 @@ test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe, bool thre
 	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, threadgroup_preemption), "GPU not supported\n");
 }
 
+#define CONTEXT_MB 100
+
 igt_main
 {
 	int xe;
 	struct drm_xe_engine_class_instance *hwe;
+	uint64_t ram_mb;
 
-	igt_fixture
+	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
+		ram_mb = igt_get_avail_ram_mb();
+	}
 
 	igt_subtest_with_dynamic("compute-preempt") {
 		xe_for_each_engine(xe, hwe) {
@@ -64,13 +69,16 @@ igt_main
 				continue;
 
 			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
-				uint16_t dev_id = intel_get_drm_devid(xe);
 				int child_count;
 
-				if (IS_PANTHERLAKE(dev_id))
-					child_count = 50;
-				else
-					child_count = 100;
+				/*
+				 * Get half of ram / 2, then divide by
+				 * CONTEXT_MB * 2 (long and short) job
+				 */
+				child_count = ram_mb / 2 / CONTEXT_MB / 2;
+
+				igt_debug("RAM: %zd, child count: %d\n",
+					  ram_mb, child_count);
 
 				test_compute_preempt(xe, hwe, false);
 				igt_fork(child, child_count)
-- 
2.34.1

