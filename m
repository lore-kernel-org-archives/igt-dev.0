Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE6410E31B
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jan 2022 08:00:26 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Tue,  4 Jan 2022 13:27:41 +0530
Message-Id: <20220104075745.1715316-12-bhanuprakash.modem@intel.com>
In-Reply-To: <20220104075745.1715316-1-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20220104075745.1715316-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 i-g-t 11/15] lib/igt_kms: Add pipe color mgmt
 properties
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>, Pekka Paalanen <ppaalanen@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>

Add IGT support to read CRTC GAMMA_MODE property.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index fdb83e0f91..677d26fedb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -592,6 +592,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_CTM] = "CTM",
 	[IGT_CRTC_GAMMA_LUT] = "GAMMA_LUT",
 	[IGT_CRTC_GAMMA_LUT_SIZE] = "GAMMA_LUT_SIZE",
+	[IGT_CRTC_GAMMA_MODE] = "GAMMA_MODE",
 	[IGT_CRTC_DEGAMMA_LUT] = "DEGAMMA_LUT",
 	[IGT_CRTC_DEGAMMA_LUT_SIZE] = "DEGAMMA_LUT_SIZE",
 	[IGT_CRTC_MODE_ID] = "MODE_ID",
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3a1f7243ad..5fac651fa3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -119,6 +119,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_CTM = 0,
        IGT_CRTC_GAMMA_LUT,
        IGT_CRTC_GAMMA_LUT_SIZE,
+       IGT_CRTC_GAMMA_MODE,
        IGT_CRTC_DEGAMMA_LUT,
        IGT_CRTC_DEGAMMA_LUT_SIZE,
        IGT_CRTC_MODE_ID,
-- 
2.32.0
