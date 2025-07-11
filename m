Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FF3C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 07:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF3010E9C2;
	Fri, 11 Jul 2025 07:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjupOgA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5EE10E9C2
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 07:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752220637; x=1783756637;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/4yTVrWDuGrTHnfMe7biUz195PJt2BC1Q7jCrAGFXlU=;
 b=hjupOgA9yDr0FTXr0Rt77kVVd/KqgrflXVC2KRa2ZoHfq9EPW9hgbc+h
 bjtnLCq9Zc4514QTsKu/Wori/uRXsuD2mlCwDxRgWERUeiAtQYhEary3D
 UtiIwdr7wVpQjiZlMIuR/V+/teHMrw2ycb+a7id0wA0lkBrT1MJ3bB8GE
 yp4YnROwOf2VQEs4UV6JAByZbOHK1itfYw8hh/RvWFYqID/QF1yovcfhJ
 HO7DezZY+8LbFG/ybLQDVUp9h5o/p1UslqAB913ndjrpEty3CN39fdVDT
 U6HjSJVm2/JK36iTVwIlDOuynNSPMIHe8cyfmyX7uMQk+thggumEVQEr6 A==;
X-CSE-ConnectionGUID: ZbivdfVXQAqE/ZasUXyicg==
X-CSE-MsgGUID: 0N5FbachRqOv9jrtbb+22Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54601445"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54601445"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 00:57:16 -0700
X-CSE-ConnectionGUID: bcIMK3cKQo2H4WQVegGE2g==
X-CSE-MsgGUID: FriUcvVCTK+VJj8U6lugWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="193511658"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 11 Jul 2025 00:57:15 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Reduce test
 complexity for simulation
Date: Fri, 11 Jul 2025 13:34:58 +0530
Message-Id: <20250711080458.1218533-1-pranay.samala@intel.com>
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

Reduce the number of iterations, draw_method combinations, and limit
execution to a single pipe to enable this test to run on simulation.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 66dcdc281..631b13aa1 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2908,6 +2908,8 @@ static void multidraw_subtest(const struct test_mode *t)
 					assertions |= ASSERT_PSR_DISABLED;
 
 				do_assertions(assertions);
+				if (igt_run_in_simulation())
+					break;
 			}
 
 			fill_fb_region(target, m2, COLOR_PRIM_BG);
@@ -2915,7 +2917,11 @@ static void multidraw_subtest(const struct test_mode *t)
 
 			update_wanted_crc(t, &blue_crcs[t->format].crc);
 			do_assertions(ASSERT_NO_ACTION_CHANGE);
+			if (igt_run_in_simulation())
+				break;
 		}
+		if (igt_run_in_simulation())
+			break;
 	}
 }
 
@@ -3275,6 +3281,8 @@ static void move_subtest(const struct test_mode *t)
 		update_wanted_crc(t, &pattern->crcs[t->format][r]);
 
 		do_assertions(assertions);
+		if (igt_run_in_simulation())
+			break;
 
 		/* "Move" the last rect to the same position just to make sure
 		 * this works too. */
@@ -3332,6 +3340,8 @@ static void onoff_subtest(const struct test_mode *t)
 		}
 
 		do_assertions(assertions);
+		if (igt_run_in_simulation())
+			break;
 	}
 }
 
@@ -4184,6 +4194,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 					break; /* One output is enough. */
 				}
+				if (igt_run_in_simulation())
+					break;
 			}
 		}
 
-- 
2.34.1

