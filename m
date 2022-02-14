Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43DC10E1BC
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 15:00:53 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon, 14 Feb 2022 20:29:55 +0530
Message-Id: <20220214150009.26815-3-jeevan.b@intel.com>
In-Reply-To: <20220214150009.26815-1-jeevan.b@intel.com>
References: <20220214150009.26815-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 02/16] lib/intel_device_info: Add a flag
 to indicate tiling 4 support
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

Add tiling 4 support flag for DG2 platform. This is similar that
we have defined in kernel i915_pci.c intel_device_info() for DG2.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
---
 lib/intel_chipset.h     | 3 +++
 lib/intel_device_info.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 9c2f1b31..32066439 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -40,6 +40,7 @@ struct intel_device_info {
 	unsigned graphics_ver;
 	unsigned display_ver;
 	unsigned gt; /* 0 if unknown */
+	bool has_4tile : 1;
 	bool is_mobile : 1;
 	bool is_whitney : 1;
 	bool is_almador : 1;
@@ -215,4 +216,6 @@ void intel_check_pch(void);
 				   IS_CHERRYVIEW(devid) || \
 				   IS_BROXTON(devid)))
 
+#define HAS_4TILE(devid)	(intel_get_device_info(devid)->has_4tile)
+
 #endif /* _INTEL_CHIPSET_H */
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 05ba2d98..7b1535fd 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -420,6 +420,7 @@ static const struct intel_device_info intel_alderlake_n_info = {
 static const struct intel_device_info intel_dg2_info = {
 	.graphics_ver = 12,
 	.display_ver = 13,
+	.has_4tile = true,
 	.is_dg2 = true,
 	.codename = "dg2"
 };
-- 
2.17.1
