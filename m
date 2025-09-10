Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B15CAC58C
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 08:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596D110E8A3;
	Wed, 10 Sep 2025 08:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jruadaYe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADCE10E36D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 08:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757494466; x=1789030466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CgvaiV8LXOf+amOOrRIQCJmwZp2kzitJos7rFkfVPsg=;
 b=jruadaYeTu3s6ADw2Kh8ArSRskJUcoxw5l8Rl85OGK+HZBqvC9X6Riuz
 eS0EOVktNzzNbisxWpNXoVQiiEq41Ww1Y0mpYujM6fVA40+rLW9PDFWY5
 A9w1AGlogA7YnHYY17hREHZtcProhTLfa/qrRLI0kGgI/GDDQXMK+BfKh
 0WmJjBE+LofsRxKq3gBn1iHtfu74pOJIe8QwhfEruMyQX7Zy0W+/PP80/
 3OGX1oFueH4sHaHNM6cFZwHH6gdkzofgNMfqRLtshzmhNIBW1zPURmYW+
 3ac6qI8VY0Pkfrgm1nMbu8pskVVnpPigrNLRM0uq9s+Xr1gQ+M867JNAz Q==;
X-CSE-ConnectionGUID: YfDvzY2PQTeta//k1egDdA==
X-CSE-MsgGUID: hKACx5UPRziNo4KYv3bmew==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77252089"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="77252089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:54:18 -0700
X-CSE-ConnectionGUID: zi9iLPlKS9aEwsP2K6eRWw==
X-CSE-MsgGUID: LB2xtXiITEO8Hkrn/EZTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="178536689"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:54:16 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/4] tests/kms_color: limit iterations in simulation
Date: Wed, 10 Sep 2025 14:30:58 +0530
Message-Id: <20250910090059.351698-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250910090059.351698-1-swati2.sharma@intel.com>
References: <20250910090059.351698-1-swati2.sharma@intel.com>
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

Skip exhaustive CTM and deep color subtests when running in
simulation to reduce runtime while preserving coverage.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 447fcc7f9..c424083b7 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -1151,6 +1151,8 @@ run_tests_for_pipe(data_t *data)
 							       ctm_tests[i].fb_colors,
 							       ctm_tests[i].ctm,
 							       ctm_tests[i].iter);
+				if (igt_run_in_simulation())
+					break;
 			}
 		}
 	}
@@ -1162,6 +1164,9 @@ run_tests_for_pipe(data_t *data)
 	igt_subtest_with_dynamic("deep-color") {
 		for_each_pipe(&data->display, pipe) {
 			run_deep_color_tests_for_pipe(data, pipe);
+
+			if (igt_run_in_simulation())
+				break;
 		}
 	}
 }
-- 
2.25.1

