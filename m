Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E29AC25B7C
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4E410F4A6;
	Wed, 22 May 2024 10:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWlbwvOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540A410EE33
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374160; x=1747910160;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lVD0YwE+mjOk+J3jQIGSvwfmlXk4QJmgHUrZMp+k16w=;
 b=VWlbwvOIayK5cWaS0BTMMWMoA+GU3YwCuivmV6sPALJp6624+5Dqr5xn
 QwvD/fWPWHnQIe356jolmccbiitHRAB3WZwLu03WASf442cLBPWCK8obL
 AHb3Iw/Fo1/LSv4cJ81nnn+cvH6HrFgm4bjLsU0SzNxtA4uFFGettFE1j
 0G/bMhJkW/CLCF3MKotV2lFdsVokpGgZudyg+QkR3cRwFtDymFHvM/zng
 AKmnL+d7+CL/T59Az1h7m1lTbiyCMeUhM1rzD1R9AVoCMfQsWDo5LmtES
 xvRdfAgWLLK/ECInYQp/c2Z9dBrBZS7pNM2Z/llosK0sso3cWQk9tkT2z w==;
X-CSE-ConnectionGUID: UGURJXpwSFCWwKwgFUiKzQ==
X-CSE-MsgGUID: 0f5HQB1DTdiFudimDUgM4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="12467754"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="12467754"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:36:00 -0700
X-CSE-ConnectionGUID: gog+z7RtS1Oucla36Y0GVw==
X-CSE-MsgGUID: L/dmeYnPRpGgVE0BdApfLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="33359449"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 08/10] lib: sync i915_pciids.h with kernel commit
 d2c4b1db1c4f
Date: Wed, 22 May 2024 13:35:21 +0300
Message-Id: <6ea627c9d1184654f728edaa304087fa9bc51247.1716373923.git.jani.nikula@intel.com>
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

d2c4b1db1c4f ("drm/i915/pciids: don't include RPL-U PCI IDs in RPL-P")

and handle RPL-U separately in intel_device_info.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915_pciids.h       | 1 -
 lib/intel_device_info.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 42913d2eb655..04f6ca3dc5c1 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -717,7 +717,6 @@
 
 /* RPL-P */
 #define INTEL_RPLP_IDS(info) \
-	INTEL_RPLU_IDS(info), \
 	INTEL_VGA_DEVICE(0xA720, info), \
 	INTEL_VGA_DEVICE(0xA7A0, info), \
 	INTEL_VGA_DEVICE(0xA7A8, info), \
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index b1eec572dd82..4d05307ce3d7 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -609,6 +609,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_ADLS_IDS(&intel_alderlake_s_info),
 	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
 	INTEL_ADLP_IDS(&intel_alderlake_p_info),
+	INTEL_RPLU_IDS(&intel_alderlake_p_info),
 	INTEL_RPLP_IDS(&intel_alderlake_p_info),
 	INTEL_ADLN_IDS(&intel_alderlake_n_info),
 
-- 
2.39.2

