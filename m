Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6D6C87FDB
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 12:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2266010E462;
	Mon, 11 Aug 2025 12:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axlrSBGa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC56D10E462
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754916648; x=1786452648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YSChsKYsfR6t8goBbmMiYnAHWBL2/OeSiAY9+iQ/Qw8=;
 b=axlrSBGaoKZW2+fG8kbC1VCc0SNVNLy18wXWKulLtLD4QWc+iE6GBNLj
 B4sOxQE2aE5omHxvnpZg5ch/6ACwTbV0Idl7nNl7hhvzuxYZn1b9BkJfF
 Je6KHQXoyc19umNwhn9T8zA0UTqd5r4uiwpaVOj7+7wWswtle+zfoukpe
 lhO1/BbMykzlrKC1UDBAIg/9kiagM6I3MD/SLiCzYnOiMepbBYrCR8u8p
 p7byXoxJUdUCxRJNomBxuaX/tuRnEstr1862FW74cqO+VZ6kZTkLkoZ5K
 ZIMIxEMKlYN7Ut5tNHfDtAz7mfhLKoEkwv4/+JfXy2KSXounlVZpSgH5I Q==;
X-CSE-ConnectionGUID: P8iuRD9HTmWLiz8Q1dL0Hg==
X-CSE-MsgGUID: bAvIGpqcSGmfK6oyDz/iLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68537480"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68537480"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:48 -0700
X-CSE-ConnectionGUID: 39EISzmbSp6Dtf2IXfhARg==
X-CSE-MsgGUID: kzV9dCZWTVe4624OwB/q/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166265778"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 05:50:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 3/4] tools/intel_vbt_decode: sync intel_vbt_defs.h with
 kernel commit dac2ec8d3ba2
Date: Mon, 11 Aug 2025 15:50:25 +0300
Message-ID: <70a2d775f5b41ec5edb5d3cf3d4f433d56fbc503.1754916577.git.jani.nikula@intel.com>
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

dac2ec8d3ba2 ("drm/i915/pps: Decouple pps delays from VBT struct definition")

Modify the tool accordingly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_bios.h       | 8 --------
 tools/intel_vbt_decode.c | 8 ++++----
 tools/intel_vbt_defs.h   | 8 ++++++++
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/intel_bios.h b/tools/intel_bios.h
index fdc3308f3d38..01de2246e147 100644
--- a/tools/intel_bios.h
+++ b/tools/intel_bios.h
@@ -44,14 +44,6 @@ struct bdb_legacy_child_devices {
 #define BDB_DRIVER_SDVO_LVDS	2
 #define BDB_DRIVER_EDP		3
 
-struct edp_power_seq {
-	uint16_t t3;
-	uint16_t t7;
-	uint16_t t9;
-	uint16_t t10;
-	uint16_t t12;
-} __attribute__ ((packed));
-
 /* Block 52 contains MiPi Panel info
  * 6 such enteries will there. Index into correct
  * entery is based on the panel_index in #40 LFP
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 85a160e08b44..7bb3c19c3340 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2367,12 +2367,12 @@ static void dump_edp(struct context *context,
 
 		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
-		printf("\t\tPower Sequence: T3 %d T7 %d T9 %d T10 %d T12 %d\n",
-		       edp->power_seqs[i].t3,
-		       edp->power_seqs[i].t7,
+		printf("\t\tPower Sequence: T1-T3 %d T8 %d T9 %d T10 %d T11-T12 %d\n",
+		       edp->power_seqs[i].t1_t3,
+		       edp->power_seqs[i].t8,
 		       edp->power_seqs[i].t9,
 		       edp->power_seqs[i].t10,
-		       edp->power_seqs[i].t12);
+		       edp->power_seqs[i].t11_t12);
 
 		bpp = panel_bits(edp->color_depth, i, 2);
 
diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 42022756bbd5..e9b809568cd4 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -1014,6 +1014,14 @@ struct bdb_tv_options {
  * Block 27 - eDP VBT Block
  */
 
+struct edp_power_seq {
+	u16 t1_t3;
+	u16 t8;
+	u16 t9;
+	u16 t10;
+	u16 t11_t12;
+} __packed;
+
 #define EDP_18BPP	0
 #define EDP_24BPP	1
 #define EDP_30BPP	2
-- 
2.47.2

