Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2054.outbound.protection.outlook.com [40.107.96.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8276E8F5
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 16:18:08 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Wed, 1 Dec 2021 11:17:29 -0500
Message-ID: <20211201161730.2085782-2-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211201161730.2085782-1-Rodrigo.Siqueira@amd.com>
References: <20211201161730.2085782-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH V3 i-g-t 1/2] lib/kms: Add DSC_SLICE_HEIGHT to
 CRTC property
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, Roman Li <roman.li@amd.com>, Hayden Goodfellow <hayden.goodfellow@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

This preparation work introduces a new CRTC property named
DSC_SLICE_HEIGHT, which will be required for amdgpu DSC tests.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 34a2aa00..fdadb6d6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -593,6 +593,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_ACTIVE] = "ACTIVE",
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
+	[IGT_CRTC_DSC_SLICE_HEIGHT] = "DSC_SLICE_HEIGHT",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e9ecd21e..5c7d7481 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -125,6 +125,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_ACTIVE,
        IGT_CRTC_OUT_FENCE_PTR,
        IGT_CRTC_VRR_ENABLED,
+       IGT_CRTC_DSC_SLICE_HEIGHT,
        IGT_NUM_CRTC_PROPS
 };
 
-- 
2.25.1
