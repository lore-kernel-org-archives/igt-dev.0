Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722B7C54E71
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 20:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB7F10E025;
	Tue, 19 Mar 2024 20:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRr1ZtS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FD810E025
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 20:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710879887; x=1742415887;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IzSMUAa5BZuqV1sQ1F6YjqFnsutLLnQBG+bos7k64vw=;
 b=cRr1ZtS1hGvWrpsXBJ1ihJ5Z6wbq3DoWkHdxGVkezKkJRE4FiofmSXl+
 EV5pDTMdx2I7Rf6EvpiDHFlCWZhoEx2VXrOJuIIfGyyE+he+FI91LtonN
 9q4pRnAUIibZ3s5iAjf9kmI0Obb5n9kBSys9bZ7O1dEYYrSs9l8qD4sv9
 F/e4D09onh1GPW3StmbmqWdhiv6aJcppuBkGiq2cM8QXNUK5+8U3OKUaJ
 4PBlVq7X9Fl1eIp3xU9YmcOCDKLuFEwZWgrWf5tr+FWW37tIKYJxk4MXy
 OheFsFr3IHOpXFmCMCgWsLi0IHjUdPDPR3O19w82QYHBub753Idubmi58 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5989719"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5989719"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 13:24:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="827782308"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="827782308"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 19 Mar 2024 13:24:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Mar 2024 22:24:43 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/kms_async_flips: Extend the "async flip needs an
 extra frame" logic
Date: Tue, 19 Mar 2024 22:24:43 +0200
Message-ID: <20240319202443.27951-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

Soon i915 will be converting the first async flip always to
a sync flip on SKL+. The reason being that Xorg/modesetting
typically attempts to change the modifier when it issues the
first async flip, and we can't do that with an actual async
flip.

Extend the logic to consider all platforms that need the
extra frame, which will now be:
- BDW-GLK due to the async flip hw double buffer fail
- SKL+ to change the modifier
- ADL+ to optimize watermarks/DDB

Note that the 'AT_LEAST_GEN(devid, 12)' already included
TGL in this logic despite the kernel not actually forcing
any sync flips on it previously. So only ICL was being
correctly excluded here. Also BDW wasn't being included
despite needing it due to the double buffer fail.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_async_flips.c | 50 ++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2895168f7dc7..efbc8778d7e1 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -233,6 +233,28 @@ static void test_init_fbs(data_t *data)
 	igt_plane_set_size(data->plane, width, height);
 }
 
+static bool async_flip_needs_extra_frame(data_t *data)
+{
+	uint32_t devid;
+
+	if (!is_intel_device(data->drm_fd))
+		return false;
+
+	devid = intel_get_drm_devid(data->drm_fd);
+
+	/*
+	 * On BDW-GLK async address update bit is double buffered
+	 * on vblank. So the first async flip will in fact be
+	 * performed as a sync flip by the hardware.
+	 *
+	 * In order to allow the first async flip to change the modifier
+	 * on SKL+ (needed by Xorg/modesetting), and to optimize
+	 * watermarks/ddb for faster response on ADL+, we convert the
+	 * first async flip to a sync flip.
+	 */
+	return intel_display_ver(devid) >= 9 || IS_BROADWELL(devid);
+}
+
 static void test_async_flip(data_t *data)
 {
 	int ret, frame;
@@ -259,26 +281,14 @@ static void test_async_flip(data_t *data)
 
 			flags |= DRM_MODE_PAGE_FLIP_ASYNC;
 
-			/*
-			 * In older platforms (<= Gen10), async address update bit is double buffered.
-			 * So flip timestamp can be verified only from the second flip.
-			 * The first async flip just enables the async address update.
-			 * In platforms greater than DISPLAY13 the first async flip will be discarded
-			 * in order to change the watermark levels as per the optimization. Hence the
-			 * subsequent async flips will actually do the asynchronous flips.
-			 */
-			if (is_intel_device(data->drm_fd)) {
-				uint32_t devid = intel_get_drm_devid(data->drm_fd);
-
-				if (IS_GEN9(devid) || IS_GEN10(devid) || AT_LEAST_GEN(devid, 12)) {
-					ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-							      data->bufs[frame % NUM_FBS].fb_id,
-							      flags, data);
-
-					igt_assert(ret == 0);
-
-					wait_flip_event(data);
-				}
+			if (async_flip_needs_extra_frame(data)) {
+				ret = drmModePageFlip(data->drm_fd, data->crtc_id,
+						      data->bufs[frame % NUM_FBS].fb_id,
+						      flags, data);
+
+				igt_assert(ret == 0);
+
+				wait_flip_event(data);
 			}
 		}
 
-- 
2.43.2

