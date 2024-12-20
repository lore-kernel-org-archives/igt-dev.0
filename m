Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B47E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 03:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B1D10E0BB;
	Fri, 20 Dec 2024 03:30:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzVMCEqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E574110E0BB
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 03:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734665399; x=1766201399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qEutZK569OjRGfOi9IV8Ybnme/uXatdEbMohsvwx5po=;
 b=dzVMCEqFit6h5J1jwBG6C9IiGV2HkI8y+PESLUzaVOoIzsYPVyX2w9s+
 k6PZAvzYUp8N5IH7EzhqTIYTuNXMzkJ6uLi4H/6Y8s1gmPWmZdwGFcIWt
 C7zLXZw526K/CN8aBsc3PPItq68qz/6+qbuIAFIxTSrRVoxF7bGGVckmX
 58/3G7StQikAiaWIV142NzIH9iec8kqBJAlrlA84aiVaQ3Bw80USit8Oz
 cuJqZ7+BjMbCAIncLIQg1Ztcgm8f7hm6MjSQ5M/InSASjhjYCY7pXVVuu
 IUYaMfc7y6riWBXI/GRGzxnhiH63WDdjYXuMI4ZhBs25BlyDmPSque8hQ g==;
X-CSE-ConnectionGUID: DZdxdqumSdar3d/vns8UuA==
X-CSE-MsgGUID: yk/nPv7mTGiM4avPyP8R8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35101166"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="35101166"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 19:29:59 -0800
X-CSE-ConnectionGUID: 5Eea6MXGTuSZwO+NgE6C7A==
X-CSE-MsgGUID: u+dWt1zDQNuCOxzpiQ+1aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98292613"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa009.jf.intel.com with ESMTP; 19 Dec 2024 19:29:58 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jeevan.b@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Add more logs to
 skips/failure
Date: Fri, 20 Dec 2024 09:00:42 +0530
Message-Id: <20241220033042.2394330-1-pranay.samala@intel.com>
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

Having some logs for test failures and skips would
make debugging much easier.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 7dc07bc83..7c66ce398 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -633,7 +633,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 		igt_plane_set_prop_enum(primary, IGT_PLANE_SCALING_FILTER,
 					kmstest_scaling_filter_str(flags));
 	} else {
-		igt_debug("Plane scaling filter prop not supported on gen < 11, running with default\n");
+		igt_info("Plane scaling filter prop not supported on gen < 11, running with default\n");
 	}
 
 	igt_skip_on_f(!igt_plane_has_format_mod(primary, data->small_fb.drm_format, data->small_fb.modifier) ||
-- 
2.34.1

