Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B774CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 17:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B4F10EFC3;
	Tue, 29 Sep 2026 17:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyaPJKnT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06CD10EFC3
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790703629; x=1822239629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GeUIlolTAldpnnY/B2ishl2dhqj/C52kgCP/KDmB8GM=;
 b=eyaPJKnTxJr0G7AFaWm7zxjZCrqawKbydr6/xIW3WzBITtA3HB456kVn
 tH8AhaBYfT5yCq52OFiJteAj10/M1R3pVoRwwni7yTv9dZ/Bv/+8wGZb1
 dS8dBikxuHBnGbO/C/EY/8rrj4JE9pIGITaeZfvzBnKoCDrklC71mtvRA
 m6w8jXRZn+YhPMy+JTb2VhJSGR3DSbmS6zp92oKCKCbOaClWeck2ptqHi
 8BY7mWZCqRP2yyT1X97HaYSy8m+69UHWKm2VeuEZNJ1eHCqhXxh1IIHmT
 m3Fe7Ar13vEzUIYs61leBNZpVFqwBEAaEcy53PIwPqT32LMIZQMISnLWZ A==;
X-CSE-ConnectionGUID: qGtkx4qLTjKA9GY3eS1X5Q==
X-CSE-MsgGUID: oBSml54IS/uBe/1S5WOeAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90196951"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90196951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 10:40:28 -0700
X-CSE-ConnectionGUID: A1E6F8EFSOGhhVUBT8OPQA==
X-CSE-MsgGUID: k+TKJKm6SsujFgDVatwFaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="274537622"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 10:40:26 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/i915_pm_rc6_residency: make residency ratio
 tolerance symmetric
Date: Tue, 29 Sep 2026 22:58:11 +0530
Message-ID: <20260929172810.2077612-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Bump the upper ratio bound from 1.05 to 1.1 so residency_accuracy()
allows the same ±10% margin on both sides of the expected duration.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17049
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/i915_pm_rc6_residency.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index 346796fb2..80c102e31 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -112,7 +112,7 @@ static void residency_accuracy(unsigned int diff,
 
 	igt_info("Residency in %s or deeper state: %u ms (sleep duration %u ms) (%.1f%% of expected duration)\n",
 		 name_of_rc6_residency, diff, duration, 100*ratio);
-	igt_assert_f(ratio > 0.9 && ratio < 1.05,
+	igt_assert_f(ratio > 0.9 && ratio < 1.1,
 		     "Sysfs RC6 residency counter is inaccurate.\n");
 }
 
-- 
2.43.0

