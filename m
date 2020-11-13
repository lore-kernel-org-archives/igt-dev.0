Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AADD6E53C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 16:50:44 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id v134so7009001qka.19
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 08:50:41 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Fri, 13 Nov 2020 11:49:39 -0500
Message-Id: <20201113164940.48427-2-jcline@redhat.com>
In-Reply-To: <20201113164940.48427-1-jcline@redhat.com>
References: <20201113164940.48427-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_addfb_basic: Mark Intel-only
 tests as such
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
To: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Several tests in the addfb suite only apply to i915 devices. Mark them
as such so these tests are skipped on non-Intel devices.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_addfb_basic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 9455909c..0ec583fe 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -572,6 +572,7 @@ static void addfb25_ytile(int fd)
 
 	igt_subtest("addfb25-y-tiled-legacy") {
 		igt_require_fb_modifiers(fd);
+		igt_require_intel(fd);
 
 		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Y_TILED;
 		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) ==
@@ -583,6 +584,7 @@ static void addfb25_ytile(int fd)
 
 	igt_subtest("addfb25-yf-tiled-legacy") {
 		igt_require_fb_modifiers(fd);
+		igt_require_intel(fd);
 
 		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Yf_TILED;
 		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) ==
@@ -594,6 +596,7 @@ static void addfb25_ytile(int fd)
 
 	igt_subtest("addfb25-y-tiled-small-legacy") {
 		igt_require_fb_modifiers(fd);
+		igt_require_intel(fd);
 
 		gen = intel_gen(intel_get_drm_devid(fd));
 		igt_require(gen >= 9);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
