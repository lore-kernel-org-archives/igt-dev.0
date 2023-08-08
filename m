Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8E010E0A1
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 14:53:42 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bba04b9df3so50377285ad.0
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Aug 2023 07:53:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 07:53:34 -0700
Message-ID: <20230808145334.24277-2-robdclark@gmail.com>
In-Reply-To: <20230808145334.24277-1-robdclark@gmail.com>
References: <20230808145334.24277-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] tests/kms_plane: Skip QCOM_COMPRESSED
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

We don't know how to generate valid compressed/UBWC data in igt, so
don't try.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index a444cdca23e2..8e7dc75d349c 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1011,6 +1011,11 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		    f.modifier != DRM_FORMAT_MOD_LINEAR)
 			continue;
 
+		/* igt doesn't know how to sw generate UBWC: */
+		if (is_msm_device(data->drm_fd) &&
+		    f.modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
+			continue;
+
 		if (f.format == ref.format &&
 		    f.modifier == ref.modifier)
 			continue;
-- 
2.41.0
