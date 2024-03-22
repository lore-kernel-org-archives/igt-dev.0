Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69F5C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632BA10E45B;
	Fri, 22 Mar 2024 20:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PPbJVLTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8456210E3FA
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711139850; x=1742675850;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sCBxtuW75AIqoK0Tsz3Ox4Qv4ALNndfYeZuHL+Lyb0M=;
 b=PPbJVLTS5Iz1SQsKqTBQK2V6iw7fKx/J8V1KqSsHm8yweqeYLogUe5Fx
 gj6i1GoEj4ksliK8KCQ37I0OTVJOz+4ffCKx88UX+h6qki0vJpKkP38Si
 H3e9aukqLbH82EoBDmOXUP6g8nyYh1d8PZ67sEBKkk/hNHObkSL69Bsm4
 DJDaN82QuQJCv4CYbrZ1J7rfZNrWJqfC3uhFVRsIgqNDI3Yjgy8Gb7CzC
 ywc4/PumoMBakQFGViXhVWG2pX/WRAXUWPXsgxJS2UExCrQHITgPMckYR
 x8fMuJU83I0m8OToFe9/7iLS22fWJReGDuyHYfHGCoPxgFj0PS6+ha8DT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329071"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329071"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783607"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783607"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:37:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:37:26 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/kms_async_flips: Extend the "async flip needs
 an extra frame" logic
Date: Fri, 22 Mar 2024 22:37:25 +0200
Message-ID: <20240322203726.16637-1-ville.syrjala@linux.intel.com>
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
 tests/kms_async_flips.c | 46 +++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 18 deletions(-)

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
+			if (async_flip_needs_extra_frame(data)) {
+				ret = drmModePageFlip(data->drm_fd, data->crtc_id,
+						      data->bufs[frame % NUM_FBS].fb_id,
+						      flags, data);
 
-				if (IS_GEN9(devid) || IS_GEN10(devid) || AT_LEAST_GEN(devid, 12)) {
-					ret = drmModePageFlip(data->drm_fd, data->crtc_id,
-							      data->bufs[frame % NUM_FBS].fb_id,
-							      flags, data);
+				igt_assert(ret == 0);
 
-					igt_assert(ret == 0);
-
-					wait_flip_event(data);
-				}
+				wait_flip_event(data);
 			}
 		}
 
-- 
2.43.2

