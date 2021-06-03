Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9246F474
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:31:37 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 17:50:12 +0530
Message-Id: <20210603122027.27330-9-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
References: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 09/24] lib/igt_kms: Add pipe color mgmt
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

From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>

Add support for Pipe color management properties.

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
(cherry picked from commit cea63909b8b1c2a730c0bde82bd958c08b70f9b9)
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index ae183e822c..b11c8c27a6 100644
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
index 41967bf28a..b54f2baf7d 100644
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
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
