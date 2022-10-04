Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB00710E193
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Oct 2022 21:17:08 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 4 Oct 2022 15:16:24 -0600
Message-ID: <20221004211626.1480938-3-alex.hung@amd.com>
In-Reply-To: <20221004211626.1480938-1-alex.hung@amd.com>
References: <20221004211626.1480938-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [RFC PATCH 2/4][[i-g-t] lib/igt_kms: Add 3D LUT properties
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: bhawanpreet.lakha@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add support for 3D LUT properties.

Note: The kernel 3DLUT API proposal "Proposal for Pre-blending 3D LUT
interfaces" is sent to dri-devel mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_kms.c | 2 ++
 lib/igt_kms.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 677d26fe..5eb0aaeb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -586,6 +586,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_GAMMA_LUT] = "PLANE_GAMMA_LUT",
 	[IGT_PLANE_DEGAMMA_MODE] = "PLANE_DEGAMMA_MODE",
 	[IGT_PLANE_DEGAMMA_LUT] = "PLANE_DEGAMMA_LUT",
+	[IGT_PLANE_3D_LUT_MODE] = "PLANE_3D_LUT_MODE",
+	[IGT_PLANE_3D_LUT] = "PLANE_3D_LUT",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5fac651f..0bcfc7b1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -307,6 +307,8 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_GAMMA_LUT,
        IGT_PLANE_DEGAMMA_MODE,
        IGT_PLANE_DEGAMMA_LUT,
+       IGT_PLANE_3D_LUT_MODE,
+       IGT_PLANE_3D_LUT,
        IGT_NUM_PLANE_PROPS
 };
 
-- 
2.25.1
