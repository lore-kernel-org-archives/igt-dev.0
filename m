Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD46310E5FB
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 17:59:59 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/12] tests/kms_big_fb: Test async flips + linear on
 tgl+
Date: Wed, 20 Dec 2023 19:59:27 +0200
Message-ID: <20231220175934.22849-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20231220175934.22849-1-ville.syrjala@linux.intel.com>
References: <20231220175934.22849-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

i915 claims to support linear+async flips on TGL+,
so let's test that here as well.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_big_fb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 6393504be7d7..75b0c4758743 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -930,7 +930,8 @@ static bool has_async_flip(data_t *data)
 	 * TODO: preferably probe all this stuff with
 	 * TEST_ONLY rather than hardcoding it...
 	 */
-	if (data->modifier == DRM_FORMAT_MOD_LINEAR)
+	if (intel_display_ver(data->devid) < 12 &&
+	    data->modifier == DRM_FORMAT_MOD_LINEAR)
 		return false;
 
 	return igt_has_drm_cap(data->drm_fd, DRM_CAP_ASYNC_PAGE_FLIP);
-- 
2.41.0
