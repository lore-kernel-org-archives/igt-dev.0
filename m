Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9FBCDE02A
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 18:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4327010EBCD;
	Thu, 26 Sep 2024 18:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnhYeleo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046F810EBCC
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 18:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727374359; x=1758910359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tECIkr8h1q17P8Xhe8Kr/q2wcxsDECo3cWZBlgjlWcU=;
 b=TnhYeleoM9bm3jkOztKl1aiom0cAc4UAGVqXr190tHYCH+dD6dp5aSa+
 JgeX8T1nOsR5gLCwlUwhjJFSM8Mlav00oluYKzu8A7Yg2x/qbQl4V2eQp
 sEkdlQK7Xk6Tu566NyFB3CtXBv4D0+txhX7oNsMBrjTgTfjWf2IQvsCPn
 LbNHGhQO1QYJiMF7fzR9w6nXh+BnJdoWEmgll5ZKl1ZquT/9hs39i7AXf
 oPajGQSmb8bMokoPjoLXw+yNI0YPStrbKECO3Ky+E/wt4VpbNoBqBgTEJ
 HHGcvn3zcz5k+KCgBqbzh6sjww/Pk9j2KnENan2p5RuIb/TaH+YWvSLzR Q==;
X-CSE-ConnectionGUID: GNZoRIXhTQ6P6cGuwUUtnQ==
X-CSE-MsgGUID: meE1h+rJTBea70iWh91ofg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26303768"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26303768"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 11:12:38 -0700
X-CSE-ConnectionGUID: vDNnXM7dRTS4OZj9MxRoIQ==
X-CSE-MsgGUID: irJ7G1r0Q8qnZUH05a4ApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="76327215"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 11:12:36 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 2/3] tests/kms_plane_scaling: Improve error handling
 in kms_plane_scaling tests
Date: Thu, 26 Sep 2024 23:41:49 +0530
Message-ID: <20240926181150.2148704-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240926181150.2148704-1-ramanaidu.naladala@intel.com>
References: <20240926181150.2148704-1-ramanaidu.naladala@intel.com>
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

Refactor error handling in test_planes_scaling_combo to use break
statements instead of immediate returns. This ensures cleanup_fbs
is always called before exiting the loop. Additionally, adjust log
message formatting in igt_main_args for consistency.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 96ceedee2..a55720ed9 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -998,12 +998,12 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 							  pipe, output, p1, p2,
 							  &d->fb[1], &d->fb[2],
 							  test_type);
-			if (ret != 0) {
-				cleanup_fbs(d);
-				return ret;
-			}
+			if (ret != 0)
+				break;
 		}
 		cleanup_fbs(d);
+		if (ret == 0)
+			break;
 	}
 	return ret;
 }
@@ -1543,7 +1543,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 								scaler_with_2_planes_tests[index].test_type);
 							if (ret == 0)
 								break;
-							igt_info("Required Scaling operation not supported on %s trying on next output\n",
+							igt_info("Required scaling operation not supported on %s trying on next output\n",
 								 igt_output_name(output));
 						}
 						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-- 
2.43.0

