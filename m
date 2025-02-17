Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55973C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:29:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176EF10E392;
	Mon, 17 Feb 2025 08:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKW22O4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148B310E392
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739780948; x=1771316948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LV+a5VdUAMGgiSmjupUi9KtBd4EgbV0246M0IySQMGg=;
 b=jKW22O4PtSvdcyeETmH6r5sptMP3TmDfXW3G5jEp9PbpDIvKa/Tf1f1R
 OmhP85Qct5QdRKnAyqOK8j7RbeNHlE0XHwVthPejALqb6JNPJQZs8FN99
 Ymd7Fvx+MhnowTn02HJEPUH6S82JV+wUaOdKRvGY61ZPkbZzA2uxt1mc8
 b2qeEJ7gcWpfCfsEOAzz3sTABctBM+GQeRxmv88ojjnOoazO4/Q5N3XvC
 uwJN+H4dCfG329zbe3dYlihI+JOFnSeAUH5lw+RFbiFqtOpyegFx0NWq2
 wjEnk+d900oICN9V8H6eUNUxKk+Z0O+y766oy8Oe25BsJCqxJiw+ffEPx g==;
X-CSE-ConnectionGUID: rz/m5Ck5TgiXsAJODOGPNw==
X-CSE-MsgGUID: ElWrwCLIS9GZuF+xyixD1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="50670416"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="50670416"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:29:07 -0800
X-CSE-ConnectionGUID: yutRT1HpTACleEj0TNOnPg==
X-CSE-MsgGUID: w7Jv8+3yQAO0H7HxY2twgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118693318"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 17 Feb 2025 00:29:05 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/intel/kms_draw_crc: Add more logs to
 skips/failure
Date: Mon, 17 Feb 2025 14:04:32 +0530
Message-Id: <20250217083432.771635-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a flag to check if display supports any format and
modifier.

v2: Rename the flag variable to meaningful name. (Karas)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_draw_crc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 30a09389e..9c350853c 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -333,6 +333,7 @@ igt_main
 	enum igt_draw_method method;
 	int format_idx, modifier_idx;
 	uint64_t modifier;
+	bool found_supported_format = false;
 
 	igt_fixture
 		setup_environment();
@@ -352,6 +353,7 @@ igt_main
 					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
 						continue;
 
+					found_supported_format = true;
 					igt_dynamic_f("%s-%s",
 						      format_str(format_idx),
 						      modifier_str(modifier_idx))
@@ -359,6 +361,8 @@ igt_main
 								    modifier);
 				}
 			}
+			if (!found_supported_format)
+				igt_info("Display doesn't supports any required formats/modifiers.\n");
 		}
 	}
 
-- 
2.34.1

