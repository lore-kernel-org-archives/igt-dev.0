Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2235E10E0DC
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:23 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 05/15] tests/kms_big_fb: Test async flips + linear on
 tgl+
Date: Fri, 22 Dec 2023 16:31:49 +0200
Message-ID: <20231222143159.24662-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
References: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
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
