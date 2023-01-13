Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F24C10E0C7
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jan 2023 20:40:41 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y205so6444029iof.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jan 2023 12:40:41 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jan 2023 13:40:32 -0700
Message-Id: <20230113133929.1.I536fe5414d54f6ab9aac42c2c702fc8fc481f7f9@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/kms_plane_scaling: Free leaking fbs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Drew Davenport <ddavenport@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When kms_plane_scaling is run without specifying a subtest, the last
several subtests fail due to "Too mange scaling requests". However, each
subtest would pass when run individually (i.e. with --run-subtest). This
seems to be related to fbs allocated for the invalid-num-scalers test
not being released.

Auditing the rest of the test cases shows that the fbs created in
test_scaler_with_multi_pipe_plane are not being released either, so
ensure those are released as well.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>

---

 tests/kms_plane_scaling.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 4c621cce..be3c8dca 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -366,6 +366,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_position(plane, 0, 0);
+	igt_remove_fb(display->drm_fd, &d->fb[0]);
 
 	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
 		      "Unsupported scaling factor with fb size %dx%d\n",
@@ -814,6 +815,11 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_plane_set_fb(plane[2], NULL);
 	igt_plane_set_fb(plane[3], NULL);
 
+	igt_remove_fb(display->drm_fd, &d->fb[0]);
+	igt_remove_fb(display->drm_fd, &d->fb[1]);
+	igt_remove_fb(display->drm_fd, &d->fb[2]);
+	igt_remove_fb(display->drm_fd, &d->fb[3]);
+
 	igt_skip_on_f(ret1 == -ERANGE || ret1 == -EINVAL ||
 		      ret2 == -ERANGE || ret1 == -EINVAL,
 		      "Scaling op is not supported by driver\n");
-- 
2.39.0.314.g84b9a713c41-goog
