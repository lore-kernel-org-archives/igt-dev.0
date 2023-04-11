Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8934210E2F5
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 13:30:16 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue, 11 Apr 2023 10:29:46 -0300
Message-Id: <20230411132946.17459-4-mcanal@igalia.com>
In-Reply-To: <20230411132946.17459-1-mcanal@igalia.com>
References: <20230411132946.17459-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/vkms: Remove tests that are
 skipping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, vkms doesn't support plane scaling. Therefore, all the
kms_plane_scaling tests are skipping with the exception to the sub-test
invalid-parameters. In order to have a testlist with only tests that are
passing, remove all the tests that skipping.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/vkms_ci/vkms.testlist | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/tests/vkms_ci/vkms.testlist b/tests/vkms_ci/vkms.testlist
index cb15ded1..c3333bcb 100644
--- a/tests/vkms_ci/vkms.testlist
+++ b/tests/vkms_ci/vkms.testlist
@@ -182,21 +182,7 @@ igt@kms_plane_cursor@primary
 igt@kms_plane_cursor@viewport
 igt@kms_plane_lowres@tiling-none
 igt@kms_plane_multiple@tiling-none
-igt@kms_plane_scaling@planes-downscale-factor-0-25
-igt@kms_plane_scaling@planes-downscale-factor-0-5
-igt@kms_plane_scaling@planes-downscale-factor-0-75
-igt@kms_plane_scaling@planes-scaler-unity-scaling
-igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25
-igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5
-igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75
-igt@kms_plane_scaling@planes-upscale-20x20
-igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25
-igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
-igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75
-igt@kms_plane_scaling@planes-upscale-factor-0-25
-igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
-igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
-igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75
+igt@kms_plane_scaling@invalid-parameters
 igt@kms_prop_blob@basic
 igt@kms_prop_blob@blob-multiple
 igt@kms_prop_blob@blob-prop-core
-- 
2.39.2
