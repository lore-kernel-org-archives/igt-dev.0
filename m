Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61538C87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 12:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEAF10E45F;
	Mon, 11 Aug 2025 12:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnusbU+4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F5F10E462
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754916644; x=1786452644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bEIwVZPozRCz1OS+lVQ13Ru5N54GkIq+nRnSX4NQnqg=;
 b=LnusbU+4oXr7kJXFypSojVTTh8nR2j2NPVNb6ScUuFlzfbkCCbXm6Cpn
 buFBmGXPkqFqoVrUybQSjB4Mr0ZCVQIEyHlttlVsddxMCzp0XsIy2IK4y
 GvrSnBnpuBJVoHj7z5ELOGUzRYhJWlzgcPYVgX3bHpXBkH8V3KhAZmkJk
 kzBdAoJmobYTn8mvzHT3rpVzz2t36Jb3Ac+JmzZ/M4fOUMRwuy+N8+TTE
 RvJ8dO/UIcaknrcyt7d3cssrwI9AVJQJy8H3eFwWcy2JQ1H1GbtQ9GE+l
 bHaeXBatctLsxOmj3Ksb9tvmGDMXlQ1WrUkdSYcJaUENodb18nhpDpk+M w==;
X-CSE-ConnectionGUID: JOX9+IiJRXuY083RpWCu/A==
X-CSE-MsgGUID: dUkhBv6mTIaD5mjlwSQN/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68537465"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68537465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:43 -0700
X-CSE-ConnectionGUID: 1Yl+em6jTxmQ+uifvLpx1w==
X-CSE-MsgGUID: KNqhBHZkQCu5aHX7S1Y2Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166265757"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 2/4] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel commit 70c33a2710cd
Date: Mon, 11 Aug 2025 15:50:24 +0300
Message-ID: <983d3adaab5169aa196a3cf0519e0b3b6013b186.1754916577.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1754916577.git.jani.nikula@intel.com>
References: <cover.1754916577.git.jani.nikula@intel.com>
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

70c33a2710cd ("drm/i915/bios: Update new entries in VBT BDB block definitions")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_vbt_defs.h | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index e613288937e4..42022756bbd5 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -1080,6 +1080,8 @@ struct bdb_edp {
 	u16 edp_fast_link_training_rate[16];			/* 224+ */
 	u16 edp_max_port_link_rate[16];				/* 244+ */
 	u16 edp_dsc_disable;					/* 251+ */
+	u16 t6_delay_support;					/* 260+ */
+	u16 link_idle_time[16];					/* 260+ */
 } __packed;
 
 /*
@@ -1321,7 +1323,7 @@ struct als_data_entry {
 } __packed;
 
 struct aggressiveness_profile_entry {
-	u8 dpst_aggressiveness : 4;
+	u8 dpst_aggressiveness : 4;		/* (228/252)-256 */
 	u8 lace_aggressiveness : 4;
 } __packed;
 
@@ -1330,12 +1332,27 @@ struct aggressiveness_profile2_entry {
 	u8 elp_aggressiveness : 4;
 } __packed;
 
+struct aggressiveness_profile3_entry {
+	u8 apd_aggressiveness:4;
+	u8 pixoptix_aggressiveness:4;
+} __packed;
+
+struct aggressiveness_profile4_entry {
+	u8 xpst_aggressiveness:4;
+	u8 tcon_aggressiveness:4;
+} __packed;
+
+struct panel_identification {
+	u8 panel_technology:4;
+	u8 reserved:4;
+} __packed;
+
 struct bdb_lfp_power {
 	struct lfp_power_features features;				/* ???-227 */
 	struct als_data_entry als[5];
 	u8 lace_aggressiveness_profile:3;				/* 210-227 */
 	u8 reserved1:5;
-	u16 dpst;							/* 228+ */
+	u16 dpst;							/* 228-256 */
 	u16 psr;							/* 228+ */
 	u16 drrs;							/* 228+ */
 	u16 lace_support;						/* 228+ */
@@ -1343,12 +1360,20 @@ struct bdb_lfp_power {
 	u16 dmrrs;							/* 228+ */
 	u16 adb;							/* 228+ */
 	u16 lace_enabled_status;					/* 228+ */
-	struct aggressiveness_profile_entry aggressiveness[16];		/* 228+ */
+	struct aggressiveness_profile_entry aggressiveness[16];
 	u16 hobl;							/* 232+ */
 	u16 vrr_feature_enabled;					/* 233+ */
-	u16 elp;							/* 247+ */
-	u16 opst;							/* 247+ */
-	struct aggressiveness_profile2_entry aggressiveness2[16];	/* 247+ */
+	u16 elp;							/* 247-256 */
+	u16 opst;							/* 247-256 */
+	struct aggressiveness_profile2_entry aggressiveness2[16];	/* 247-256 */
+	u16 apd;							/* 253-256 */
+	u16 pixoptix;							/* 253-256 */
+	struct aggressiveness_profile3_entry aggressiveness3[16];	/* 253-256 */
+	struct panel_identification panel_identification[16];		/* 257+ */
+	u16 xpst_support;						/* 257+ */
+	u16 tcon_based_backlight_optimization;				/* 257+ */
+	struct aggressiveness_profile4_entry aggressiveness4[16];	/* 257+ */
+	u16 tcon_backlight_xpst_coexistence;				/* 257+ */
 } __packed;
 
 /*
-- 
2.47.2

