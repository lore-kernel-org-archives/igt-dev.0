Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ABA10E3BC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 09:33:22 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 11:32:47 +0200
Message-Id: <20220615093247.414156-1-karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/i915: Fix ATS-M definitions
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

Instead of using a separate "is_ats_m" flag, reuse "is_dg2" in ATS-M
intel_device_info definition. Delete is_ats_m in intel_device_info struct
definition and IS_ATS_M() macro, as they are no longer needed.

Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
---
 lib/intel_chipset.h     | 2 --
 lib/intel_device_info.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index de4749e1..06f73211 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -84,7 +84,6 @@ struct intel_device_info {
 	bool is_raptorlake_s : 1;
 	bool is_alderlake_p : 1;
 	bool is_alderlake_n : 1;
-	bool is_ats_m : 1;
 	const char *codename;
 };
 
@@ -191,7 +190,6 @@ void intel_check_pch(void);
 #define IS_RAPTORLAKE_S(devid)	(intel_get_device_info(devid)->is_raptorlake_s)
 #define IS_ALDERLAKE_P(devid)	(intel_get_device_info(devid)->is_alderlake_p)
 #define IS_ALDERLAKE_N(devid)	(intel_get_device_info(devid)->is_alderlake_n)
-#define IS_ATS_M(devid)	(intel_get_device_info(devid)->is_ats_m)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 #define AT_LEAST_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver >= x)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 5b1da33f..bfdd9fa5 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -430,7 +430,7 @@ static const struct intel_device_info intel_alderlake_n_info = {
 static const struct intel_device_info intel_ats_m_info = {
 	.graphics_ver = 12,
 	.display_ver = 0, /* no display support */
-	.is_ats_m = true,
+	.is_dg2 = true,
 	.has_4tile = true,
 	.codename = "ats_m",
 	.has_flatccs = true,
-- 
2.25.1
