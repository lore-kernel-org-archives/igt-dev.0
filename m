Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049A7EF48DD
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 08:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A27F10E7A0;
	Fri, 13 Feb 2026 08:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jobQtaUF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE20610E7A0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770969754; x=1802505754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y0KbDmxvX1D7HvDzifC3t2fGQc5x29LjQHlOBfjApw4=;
 b=jobQtaUFLIcsiwgcpXmm1SZ9nIUTLk35Qb2gulN7RbUSCdoDPngycupi
 j1AFhRokzKZK6b2Mlc/wQ5EiHS4+S9Hx5u0lfWTKQqROxg1QZ4KDmNOSZ
 GtnuY2aTsIhjiXL/dYg346IiU0iT3C+Ok/HdWcCs8LqaZ743lM1XbIdrp
 yq2exqioE/wmDszHA7sP28uT0hvmPsW7C2DVI3JK8L23GNApCAi6i3ARj
 usIcOSXG/4WuvmxKPhhWG/dUqDRLr93pQlm34vS234/awnIL70UreX0Eo
 DLmWGdvNkJ8ulNaxyVmEndT7AF4scPke7VBEOOE3bDKPejgW4F0RHZGAX g==;
X-CSE-ConnectionGUID: O81BJ/GJRoGzq6VsSNHScQ==
X-CSE-MsgGUID: wCDZuALVSAWx+T2c+Pp9EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="74752289"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="74752289"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:02:33 -0800
X-CSE-ConnectionGUID: 96hjjeAFSx6dy3JT+/hIow==
X-CSE-MsgGUID: wHTxi8DyT2eaBG9H4Y/A8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="250527751"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:02:32 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_invalid_mode: Add informative skip for
 connectors with fixed mode
Date: Fri, 13 Feb 2026 13:40:59 +0530
Message-Id: <20260213081059.450804-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Currently adjust_mode_clock_too_high() silently returns when the
connector exposes a scaling mode property. On such connectors the
kernel ignores user-specified timings (except hdisplay/vdisplay).

Instead of silently returning, add an explicit igt_skip() with a
clear message indicating that fixed mode connectors are not
suitable for this test.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_invalid_mode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 9f6b2df9e..2c4fbe8c0 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -136,8 +136,11 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
 	 * roughly match the user will get. For now skip the
 	 * test on  any connector with a fixed mode.
 	 */
-	if (has_scaling_mode_prop(data))
+	if (has_scaling_mode_prop(data)) {
+		igt_skip("Skipping: connector %s exposes a fixed mode; kernel"
+		         "ignores user timings (clock/refresh not honored)\n", data->output->name);
 		return false;
+	}
 
 	/*
 	 * Newer platforms can support modes higher than the maximum dot clock
-- 
2.25.1

