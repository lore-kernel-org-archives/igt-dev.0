Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D61810E33A
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 05:19:27 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 30 May 2023 10:48:52 +0530
Message-Id: <20230530051852.342524-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: make test name
 uniform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Rename "upscale" test to "upscale-factor" to align with rest of
the tests.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 0e7cd4a2..77bb905b 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -312,7 +312,7 @@ const struct {
 	},
 	{
 		"Tests downscaling (scaling factor 0.25) and upscaling (scaling factor 0.25) of 2 planes.",
-		"planes-downscale-factor-0-25-upscale-0-25",
+		"planes-downscale-factor-0-25-upscale-factor-0-25",
 		0.25,
 		0.25,
 		TEST_PLANES_DOWNSCALE_UPSCALE,
@@ -333,7 +333,7 @@ const struct {
 	},
 	{
 		"Tests downscaling (scaling factor 0.5) and upscaling (scaling factor 0.25) of 2 planes.",
-		"planes-downscale-factor-0-5-upscale-0-25",
+		"planes-downscale-factor-0-5-upscale-factor-0-25",
 		0.5,
 		0.25,
 		TEST_PLANES_DOWNSCALE_UPSCALE,
@@ -354,7 +354,7 @@ const struct {
 	},
 	{
 		"Tests downscaling (scaling factor 0.75) and upscaling (scaling factor 0.25) of 2 planes.",
-		"planes-downscale-factor-0-75-upscale-0-25",
+		"planes-downscale-factor-0-75-upscale-factor-0-25",
 		0.75,
 		0.25,
 		TEST_PLANES_DOWNSCALE_UPSCALE,
-- 
2.25.1
