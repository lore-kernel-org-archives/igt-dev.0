Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FBE11A621
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Jul 2022 12:30:05 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 14:29:38 +0200
Message-Id: <20220701122939.11193-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib/i915: Add graphics release
 subversion to device info
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com, nirmoy.das@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Record the minor inremental changes between the major gen12 platforms as
a release version.

v2: add missing "," to last struct member and move
graphics_rel next to graphics_ver.

Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/intel_chipset.h     |  4 ++++
 lib/intel_device_info.c | 11 ++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 06f732110..d7a6ff190 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -38,6 +38,7 @@ uint32_t intel_get_drm_devid(int fd);
 
 struct intel_device_info {
 	unsigned graphics_ver;
+	unsigned graphics_rel;
 	unsigned display_ver;
 	unsigned gt; /* 0 if unknown */
 	bool has_4tile : 1;
@@ -90,6 +91,7 @@ struct intel_device_info {
 const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
 
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
+unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
 
 extern enum pch_type intel_pch;
@@ -107,6 +109,8 @@ void intel_check_pch(void);
 #define HAS_CPT (intel_pch == PCH_CPT)
 #define HAS_LPT (intel_pch == PCH_LPT)
 
+#define IP_VER(ver, rel)		((ver) << 8 | (rel))
+
 /* Exclude chipset #defines, they just add noise */
 #ifndef __GTK_DOC_IGNORE__
 
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index bfdd9fa5c..536707252 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -385,13 +385,15 @@ static const struct intel_device_info intel_rocketlake_info = {
 
 static const struct intel_device_info intel_dg1_info = {
 	.graphics_ver = 12,
+	.graphics_rel = 10,
 	.display_ver = 12,
 	.is_dg1 = true,
-	.codename = "dg1"
+	.codename = "dg1",
 };
 
 static const struct intel_device_info intel_dg2_info = {
 	.graphics_ver = 12,
+	.graphics_rel = 55,
 	.display_ver = 13,
 	.has_4tile = true,
 	.is_dg2 = true,
@@ -583,6 +585,13 @@ unsigned intel_gen(uint16_t devid)
 	return intel_get_device_info(devid)->graphics_ver ?: -1u;
 }
 
+unsigned intel_graphics_ver(uint16_t devid)
+{
+	const struct intel_device_info *info = intel_get_device_info(devid);
+
+	return IP_VER(info->graphics_ver, info->graphics_rel);
+}
+
 /**
  * intel_display_ver:
  * @devid: pci device id
-- 
2.35.1

Intel Deutschland GmbH
Registered Address: Am Campeon 10, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de <http://www.intel.de>
Managing Directors: Christin Eisenschmid, Sharon Heck, Tiffany Doon Silva  
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928
