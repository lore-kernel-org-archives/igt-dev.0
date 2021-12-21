Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ECE10E1AA
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Dec 2021 05:55:05 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 21 Dec 2021 11:19:29 +0530
Message-Id: <20211221054930.4128285-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20211221054930.4128285-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20211221054930.4128285-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 1/2] lib: sync i915_pciids.h with kernel
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

This synchronizes with kernel commit

7e28d0b26759 ("drm/i915/adl-n: Enable ADL-N platform")
to bring in ADL-N PCI IDs.

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/i915_pciids.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index baf3d1d3..533890dc 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -666,6 +666,12 @@
 	INTEL_VGA_DEVICE(0x46C2, info), \
 	INTEL_VGA_DEVICE(0x46C3, info)
 
+/* ADL-N */
+#define INTEL_ADLN_IDS(info) \
+	INTEL_VGA_DEVICE(0x46D0, info), \
+	INTEL_VGA_DEVICE(0x46D1, info), \
+	INTEL_VGA_DEVICE(0x46D2, info)
+
 /* RPL-S */
 #define INTEL_RPLS_IDS(info) \
 	INTEL_VGA_DEVICE(0xA780, info), \
-- 
2.31.1
