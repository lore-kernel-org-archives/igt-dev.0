Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018826F3F5
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:31:32 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 17:50:04 +0530
Message-Id: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/24] lib/igt_kms: Add plane color mgmt
 properties
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Add support for Plane color management properties.

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
(cherry picked from commit 51099f0939ca28f15fdd99143ca38e0fc52e38fe)
---
 lib/igt_kms.c | 5 +++++
 lib/igt_kms.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c7c69b6ea0..ae183e822c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -581,6 +581,11 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ALPHA] = "alpha",
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
+	[IGT_PLANE_CTM] = "PLANE_CTM",
+	[IGT_PLANE_GAMMA_MODE] = "PLANE_GAMMA_MODE",
+	[IGT_PLANE_GAMMA_LUT] = "PLANE_GAMMA_LUT",
+	[IGT_PLANE_DEGAMMA_MODE] = "PLANE_DEGAMMA_MODE",
+	[IGT_PLANE_DEGAMMA_LUT] = "PLANE_DEGAMMA_LUT",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 8cde24b791..41967bf28a 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -301,6 +301,11 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_ALPHA,
        IGT_PLANE_ZPOS,
        IGT_PLANE_FB_DAMAGE_CLIPS,
+       IGT_PLANE_CTM,
+       IGT_PLANE_GAMMA_MODE,
+       IGT_PLANE_GAMMA_LUT,
+       IGT_PLANE_DEGAMMA_MODE,
+       IGT_PLANE_DEGAMMA_LUT,
        IGT_NUM_PLANE_PROPS
 };
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
