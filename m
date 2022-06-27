Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06CE10ED19
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 21:05:15 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so10578239pjj.5
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jun 2022 14:05:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Jun 2022 14:05:34 -0700
Message-Id: <20220627210534.258721-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt] tests/msm: Fix mapping test
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

The format of the fault-info in the devcore is a bit different from what
it was looking for.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/msm/msm_mapping.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index e1474f9f..21cdc8e1 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -211,10 +211,10 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	/* Make sure the devcore is from iova fault: */
 	igt_fail_on(!strstr(devcore, "fault-info"));
 
-	s = strstr(devcore, "  - far: ");
+	s = strstr(devcore, "  - iova=");
 	igt_fail_on(!s);
 
-	ret = sscanf(s, "  - far: %"PRIx64, &fault_addr);
+	ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
 	igt_fail_on(ret != 1);
 	igt_fail_on(addr != fault_addr);
 }
-- 
2.36.1
