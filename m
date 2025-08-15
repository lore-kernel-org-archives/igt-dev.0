Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97811CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 08:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4407810E368;
	Fri, 15 Aug 2025 08:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5wR2BTm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7555710E368
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755245121; x=1786781121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w1ZJjUQzswpn4xt5PBr5Go2zaKP1GPz8I51U5M+ZeuI=;
 b=U5wR2BTmU/grxZwntJyDRiNhvjZwCA4xHkGITtAdhVi415rPehhSF3BX
 BMvvQ81KeLBETsaW0k4UWKL+avkzHmIZ7GotTW5dgjpK8hIyBD458qjYe
 6gMozBprdOhzXPkwtwbpPHPfm0qoAz3U0nPYOlm71SQrLur/b5P/ADT20
 eE1FWzVO6lYv6l71b3yAVJnuwHkM7HMti/Ur7GNo/KySPw2dm26SV2c2K
 W0Mkti2AAod+XP6EN5r7hmvkcpmqj1B+m/J4rh9CORrVo3v0N9l38kqnE
 93a6Z2zsm9GaUDFjIGaoW9F4zL1SNv6F+hckE1X7XjeeAU1wjX9ljfpqy Q==;
X-CSE-ConnectionGUID: oAfKcVLiQgWyr2XrQjP+4Q==
X-CSE-MsgGUID: d46p9PUtS8aLOrytDSNvDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57494991"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57494991"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:05:21 -0700
X-CSE-ConnectionGUID: xexcwOIHSX29CN8GuwQ95Q==
X-CSE-MsgGUID: rwBH61GDS8udJjuPjo1pHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="166882107"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.142])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 01:05:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [RESEND i-g-t 4/5] tools/intel_vbt_decode: Flip bta_enabled to
 bta_disable
Date: Fri, 15 Aug 2025 11:04:54 +0300
Message-ID: <335bfe64fb01ba488ed666142b3e092bc2a9c4ee.1755245038.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1755245038.git.jani.nikula@intel.com>
References: <cover.1755245038.git.jani.nikula@intel.com>
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

Synchronize intel_dsi_vbt_defs.h with kernel commit:

745b597a7930 ("drm/i915/vbt: flip bta_enabled to bta_disable")

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tools/intel_dsi_vbt_defs.h | 2 +-
 tools/intel_vbt_decode.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel_dsi_vbt_defs.h b/tools/intel_dsi_vbt_defs.h
index 7ac872dbba8d..3f9b9ed6592c 100644
--- a/tools/intel_dsi_vbt_defs.h
+++ b/tools/intel_dsi_vbt_defs.h
@@ -76,7 +76,7 @@ struct mipi_config {
 #define ENABLE_ROTATION_180	0x2
 #define ENABLE_ROTATION_270	0x3
 		u32 rotation:2;
-		u32 bta_enabled:1;
+		u32 bta_disable:1;
 		u32 rsvd2:15;
 	} __packed;
 
diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 307c4da14843..6882ae1d2f63 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2852,7 +2852,7 @@ static void dump_mipi_config(struct context *context,
 		printf("\tPanel %d%s\n", i, panel_str(context, i));
 
 		printf("\t\tGeneral Param\n");
-		printf("\t\t\t BTA disable: %s\n", config->bta_enabled ? "Disabled" : "Enabled");
+		printf("\t\t\t BTA disable: %s\n", config->bta_disable ? "Disabled" : "Enabled");
 		printf("\t\t\t Panel Rotation: %d degrees\n", config->rotation * 90);
 
 		printf("\t\t\t Video Mode Color Format: ");
-- 
2.47.2

