Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51230C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 16:34:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B768D10E212;
	Wed, 28 Feb 2024 16:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KsGzJIVn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A0E10E212
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709138097; x=1740674097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2cm/N5eh8qA57P+S4d0mhN0Y+vz1EphtT85TdvyTnc8=;
 b=KsGzJIVnbMdhUYbFXTCgV8TTu6S1uAiREfIo7BmQyFsIFMqHid5h+Ejj
 Egq0/et6GlT73RgjF157HKjBgO9Tj/vZpvrCUHK8INI6TbQ4me32WLhLU
 XpEgsdRTh6rMHh5WlolivTWKQDlrKgu7q42Xvu6PyTwuZY5qDeLvxvMxR
 jivfucRu7vviujMiPTYARjQV3DCiRFKQZMoSNj/TiIgFAWYyoVKAey0XO
 oQVDCj669/X3+Vlqdy86aU4r/YvijW3gmeAdjpHmevpK4aRLbUeHncsfO
 qnzzUPCtEEn3TYWwhVv3qJ6N1ERS7mK9sCopcKFlBYf2gsSggmjVxev/F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3713759"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3713759"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="30671349"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:34:55 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_compute_preempt: Add
 compute-preempt-many
Date: Wed, 28 Feb 2024 17:21:18 +0100
Message-ID: <20240228162118.14654-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Add compute-preempt-many which should exercise multiple
mid-thread preemption at a time for multiple contexts.

v2: move igt_fork within the test(Zbigniew).

Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_compute_preempt.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
index a4e0e1454..0aeb10547 100644
--- a/tests/intel/xe_compute_preempt.c
+++ b/tests/intel/xe_compute_preempt.c
@@ -22,6 +22,11 @@
  * Description:
  *      Exercise compute walker mid thread preemption scenario
  * Functionality: compute openCL kernel
+ * SUBTEST: compute-preempt-many
+ * GPU requirement: LNL
+ * Description:
+ *      Exercise multiple walker mid thread preemption scenario
+ * Functionality: compute openCL kernel
  */
 static void
 test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
@@ -48,6 +53,20 @@ igt_main
 		}
 	}
 
+	igt_subtest_with_dynamic("compute-preempt-many") {
+		xe_for_each_engine(xe, hwe) {
+			/* TODO: This subtest fails on RCS engine */
+			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+				continue;
+
+			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class)) {
+				igt_fork(child, 100)
+					test_compute_preempt(xe, hwe);
+				igt_waitchildren();
+			}
+		}
+	}
+
 	igt_fixture
 		drm_close_driver(xe);
 
-- 
2.42.0

