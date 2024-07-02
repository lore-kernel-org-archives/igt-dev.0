Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F50C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDF410E501;
	Tue,  2 Jul 2024 23:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhiglFnE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE7910E501
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719963000; x=1751499000;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=amGYvdiojWzvgRQVMQDoxhf2IKKKIHIozt4u5iPZpa8=;
 b=KhiglFnE/EnDBgvAHZGs+PWag0rv8Ys4L9zVYWQRessBN+GVhrdpZ6LU
 dpLAODtc5rra4uzZkkFXF7J8iKoiLVcyMMNMQmOfXiY4Tm0G1y6J4OT9C
 3dX/d/3gnsW0iVDBCghf1MM+NrHa/uXqO4WOSPpvBrr12UzYMgs/VRGwy
 eR6ondfsz9IGSTfB/zkHZuCokEk2GvAtln0YDolsrTHnQzRtADLVqcTnT
 VI21k8aYvJWpHTSNL6XqzKk5vIG23o04CEPjFvSS5ymaKmO/g/X8/WnJC
 MsZ6ZL0SQRlDx/1xvkVXE+LjRp1gBFq+T7ijQvu6/61a3rCn2+I8jv9QF Q==;
X-CSE-ConnectionGUID: RIR1kfWbQa+LjK6aDc7H0Q==
X-CSE-MsgGUID: Ja+U1n7GQ5eC9Hhi3KAnzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559714"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559714"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:30:00 -0700
X-CSE-ConnectionGUID: fZlsciu2Rs2cgAFoVla8bQ==
X-CSE-MsgGUID: yMFRxk7BT22nNQk/qlUizQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043943"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 36/37] tests/kms_ccs: Skip testing on identical plane
 types
Date: Wed,  3 Jul 2024 02:28:16 +0300
Message-ID: <20240702232817.31147-37-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 60d8dc132105..8d3932de093e 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -977,6 +977,24 @@ static int test_ccs(data_t *data)
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
@@ -1025,6 +1043,9 @@ static void test_output(data_t *data, const int testnum)
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

