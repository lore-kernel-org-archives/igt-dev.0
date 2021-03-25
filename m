Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2196EDD3
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 17:12:48 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id b83so3592032lfd.11
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 10:12:48 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Thu, 25 Mar 2021 19:12:22 +0200
Message-Id: <20210325171222.26283-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_scaled_crc: skip test if no
 requested mode and exceed cdclk limits
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
List-ID: <igt-dev@lists.freedesktop.org>

If there was no requested 640p or 1080p mode available in connector
and flipping to scaled fb fail with einval assume cdclk limits
were exceeded and skip test instead of failing.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_flip_scaled_crc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c
index c41709b68..35417396e 100644
--- a/tests/kms_flip_scaled_crc.c
+++ b/tests/kms_flip_scaled_crc.c
@@ -204,6 +204,9 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
 
 	igt_require_f(ret != -ERANGE,
 		      "Platform scaling limits exceeded, skipping.\n");
+	igt_require_f(!(ret == -EINVAL && !modetoset),
+		      "No %dp and default mode too big, cdclk limits exceeded. Skipping.\n",
+		      data->attemptmodeheight);
 	igt_assert_eq(ret, 0);
 
 	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
