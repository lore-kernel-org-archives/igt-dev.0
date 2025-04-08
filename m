Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47ECC369A5
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 18:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D49910E725;
	Tue,  8 Apr 2025 18:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcys4md4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21C510E725
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744138276; x=1775674276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MFeyTfw6VkM0ndlGm1LHek7RUcaerSP7Eas4xp4clSE=;
 b=dcys4md4DaZSDppTnGv6reIK8RlqJ9MQMn6FTqR/Mj4/W2yTcOgzXMzO
 2oXWo+xYcuEuLRyKa6ANzNJm2UN3/wWIiPUYMMeMwzirCpRicxYWtYx33
 Dexi0IWjOQai5oiSEvdwYE880hUibW1f3ROihaIo2bIwrSV0X1aObsGnU
 2uiKtPForRjhMdBZ631N3FcQuZEXdxutqCjWz54asqrMwT8xjYs7qMOVr
 JG43y9+VfjsyDIfotqMdHJ0JeCuWfdYMFtTsI7UHAdAOKUlDOI5ueT3Iv
 TRcsE/Hvs0xrbpGDZscLRuHANxWxsBKGiveIpMa+YZZrw1zPw0P/VDNQf g==;
X-CSE-ConnectionGUID: u9khzjlhRCWGoEgqeqyaaA==
X-CSE-MsgGUID: kLuhxhNzTg+IPcvX0On8Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="48297156"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="48297156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:51:16 -0700
X-CSE-ConnectionGUID: ciDAZCxCSi64GtOCCf+wQQ==
X-CSE-MsgGUID: 9BXadqWrTwGXuoWcYzzo1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="165588441"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 11:51:13 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: [PATCH i-g-t v3 4/5] tests/xe_compute_preempt: adjust number of
 children according to ram size
Date: Tue,  8 Apr 2025 20:50:44 +0200
Message-Id: <20250408185045.272673-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
References: <20250408185045.272673-1-zbigniew.kempczynski@intel.com>
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

