Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9227310E299
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 12:33:48 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 14 Feb 2022 13:33:37 +0100
Message-Id: <20220214123338.39884-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220214123338.39884-1-zbigniew.kempczynski@intel.com>
References: <20220214123338.39884-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_device_info: Introduce
 i915_pciids_local.h and add DG2 definition
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

Before pciids will land in the kernel and then is merged to IGT we need
to add them locally to unblock compilation and testing staged kernels.
We can use some hybrid solution where intel_device_info takes official
pciids from i915_pciids.h and not official from i915_pciids_local.h.
Such strategy allows us to decrease code changes in the libraries/tests
especially where IS_GENx() or IS_<machine>() macros are in use.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/i915_pciids_local.h | 20 ++++++++++++++++++++
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c |  9 +++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 lib/i915_pciids_local.h

diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
new file mode 100644
index 000000000..2a18109e5
--- /dev/null
+++ b/lib/i915_pciids_local.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#ifndef _I915_PCIIDS_LOCAL_H_
+#define _I915_PCIIDS_LOCAL_H_
+
+#include "i915_pciids.h"
+
+/* DG2 */
+#define INTEL_DG2_IDS(info) \
+	INTEL_VGA_DEVICE(0x56A0, info), \
+	INTEL_VGA_DEVICE(0x56A1, info), \
+	INTEL_VGA_DEVICE(0x56A2, info), \
+	INTEL_VGA_DEVICE(0x56A3, info), \
+	INTEL_VGA_DEVICE(0x56A4, info), \
+	INTEL_VGA_DEVICE(0x56A5, info), \
+	INTEL_VGA_DEVICE(0x56A6, info)
+
+#endif /* _I915_PCIIDS_LOCAL_H */
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 3527cbe57..1396f105b 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -77,6 +77,7 @@ struct intel_device_info {
 	bool is_tigerlake : 1;
 	bool is_rocketlake : 1;
 	bool is_dg1 : 1;
+	bool is_dg2 : 1;
 	bool is_alderlake_s : 1;
 	bool is_raptorlake_s : 1;
 	bool is_alderlake_p : 1;
@@ -182,6 +183,7 @@ void intel_check_pch(void);
 #define IS_TIGERLAKE(devid)	(intel_get_device_info(devid)->is_tigerlake)
 #define IS_ROCKETLAKE(devid)	(intel_get_device_info(devid)->is_rocketlake)
 #define IS_DG1(devid)		(intel_get_device_info(devid)->is_dg1)
+#define IS_DG2(devid)		(intel_get_device_info(devid)->is_dg2)
 #define IS_ALDERLAKE_S(devid)	(intel_get_device_info(devid)->is_alderlake_s)
 #define IS_RAPTORLAKE_S(devid)	(intel_get_device_info(devid)->is_raptorlake_s)
 #define IS_ALDERLAKE_P(devid)	(intel_get_device_info(devid)->is_alderlake_p)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 40942afe7..4aabdafe0 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -1,5 +1,6 @@
 #include "intel_chipset.h"
 #include "i915_pciids.h"
+#include "i915_pciids_local.h"
 
 #include <strings.h> /* ffs() */
 
@@ -389,6 +390,13 @@ static const struct intel_device_info intel_dg1_info = {
 	.codename = "dg1"
 };
 
+static const struct intel_device_info intel_dg2_info = {
+	.graphics_ver = 12,
+	.display_ver = 13,
+	.is_dg2 = true,
+	.codename = "dg2",
+};
+
 static const struct intel_device_info intel_alderlake_s_info = {
 	.graphics_ver = 12,
 	.display_ver = 12,
@@ -506,6 +514,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_RKL_IDS(&intel_rocketlake_info),
 
 	INTEL_DG1_IDS(&intel_dg1_info),
+	INTEL_DG2_IDS(&intel_dg2_info),
 
 	INTEL_ADLS_IDS(&intel_alderlake_s_info),
 	INTEL_RPLS_IDS(&intel_raptorlake_s_info),
-- 
2.32.0
