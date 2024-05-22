Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E27C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A5810F4AB;
	Wed, 22 May 2024 10:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhRHxUMN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7E210ECC7
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374168; x=1747910168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PsNlzgwc5O752MyxU/ygtymIWp8xBwhdqx+wGrtwQYM=;
 b=lhRHxUMNSi/g+kxUsk0rowSJHhqUmKs3FL3CTU83EtUGWNieyWMsJnAS
 apaT6JlMMRSBqX8zs85SIyWIDHlZgYKUYmxMWaf/Rn2iVQEtJdSFRFGDj
 lXDNg5CPU7F5TXcYpAlZMm1g8ZbLrWYIOTrsMQwP8AQ0CQN2L6513x7QW
 gTWlGO8jWKiGNtEd+szJTOWKl8OoJOtq9UpY028DBa68F/rjddudroq7J
 MdBNhYpM9w68GALPVufugySAPTm3HtHyH25uZUssrg/XBTSoZJ6qZhDQt
 uA3gQPDwnpjjrRkRDyNSbdhGl+G2L1f+BsC2NUGcXwBZdHGIOIICtSA8J Q==;
X-CSE-ConnectionGUID: YSL4OlfSTiu5z5Z9l3Ii3w==
X-CSE-MsgGUID: tkSu3OnXSJyt+zNcHJi1FA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12467758"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="12467758"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:36:08 -0700
X-CSE-ConnectionGUID: K7UL9VyZSrezyloHzIATCQ==
X-CSE-MsgGUID: CygSxuw+RJarIt8JVaheFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="33359497"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:36:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 10/10] lib: switch i915_pciids_local.h to xe driver
 style PCI ID macros
Date: Wed, 22 May 2024 13:35:23 +0300
Message-Id: <dca416158698f28ba603e804467b2bee6c2e5d59.1716373923.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716373923.git.jani.nikula@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Follow-up the kernel i915_pciids.h switching to xe driver style PCI ID
macros, and do the same for i915_pciids_local.h. This is a clear
improvement in the perf code, for example.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915/perf.c         | 12 +++--------
 lib/i915_pciids_local.h | 44 ++++++++++++++++++++---------------------
 lib/intel_device_info.c |  2 +-
 3 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index 4b00ba5de9d4..ee950b3c03e4 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -204,13 +204,10 @@ is_acm_gt3(const struct intel_perf_devinfo *devinfo)
 static bool
 is_mtl_gt2(const struct intel_perf_devinfo *devinfo)
 {
-#undef INTEL_VGA_DEVICE
-#define INTEL_VGA_DEVICE(_id, _info) _id
 	static const uint32_t devids[] = {
-		INTEL_MTL_M_IDS(NULL),
-		INTEL_MTL_P_GT2_IDS(NULL),
+		INTEL_MTL_M_IDS(ID),
+		INTEL_MTL_P_GT2_IDS(ID),
 	};
-#undef INTEL_VGA_DEVICE
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
 		if (devids[i] == devinfo->devid)
 			return true;
@@ -222,12 +219,9 @@ is_mtl_gt2(const struct intel_perf_devinfo *devinfo)
 static bool
 is_mtl_gt3(const struct intel_perf_devinfo *devinfo)
 {
-#undef INTEL_VGA_DEVICE
-#define INTEL_VGA_DEVICE(_id, _info) _id
 	static const uint32_t devids[] = {
-		INTEL_MTL_P_GT3_IDS(NULL),
+		INTEL_MTL_P_GT3_IDS(ID),
 	};
-#undef INTEL_VGA_DEVICE
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
 		if (devids[i] == devinfo->devid)
 			return true;
diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
index 0043b0cd9b34..92879704aa8e 100644
--- a/lib/i915_pciids_local.h
+++ b/lib/i915_pciids_local.h
@@ -9,41 +9,41 @@
 
 /* MTL perf */
 #ifndef INTEL_MTL_M_IDS
-#define INTEL_MTL_M_IDS(info) \
-	INTEL_VGA_DEVICE(0x7D60, info), \
-	INTEL_VGA_DEVICE(0x7D67, info)
+#define INTEL_MTL_M_IDS(MACRO__, ...) \
+	MACRO__(0x7D60, ## __VA_ARGS__), \
+	MACRO__(0x7D67, ## __VA_ARGS__)
 #endif
 
 #ifndef INTEL_MTL_P_GT2_IDS
-#define INTEL_MTL_P_GT2_IDS(info) \
-	INTEL_VGA_DEVICE(0x7D45, info)
+#define INTEL_MTL_P_GT2_IDS(MACRO__, ...) \
+	MACRO__(0x7D45, ## __VA_ARGS__)
 #endif
 
 #ifndef INTEL_MTL_P_GT3_IDS
-#define INTEL_MTL_P_GT3_IDS(info) \
-	INTEL_VGA_DEVICE(0x7D55, info), \
-	INTEL_VGA_DEVICE(0x7DD5, info)
+#define INTEL_MTL_P_GT3_IDS(MACRO__, ...) \
+	MACRO__(0x7D55, ## __VA_ARGS__), \
+	MACRO__(0x7DD5, ## __VA_ARGS__)
 #endif
 
 #ifndef INTEL_MTL_P_IDS
-#define INTEL_MTL_P_IDS(info) \
-	INTEL_MTL_P_GT2_IDS(info), \
-	INTEL_MTL_P_GT3_IDS(info)
+#define INTEL_MTL_P_IDS(MACRO__, ...) \
+	INTEL_MTL_P_GT2_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_MTL_P_GT3_IDS(MACRO__, ## __VA_ARGS__)
 #endif
 
 /* PVC */
 #ifndef INTEL_PVC_IDS
-#define INTEL_PVC_IDS(info) \
-	INTEL_VGA_DEVICE(0x0BD0, info), \
-	INTEL_VGA_DEVICE(0x0BD1, info), \
-	INTEL_VGA_DEVICE(0x0BD2, info), \
-	INTEL_VGA_DEVICE(0x0BD5, info), \
-	INTEL_VGA_DEVICE(0x0BD6, info), \
-	INTEL_VGA_DEVICE(0x0BD7, info), \
-	INTEL_VGA_DEVICE(0x0BD8, info), \
-	INTEL_VGA_DEVICE(0x0BD9, info), \
-	INTEL_VGA_DEVICE(0x0BDA, info), \
-	INTEL_VGA_DEVICE(0x0BDB, info)
+#define INTEL_PVC_IDS(MACRO__, ...) \
+	MACRO__(0x0BD0, ## __VA_ARGS__), \
+	MACRO__(0x0BD1, ## __VA_ARGS__), \
+	MACRO__(0x0BD2, ## __VA_ARGS__), \
+	MACRO__(0x0BD5, ## __VA_ARGS__), \
+	MACRO__(0x0BD6, ## __VA_ARGS__), \
+	MACRO__(0x0BD7, ## __VA_ARGS__), \
+	MACRO__(0x0BD8, ## __VA_ARGS__), \
+	MACRO__(0x0BD9, ## __VA_ARGS__), \
+	MACRO__(0x0BDA, ## __VA_ARGS__), \
+	MACRO__(0x0BDB, ## __VA_ARGS__)
 #endif
 
 #endif /* _I915_PCIIDS_LOCAL_H */
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 30aca2abd7be..e80ea54707de 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -617,7 +617,7 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &intel_meteorlake_info),
 
-	INTEL_PVC_IDS(&intel_pontevecchio_info),
+	INTEL_PVC_IDS(INTEL_VGA_DEVICE, &intel_pontevecchio_info),
 
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
 
-- 
2.39.2

