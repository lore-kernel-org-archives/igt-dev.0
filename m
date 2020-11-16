Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D806E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2020 22:19:15 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id l67so11139814qte.6
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2020 14:19:12 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
Date: Mon, 16 Nov 2020 17:18:44 -0500
Message-Id: <20201116221844.82283-3-jcline@redhat.com>
In-Reply-To: <20201116221844.82283-1-jcline@redhat.com>
References: <20201113164940.48427-1-jcline@redhat.com>
 <20201116221844.82283-1-jcline@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_addfb_basic: add
 vendor-specific errno assertions
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This adjusts the check on failed calls to DRM_IOCTL_MODE_ADDFB2 in
various scenarios. According to the kernel's
drm_mode_config_funcs.fb_create documentation, a negative return code is
all that is required to signal failure, and different drivers return
different errors in these scenarios.

Particularly, Nouveau returns -ERANGE rather than -EINVAL in scenarios
where the buffer is too small for the proposed configuration.

In situations where Nouveau and Intel return codes diverge, this splits
up the test into a generic test asserting a non-zero error code,
followed by some vendor-specific assertions about its exact value.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
Changes since v1:
  - Added vendor-specific assertions for exact error numbers
  - Added igt_info statements to the generic test cases
  - Made use of do_ioctl_err() macro when possible

 tests/kms_addfb_basic.c | 64 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 6 deletions(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 0ec583fe..9b936584 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -278,11 +278,35 @@ static void pitch_tests(int fd)
 		f.fb_id = 0;
 	}
 
+	/* Generic invalid pitch tests; error numbers are driver-dependent */
 	for (i = 0; i < ARRAY_SIZE(bad_pitches); i++) {
-		igt_subtest_f("bad-pitch-%i", bad_pitches[i]) {
+		igt_subtest_f("generic-bad-pitch-%i", bad_pitches[i]) {
 			f.pitches[0] = bad_pitches[i];
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
-				   errno == EINVAL);
+				   errno != 0);
+			igt_info("invalid pitch %i resulted in errno %i\n",
+				 bad_pitches[i], errno);
+		}
+	}
+
+	/* Intel returns EINVAL in all invalid pitch scenarios */
+	for (i = 0; i < ARRAY_SIZE(bad_pitches); i++) {
+		igt_subtest_f("intel-bad-pitch-%i", bad_pitches[i]) {
+			igt_require_intel(fd);
+			f.pitches[0] = bad_pitches[i];
+			do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
+		}
+	}
+
+	/* Nouveau returns ERANGE for pitches that are too big */
+	for (i = 0; i < ARRAY_SIZE(bad_pitches); i++) {
+		igt_subtest_f("nouveau-bad-pitch-%i", bad_pitches[i]) {
+			igt_require_nouveau(fd);
+			f.pitches[0] = bad_pitches[i];
+			if (bad_pitches[i] > 4 * 1024)
+				do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, ERANGE);
+			else
+				do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
 		}
 	}
 
@@ -427,17 +451,45 @@ static void size_tests(int fd)
 	f_8.height++;
 	igt_subtest("too-high") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
+		igt_info("driver returned errno %i for framebuffer f\n", errno);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
+		igt_info("driver returned errno %i for framebuffer f_16\n", errno);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
+		igt_info("driver returned errno %i for framebuffer f_8\n", errno);
+	}
+
+	igt_subtest("intel-too-high") {
+		igt_require_intel(fd);
+		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
+		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f_16, EINVAL);
+		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f_8, EINVAL);
+	}
+
+	igt_subtest("nouveau-too-high") {
+		igt_require_nouveau(fd);
+		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, ERANGE);
+		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f_16, ERANGE);
+		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f_8, ERANGE);
 	}
 
 	f.handles[0] = gem_bo_small;
 	igt_subtest("bo-too-small") {
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
-			   errno == EINVAL);
+			   errno != 0);
+		igt_info("driver returned errno %i\n", errno);
+	}
+
+	igt_subtest("intel-bo-too-small") {
+		igt_require_intel(fd);
+		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EINVAL);
+	}
+
+	igt_subtest("nouveau-bo-too-small") {
+		igt_require_nouveau(fd);
+		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, ERANGE);
 	}
 
 	/* Just to check that the parameters would work. */
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
