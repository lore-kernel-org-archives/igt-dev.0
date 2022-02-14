Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11D910E2BE
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 12:33:52 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 14 Feb 2022 13:33:38 +0100
Message-Id: <20220214123338.39884-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220214123338.39884-1-zbigniew.kempczynski@intel.com>
References: <20220214123338.39884-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/intel_chipset: Add flatccs flag for
 DG2
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

FlatCCS is discrete DG2+ feature and is worth to add the flag which
enables it. Add HAS_FLATCCS() macro which should make conditional code
simpler and compact.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/intel_chipset.h     | 3 +++
 lib/intel_device_info.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 1396f105b..e27b9aab1 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -40,6 +40,7 @@ struct intel_device_info {
 	unsigned graphics_ver;
 	unsigned display_ver;
 	unsigned gt; /* 0 if unknown */
+	bool has_flatccs;
 	bool is_mobile : 1;
 	bool is_whitney : 1;
 	bool is_almador : 1;
@@ -215,4 +216,6 @@ void intel_check_pch(void);
 				   IS_CHERRYVIEW(devid) || \
 				   IS_BROXTON(devid)))
 
+#define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)
+
 #endif /* _INTEL_CHIPSET_H */
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 4aabdafe0..9f1913679 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -395,6 +395,7 @@ static const struct intel_device_info intel_dg2_info = {
 	.display_ver = 13,
 	.is_dg2 = true,
 	.codename = "dg2",
+	.has_flatccs = true,
 };
 
 static const struct intel_device_info intel_alderlake_s_info = {
-- 
2.32.0
