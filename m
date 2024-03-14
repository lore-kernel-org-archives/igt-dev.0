Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C968C54E60
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 21:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E55A10FE05;
	Thu, 14 Mar 2024 21:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWCuRk1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCED10FE05
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 21:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710453095; x=1741989095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s3lDAHyNVaRs/mTLg+wuv2cA2+Fch09xfi8E6dmeiJs=;
 b=XWCuRk1lsa8fNTm4n+Q4L7awHzzYyOBtdrhe+5hdjfLOnH4W2q0waAi4
 P+yHiKddiuMRHqSB52g70Up4ZQfQDpVWF391JAYWpgCQrx9t05Sf90BAR
 02vZ4ZzcWhlVJBfjKO+K51EPI5oaOPXIv3P/p3iciKKnKbx6R8d/ygLrz
 r9OdjXOtVjtpvRQ2yuBdABZmiwBFaYL/CTcE41/Y4nSHinNED8h+1fK8a
 p5Dmn+4h+vhYuAeJgqMAsluR5vrO/jLY1OcxjBQlErfm5DOpV/GS3sfpf
 E5ZjVL0tlcKH97k82fpEUDyxMgL8ZeTgBgPPPpTlcLkEje1zUZcxORQFS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5504054"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5504054"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 14:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12349884"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 14:51:32 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: Do not assume engine class
Date: Thu, 14 Mar 2024 22:37:48 +0100
Message-ID: <20240314213748.6323-1-nirmoy.das@intel.com>
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

Let the test decide what engine class to use instead of
a lib function deciding it for tests.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/intel_compute.c      | 20 +++-----------------
 tests/intel/xe_compute.c | 21 ++++++++++++++++++++-
 2 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 9d3b97efe..c96e60027 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -81,24 +81,10 @@ static void bo_execenv_create(int fd, struct bo_execenv *execenv,
 	execenv->driver = get_intel_driver(fd);
 
 	if (execenv->driver == INTEL_DRIVER_XE) {
+		igt_fail_on(eci == NULL);
 		execenv->vm = xe_vm_create(fd, 0, 0);
-
-		if (eci) {
-			execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm,
-								   eci, 0);
-		} else {
-			uint16_t engine_class;
-			uint32_t devid = intel_get_drm_devid(fd);
-			const struct intel_device_info *info = intel_get_device_info(devid);
-
-			if (info->graphics_ver >= 12 && info->graphics_rel < 60)
-				engine_class = DRM_XE_ENGINE_CLASS_RENDER;
-			else
-				engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
-
-			execenv->exec_queue = xe_exec_queue_create_class(fd, execenv->vm,
-									 engine_class);
-		}
+		execenv->exec_queue = xe_exec_queue_create(fd, execenv->vm, eci,
+							   0);
 	}
 }
 
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 42f42ca0c..cb98b00d5 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -163,9 +163,28 @@ test_compute_kernel_with_ccs_mode(int num_gt)
 static void
 test_compute_square(int fd)
 {
-	igt_require_f(run_intel_compute_kernel(fd), "GPU not supported\n");
+	struct drm_xe_engine_class_instance *hwe;
+	const struct intel_device_info *info;
+	uint16_t engine_class;
+	uint32_t devid = intel_get_drm_devid(fd);
+
+	info = intel_get_device_info(devid);
+
+	if (info->graphics_ver >= 12 && info->graphics_rel < 60)
+		engine_class = DRM_XE_ENGINE_CLASS_RENDER;
+	else
+		engine_class = DRM_XE_ENGINE_CLASS_COMPUTE;
+
+	xe_for_each_engine(fd, hwe) {
+		if (hwe->engine_class != engine_class)
+			continue;
+
+		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe),
+			      "GPU not supported\n");
+	}
 }
 
+
 igt_main
 {
 	int xe, num_gt;
-- 
2.42.0

