Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25DD89FF9
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Aug 2021 03:40:37 +0000 (UTC)
From: maitreye <maitreye@codeaurora.org>
Date: Wed,  4 Aug 2021 20:40:22 -0700
Message-Id: <1628134823-27763-1-git-send-email-maitreye@codeaurora.org>
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: check device type before
 calling intel_get_drm_devid
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: maitreye <maitreye@codeaurora.org>, robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org, aravindh@codeaurora.org, abhinavk@codeaurora.org, khsieh@codeaurora.org, manasi.d.navare@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Check intel device type before calling intel_get_drm_devid
to avoid incorrect assertion failures while trying to use
create_bo_for_fb on non-intel targets. Otherwise it leads
to failures like below :

./msm_dp_compliance
found idx of failsafe mode = 17
(msm_dp_compliance:27338) intel_chipset-CRITICAL: Test assertion failure function
intel_get_drm_devid, file ../igt-gpu-tools-9999/lib/intel_chipset.c:132:
(msm_dp_compliance:27338) intel_chipset-CRITICAL:
Failed assertion: is_i915_device(fd)
(msm_dp_compliance:27338) intel_chipset-CRITICAL: Last errno: 2,
No such file or directory

Signed-off-by: maitreye <maitreye@codeaurora.org>
---
 lib/igt_fb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab52ea9..583cc9e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -836,9 +836,11 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		 * On ADL_P CCS color planes must be 2MB aligned, until remapping
 		 * support is added for CCS FBs.
 		 */
-		if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
-		    is_ccs_modifier(fb->modifier))
-			size = ALIGN(size, 2 * 1024 * 1024);
+		if (is_i915_device(fb->fd)) {
+			if (IS_ALDERLAKE_P(intel_get_drm_devid(fb->fd)) &&
+			is_ccs_modifier(fb->modifier))
+			size = ALIGN(size,2 * 1024 * 1024);
+               }
 
 		return size;
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
