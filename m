Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9CAC9830E
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 09:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDBB10F9CC;
	Fri, 25 Sep 2026 09:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWCSh/WD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA0110E249
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 09:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790329778; x=1821865778;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P6sVlOxfpv25RskAWBJMeC/GSnV1D65iiDlpW2w7i/0=;
 b=gWCSh/WD7BpIlQTFOlT4hwIOak/q75wWWyLwrrBBS+DEd9GsVyfD8X5U
 jRgueGYROfAPdfb3WDLRJqs0KnhrK/rfmQ1zkacQht/zgYu2jIoPTlII6
 W8ARrMYMF1CeQtTbkUPbvX3CMxjpdh15R94ymWMSD4PlasM3fif+ZIPCN
 eDvl2UFjEpEuVf2BfIEWy3OkvjqzBZYyU9/taEaaRjS8fgLllCcnH93o5
 s2s5fVRulEWHA2nm5/WJtmafZMAVg0pxiN2UVW3r+6LUy/fP3hYyDvQ43
 dRBFA8VhlurmIwHSGO4sFmPJTl/bAd/448Rsdnm1SMneNzP0gb1Xnm2ZL w==;
X-CSE-ConnectionGUID: dA7aYo18SzuWfhRuHg/Kdw==
X-CSE-MsgGUID: 2g4uKe+DSau+O3dJbGQ1Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101286427"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="101286427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 02:49:38 -0700
X-CSE-ConnectionGUID: a2JlhQvfSBKQH3L9QkDJ6w==
X-CSE-MsgGUID: IhpsnpZRRCenQwR5TFLvEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="274386259"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 02:49:38 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_vm: Validate host memory for overcommit
 tests
Date: Fri, 25 Sep 2026 09:49:30 +0000
Message-ID: <20260925094930.2647997-1-sobin.thomas@intel.com>
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

The amount of VRAM available for the overcommit tests varies
across platforms. As a result the host RAM and swap required to
support the overcommit workload also varies.

Query the platform RAM and swap space and visible VRAM before
running overcommit tests.
Require a minimum swap capacity relative to the platform memory
config and limit the overcommit working set to 50% of the currently
available RAM and swap size.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_vm.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index a0a6616c3..4ee2ebbc0 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2611,6 +2611,13 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 	overcommit_size = ALIGN((uint64_t)(base_size * c->overcommit_mult), 4096);
 
 	num_bos = (overcommit_size / nf_bo_size) + 1;
+	igt_debug("Overcommit sizing: case=%s use_vram=%d multiplier=%d "
+		  "system_size=%" PRIu64 " MiB vram_size=%" PRIu64 " MiB "
+		  "base_size=%" PRIu64 " MiB overcommit_size=%" PRIu64 " MiB "
+		  "bo_size=%" PRIu64 " MiB num_bos=%d\n",
+		  c->name, c->use_vram, c->overcommit_mult,
+		  system_size >> 20, vram_size >> 20, base_size >> 20,
+		  overcommit_size >> 20, nf_bo_size >> 20, num_bos);
 	bos = calloc(num_bos, sizeof(*bos));
 	igt_assert(bos);
 
@@ -2634,6 +2641,8 @@ test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
 	/* Create and bind data BOs */
 	actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, c->use_vram, data_addr,
 				       c->bo_flags, eci->gt_id, &num_bound);
+	igt_debug("Overcommit BO creation: case=%s actual_stage=%d num_bound=%d/%d\n",
+		  c->name, actual_stage, num_bound, num_bos);
 	/*
 	 * On EXPECT_CREATE nothing was bound so bail out entirely.
 	 * On EXPECT_BIND with no BOs bound there is nothing to execute either.
@@ -3499,9 +3508,33 @@ int igt_main()
 		const char *mode = (c->vm_flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
 					"fault" : "nonfault";
 		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
+			uint64_t ram_mb = igt_get_total_ram_mb();
+			uint64_t swap_mb = igt_get_total_swap_mb();
+			uint64_t vram_mb = xe_visible_vram_size(fd, 0) >> 20;
+			uint64_t avail_ram_mb = igt_get_avail_ram_mb();
+			uint64_t required_mb;
+			uint64_t budget_mb;
+
 			igt_require(xe_has_vram(fd));
-			igt_require(xe_visible_vram_size(fd, 0));
-			test_vm_overcommit(fd, hwe_non_copy, c, (igt_get_avail_ram_mb() << 20),
+			igt_require(vram_mb);
+			igt_debug("Overcommit host memory: case=%s mode=%s total_ram=%" PRIu64
+				  " MiB available_ram=%" PRIu64 " MiB vram=%" PRIu64
+				  " MiB swap=%" PRIu64 " MiB swap_ratio=%" PRIu64 "%%\n",
+				  c->name, mode, ram_mb, avail_ram_mb, vram_mb, swap_mb,
+				  (vram_mb + ram_mb) ? swap_mb * 100 / (vram_mb + ram_mb) : 0);
+			igt_require_f(swap_mb * 100 >= (vram_mb + ram_mb) * 35,
+				      "Swap (%" PRIu64 " MiB) must be at least 35%% of "
+				      "VRAM + system RAM (%" PRIu64 " MiB)\n",
+				      swap_mb, vram_mb + ram_mb);
+			required_mb = ((c->use_vram ? vram_mb : avail_ram_mb) *
+				       c->overcommit_mult);
+			required_mb = ALIGN(required_mb, 64) + 64;
+			budget_mb = avail_ram_mb + swap_mb;
+			igt_require_f(required_mb <= budget_mb * 50 / 100,
+				      "Overcommit working set (%" PRIu64 " MiB) exceeds "
+				      "50%% of available RAM + swap (%" PRIu64 " MiB)\n",
+				       required_mb, budget_mb);
+			test_vm_overcommit(fd, hwe_non_copy, c, (avail_ram_mb << 20),
 					   xe_visible_vram_size(fd, 0));
 		}
 	}
-- 
2.52.0

