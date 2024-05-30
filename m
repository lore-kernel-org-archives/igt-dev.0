Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2440C27C43
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 15:26:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3598910F8EF;
	Thu, 30 May 2024 15:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRj2E6eh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFBC10F07B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 15:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717082778; x=1748618778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WBoBm3mcrvTVNxJA4b7E/oJM8mClBTWx7D6CO6HKODA=;
 b=aRj2E6ehEzW/dzXXzJBvA36Bb/H3PAB8yMJ2+726Bu6egZUEPwv8BhAu
 Es0sT3/aabqHxj+SZdKPjMslAGVAFw6xPVolJDFOwVwIOMQslrmB5q++O
 zPU/tVUElwXeb/v8BPSJni+UoKov2hbpMJtahcbebDEk0jssBUEhR4/w4
 cIdWijB9WLPJ04cv3NeOf/B6kGGWE3KAaVCuVJFttgOk2JVl/QFQSWgth
 AHX+qSAE//hBV2NS4IAR2kfWQJuwqSPGdOTaNRdtTx31ushph4L8KufKg
 CmHCfd34wnCP1qvnpcvkfyRfpVBt7w+WtBobBojxXxOmcCFgxiTjiTN5w g==;
X-CSE-ConnectionGUID: Tsh8OHmFSfSugwa8nxXZCQ==
X-CSE-MsgGUID: LAGK58M3Tja8D44EZI+w2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24697809"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24697809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:17 -0700
X-CSE-ConnectionGUID: 8yZWg9SzSASYa3UaqsiWSg==
X-CSE-MsgGUID: Dv5XJPZtS3yok9dBrKRPHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="36328193"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 08:26:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 1/5] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel commit d9981f36e4f3
Date: Thu, 30 May 2024 18:26:04 +0300
Message-Id: <3583c716b3767844a4e424f67910d5e4fc2b97f0.1717082630.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717082630.git.jani.nikula@intel.com>
References: <cover.1717082630.git.jani.nikula@intel.com>
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

Synchronize intel_vbt_defs.h with kernel commit:

d9981f36e4f3 ("drm/i915/bios: Remove version number comment from DEVICE_HANDLE_EFP4")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_defs.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 3815aa21d19f..6600a8cf8464 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -201,7 +201,7 @@ struct bdb_general_features {
 #define DEVICE_HANDLE_EFP1	0x0004
 #define DEVICE_HANDLE_EFP2	0x0040
 #define DEVICE_HANDLE_EFP3	0x0020
-#define DEVICE_HANDLE_EFP4	0x0010 /* 194+ */
+#define DEVICE_HANDLE_EFP4	0x0010
 #define DEVICE_HANDLE_EFP5	0x0002 /* 215+ */
 #define DEVICE_HANDLE_EFP6	0x0001 /* 217+ */
 #define DEVICE_HANDLE_EFP7	0x0100 /* 217+ */
@@ -749,6 +749,7 @@ struct bdb_edp {
 	struct edp_apical_params apical_params[16];		/* 203+ */
 	u16 edp_fast_link_training_rate[16];			/* 224+ */
 	u16 edp_max_port_link_rate[16];				/* 244+ */
+	u16 edp_dsc_disable;					/* 251+ */
 } __packed;
 
 /*
@@ -899,11 +900,6 @@ struct lfp_brightness_level {
 	u16 reserved;
 } __packed;
 
-#define EXP_BDB_LFP_BL_DATA_SIZE_REV_191 \
-	offsetof(struct bdb_lfp_backlight_data, brightness_level)
-#define EXP_BDB_LFP_BL_DATA_SIZE_REV_234 \
-	offsetof(struct bdb_lfp_backlight_data, brightness_precision_bits)
-
 struct bdb_lfp_backlight_data {
 	u8 entry_size;
 	struct lfp_backlight_data_entry data[16];
-- 
2.39.2

