Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF82D43FEC
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 08:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A5B10E443;
	Mon, 18 Nov 2024 08:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2lAgOQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9D010E43D
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 08:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731917876; x=1763453876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YzfIHrWVNDUq7vfGyqyNsn3bg8Gg4zDwHftNTG/lRxM=;
 b=m2lAgOQLqGqlaPA7TnfW8c0vqgQcrONBmBKbj2RNsY4XLyZhV73V7Bto
 M26EnLwwJT+M8B7ruQSqPc0coHOEXAQ0w1iCDnjnBtXGso905/WYPW1UI
 qySt70Vp2qTb7jOGXECOUHto7pMhfL3rcXq79LyzfOEJf6KefIzQl11lP
 xb9tHZRdkkLX+uK3dwVT/M8QWVl6AXqTSx4qgRtYEx2m4pKJXahaT+P1O
 yXD/PU0PbHVh9dH9fXrEvmyieuKqgH5DZXNdMLW4TqqS2MiLp4Yucd0DZ
 sp88AWwqiNmD1na0D/JMSSCSmydyrnH9VwSxS0xldCkbDsgJwqoukLQUC A==;
X-CSE-ConnectionGUID: XhM1/dx8QEGpRETy93WoYw==
X-CSE-MsgGUID: 1b5R5bn7Q/WlxziEMQtxKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="19474112"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="19474112"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 00:17:56 -0800
X-CSE-ConnectionGUID: N8inapRXQcWj7/F4uLfuNw==
X-CSE-MsgGUID: pwBKqUzJSEuBM+wBxUaKSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="94098436"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa005.jf.intel.com with ESMTP; 18 Nov 2024 00:17:54 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/kms_big_fb: Intel display version 20
 onwards doesn't do hflip with tile4
Date: Mon, 18 Nov 2024 13:48:27 +0530
Message-Id: <20241118081828.1895925-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118081828.1895925-1-pranay.samala@intel.com>
References: <20241118081828.1895925-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_big_fb.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 7da3d12d4..ab44a9a42 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -965,6 +965,19 @@ static const struct {
 	{ 0, "" },
 	{ IGT_REFLECT_X, "-hflip" },
 };
+
+static bool test_requirements(data_t *data, int l)
+{
+	/* Intel display version 20 onwards cannot do reflect-x with tile4 */
+	if (!(!is_intel_device(data->drm_fd) ||
+	      intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 20 ||
+	      !(fliptab[l].flip == IGT_REFLECT_X &&
+	      data->modifier == I915_FORMAT_MOD_4_TILED)))
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

