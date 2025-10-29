Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E45CCF9EB
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 22:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFB610E85C;
	Wed, 29 Oct 2025 22:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmzElHYQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D414B10E85C
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 22:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761775230; x=1793311230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mKZJZUM4/Gtnq+armLQWlDKSraPeNItKdNMQyhR14LM=;
 b=LmzElHYQz1gnwyKicsbF7satyZvVL+buWsY43AocEp7Lq4JGeNq8Sagl
 KPMKecR+/n97ZR3VwIn+kKxOlvw6j1Ew+3j+Vwz7Z3PQsCni0qKwtKkVT
 4I23Eu7YzLzJJaszElcPlXDxLsyrgZOkmuZCo6N8J7zYkmAEot2hA865g
 FYE+uWIkMp69uxV6a1U8V/4VZ0L8f4KCxcG8bnOlBME58j7g5tcNlE7uV
 WyUxjp9pjhXMOKLX40KN/SNp6gAuc+LxePVLi0Ns0+PcABz2QxWysQvip
 +7Ocv5WiE+4fzzbXWFDPNrT/zoNc2x17LyY/uPPG0HJYOq4fhgVGVTVUs g==;
X-CSE-ConnectionGUID: ogVa4V6dRz2/M5LtM7mOlw==
X-CSE-MsgGUID: PvCbMXXbRnm920xkVjWfKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75028490"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="75028490"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:00:29 -0700
X-CSE-ConnectionGUID: k8rgBSjYQE+IOUEogvbzNQ==
X-CSE-MsgGUID: MWLzYtFoSm+rv7VQ1dtcoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="190101990"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 15:00:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_configfs: Check for invalid char in
 the beginning
Date: Wed, 29 Oct 2025 14:59:49 -0700
Message-ID: <20251029215947.3580744-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029215947.3580744-3-lucas.demarchi@intel.com>
References: <20251029215947.3580744-3-lucas.demarchi@intel.com>
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
but was actually doing the same check (the end) twice. Fix it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index ecba69dbd..08b0b0ae8 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -168,11 +168,11 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-type",
 		  .in = "rcs 11000001 4F100 DEADBEEF",
 		},
-		{ .test = "invalid-number",
+		{ .test = "invalid-number-end",
 		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
 		},
-		{ .test = "invalid-number",
-		  .in = "rcs cmd 1100000g 4F100 DEADBEEF",
+		{ .test = "invalid-number-start",
+		  .in = "rcs cmd g1100000 4F100 DEADBEEF",
 		},
 		{ .test = "invalid-reg-addr-only",
 		  .in = "rcs reg 4F100",
-- 
2.51.0

