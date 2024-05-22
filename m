Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC831C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4530D10EE33;
	Wed, 22 May 2024 10:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Td5dNhC8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4A910EDA7
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374156; x=1747910156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VRazTCDC3O3Fm+8ir7I498cJ2SMstkcFUbPxqCwTR6M=;
 b=Td5dNhC8TAHCT0EcmJZQUazNthB6e3FBqANNFwzZkUodIZxAVNvlhbpb
 +HrUy8KD8WH40UduOrN1JoMwqkSjknQVXnVSdjPzLy8J5bBaYkmuTT9Uh
 9pE2je2menUO1UIvqZTP2HExS9EoSZU/ivP2dJUuqR+6lcVPRjWvWY35C
 CVh/Ww50OZhL4zGKxYos2T4VOnIKZra7nuK16l7EiKbmqvKqnuM/oE95i
 Yth/z75IVUd/BoS9ygqTRiuDtX2ZRdZmpFJDkyyWH+VSQXVryokx5gIX9
 LLSkmJV/nNGcxCbActrxZlw/WtQsMATX8ftTKU8JwfYGD264mSTCXDZtE g==;
X-CSE-ConnectionGUID: PDVMt6qQQ/emGboEGsc+ow==
X-CSE-MsgGUID: 4lVGWluYSaW1RTN98Ivcmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24029234"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="24029234"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:56 -0700
X-CSE-ConnectionGUID: arPk7pp/RJSoQb5UP2bhbA==
X-CSE-MsgGUID: EpSrRAitQ5q7VQ3aQGiKGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37827703"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 07/10] lib: sync i915_pciids.h with kernel commit
 7858cc0b55e3
Date: Wed, 22 May 2024 13:35:20 +0300
Message-Id: <f01a84905a1659e2ac0cb2fc657c776428aa3ef5.1716373923.git.jani.nikula@intel.com>
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

7858cc0b55e3 ("drm/i915/pciids: remove 12 from INTEL_TGL_IDS()")

and update the references in intel_device_info.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915_pciids.h       | 10 +++++-----
 lib/intel_device_info.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index ecfd7f71e2e7..42913d2eb655 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -620,12 +620,12 @@
 	INTEL_VGA_DEVICE(0x4E71, info)
 
 /* TGL */
-#define INTEL_TGL_12_GT1_IDS(info) \
+#define INTEL_TGL_GT1_IDS(info) \
 	INTEL_VGA_DEVICE(0x9A60, info), \
 	INTEL_VGA_DEVICE(0x9A68, info), \
 	INTEL_VGA_DEVICE(0x9A70, info)
 
-#define INTEL_TGL_12_GT2_IDS(info) \
+#define INTEL_TGL_GT2_IDS(info) \
 	INTEL_VGA_DEVICE(0x9A40, info), \
 	INTEL_VGA_DEVICE(0x9A49, info), \
 	INTEL_VGA_DEVICE(0x9A59, info), \
@@ -635,9 +635,9 @@
 	INTEL_VGA_DEVICE(0x9AD9, info), \
 	INTEL_VGA_DEVICE(0x9AF8, info)
 
-#define INTEL_TGL_12_IDS(info) \
-	INTEL_TGL_12_GT1_IDS(info), \
-	INTEL_TGL_12_GT2_IDS(info)
+#define INTEL_TGL_IDS(info) \
+	INTEL_TGL_GT1_IDS(info), \
+	INTEL_TGL_GT2_IDS(info)
 
 /* RKL */
 #define INTEL_RKL_IDS(info) \
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 79e3796dbefe..b1eec572dd82 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -599,8 +599,8 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_EHL_IDS(&intel_elkhartlake_info),
 	INTEL_JSL_IDS(&intel_jasperlake_info),
 
-	INTEL_TGL_12_GT1_IDS(&intel_tigerlake_gt1_info),
-	INTEL_TGL_12_GT2_IDS(&intel_tigerlake_gt2_info),
+	INTEL_TGL_GT1_IDS(&intel_tigerlake_gt1_info),
+	INTEL_TGL_GT2_IDS(&intel_tigerlake_gt2_info),
 	INTEL_RKL_IDS(&intel_rocketlake_info),
 
 	INTEL_DG1_IDS(&intel_dg1_info),
-- 
2.39.2

