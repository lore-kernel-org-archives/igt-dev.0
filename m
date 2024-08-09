Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B44C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 17:30:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67F410E9B1;
	Fri,  9 Aug 2024 17:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HCfUgmTl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2CA10E9B1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723224600; x=1754760600;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rhoWSig07n77MoaZSRs58ookg0S+x7WIwbxCiufg+UQ=;
 b=HCfUgmTl6iyRC9b0C2mMptUeg5pb+fDxDXGQ8Xi3qPE1FbridpeqHAGl
 LI9sq3dDdm1e1zuYIciSH0eQcFIQSGN/az6OKk3wFWFfQp2jCbDyi245a
 ILOPHXVV3BF1PYIVWweAfu6At6HtxOJN76J4qjjr6rNF/b4WmXlEbSUGO
 TY8zGFXU3oiGmCl4szY5eAPtE33zyN6BcfX/u81Jisj8wHdRwPgsDN0Lw
 rNGrirS9TgJBD4Fwn4UbJlQjcvCGXzM+hjYsfwNRUp+tEC9kEieIUK5L0
 Xflvnl1v6ng2XDQQ/hgkdAcQTrQC0gTiCFBiMgmdUYisQx8bCwpqfnr8T w==;
X-CSE-ConnectionGUID: 39c0sylWTnS2/sABrEOXqA==
X-CSE-MsgGUID: hrf6nCuAQ/a/xv1UQmoK+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21265821"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21265821"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 10:29:59 -0700
X-CSE-ConnectionGUID: djnTXapQQZSfrTcTfPyM3Q==
X-CSE-MsgGUID: NrA2mrCDS4Gj8FIhelaykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="88271608"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 10:29:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_module_load: Rename enable_display
 module param
Date: Fri,  9 Aug 2024 10:27:28 -0700
Message-ID: <20240809172936.2718506-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

enable_display is being renamed in the kernel since it's ambiguous:
https://lore.kernel.org/all/20240808180154.2495634-1-lucas.demarchi@intel.com/

Prepare for that renaming it in igt.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

After doing this I'm wondering if it would break anything in CI if
either

a) igt started passing both for some time
b) the kernel to have one additional enable_display module param,
   documented as deprecated,  that we keep for a couple of releases


 tests/intel/xe_module_load.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 0856a57c8..30259fc26 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -112,7 +112,7 @@ static const char * const unwanted_drivers[] = {
  * Description: Reload the Xe driver
  *
  * SUBTEST: reload-no-display
- * Description: Reload the Xe driver passing ``enable_display=0`` parameter
+ * Description: Reload the Xe driver passing ``probe_display=0`` parameter
  *
  * SUBTEST: many-reload
  * Description: Reload the Xe driver many times
@@ -145,7 +145,7 @@ igt_main
 
 	igt_subtest("reload-no-display") {
 		igt_xe_driver_unload();
-		load_and_check_xe("enable_display=0");
+		load_and_check_xe("probe_display=0");
 		igt_xe_driver_unload();
 	}
 
-- 
2.43.0

