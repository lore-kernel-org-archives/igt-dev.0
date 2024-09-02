Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7972CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CED10E33D;
	Mon,  2 Sep 2024 14:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLKiAbf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB9810E33E
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287945; x=1756823945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OjDvFH2fmGAvrZgOS0wjai3rzYCkRC35HzUCbqNsTjo=;
 b=KLKiAbf8/y7tAboTpXniaTYFaKC60Y5ipv4jX2XmzvmYpuaQbwjfUTGj
 iyJaOyHJN9E5aXVGaD/WOwW9xUQIHIRYiB921Nn9+76mgrhSRqxBXSsEn
 wyI6n4THu2VY+k4jGkXFPxFL1mKPJnx23mihlJigbr/RTzqWpeEu8dSSP
 h29WR5snn5GNl2VJdxcZXhwn5dJ6Fj3IhRJK074hRSvbUwHmKg/syU2fK
 wOQd/6kTWlJ8W6i3OkG9nwNALnQLsogDeKiugxbCnvQVGwCvjuNS1e1vy
 YepsVGG6hEXPTaPshSx0BFPgFUjNdiZ98Fr57rpFcyXv4Fny9ER/Nfs8s w==;
X-CSE-ConnectionGUID: DCrkqXTxS2GAyfBFeXHEkg==
X-CSE-MsgGUID: aK4MyGsxTVKfaH35twQmsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009535"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:39:05 -0700
X-CSE-ConnectionGUID: 2nSFynB0T6iWGbtdWS9jGA==
X-CSE-MsgGUID: 10jeEiJ9RZq7eQq78tGOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639521"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:39:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:39:02 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 22/23] tests/kms_ccs: Skip testing on identical plane
 types
Date: Mon,  2 Sep 2024 17:37:57 +0300
Message-ID: <20240902143758.21036-23-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

On icl+ each plane type (HDR,SDR UV,SDR Y) have identical
capabilities, so only test one plane of each type. Makes the
test quite a bit faster:

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 1036666de2b6..6409ad605f0d 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -946,6 +946,24 @@ static int test_ccs(data_t *data)
 	return valid_tests;
 }
 
+static bool skip_plane(data_t *data, igt_plane_t *plane)
+{
+	int index = plane->index;
+
+	if (intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 11)
+		return false;
+
+	/*
+	 * Test 1 HDR plane, 1 SDR UV plane, 1 SDR Y plane.
+	 *
+	 * Kernel registers planes in the hardware Z order:
+	 * 0,1,2 HDR planes
+	 * 3,4 SDR UV planes
+	 * 5,6 SDR Y planes
+	 */
+	return index != 0 && index != 3 && index != 5;
+}
+
 static void test_output(data_t *data, const int testnum)
 {
 	uint16_t dev_id;
@@ -996,6 +1014,9 @@ static void test_output(data_t *data, const int testnum)
 						igt_display_require_output_on_pipe(&data->display, data->pipe);
 
 						for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+							if (skip_plane(data, data->plane))
+								continue;
+
 							for (int j = 0; j < ARRAY_SIZE(formats); j++) {
 								data->format = formats[j];
 								valid_tests += test_ccs(data);
-- 
2.44.2

