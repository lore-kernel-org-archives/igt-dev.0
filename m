Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A61E65D29
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 05:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEDB10EAC5;
	Fri, 22 Nov 2024 05:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7j7huph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0044F10EAC5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 05:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732253607; x=1763789607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZzJwCE6RMv15Gf4i352itDzDRaPNjIfqGcf8yEgkiv8=;
 b=G7j7huph5nSChwOj7+7voRO9yX60dZ/UxG1PytHsdxy1Itis3YM3cOL6
 9j3J5QEQdp/6RMXHDasZYowWFcfcKw4phtCVYV7f29HLjjL0E1WU+fiXv
 hdPGTVnIdHndXnCuZdwI2mtkqL2v+1gsPLauPR9jS4lnbFMgQ5dY63tH6
 3qyFBQG4wO3VgCbOkvNnOlYgokd5ZWzSoPNXn8ewTGLtr55Q00HKwppTh
 eRuyG1e7Gg8a8lTNa4wXftR9X/7yMS/66N54G7WZsaD9NSqhS43FpSX6/
 s/RwyYmmoCzzmtg4K5MB5kcy9QLbJ0WeHH5iUUUQYjZx0RrYPW+DVJO4o Q==;
X-CSE-ConnectionGUID: 99O5R7pYR+C93wrlK4Jjkw==
X-CSE-MsgGUID: G/E5wbW5S0epJj5Vd0F+7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43040398"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="43040398"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 21:33:27 -0800
X-CSE-ConnectionGUID: SGVmKhL2SgKGmSNjBwQ86A==
X-CSE-MsgGUID: 2hezJ8kYTtCWUzKUDdbJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="113753610"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2024 21:33:25 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 1/2] tests/intel/kms_big_fb: Intel display version 20
 onwards doesn't do hflip with tile4
Date: Fri, 22 Nov 2024 11:03:59 +0530
Message-Id: <20241122053400.1931176-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122053400.1931176-1-pranay.samala@intel.com>
References: <20241122053400.1931176-1-pranay.samala@intel.com>
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

Intel display version 20 onwards, Tile4 no longer can be used with
horizontal flip.

Bspec: 69853

v2: Fix the shadowing global declaration warn (Jeevan)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_big_fb.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 7da3d12d4..67ab85852 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -965,6 +965,19 @@ static const struct {
 	{ 0, "" },
 	{ IGT_REFLECT_X, "-hflip" },
 };
+
+static bool test_requirements(data_t *input_data, int l)
+{
+	/* Intel display version 20 onwards cannot do reflect-x with tile4 */
+	if (!(!is_intel_device(input_data->drm_fd) ||
+	      intel_display_ver(intel_get_drm_devid(input_data->drm_fd)) < 20 ||
+	      !(fliptab[l].flip == IGT_REFLECT_X &&
+	      input_data->modifier == I915_FORMAT_MOD_4_TILED)))
+		return false;
+
+	return true;
+}
+
 igt_main
 {
 	igt_fixture {
@@ -1123,6 +1136,8 @@ igt_main
 					igt_describe("test async flip on maximum hardware supported stride length for given bpp and modifiers.");
 					igt_subtest_f("%s-max-hw-stride-%dbpp-rotate-%d%s-async-flip", modifiers[i].name,
 						formats[j].bpp, rotations[k].angle, fliptab[l].flipname) {
+							igt_require_f(test_requirements(&data, l),
+								      "Can't use reflect-x with Tile4 on intel display version 20+\n");
 							igt_require(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP));
 							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
 							test_scanout(&data);
-- 
2.34.1

