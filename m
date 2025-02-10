Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF921C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 05:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A29C10E181;
	Mon, 10 Feb 2025 05:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BUeuhanE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E0210E181
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 05:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739166897; x=1770702897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9ohv1W0XxhMDP7TyF7iHKlZVBDWBGFKuf0jUNbX+Fo4=;
 b=BUeuhanEVaO512B2I7ZBFEMjzDe5rN/eup4VDqDWcHfS2lJrJIHyMeo6
 pmZQCBQJ76xdBkF+Mkkqrfm8oJ6RoL/bVOGH+ODPyF9YxoF81wXVga35t
 mMTl311uzOjG5OC4vEncXRd0kuXhKUT+8lBFshcovtp5425MmyOlEE7oz
 sD+cTg4F8mtLAu4BqcRevgwp0XiPyG61C8Rb4itFPaykkTguF3tmX4Kes
 tmiYD2UdraMrV5idHrD37EMdelmJmJEYSXBQHg0pfZlNHhnuvWrm/Jx5Z
 fqIxpEV3VxtfVfIgz3QxVj47U68MU9Er2hrDtyChy5sAw5xS9DyaOC58Q w==;
X-CSE-ConnectionGUID: PWNqgIILT/Wrocn6Eiuf4Q==
X-CSE-MsgGUID: 3MwjA1PWTime3r9HVsPadA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="38966858"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="38966858"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 21:54:57 -0800
X-CSE-ConnectionGUID: aKEhu5RsSqORBwi1RmBwDQ==
X-CSE-MsgGUID: elWKgQGlSKywVUHdDg8Dqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; d="scan'208";a="142946117"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:54:55 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] =?UTF-8?q?tests/kms=5Fdisplay=5Fmodes:=20Add=20chec?=
 =?UTF-8?q?k=20for=20=E2=89=A52=20outputs=20in=20extended=20mode=20test?=
Date: Mon, 10 Feb 2025 11:40:36 +0530
Message-Id: <20250210061036.1228921-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

extended mode test needs minimum 2 display to run, so add igt_require
to check if the required criteria is met or not.

v2: Fix commit message.
v3: Update subject.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index e41c60cc0..117f82325 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -335,8 +335,10 @@ igt_main
 	}
 
 	igt_describe("Test for validating display extended mode with a pair of connected displays");
-	igt_subtest_with_dynamic("extended-mode-basic")
+	igt_subtest_with_dynamic("extended-mode-basic") {
+		igt_require_f(count > 1, "Minimum 2 outputs are required\n");
 		run_extendedmode_test(&data);
+	}
 
 	igt_describe("Negative test for validating display extended mode with a pair of connected "
 		     "2k-4k or 4k-4k displays");
-- 
2.25.1

