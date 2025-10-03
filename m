Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCE2CCD182
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 12:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8600F10E8EF;
	Fri,  3 Oct 2025 12:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZLBDr5E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A055610E8EF
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759493953; x=1791029953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yMhJGMpcZ5XwZidVGKdih1aBkepsk6iGxqAPMw9Ptds=;
 b=KZLBDr5E6eC/2Ja6qnYXMenwZH24M/2ZiZ6Umo4oFo1s2HUVehPrHT1b
 TCdWFG44pmXl7qzmHxtogmzLrJ/Sxd8Cuo9QuQygXNtTSGo8OfjSJqb0C
 TS1GV4oyX2BQaVkIhQ6xQDus985HcSGzz1m2OWkgsc9jo0impksmmjFJZ
 PEf6VshW9kpT6KrPAjwEWhMxZ8ALhuBYlPd0fBgjltYdvmplY3+rFttPW
 RTOzx4hmx+hxzArcn00+ywrMznbeRiTL4gKvtLw6hlaEzgIgwe/5k5tA+
 2nnx2dF/icF7Tkpw40RFehcAb90Q6Iebr/dNMqec1QQq/ziVYPhrqI8QB w==;
X-CSE-ConnectionGUID: LoaXINmKQr+5BooxeXwPdw==
X-CSE-MsgGUID: 8RCXV4fsQHGe6sWkBMt/zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84399227"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="84399227"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:19:13 -0700
X-CSE-ConnectionGUID: nVR8Xm0hSY+QzSagRQTHJQ==
X-CSE-MsgGUID: G91JZc8bTLiX3R1vJSmjoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183300133"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:19:11 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/9] lib/kms: Add support for COLOROP_HW_CAPS property
Date: Fri,  3 Oct 2025 17:55:45 +0530
Message-Id: <20251003122550.729242-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251003122550.729242-1-swati2.sharma@intel.com>
References: <20251003122550.729242-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 435e44744..347cbe2a7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -711,6 +711,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
 	[IGT_COLOROP_SIZE] = "SIZE",
+	[IGT_COLOROP_HW_CAPS] = "HW_CAPS",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_COLOR_DEPTH] = "COLOR_DEPTH",
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index beeab4b3c..fc7eccb6c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -375,6 +375,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
+	IGT_COLOROP_HW_CAPS,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_COLOR_DEPTH,
-- 
2.25.1

