Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E7389FAD
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jun 2021 09:41:59 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 30 Jun 2021 12:43:04 +0300
Message-Id: <20210630094304.1230608-1-mika.kahola@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Skip 90/270
 rotation for ADL-P
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

ADL-P platform doesn't support 90/270 rotation. Let's skip to test
with these rotations.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_plane_scaling.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 2aa46ac8..1dad2e60 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -165,6 +165,10 @@ static bool can_rotate(data_t *d, unsigned format, uint64_t tiling,
 	if (!is_i915_device(d->drm_fd))
 		return true;
 
+	if (intel_display_ver(d->devid) >= 13 &&
+		(rot == IGT_ROTATION_90 || rot == IGT_ROTATION_270))
+		return false;
+
 	switch (format) {
 	case DRM_FORMAT_RGB565:
 		if (intel_display_ver(d->devid) >= 11)
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
