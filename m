Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603F1CF31B6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 11:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E60710E6F9;
	Wed,  2 Oct 2024 11:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b6pUaiyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A0610E6F9
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 11:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727868578; x=1759404578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jb61ZSIOJuQiGDvHc5zrvYxpkGn26ttXQAUV5XU+17M=;
 b=b6pUaiyyjVb9I7jSXXWAFEUyYl3ne6Q/WdTEras4XRKOSnxAx0pO0zIh
 vyKi69RlGZ0sPmY/KL6cI1j8QLZcAGYcvPAjLhhw5ahU3FW8ONkWF2yXq
 /1+0ZrdFms4xYlOwvddivOpDaDWjS8z5XUI6+hzN62luYTqpbIaWNBVb/
 3Ipj3/DdiyxHMc9u1YxxvEAdofZXt4StgVzESjyO1w41CNRu1MAG1eoOc
 kvqCDYhRScOx3QxoLEX3A9zWF6q8ajCnQJJkCXgRqLFgjQLInwDeTrjFv
 M21YMwdoXaI4LIu/fqPzpJp66bgNP7YOVrPzhS+qus2C/GEIoDsApKP67 A==;
X-CSE-ConnectionGUID: rj02q2IXTXe68JymQq3n1g==
X-CSE-MsgGUID: jelkj4asQ7mmLoISu0KITQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27160605"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27160605"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:29:38 -0700
X-CSE-ConnectionGUID: xVo3+kBiRhmfJHEhCIjgLg==
X-CSE-MsgGUID: 8UhNI9X4T5KY4T8lxsT4/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="104764509"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:29:35 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 2/2] tests/xe_eudebug_online: Adjust interrupt-other
 test
Date: Wed,  2 Oct 2024 13:29:14 +0200
Message-Id: <20241002112914.5556-3-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
References: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
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

It is set to maximum inside test_gt_render_or_compute. If set before,
we would lack engine_class info. If set inside the test function, we
would need to pass original preempt_timeout_us value from there,
unnecessarily complicating the declaration of test function.

It is restored in subsequent igt_fixture. This way, a proper cleanup
can be assured. If restored inside the test function or even
test_gt_render_or_compute section, any failed assert preceding cleanup
inside test function would prevent cleanup from happening. We cannot
allow that.

In order to underline that the subsequent igt_fixture is related to
this test, both test_gt_render_or_compute and igt_fixture sections
were put inside igt_subtest_group, hopefully increasing readability.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 tests/intel/xe_eudebug_online.c | 45 +++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
index 68d1b786f..84736192f 100644
--- a/tests/intel/xe_eudebug_online.c
+++ b/tests/intel/xe_eudebug_online.c
@@ -16,6 +16,7 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "intel_pat.h"
 #include "intel_mocs.h"
 #include "gpgpu_shader.h"
@@ -2201,6 +2202,30 @@ static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)
 	return NULL;
 }
 
+static bool set_preempt_timeout_to_max(int fd, uint16_t engine_class, uint32_t *preempt_timeout)
+{
+	uint32_t preempt_timeout_max;
+
+	if (!xe_sysfs_engine_class_get_property(fd, 0, engine_class, "preempt_timeout_max",
+						&preempt_timeout_max))
+		return false;
+
+	if (!xe_sysfs_engine_class_set_property(fd, 0, engine_class, "preempt_timeout_us",
+						preempt_timeout_max, preempt_timeout))
+		return false;
+
+	return true;
+}
+
+static bool restore_preempt_timeout(int fd, uint16_t engine_class, uint32_t preempt_timeout)
+{
+	if (!xe_sysfs_engine_class_set_property(fd, 0, engine_class, "preempt_timeout_us",
+						preempt_timeout, NULL))
+		return false;
+
+	return true;
+}
+
 #define test_gt_render_or_compute(t, fd, __hwe) \
 	igt_subtest_with_dynamic(t) \
 		for (int gt = 0; (__hwe = pick_compute(fd, gt)); gt++) \
@@ -2212,6 +2237,8 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	bool was_enabled;
 	int fd;
+	uint16_t engine_class = 0xFFFF;
+	uint32_t preempt_timeout = 0xFFFFFFFF;
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -2247,8 +2274,22 @@ igt_main
 	test_gt_render_or_compute("interrupt-other-debuggable", fd, hwe)
 		test_interrupt_other(fd, hwe, SHADER_LOOP);
 
-	test_gt_render_or_compute("interrupt-other", fd, hwe)
-		test_interrupt_other(fd, hwe, SHADER_LOOP | DISABLE_DEBUG_MODE);
+	igt_subtest_group {
+		test_gt_render_or_compute("interrupt-other", fd, hwe) {
+			engine_class = hwe->engine_class;
+
+			igt_skip_on(!set_preempt_timeout_to_max(fd, engine_class,
+								&preempt_timeout));
+
+			test_interrupt_other(fd, hwe, SHADER_LOOP | DISABLE_DEBUG_MODE);
+		}
+
+		igt_fixture {
+			if ((uint16_t)~engine_class && ~preempt_timeout)
+				if (!restore_preempt_timeout(fd, engine_class, preempt_timeout))
+					igt_warn("Cleanup of preempt_timeout failed!\n");
+		}
+	}
 
 	test_gt_render_or_compute("interrupt-all-set-breakpoint", fd, hwe)
 		test_interrupt_all(fd, hwe, SHADER_LOOP | TRIGGER_RESUME_SET_BP);
-- 
2.34.1

