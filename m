Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17871C369D1
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 12:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C524410EAEA;
	Thu, 26 Sep 2024 12:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVGj++BB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B2110E32A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727353154; x=1758889154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/sQ1ik8iWr33q0g1PWAySIeC6tdXQTjyhcAtG3eIbE=;
 b=CVGj++BB9ySj1EMBWVQy2Gy96iSNefOYTp3JFnm5AFSCUVdbCOGKHn7e
 gRChe9AbotLi0DwhqKrPqOVXC8cK/VcoXikqvXiICSwHPjp17LzyKsLNP
 sIYPtFfmW3rIOGaJfUNvXvtlBU/fKfLoOaG0A42hEeIm5dlX/ywoeTCJ9
 IzV354VQSGXmDaD7f6B/thnQ5/kHL55sPjzdQ0ayHdRBhrHR+lNStrofJ
 nkCzxLV6EFc+Ai0EHWc/hjgA/lYjrykV1zqpmoX/4+VU6YoUObfyz5VDz
 piUFsCW9KgNFoOOltt1T9C966+XZDwb4ecPNoCr1WEAfMCa3GWI44mD+0 Q==;
X-CSE-ConnectionGUID: /PzER9EQRZO4yGtHtcxqYA==
X-CSE-MsgGUID: IlrZbzlZRg+XvTwwhwrfFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="43958768"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="43958768"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 05:19:13 -0700
X-CSE-ConnectionGUID: Gr9CZBpGQhGKWDe43DjCKQ==
X-CSE-MsgGUID: iTWT5mxgQOWtK2GZidZg8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76956919"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.104])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 05:19:11 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_eudebug_online: Adjust interrupt-other test
Date: Thu, 26 Sep 2024 14:18:46 +0200
Message-Id: <20240926121846.5885-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
References: <20240926121846.5885-1-dominik.karol.piatkowski@intel.com>
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

This test fails due to preemption interfering with it.

In order to fix it, set the preempt_timeout_us for engine_class used in
this test to maximum for the duration of the test.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 68d1b786f..d984eaf99 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -2212,6 +2212,8 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	bool was_enabled;
 	int fd;
+	uint32_t preempt_timeout;
+	uint16_t engine_class = 0xFFFF;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -2247,8 +2249,17 @@ igt_main
 	test_gt_render_or_compute("interrupt-other-debuggable", fd, hwe)
 		test_interrupt_other(fd, hwe, SHADER_LOOP);
 
-	test_gt_render_or_compute("interrupt-other", fd, hwe)
+	test_gt_render_or_compute("interrupt-other", fd, hwe) {
+		engine_class = hwe->engine_class;
+		igt_skip_on(!xe_eudebug_set_preempt_timeout_to_max(fd, engine_class,
+								   &preempt_timeout));
 		test_interrupt_other(fd, hwe, SHADER_LOOP | DISABLE_DEBUG_MODE);
+	}
+
+	igt_fixture
+		if (engine_class != 0xFFFF &&
+		    !xe_eudebug_restore_preempt_timeout(fd, engine_class, preempt_timeout))
+			igt_warn("Cleanup of preempt_timeout failed!\n");
 
 	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
 		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
-- 
2.34.1

