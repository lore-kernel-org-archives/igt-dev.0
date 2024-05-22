Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26F5C25B7A
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E1D10EDA7;
	Wed, 22 May 2024 10:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ve1/lnVo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1113A10EDA7
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374136; x=1747910136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CopxnfCO9wDeWh2IE/z2VIqcLfVEvGWI7GbLkUsisEo=;
 b=Ve1/lnVoBhCUAlj1XP0FtI5AeF95plfAFEUdpOt32PyNtoSDZ80ekQjz
 tgevJ/hDotEwkRy8aO+gaeZSie+jnhvFOA8wu937Kb3qW8lfD2IeZGeOy
 NvBHXuzZ7rWY3swpnEMVtVLxKlrebb5Ir7NrAXJ09rs4SC8y9WJ8HBx05
 G6wlJ7jcl4jdmrxewv/i1xpRvAdQaMOOgtWBqPreV8oa+7twB4G1DOesJ
 hB2Rz7ptPLo3RZ7iAALgZuYkOWZXt59sxzVUATdeVuMJRyNVHwMzvWoBc
 TeV1ZDeU1LxPBaS4I1UI7Q/CfcAbjKC3egBrnXn/anahyqr1F5ABXP3Br w==;
X-CSE-ConnectionGUID: HE1WmykhTFW6rmY7uA0r1A==
X-CSE-MsgGUID: 59Np5LSVTjSR8IpDEosCqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24029215"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="24029215"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:36 -0700
X-CSE-ConnectionGUID: FQJ0SA3fSyebOBJL+gzIlA==
X-CSE-MsgGUID: iicrKx1fSNeMfRQSbH5ZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37827640"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 02/10] lib: sync i915_pciids.h with kernel commit
 41c0f8a36f15
Date: Wed, 22 May 2024 13:35:15 +0300
Message-Id: <5bd3776051b68b34c962828ea1643b856859a51a.1716373923.git.jani.nikula@intel.com>
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

Synchronize i915_pciids.h with kernel commit:

41c0f8a36f15 ("drm/i915/pciids: add INTEL_ILK_IDS(), use acronym")

and update the references in intel_device_info.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915_pciids.h       | 8 ++++++--
 lib/intel_device_info.c | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 21942a3c823b..05f466ca8ce2 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -118,12 +118,16 @@
 	INTEL_PNV_G_IDS(info), \
 	INTEL_PNV_M_IDS(info)
 
-#define INTEL_IRONLAKE_D_IDS(info) \
+#define INTEL_ILK_D_IDS(info) \
 	INTEL_VGA_DEVICE(0x0042, info)
 
-#define INTEL_IRONLAKE_M_IDS(info) \
+#define INTEL_ILK_M_IDS(info) \
 	INTEL_VGA_DEVICE(0x0046, info)
 
+#define INTEL_ILK_IDS(info) \
+	INTEL_ILK_D_IDS(info), \
+	INTEL_ILK_M_IDS(info)
+
 #define INTEL_SNB_D_GT1_IDS(info) \
 	INTEL_VGA_DEVICE(0x0102, info), \
 	INTEL_VGA_DEVICE(0x010A, info)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 88b160ae2d69..0bff1ab4ee95 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -539,8 +539,8 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_G45_IDS(&intel_g45_info),
 	INTEL_GM45_IDS(&intel_gm45_info),
 
-	INTEL_IRONLAKE_D_IDS(&intel_ironlake_info),
-	INTEL_IRONLAKE_M_IDS(&intel_ironlake_m_info),
+	INTEL_ILK_D_IDS(&intel_ironlake_info),
+	INTEL_ILK_M_IDS(&intel_ironlake_m_info),
 
 	INTEL_SNB_D_IDS(&intel_sandybridge_info),
 	INTEL_SNB_M_IDS(&intel_sandybridge_m_info),
-- 
2.39.2

