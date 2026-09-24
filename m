Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68010C98318
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 18:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0881A10E4EA;
	Thu, 24 Sep 2026 18:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljNxQYKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D3610E4EA
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790275037; x=1821811037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FudYgYcplLbPO5Hyg7fT40zV3pSGa/np5Zl70yH9lVc=;
 b=ljNxQYKaDf0gHpNIfVqQtlmo9CLcc7o1MLt/jnc0hdxlojMAzyxY3J7u
 zqxRlUcMfsV5WGSIAWbCcUjpGL/iW9sBSDRq1F4uZyqe5OZeTGQciY7UB
 RmPV2PWtX7NVydvCg/h0OSTTMS9vUHuQ4ePuK2xGMsK2LyY1Rypv6KbvO
 LAcw8lcYgb5UOuk7EsYNTW3JcmhCGiCKBmJnxIRzVRMA0UdcNg6DZnnLS
 2unOMQ1ZXj9doqX0ObfR5gv8cQhb1h/TGrOUAedX1OnhXlDXazFl/UPr7
 9R/qjG1SQxVowpXAtnm9NqhkR1a0GEOwqIo0h86OM69KDuMNPZRi6PpGs Q==;
X-CSE-ConnectionGUID: lXP4btm8RUWFmMqQVoi9HA==
X-CSE-MsgGUID: IJ2Hh/ArSfe6wwB/ygUx5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89967542"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="89967542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 11:37:17 -0700
X-CSE-ConnectionGUID: hxBDK8WRRXOvGtFALDFstA==
X-CSE-MsgGUID: xrq3OqYyRfSwuOMemZ7kDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="273675357"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 11:37:16 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v1] test/intel/xe_vm: Add multi-GPU VRAM overcommit test
Date: Thu, 24 Sep 2026 18:37:08 +0000
Message-ID: <20260924183709.2643390-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

Extend the VRAM overcommit test to cover all available Xe GPUs
independently. Run each existing overcommit scenarios on every
physical GPU and use the VRAM capacity of the respective GPU
when calculating the overcommit size.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 56 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 545350894..6588baa75 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -22,6 +22,11 @@
 #include <string.h>
 #define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
 
+struct overcommit_gpu {
+	int fd;
+	struct drm_xe_engine_class_instance *hwe_non_copy;
+};
+
 enum overcommit_stage {
 	EXPECT_NONE,
 	EXPECT_CREATE,
@@ -35,6 +40,40 @@ addr_low(uint64_t addr)
 	return addr;
 }
 
+/* Get the number of the GPUs */
+static int get_overcommit_gpus(struct overcommit_gpu **gpus)
+{
+	struct overcommit_gpu *tmp = NULL;
+	int num_gpus = 0, i;
+
+	for (i = 0; ; i++) {
+		int gpu_fd;
+		struct drm_xe_engine *engine;
+		struct drm_xe_engine_class_instance *eci;
+
+		gpu_fd = __drm_open_driver_another(i, DRIVER_XE);
+		if (gpu_fd < 0)
+			break;
+		if (!xe_has_vram(gpu_fd) || !xe_visible_vram_size(gpu_fd, 0)) {
+			drm_close_driver(gpu_fd);
+			continue;
+		}
+		engine = xe_engine(gpu_fd, 0);
+		if (!engine) {
+			drm_close_driver(gpu_fd);
+			continue;
+		}
+		eci = &engine->instance;
+		tmp = realloc(tmp, (num_gpus + 1) * sizeof(*tmp));
+		igt_assert(tmp);
+		tmp[num_gpus].fd = gpu_fd;
+		tmp[num_gpus].hwe_non_copy = eci;
+		num_gpus++;
+	}
+	*gpus = tmp;
+	return num_gpus;
+}
+
 static uint32_t
 addr_high(int fd, uint64_t addr)
 {
@@ -3539,6 +3578,23 @@ int igt_main()
 		}
 	}
 
+	igt_subtest("overcommit-multigpu") {
+		struct overcommit_gpu *gpus = NULL;
+		int num_gpus = get_overcommit_gpus(&gpus);
+
+		for (int i = 0; i < num_gpus; i++) {
+			for (int j = 0; overcommit_cases[j].name; j++) {
+				const struct vm_overcommit_case *c = &overcommit_cases[j];
+
+				test_vm_overcommit(gpus[i].fd, gpus[i].hwe_non_copy, c,
+						   igt_get_avail_ram_mb() << 20,
+						   xe_visible_vram_size(gpus[i].fd, 0));
+			}
+			drm_close_driver(gpus[i].fd);
+		}
+		free(gpus);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.52.0

