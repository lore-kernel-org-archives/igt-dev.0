Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CCECCD184
	for <igt-dev@archiver.kernel.org>; Thu,  9 Oct 2025 12:28:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5955910EA08;
	Thu,  9 Oct 2025 12:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLfuVJiV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C48F10EA08
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Oct 2025 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760012938; x=1791548938;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yVF+mHsnJzPN8Dx/2IVBpq99fkIJIFb0pqPr798tcHE=;
 b=NLfuVJiVvfQF3VSbMKtmVoZO8+NdWlSPuQhswiq517yzR3hUs0f/oIZP
 g00k930eQlbV88HCKlALiAr2+Y2jJgNSieYt4mrtZn6PxGOh9k+aHFrRU
 F/BbuTcafo8ONiyIvM79ZIe8kCzTpXaABDkh0tJLo/sH0F1WL8OrJX6xe
 JqQbcVBFWkfBQZTkFAPhdk39JQj85LVs6cpgeMWXe7gCSDfzK+PtKFgm7
 tS23aeyqUl+59+KE+b153m+JF6YuA128LISM9FQE/LHuY7MCGjbCt3fpn
 j4CuQeS6496wiK0CzUTBKU8qg4Z15XN2fMsa9CwAnFLyd42slM0KwZmvU A==;
X-CSE-ConnectionGUID: VXfWPsoZTR6of59KSUcrrg==
X-CSE-MsgGUID: HSVvdVMoSk+zq+0wEg4nCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64839750"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="64839750"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 05:28:58 -0700
X-CSE-ConnectionGUID: pXrHK6m6RcGZ/R5YvredrA==
X-CSE-MsgGUID: jJdrZFUhR5ex0z/aGYrAiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="184965979"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 05:28:56 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_multiple: Restrict pipe/output combos
 on 2x subtests for simulation
Date: Thu,  9 Oct 2025 17:55:14 +0530
Message-Id: <20251009122514.637703-1-santhosh.reddy.guddati@intel.com>
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

In simulation platforms, limit the execution to fewer pipe output
combinations for 2x subtests. This avoids timeouts by reducing overall
test execution time out.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_plane_multiple.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 4e6ca780a..28969fab1 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -509,6 +509,7 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 	enum pipe pipe1, pipe2;
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
+	bool is_sim = igt_run_in_simulation();
 
 	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
 		      "%s modifier is not supported\n", name);
@@ -543,7 +544,15 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 					test_fini_2_display(data);
 				}
 			}
+			/*
+			 * In simulation env, only run the test once with a
+			 * single valid pipe/output pair instead of all combos.
+			 */
+			if (is_sim)
+				break;
 		}
+		if (is_sim)
+			break;
 	}
 }
 
-- 
2.34.1

