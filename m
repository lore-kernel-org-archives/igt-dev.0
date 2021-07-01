Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC116E0D9
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jul 2021 17:44:35 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id f13so4681398qtb.6
 for <igt-dev@lists.freedesktop.org>; Thu, 01 Jul 2021 10:44:35 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu,  1 Jul 2021 13:44:24 -0400
Message-Id: <20210701174424.2261499-2-markyacoub@chromium.org>
In-Reply-To: <20210701174424.2261499-1-markyacoub@chromium.org>
References: <20210701174424.2261499-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/2] kms_addfb_basic: Check for AMDGPU and MSM bad
 pitch.
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
Cc: petri.latvala@intel.com, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
AMDGPU and MSM devices have a known errno when it fails coorectly for
bad pitches.

[How]
Assert `errno` to `EINVAL` for both AMDGPU and MSM as well.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_addfb_basic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 85c14be5..91fb6ac9 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -310,7 +310,7 @@ static void pitch_tests(int fd)
 			f.pitches[0] = bad_pitches[i];
 			igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &f), -1);
 			igt_assert(errno != 0);
-			if (is_i915_device(fd)) {
+			if (is_i915_device(fd) || is_amdgpu_device(fd) || is_msm_device(fd)) {
 				igt_assert_eq(errno, EINVAL);
 			} else if (is_nouveau_device(fd)) {
 				if (bad_pitches[i] > 4 * 1024)
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
