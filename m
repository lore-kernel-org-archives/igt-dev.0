Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AE16E7DD
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Sep 2021 16:45:42 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu,  2 Sep 2021 19:45:06 +0300
Message-Id: <20210902164508.20104-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20210902164508.20104-1-ville.syrjala@linux.intel.com>
References: <20210902164508.20104-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/11] tests/kms_big_fb: Check whether the
 rotation is supposed in the async flip test
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Don't corrupt the plane state with some totally unsupported
rotation. Doing so causes subseuqenct subtests to just fail
on account of that bad rotation state leaking between the
subtests.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_big_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index 6be3062bd335..d38c24a70d2b 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -489,6 +489,7 @@ max_hw_stride_async_flip_test(data_t *data)
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 
+	igt_require(igt_plane_has_rotation(primary, data->rotation));
 	igt_plane_set_rotation(primary, data->rotation);
 
 	igt_require_f(igt_display_try_commit2(&data->display, COMMIT_ATOMIC) == 0,
-- 
2.31.1
