Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2ABC79FAC
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 18:05:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE38A10E053;
	Mon,  7 Sep 2026 18:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOACxTzU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A642A10E035
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788804138; x=1820340138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VCDEaId52JKkSNmFLLdUsGH+Zo+g7NqaB1aDV2TbGSk=;
 b=BOACxTzUQ9X5vxLVnc6Rx+qmBpcakxMVkwRiXUHC4kODk6MHAi+MA4+u
 ImxGG3YeCHETRuiBn7jM7hILl49kZfG1LqOYTH6vANaLbQCi6fyLtkY5S
 /jKOsej78upgbjLzL00ujus/xMh9uqe7W/d8ec0eXNRkD+p7NCyHLF7Ia
 HiHgliV8FlQ84porexUWCvZEANwhZIh/JzvEf2qDRAzJxCD8oB40kLJnT
 53ZDVCIG8bv8DuuVDNdJkccSP4BiAgdW471JgBHpLr7/cnpA/Kp1WCBSD
 rfmkfa35kR7skai8R+jSPWVbFX9nPDQ/By5clkjbs9JInDCULzZkNB6X4 g==;
X-CSE-ConnectionGUID: /cUEmqzmTVOcX+TtbPfhFQ==
X-CSE-MsgGUID: YjoAiNYAT9mpfDihaSJztA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91717158"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="91717158"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 11:02:17 -0700
X-CSE-ConnectionGUID: jbKtQusSS1aHOqwTNQ3NMA==
X-CSE-MsgGUID: LJKviVbMTwKpYymA2EpjBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="309010249"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.226])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 11:02:16 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Pranay Samala <pranay.samala@intel.com>
Subject: [PATCH i-g-t v3 2/3] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property
Date: Mon,  7 Sep 2026 20:02:03 +0200
Message-ID: <20260907180204.336052-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907180204.336052-1-kamil.konieczny@linux.intel.com>
References: <20260907180204.336052-1-kamil.konieczny@linux.intel.com>
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

From: Maarten Lankhorst <dev@lankhorst.se>

The background color is a 64-bits property that contains the ARGB values
of the background with 16 bits for each component.

Add support for the BACKGROUND_COLOR property, and set to pitch black
as the default.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2d78e3bee..7336a6384 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -49,6 +49,7 @@
 #include <time.h>
 #include <ctype.h>
 
+#include "linux_scaffold.h"
 #include <i915_drm.h>
 
 #include "drmtest.h"
@@ -740,6 +741,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
 	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
 	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
+	[IGT_CRTC_BACKGROUND_COLOR] = "BACKGROUND_COLOR",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -2740,6 +2742,10 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
 	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
 		igt_crtc_set_prop_value(crtc, IGT_CRTC_SHARPNESS_STRENGTH, 0);
 
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_BACKGROUND_COLOR,
+					DRM_ARGB64_PREP(0xffff, 0, 0, 0));
+
 	crtc->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 27f8877a9..19e7ce08e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -168,6 +168,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_VRR_ENABLED,
        IGT_CRTC_SCALING_FILTER,
        IGT_CRTC_SHARPNESS_STRENGTH,
+       IGT_CRTC_BACKGROUND_COLOR,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.55.0

