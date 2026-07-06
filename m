Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2321C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 05:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF1A10E725;
	Mon,  6 Jul 2026 05:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpFeQDcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0597510E2D7
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 05:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783314526; x=1814850526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zWGW4U/gvhjbbALfzIbalIql4st3LWA1hHxu5XWvXTQ=;
 b=SpFeQDcbjYJqH4LUqCp6/rAiy9QZ1lpKR8eHy5cLU3/sTMIOiUnwNQeP
 A8EW7rJzbZ7/PhnThmWcBSXp8mPYlyGwa6i2iak9bgKYF6Xv/9bv+Oek5
 Qt4jgQcbIes+i5bnrCxqfg7k5rk5vZTtpmHkKPXdAquu1BA8+KcLJvIij
 WK3SVdik/xR343kV3wyELayHFewCenASL/kni5F3BSnJPf/Bp6A7lC7oi
 gEKGN8P6VSToQWTKqkeuN6RQsjq4bo7WM7OhCE20PBQ5lZTxMvledQWsf
 Er1Xq3Vu5jrPnHfQ5pv09boriNrkY6vB1pQtLdS0kovp8dpkNQ2BXfyrD A==;
X-CSE-ConnectionGUID: L5uU1slXTQKAfHg3b6/H5g==
X-CSE-MsgGUID: sQCTKeHAQBCa6ddmelJ3+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="82921746"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="82921746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2026 22:08:45 -0700
X-CSE-ConnectionGUID: OlsKzoWRQ3mz3qqkB7lDgg==
X-CSE-MsgGUID: f1co6hDyS1eYCRptxoErsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; d="scan'208";a="257193572"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:08:44 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_display_modes: Skip mirrored pipe combinations
Date: Mon,  6 Jul 2026 10:38:37 +0530
Message-ID: <20260706050837.3897774-1-jeevan.b@intel.com>
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

Use a canonical pipe ordering in extended-mode-basic so each pipe pair
is tested only once. This removes mirrored combinations (A-B and B-A)
that provide duplicate coverage.

Reducing these redundant combinations lowers the total number of dynamic
subtests, helping prevent incomplete test execution in CI while
preserving coverage of all pipe and output pairings.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index d8aae4256..983733b9b 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -190,6 +190,9 @@ static void run_extendedmode_test(data_t *data) {
 			if (crtc1 == crtc2)
 				continue;
 
+			if (crtc1->pipe > crtc2->pipe)
+				continue;
+
 			if (output1 == output2)
 				continue;
 
-- 
2.43.0

