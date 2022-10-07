Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA65410E2E0
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 13:40:35 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Oct 2022 16:40:28 +0300
Message-Id: <20221007134029.3188-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20221007134029.3188-1-ville.syrjala@linux.intel.com>
References: <20221007134029.3188-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] Revert "tests/kms_invalid_mode: Avoid
 usage of same pipe on multiple outputs"
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

This reverts commit 52c06782816c1dfaf721308d70d9dca83f7eff16.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_invalid_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 0ae98a31fcc2..21ee91abf54b 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -185,7 +185,6 @@ test_output(data_t *data)
 	int ret;
 	drmModeModeInfo *mode;
 
-	igt_display_reset(&data->display);
 	igt_output_set_pipe(output, data->pipe);
 
 	igt_create_fb(data->drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
@@ -203,6 +202,7 @@ test_output(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_output_override_mode(output, NULL);
 	/*unset_all_crtcs*/
+	igt_display_reset(&data->display);
 	igt_display_commit(&data->display);
 }
 
-- 
2.35.1
