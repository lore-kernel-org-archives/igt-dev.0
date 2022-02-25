Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11210E7B1
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 05:09:26 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Feb 2022 10:38:44 +0530
Message-Id: <20220225050853.8349-2-jeevan.b@intel.com>
In-Reply-To: <20220225050853.8349-1-jeevan.b@intel.com>
References: <20220225050853.8349-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 01/10] lib/intel_device_info: Add a flag to
 indicate tiling 4 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

Add tiling 4 support flag for DG2 platform. This is similar that
we have defined in kernel i915_pci.c intel_device_info() for DG2.

v2: rebase

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_chipset.h     | 3 +++
 lib/intel_device_info.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index e27b9aab..db75a829 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -40,6 +40,7 @@ struct intel_device_info {
 	unsigned graphics_ver;
 	unsigned display_ver;
 	unsigned gt; /* 0 if unknown */
+	bool has_4tile : 1;
 	bool has_flatccs;
 	bool is_mobile : 1;
 	bool is_whitney : 1;
@@ -216,6 +217,8 @@ void intel_check_pch(void);
 				   IS_CHERRYVIEW(devid) || \
 				   IS_BROXTON(devid)))
 
+#define HAS_4TILE(devid)	(intel_get_device_info(devid)->has_4tile)
+
 #define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)
 
 #endif /* _INTEL_CHIPSET_H */
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 9f191367..e55841df 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -393,6 +393,7 @@ static const struct intel_device_info intel_dg1_info = {
 static const struct intel_device_info intel_dg2_info = {
 	.graphics_ver = 12,
 	.display_ver = 13,
+	.has_4tile = true,
 	.is_dg2 = true,
 	.codename = "dg2",
 	.has_flatccs = true,
-- 
2.17.1
