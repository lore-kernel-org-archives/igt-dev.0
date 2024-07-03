Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E42C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 22:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C9E10E0C8;
	Wed,  3 Jul 2024 22:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+pWUplo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F2410E0C8
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 22:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720046647; x=1751582647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1skz7mdQnuiSa/nRHDTkkeCy6pilTZPl4sS21zjnawI=;
 b=g+pWUplobyVimZ2pChgAi5j7vw67cumkWiG9hUAd9fEb2l5f51ORhQiW
 9X7C6qvQHyR9fb3ri8U/SxK4uc31P/Q0ZdTcegr5b0KBXZM03oYyP3Ob0
 0J/KiOABspvR/SMZP2ooLdKGRA4rAMRw2dyheO3gP+8FxmkFH0n+1UOao
 I0AY1/lUTWNc1eM9hUWI+knbJoQhkHUEAGvElbGItwxVihBMo+V+M6ujy
 8NV7cVxSCBffZEheEHWuybbS5PeDl7hq6zzpe20AIyLpNGXpUSPKXVBvG
 c42wbm8O4Kx5mnoHBoac9WjWDjJcaGrxJUhBjjHCjbwUMLyVBDVmX6lbM w==;
X-CSE-ConnectionGUID: pxin8elnRlmmuoW6SQQefw==
X-CSE-MsgGUID: OAldQW6/QmOdTYNgqIgkUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17258533"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17258533"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 15:44:06 -0700
X-CSE-ConnectionGUID: aho4FtwGSpymxNI9yz0oNA==
X-CSE-MsgGUID: PrygamKQTXmyuHTNMG0Nwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46471436"
Received: from unerlige-desk.jf.intel.com ([10.165.21.199])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 15:44:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] lib/i915/perf: Add ARL support in IGT perf library
Date: Wed,  3 Jul 2024 15:44:05 -0700
Message-Id: <20240703224405.3172164-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.38.1
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

Add ARL PCI ids for ARL in IGT perf library.

Resolves: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11356
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/perf.c         | 32 ++++++++++++++++++++++++++++++++
 lib/i915_pciids_local.h | 18 ++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index ee950b3c0..ef2f74be8 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -230,6 +230,34 @@ is_mtl_gt3(const struct intel_perf_devinfo *devinfo)
 	return false;
 }
 
+static bool
+is_arl_gt1(const struct intel_perf_devinfo *devinfo)
+{
+	static const uint32_t devids[] = {
+		INTEL_ARL_GT1_IDS(ID),
+	};
+	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
+		if (devids[i] == devinfo->devid)
+			return true;
+	}
+
+	return false;
+}
+
+static bool
+is_arl_gt2(const struct intel_perf_devinfo *devinfo)
+{
+	static const uint32_t devids[] = {
+		INTEL_ARL_GT2_IDS(ID),
+	};
+	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
+		if (devids[i] == devinfo->devid)
+			return true;
+	}
+
+	return false;
+}
+
 struct intel_perf *
 intel_perf_for_devinfo(uint32_t device_id,
 		       uint32_t revision,
@@ -432,6 +460,10 @@ intel_perf_for_devinfo(uint32_t device_id,
 			intel_perf_load_metrics_mtlgt2(perf);
 		else if (is_mtl_gt3(&perf->devinfo))
 			intel_perf_load_metrics_mtlgt3(perf);
+		else if (is_arl_gt1(&perf->devinfo))
+			intel_perf_load_metrics_mtlgt2(perf);
+		else if (is_arl_gt2(&perf->devinfo))
+			intel_perf_load_metrics_mtlgt3(perf);
 		else
 			return unsupported_i915_perf_platform(perf);
 	} else {
diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
index 92879704a..c404a51af 100644
--- a/lib/i915_pciids_local.h
+++ b/lib/i915_pciids_local.h
@@ -31,6 +31,24 @@
 	INTEL_MTL_P_GT3_IDS(MACRO__, ## __VA_ARGS__)
 #endif
 
+#ifndef INTEL_ARL_GT1_IDS
+#define INTEL_ARL_GT1_IDS(MACRO__, ...) \
+	MACRO__(0x7D41, ## __VA_ARGS__), \
+	MACRO__(0x7D67, ## __VA_ARGS__)
+#endif
+
+#ifndef INTEL_ARL_GT2_IDS
+#define INTEL_ARL_GT2_IDS(MACRO__, ...) \
+	MACRO__(0x7D51, ## __VA_ARGS__), \
+	MACRO__(0x7DD1, ## __VA_ARGS__)
+#endif
+
+#ifndef INTEL_ARL_IDS
+#define INTEL_ARL_IDS(MACRO__, ...) \
+	INTEL_ARL_GT1_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_ARL_GT2_IDS(MACRO__, ## __VA_ARGS__)
+#endif
+
 /* PVC */
 #ifndef INTEL_PVC_IDS
 #define INTEL_PVC_IDS(MACRO__, ...) \
-- 
2.38.1

