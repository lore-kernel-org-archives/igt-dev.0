Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E8689FCE
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Nov 2021 06:43:47 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon, 22 Nov 2021 12:18:48 +0530
Message-Id: <20211122064849.785894-3-apoorva1.singh@intel.com>
In-Reply-To: <20211122064849.785894-1-apoorva1.singh@intel.com>
References: <20211122064849.785894-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v2 2/3] lib/intel_chipset.h: Add has_flat_ccs flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add a new platform flag, has_flat_ccs, for platforms
supporting Flat CCS.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/intel_chipset.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 2b795527..d2719932 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -40,6 +40,7 @@ struct intel_device_info {
 	unsigned graphics_ver;
 	unsigned display_ver;
 	unsigned gt; /* 0 if unknown */
+	bool has_flat_ccs : 1;
 	bool is_mobile : 1;
 	bool is_whitney : 1;
 	bool is_almador : 1;
@@ -209,4 +210,6 @@ void intel_check_pch(void);
 				   IS_CHERRYVIEW(devid) || \
 				   IS_BROXTON(devid)))
 
+#define HAS_FLAT_CCS(devid)	(intel_get_device_info(devid)->has_flat_ccs)
+
 #endif /* _INTEL_CHIPSET_H */
-- 
2.25.1
