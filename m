Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C3889EAE
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 02:32:00 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  6 Apr 2021 08:11:54 +0530
Message-Id: <20210406024154.4416-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_getfb.c : Added test description
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added test description.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_getfb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 8c59b8a9..5f4758c6 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -170,11 +170,14 @@ static void test_handle_input(int fd)
 		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
 	}
 
+	igt_describe("Tests error handling for a zero'd input.");
 	igt_subtest("getfb-handle-zero") {
 		struct drm_mode_fb_cmd get = { .fb_id = 0 };
 		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
 	}
 
+	igt_describe("Tests error handling when passing an valid "
+		     "handle.");
 	igt_subtest("getfb-handle-valid") {
 		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
 		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get);
@@ -187,12 +190,16 @@ static void test_handle_input(int fd)
 		gem_close(fd, get.handle);
 	}
 
+	igt_describe("Tests error handling when passing a handle that "
+		     "has been closed.");
 	igt_subtest("getfb-handle-closed") {
 		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
 		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add.fb_id);
 		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
 	}
 
+	igt_describe("Tests error handling when passing an invalid "
+		     "handle.");
 	igt_subtest("getfb-handle-not-fb") {
 		struct drm_mode_fb_cmd get = { .fb_id = get_any_prop_id(fd) };
 		igt_require(get.fb_id > 0);
@@ -218,6 +225,8 @@ static void test_duplicate_handles(int fd)
 		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
 	}
 
+	igt_describe("Tests error handling while requesting for two different "
+		     "handles from same fd.");
 	igt_subtest("getfb-addfb-different-handles") {
 		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
 
@@ -226,6 +235,8 @@ static void test_duplicate_handles(int fd)
 		gem_close(fd, get.handle);
 	}
 
+	igt_describe("Tests error handling while requesting for two different "
+		     "handles from different fd.");
 	igt_subtest("getfb-repeated-different-handles") {
 		struct drm_mode_fb_cmd get1 = { .fb_id = add.fb_id };
 		struct drm_mode_fb_cmd get2 = { .fb_id = add.fb_id };
@@ -238,6 +249,9 @@ static void test_duplicate_handles(int fd)
 		gem_close(fd, get2.handle);
 	}
 
+	igt_describe("Tests error handling while requesting CCS buffers "
+		     "it should refuse because getfb supports returning "
+		     "a single buffer handle.");
 	igt_subtest("getfb-reject-ccs") {
 		struct drm_mode_fb_cmd2 add_ccs = { };
 		struct drm_mode_fb_cmd get = { };
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
