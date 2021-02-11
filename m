Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3FA6ED94
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Feb 2021 09:08:44 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Thu, 11 Feb 2021 14:29:55 +0530
Message-Id: <20210211085956.241188-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210211085956.241188-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210211085956.241188-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t 1/2] lib/adl_s: Add ADL-S PCIids
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: anusha.srivatsa@intel.com, lucas.demarchi@intel.com, hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Taken from kernel commit:
0883d63b19bb drm/i915/adl_s: Add ADL-S platform info and PCI ids

Signed-off-by: Caz Yokoyama <caz.yokoyama@intel.com>
Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/i915_pciids.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 3b5ed1e4..ba87b458 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -628,6 +628,17 @@
 	INTEL_VGA_DEVICE(0x4C90, info), \
 	INTEL_VGA_DEVICE(0x4C9A, info)
 
+ /* ADL-S */
+ #define INTEL_ADLS_IDS(info) \
+	INTEL_VGA_DEVICE(0x4680, info), \
+	INTEL_VGA_DEVICE(0x4681, info), \
+	INTEL_VGA_DEVICE(0x4682, info), \
+	INTEL_VGA_DEVICE(0x4683, info), \
+	INTEL_VGA_DEVICE(0x4690, info), \
+	INTEL_VGA_DEVICE(0x4691, info), \
+	INTEL_VGA_DEVICE(0x4692, info), \
+	INTEL_VGA_DEVICE(0x4693, info)
+
 /* DG1 */
 #define INTEL_DG1_IDS(info) \
 	INTEL_VGA_DEVICE(0x4905, info), \
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
