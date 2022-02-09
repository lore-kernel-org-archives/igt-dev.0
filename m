Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED9B10E481
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Feb 2022 23:30:54 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 10 Feb 2022 00:30:41 +0100
Message-Id: <20220209233044.57624-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220209233044.57624-1-zbigniew.kempczynski@intel.com>
References: <20220209233044.57624-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] FIXME: Add DG2 defs to use in gem-ccs
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
List-ID: <igt-dev@lists.freedesktop.org>

Only for use before kernel defs will land.
---
 lib/i915_pciids.h       | 7 +++++++
 lib/intel_device_info.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 533890dc9..24747f462 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -635,6 +635,13 @@
 	INTEL_VGA_DEVICE(0x4908, info), \
 	INTEL_VGA_DEVICE(0x4909, info)
 
+/* DG2 */
+#define INTEL_DG2_IDS(info) \
+	INTEL_VGA_DEVICE(0x56A0, info), \
+	INTEL_VGA_DEVICE(0x56A2, info), \
+	INTEL_VGA_DEVICE(0x56A5, info), \
+	INTEL_VGA_DEVICE(0x56A6, info)
+
 /* ADL-S */
 #define INTEL_ADLS_IDS(info) \
 	INTEL_VGA_DEVICE(0x4680, info), \
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 40942afe7..279ae1e56 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -389,6 +389,12 @@ static const struct intel_device_info intel_dg1_info = {
 	.codename = "dg1"
 };
 
+static const struct intel_device_info intel_dg2_info = {
+	.graphics_ver = 12,
+	.display_ver = 12,
+	.codename = "dg2"
+};
+
 static const struct intel_device_info intel_alderlake_s_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
@@ -506,6 +512,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_RKL_IDS(&intel_rocketlake_info),
 
 	INTEL_DG1_IDS(&intel_dg1_info),
+	INTEL_DG2_IDS(&intel_dg2_info),
 
 	INTEL_ADLS_IDS(&intel_alderlake_s_info),
 	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
-- 
2.32.0
