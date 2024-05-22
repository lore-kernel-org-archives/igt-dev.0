Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C33C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E83F10EE34;
	Wed, 22 May 2024 10:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AY/18KNl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C365E10EE34
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374144; x=1747910144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wDdUYBPAnmCb6A9AQv8qYUMQVPL30WI7xM5CKtQDqGM=;
 b=AY/18KNl92NOdaqO7R+H6QGhUyuFQGwDGELlCovNnsZa+ilpp32JxF96
 7NbLlJparsHS2nHUrZwzrmZkHe6EVF1Y0tFqskW/O+cwkYyjKz/KsdyUC
 /wv2M4neMzfL7CKP6UrFykU2rOSYOwtKbRJXPhsQNwEuVWKKRbCEo+Etv
 9gli2SZg4/dTFA6QYPo8fL8ZPwpX21b68blAnv0fmtUyPoOB8OF92QcqI
 2w7waSgpV7f7Z+ZoWVXNVSm7VXra7h6Bts7JIz44fBcQ9O2lFtLPsAdZE
 vmE5USM752iDUAEd0mgzlWOHt0XPEi/RbkBTsphUI2c5LosnJJi8wB2dW g==;
X-CSE-ConnectionGUID: SvEPl8DNQJKYAisvVR5LRQ==
X-CSE-MsgGUID: fHkd5jGrTN6K1vifywvxuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24029229"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="24029229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:44 -0700
X-CSE-ConnectionGUID: +lcWnBqlQ6OJJateGRiQ6Q==
X-CSE-MsgGUID: 9FqBEiQTSi6Pxz+vkux6bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37827660"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 04/10] lib: sync i915_pciids.h with kernel commit
 5c8c22adc802
Date: Wed, 22 May 2024 13:35:17 +0300
Message-Id: <ffbd687019c672d50ea5857780623149aadbbff1.1716373923.git.jani.nikula@intel.com>
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

5c8c22adc802 ("drm/i915/pciids: add INTEL_IVB_IDS()")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915_pciids.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 0d48c493dcce..16778d92346b 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -177,6 +177,10 @@
 	INTEL_IVB_D_GT1_IDS(info), \
 	INTEL_IVB_D_GT2_IDS(info)
 
+#define INTEL_IVB_IDS(info) \
+	INTEL_IVB_M_IDS(info), \
+	INTEL_IVB_D_IDS(info)
+
 #define INTEL_IVB_Q_IDS(info) \
 	INTEL_QUANTA_VGA_DEVICE(info) /* Quanta transcode */
 
-- 
2.39.2

