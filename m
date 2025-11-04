Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07C8CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 16:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E39A10E63F;
	Tue,  4 Nov 2025 16:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYFU0+O2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111C710E292
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762274538; x=1793810538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0n9WTbX/1nIuCp0lrkt/g7oQjPD0ACc/G8MrZzDYJyw=;
 b=nYFU0+O2gpXtpxoBA4reRy/Dq9lQL4JkV3NVriA2iTqnrcEqNmxgwRzI
 U3gL62g7SyuoUPlEzFNsFbmBRRklhu/rkajxMpPP3JwMAP1QhMhlFyhaK
 RHMfsEgPTX6sCW4qpJ91vY34l/h98TdA5EQONE5TShVNcG4yD2QAeYAym
 fjOiwRcshOGa9rU+nMUg2Ig4MG/HEPxOh4LthYu9EGlk2r9u9GkswZYVS
 8jDUPfnzl3XKLSC+hklSw1w65exGz7tbyhxP6bwEuIcfy3FVmUw2LIfNR
 BcvJG/iGb8Ddb7WoroXAhRVkKnGsHVQ/THaFIg8Gda2i3lSx0XaKUVT/f g==;
X-CSE-ConnectionGUID: +cDUlI93QSOxSgN2KY8VVw==
X-CSE-MsgGUID: eyS+pqsNR2y2azrTTyIGAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75055205"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="75055205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:42:17 -0800
X-CSE-ConnectionGUID: 8DdZMGLzQcCrJRYRGisF+g==
X-CSE-MsgGUID: 2HODeH+QSFKPCHoanoOxkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="217857354"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 08:42:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_configfs: More invalid chars check
Date: Tue,  4 Nov 2025 08:41:43 -0800
Message-ID: <20251104164141.712312-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104164141.712312-3-lucas.demarchi@intel.com>
References: <20251104164141.712312-3-lucas.demarchi@intel.com>
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

The test was supposed to check the beginning and the end of the number,
but was actually doing the same check (the end) twice. Fix it and also
check for an invalid char in the middle.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
v2: Add check for invalid char in the middle
---
 tests/intel/xe_configfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index ecba69dbd..911e18965 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -168,10 +168,13 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-type",
 		  .in = "rcs 11000001 4F100 DEADBEEF",
 		},
-		{ .test = "invalid-number",
-		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
+		{ .test = "invalid-number-start",
+		  .in = "rcs cmd g1100000 4F100 DEADBEEF",
+		},
+		{ .test = "invalid-number-middle",
+		  .in = "rcs cmd 11g00000 4F100 DEADBEEF",
 		},
-		{ .test = "invalid-number",
+		{ .test = "invalid-number-end",
 		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
 		},
 		{ .test = "invalid-reg-addr-only",
-- 
2.51.2

