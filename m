Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7087710E2AB
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jan 2024 18:56:43 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6d9e62ff056so1828545b3a.1
 for <igt-dev@lists.freedesktop.org>; Mon, 08 Jan 2024 10:56:43 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/msm_submit: Fix invalid-duplicate-bo-submit errno
Date: Mon,  8 Jan 2024 10:56:38 -0800
Message-ID: <20240108185638.154998-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

With the drm_exec conversion[1], this now returns EALREADY.  Which is
arguablly a fix (better error return code).

[1] kernel commit a6397e63877e ("drm/msm/gem: Convert to drm_exec")

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
I'm not sure how much to care about newer igt on older kernel.  I think
I'd be willing to just let this test fail in that case.

 tests/msm/msm_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/msm/msm_submit.c b/tests/msm/msm_submit.c
index 95f8318facb0..48cffab6940b 100644
--- a/tests/msm/msm_submit.c
+++ b/tests/msm/msm_submit.c
@@ -102,7 +102,7 @@ igt_main
 				.nr_bos  = ARRAY_SIZE(bos),
 				.bos     = VOID2U64(bos),
 		};
-		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EINVAL);
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_SUBMIT, &req, EALREADY);
 	}
 
 	igt_describe("Check that submit with cmdstream referencing an invalid bo fails");
-- 
2.43.0
