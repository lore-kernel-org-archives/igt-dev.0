Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1AAF8D74B
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 14:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1581510E8CE;
	Thu, 16 Apr 2026 14:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOizmZiW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6F210E8CE
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776348827; x=1807884827;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rThzxwHvY8pAalxe7lTgDzPcaQwcvLMy+leo5KMFc0k=;
 b=mOizmZiWwUzIckKC5hFplcBaA++aGAKpYL7isQpv27Bj3WCnVRT6lknb
 VqJswfVZQxENzEa/52x7ugXlYDQwwnD8UT3mk4tb3e9vocnedgbyBDvAZ
 MnJZ0+uxchLf12pu3dzahAEdoj9LUMbee/kFva6fqwYiNeKfyjo/O7ueL
 HpTA/fMpg9cnEypDAdA86jdRpBWd1vWY639mIwHxelq0y8NEQSRHdQGe9
 ADXC1bMbZTCDXXI3oNZiqKb2fOr6NpLAm4dt+9oRqGU473im7NV9NW7uV
 umo13H5c/XVypkc0BOo+Z+8VK/iokCN3ynoRdNETh1z7LnkBtf8Vu5M7H A==;
X-CSE-ConnectionGUID: K8FX1bK4ReeJxXrMNkE8DQ==
X-CSE-MsgGUID: zufwBa+mR6K3FT1ip3TDjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88731152"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88731152"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 07:13:47 -0700
X-CSE-ConnectionGUID: 6VNd3TjlRl6v9yjRmJGkHA==
X-CSE-MsgGUID: 8v1XwEepTPuAKVmOLq9gTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="226410283"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 07:13:46 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] tests/kms: Use for_each_plane_format()
Date: Thu, 16 Apr 2026 17:13:34 +0300
Message-ID: <20260416141334.20086-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
References: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Replace the open coded copies of for_each_plane_format()
with the real thing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane_scaling.c | 8 ++++----
 tests/kms_rotation_crc.c  | 7 +++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index fde8b8370c9f..90dc5593579f 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -800,16 +800,16 @@ test_scaler_with_pixel_format_crtc(data_t *d, double sf_plane,
 
 	for_each_plane_on_crtc(crtc, plane) {
 		struct igt_vec tested_formats;
+		int iteration = 0;
+		uint32_t format;
 
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
 		igt_vec_init(&tested_formats, sizeof(uint32_t));
 
-		for (int j = 0; j < plane->drm_plane->count_formats; j++) {
-			uint32_t format = plane->drm_plane->formats[j];
-
-			if (!test_crtc_iteration(d, crtc, j))
+		for_each_plane_format(plane, format) {
+			if (!test_crtc_iteration(d, crtc, iteration++))
 				continue;
 
 			if (test_format(d, &tested_formats, format) &&
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4420053f1c6d..4a249ed21801 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -606,7 +606,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 
 	for_each_crtc_with_valid_output(display, crtc, output) {
 		igt_plane_t *plane;
-		int i, j, c;
+		int i, c;
 
 		igt_display_reset(display);
 
@@ -678,12 +678,11 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 
 			if (!data->override_fmt) {
 				struct igt_vec tested_formats;
+				uint32_t format;
 
 				igt_vec_init(&tested_formats, sizeof(uint32_t));
 
-				for (j = 0; j < plane->drm_plane->count_formats; j++) {
-					uint32_t format = plane->drm_plane->formats[j];
-
+				for_each_plane_format(plane, format) {
 					if (!test_format(data, &tested_formats, format))
 						continue;
 
-- 
2.52.0

