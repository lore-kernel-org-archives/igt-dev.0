Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B3C6E51C
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 16:50:50 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id z68so7066966qkc.4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2020 08:50:47 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Fri, 13 Nov 2020 11:49:40 -0500
Message-Id: <20201113164940.48427-3-jcline@redhat.com>
In-Reply-To: <20201113164940.48427-1-jcline@redhat.com>
References: <20201113164940.48427-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_addfb_basic: Relax errno
 assertions
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

This adjusts the check on failed calls to DRM_IOCTL_MODE_ADDFB2 in
various scenarios. According to the kernel's
drm_mode_config_funcs.fb_create documentation, a negative return code is
all that is required to signal failure, and different drivers return
different errors in these scenarios.

Particularly, Nouveau returns -ERANGE rather than -EINVAL in scenarios
where the buffer is too small for the proposed configuration.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_addfb_basic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 0ec583fe..b284bfc1 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -282,7 +282,7 @@ static void pitch_tests(int fd)
 		igt_subtest_f("bad-pitch-%i", bad_pitches[i]) {
 			f.pitches[0] = bad_pitches[i];
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
-				   errno == EINVAL);
+				   errno != 0);
 		}
 	}
 
@@ -413,11 +413,11 @@ static void size_tests(int fd)
 	f_8.width++;
 	igt_subtest("too-wide") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
 	}
 	f.width--;
 	f_16.width--;
@@ -427,17 +427,17 @@ static void size_tests(int fd)
 	f_8.height++;
 	igt_subtest("too-high") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
 	}
 
 	f.handles[0] = gem_bo_small;
 	igt_subtest("bo-too-small") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
 	}
 
 	/* Just to check that the parameters would work. */
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
