Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03C110E457
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Dec 2022 15:25:25 +0000 (UTC)
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Dec 2022 07:20:25 -0800
Message-Id: <20221221152024.3789630-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] drm/i915: Enable XE_HP 4Tile support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: jonathan.cavitt@intel.com,
 Telukuntla Sreedhar <sreedhar.telukuntla@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add .has_4tile tag to XE_HP_FEATURES set.
Remove duplicate entry from DG2_FEATURES.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Roper Matthew D <matthew.d.roper@intel.com>
Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
Cc: Telukuntla Sreedhar <sreedhar.telukuntla@intel.com>
Acked-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 668e9da52584..7fd74cc28c0a 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1017,6 +1017,7 @@ static const struct intel_device_info adl_p_info = {
 	.has_3d_pipeline = 1, \
 	.has_64bit_reloc = 1, \
 	.has_flat_ccs = 1, \
+	.has_4tile = 1, \
 	.has_global_mocs = 1, \
 	.has_gt_uc = 1, \
 	.has_llc = 1, \
@@ -1061,7 +1062,6 @@ static const struct intel_device_info xehpsdv_info = {
 	.__runtime.graphics.ip.rel = 55, \
 	.__runtime.media.ip.rel = 55, \
 	PLATFORM(INTEL_DG2), \
-	.has_4tile = 1, \
 	.has_64k_pages = 1, \
 	.has_guc_deprivilege = 1, \
 	.has_heci_pxp = 1, \
-- 
2.25.1
