Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3071DCEB2FD
	for <igt-dev@archiver.kernel.org>; Tue,  1 Oct 2024 05:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9184410E0C9;
	Tue,  1 Oct 2024 05:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lvoTdHS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38E10E0C9
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Oct 2024 05:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727761165; x=1759297165;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1gLdrjqCVNo7LmcDypZGMiMulKgZGW2OP7Iz8BdrdvM=;
 b=lvoTdHS6CyXtIUXdqhECNcXgzuLgzSoedYHy/qfKAS6ILFuNoUzRtlC/
 A9TIza2ONI2mKXWoYRZF0e9cC5C9/oCjDROijmHzIS5Hr6GD868pVIgwL
 +zErGAW4k+PLjCLf5Ez7ugSC9isuAssCYT8fJDtJXnKhYPSzskL1tklj6
 77GgNrSheqow8jPrTYIO7/ws/wuQeNZds8jbifHqmR6onHp8XpyaCiGTP
 oPwdkaNzJ49FgZzv2NaZHxONHHgRWEAAFYvqOtvfiNkWQFEVt6LFWBYIV
 sh1hP41hOaGHWNbaNxa2AqzbPCqx+EYxeKn1a4m2xrCl+tVPf1bkfKeRe w==;
X-CSE-ConnectionGUID: k6x1PtdxSBStlUzt7savwQ==
X-CSE-MsgGUID: PX5ngFCtTiit3airXj5qag==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27034826"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27034826"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:39:24 -0700
X-CSE-ConnectionGUID: ys2XyCKBRJ6/UDex7pfrfg==
X-CSE-MsgGUID: x9Kq2vyuRgyMY1BGeIxtiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="78395361"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 22:39:23 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_scaling: Improve error handling in
 kms_plane_scaling tests
Date: Tue,  1 Oct 2024 11:08:38 +0530
Message-ID: <20241001053838.2192132-1-ramanaidu.naladala@intel.com>
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

Refactor error handling in test_planes_scaling_combo to use break
statements instead of immediate returns. This ensures cleanup_fbs
is always called before exiting the loop. Additionally, adjust log
message formatting in igt_main_args for consistency.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_plane_scaling.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index bc9114acd..a76fb4ffd 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -997,12 +997,12 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
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
@@ -1542,7 +1542,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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

