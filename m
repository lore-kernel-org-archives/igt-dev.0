Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50449C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900C310ED3D;
	Wed, 22 May 2024 10:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiT/T9Ql";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4783A10ED3D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374132; x=1747910132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=210MiFtUvbT0atBXywFYVO+ntpQY9ghHWm+GNSok2WA=;
 b=UiT/T9QlORTmkEznsMCeIaEsefhVpIgdXNkmj1iraqLTnoJu7akcvibt
 YGl/oD6T7tWnNWVtMe6TI7tKKoZBkDWzDAQJfBXG7GZovcLu/bfifnabf
 +/nWohXew40k53Tj35jZfwl4TQ8b2ymlUfifoZYuWHvEs7JaQpYsmQteK
 Wpzk6qI2WwXk+7PkSR+2hl4yoeoymLA5LfNyL0eKvbyVmRTEOoo2v3gS4
 GuO/ztVo4C5ulTw+lKoBYmq6wiaALqTjE5tc8VwzuhoO5iS1H4ecHIYRM
 ZIYkWgnb66q5ua770zxBc/FPF+5GjOnsqP6I59Y1NeDa+fs9ElwKvVQRt g==;
X-CSE-ConnectionGUID: upEpE9FGTLSsTRUys8lxSA==
X-CSE-MsgGUID: EDIKovucQjmEJYdY1x7fYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24029208"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="24029208"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:32 -0700
X-CSE-ConnectionGUID: Y0eN91DgSwWOr4kVGvWzwQ==
X-CSE-MsgGUID: vzPlmVE3Q6eRa6ls3/P7kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37827632"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 01/10] lib: sync i915_pciids.h with kernel commit
 432ed92bfb55
Date: Wed, 22 May 2024 13:35:14 +0300
Message-Id: <71037598d3aefaf5f86d197e9556e606b3717664.1716373923.git.jani.nikula@intel.com>
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

432ed92bfb55 ("drm/i915/pciids: add INTEL_PNV_IDS(), use acronym")

and update the references in intel_device_info.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915_pciids.h       | 8 ++++++--
 lib/intel_device_info.c | 4 ++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 85ce33ad6e26..21942a3c823b 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -108,12 +108,16 @@
 	INTEL_VGA_DEVICE(0x2e42, info), /* B43_G */ \
 	INTEL_VGA_DEVICE(0x2e92, info)	/* B43_G.1 */
 
-#define INTEL_PINEVIEW_G_IDS(info) \
+#define INTEL_PNV_G_IDS(info) \
 	INTEL_VGA_DEVICE(0xa001, info)
 
-#define INTEL_PINEVIEW_M_IDS(info) \
+#define INTEL_PNV_M_IDS(info) \
 	INTEL_VGA_DEVICE(0xa011, info)
 
+#define INTEL_PNV_IDS(info) \
+	INTEL_PNV_G_IDS(info), \
+	INTEL_PNV_M_IDS(info)
+
 #define INTEL_IRONLAKE_D_IDS(info) \
 	INTEL_VGA_DEVICE(0x0042, info)
 
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 64b5246b7783..88b160ae2d69 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -530,8 +530,8 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_I945GM_IDS(&intel_i945m_info),
 
 	INTEL_G33_IDS(&intel_g33_info),
-	INTEL_PINEVIEW_G_IDS(&intel_pineview_g_info),
-	INTEL_PINEVIEW_M_IDS(&intel_pineview_m_info),
+	INTEL_PNV_G_IDS(&intel_pineview_g_info),
+	INTEL_PNV_M_IDS(&intel_pineview_m_info),
 
 	INTEL_I965G_IDS(&intel_i965_info),
 	INTEL_I965GM_IDS(&intel_i965m_info),
-- 
2.39.2

