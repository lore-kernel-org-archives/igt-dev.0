Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3403D10E36F
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 14:42:10 +0000 (UTC)
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 20:08:14 +0530
Message-Id: <20230829143821.1417623-3-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
References: <20230829143821.1417623-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/9] tests/kms_color: Add support for color
 pipeline properties
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chaitanya.kumar.borah@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add support for properties to get and set a plane color pipeline

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kms.c | 2 ++
 lib/igt_kms.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c2f3728a6..872e02512 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -616,6 +616,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
 	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
+	[IGT_PLANE_GET_COLOR_PIPELINE] = "GET_COLOR_PIPELINE",
+	[IGT_PLANE_SET_COLOR_PIPELINE] = "SET_COLOR_PIPELINE",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f2c3741fc..d40a0b512 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -326,6 +326,8 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_SCALING_FILTER,
        IGT_PLANE_HOTSPOT_X,
        IGT_PLANE_HOTSPOT_Y,
+       IGT_PLANE_GET_COLOR_PIPELINE,
+       IGT_PLANE_SET_COLOR_PIPELINE,
        IGT_NUM_PLANE_PROPS
 };
 
-- 
2.25.1
