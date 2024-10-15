Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B598D216AA
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 13:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2915310E58E;
	Tue, 15 Oct 2024 13:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUQRxBEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C958D10E58E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729000675; x=1760536675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zvsayTHfkn5p5yHLiOkrjQt8o05JA1u+qqyfTTv3pKU=;
 b=RUQRxBECyY01xw4peX2ITFrxapzYkvyoYRqXYSZ3pTZfOJSnW2wn4SUe
 ql/cAMr9ad8jlFgvAA6YMCGP6ELFlZYqax99BFKi5TF5E+fACs9htZU6E
 l4DwgfxJsk4VxZDbWFCbf3EOlUI7z22p8dBspMyOyrivfExhbDYJD8M+v
 1bwPX1NZhj2KdPp6B0gdZeQHzIIhtx5aTgJXknwcqES7Qm181aeZ4svIM
 /BfQ31TlVt6ScZlrhJHfvmCjDbCQb7XMUvls9idqEbINq2vqDRdw3l1m5
 BfU8rfzDFrw/sgITFwqBXuEwWCub6fkz9a0iHGsCZpF+4hlSsJjrNwJgM Q==;
X-CSE-ConnectionGUID: ed/UQhyvRoyEwNUGOaTwLg==
X-CSE-MsgGUID: u9tkdWQcQ+iY3jE4ntZqeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28494412"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28494412"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 06:57:55 -0700
X-CSE-ConnectionGUID: 8sKtVAu6Tlu5z2Z6y0IFMg==
X-CSE-MsgGUID: VcuUQ1yPRnOe9knNVKbNJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77788286"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 06:57:53 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t v6 2/2] tests/kms_plane_scaling: Improve error handling
 in kms_plane_scaling tests
Date: Tue, 15 Oct 2024 19:26:54 +0530
Message-ID: <20241015135654.2328448-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241015135654.2328448-1-ramanaidu.naladala@intel.com>
References: <20241015135654.2328448-1-ramanaidu.naladala@intel.com>
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

