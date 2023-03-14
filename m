Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E215010E81E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 14:44:43 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 14 Mar 2023 15:44:35 +0100
Message-Id: <af61dd51dd90df03d2f563adf322e115aa539493.1678804829.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1678804829.git.karolina.stolarek@intel.com>
References: <cover.1678804829.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/8] lib/intel_device_info: Add tiling
 information for early gens
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

Update relevant intel_device_info entries to store information
on supported tiling formats.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_device_info.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 0baad721..bda4fb63 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -27,12 +27,14 @@ static const struct intel_device_info intel_i830_info = {
 	.graphics_ver = 2,
 	.display_ver = 2,
 	.is_almador = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "almador"
 };
 static const struct intel_device_info intel_i845_info = {
 	.graphics_ver = 2,
 	.display_ver = 2,
 	.is_brookdale = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "brookdale"
 };
 static const struct intel_device_info intel_i855_info = {
@@ -40,12 +42,14 @@ static const struct intel_device_info intel_i855_info = {
 	.display_ver = 2,
 	.is_mobile = true,
 	.is_montara = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "montara"
 };
 static const struct intel_device_info intel_i865_info = {
 	.graphics_ver = 2,
 	.display_ver = 2,
 	.is_springdale = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "spingdale"
 };
 
@@ -53,6 +57,7 @@ static const struct intel_device_info intel_i915_info = {
 	.graphics_ver = 3,
 	.display_ver = 3,
 	.is_grantsdale = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "grantsdale"
 };
 static const struct intel_device_info intel_i915m_info = {
@@ -60,12 +65,14 @@ static const struct intel_device_info intel_i915m_info = {
 	.display_ver = 3,
 	.is_mobile = true,
 	.is_alviso = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "alviso"
 };
 static const struct intel_device_info intel_i945_info = {
 	.graphics_ver = 3,
 	.display_ver = 3,
 	.is_lakeport = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "lakeport"
 };
 static const struct intel_device_info intel_i945m_info = {
@@ -73,6 +80,7 @@ static const struct intel_device_info intel_i945m_info = {
 	.display_ver = 3,
 	.is_mobile = true,
 	.is_calistoga = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "calistoga"
 };
 
@@ -80,6 +88,7 @@ static const struct intel_device_info intel_g33_info = {
 	.graphics_ver = 3,
 	.display_ver = 3,
 	.is_bearlake = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "bearlake"
 };
 
@@ -87,6 +96,7 @@ static const struct intel_device_info intel_pineview_g_info = {
 	.graphics_ver = 3,
 	.display_ver = 3,
 	.is_pineview = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "pineview"
 };
 
@@ -95,6 +105,7 @@ static const struct intel_device_info intel_pineview_m_info = {
 	.display_ver = 3,
 	.is_mobile = true,
 	.is_pineview = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "pineview"
 };
 
@@ -102,6 +113,7 @@ static const struct intel_device_info intel_i965_info = {
 	.graphics_ver = 4,
 	.display_ver = 4,
 	.is_broadwater = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "broadwater"
 };
 
@@ -110,6 +122,7 @@ static const struct intel_device_info intel_i965m_info = {
 	.display_ver = 4,
 	.is_mobile = true,
 	.is_crestline = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "crestline"
 };
 
@@ -117,6 +130,7 @@ static const struct intel_device_info intel_g45_info = {
 	.graphics_ver = 4,
 	.display_ver = 4,
 	.is_eaglelake = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "eaglelake"
 };
 static const struct intel_device_info intel_gm45_info = {
@@ -124,6 +138,7 @@ static const struct intel_device_info intel_gm45_info = {
 	.display_ver = 4,
 	.is_mobile = true,
 	.is_cantiga = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "cantiga"
 };
 
@@ -131,6 +146,7 @@ static const struct intel_device_info intel_ironlake_info = {
 	.graphics_ver = 5,
 	.display_ver = 5,
 	.is_ironlake = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "ironlake" /* clarkdale? */
 };
 static const struct intel_device_info intel_ironlake_m_info = {
@@ -138,6 +154,7 @@ static const struct intel_device_info intel_ironlake_m_info = {
 	.display_ver = 5,
 	.is_mobile = true,
 	.is_arrandale = true,
+	.cmds_info = &pre_gen6_cmds_info,
 	.codename = "arrandale"
 };
 
-- 
2.25.1
