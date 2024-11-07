Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89701D5D695
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 23:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336A910E327;
	Thu,  7 Nov 2024 23:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTWyAwDu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8705610E327
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 23:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731021526; x=1762557526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vDAnOuturVihLuDdJ+/a12x6F3crZoerAfa2EwXit9k=;
 b=jTWyAwDuy30YMneBT6PG7+2Eu+DLAngpaJc8FTMIX2RV8JuMTqMYkfH5
 6WSa4ltCizmKvxyfrpIvf+nDbsWSSw3iqMUkb59PDnkMjKTtxjBd9akrO
 q/wiaBj9YT7BMSIQ9ZW9uNFL8p2m1jw56ThL+FemOVPx6N+eQWGRJ9BHQ
 GPk8w62jkaFywmk+Tvb0QN8nrA5Zdc6iHdm9rcBiXqf8iB2e2G/IM6Bye
 WTUpSV49cPISqeOZ/Uir6HIw/ik+G+bB9wjYzwqFAYrhxHCIggbcfgvpZ
 ok2l8JpRuWHx89WHquf4ZP3hCPGRFQjHXQINtCZHjD1jRvFo4h5L2aAwI A==;
X-CSE-ConnectionGUID: n9bz2Wy3Se+pgjdjvmkZiQ==
X-CSE-MsgGUID: NAPnn02aSRGN/ZKSXMtFng==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48350928"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48350928"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 15:18:46 -0800
X-CSE-ConnectionGUID: KFNgBmtWQ5qCk4KE9u0tng==
X-CSE-MsgGUID: a+68EGKBTkq0XZ/W9PMDsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="90399012"
Received: from nkwan-gpu-0.jf.intel.com ([10.165.21.163])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 15:18:46 -0800
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, clinton.a.taylor@intel.com,
 kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com,
 Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: [PATCH v2] lib: sync PCI ID macros with kernel
Date: Thu,  7 Nov 2024 15:14:45 -0800
Message-ID: <20241107231457.70157-1-ngai-mint.kwan@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Synch with kernel commit that uses common PCI ID macros:
3c1d5ced18db ("drm/i915/gsc: ARL-H and ARL-U need a newer GSC FW.")

Refactor lib to use new macro definitions and pciids.h header file.

Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
---
 docs/reference/igt-gpu-tools/meson.build |   3 +-
 lib/i915/perf.c                          |   2 +-
 lib/i915_pciids_local.h                  |   2 +-
 lib/intel_device_info.c                  |   8 +-
 lib/{i915_pciids.h => pciids.h}          | 106 ++++++++---
 lib/xe/xe_oa.c                           |  12 +-
 lib/xe_pciids.h                          | 218 -----------------------
 7 files changed, 90 insertions(+), 261 deletions(-)
 rename lib/{i915_pciids.h => pciids.h} (92%)
 delete mode 100644 lib/xe_pciids.h

diff --git a/docs/reference/igt-gpu-tools/meson.build b/docs/reference/igt-gpu-tools/meson.build
index d5db95e40..8d70a49b8 100644
--- a/docs/reference/igt-gpu-tools/meson.build
+++ b/docs/reference/igt-gpu-tools/meson.build
@@ -10,7 +10,6 @@ ignore_headers = [
 	'gpgpu_fill.h',
 	'i830_reg.h',
 	'i915_3d.h',
-	'i915_pciids.h',
 	'i915_reg.h',
 	'igt_edid_template.h',
 	'intel_reg.h',
@@ -21,8 +20,8 @@ ignore_headers = [
 	'media_spin.h',
 	'media_fill_gen9.h',
 	'gen9_render.h',
+	'pciids.h',
 	'version.h',
-	'xe_pciids.h',
 ]
 
 test_groups = [
diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index ef2f74be8..9eb1141d4 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -37,7 +37,7 @@
 
 #include <i915_drm.h>
 
-#include "i915_pciids.h"
+#include "pciids.h"
 #include "i915_pciids_local.h"
 
 #include "intel_chipset.h"
diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
index c404a51af..b85cfd779 100644
--- a/lib/i915_pciids_local.h
+++ b/lib/i915_pciids_local.h
@@ -5,7 +5,7 @@
 #ifndef _I915_PCIIDS_LOCAL_H_
 #define _I915_PCIIDS_LOCAL_H_
 
-#include "i915_pciids.h"
+#include "pciids.h"
 
 /* MTL perf */
 #ifndef INTEL_MTL_M_IDS
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 2a118eda6..546b9c65a 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -1,7 +1,6 @@
 #include "intel_chipset.h"
-#include "i915_pciids.h"
+#include "pciids.h"
 #include "i915_pciids_local.h"
-#include "xe_pciids.h"
 
 #include <strings.h> /* ffs() */
 
@@ -635,12 +634,13 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_ATS_M_IDS(INTEL_PCI_ID_INIT, &intel_ats_m_info),
 
 	INTEL_MTL_IDS(INTEL_PCI_ID_INIT, &intel_meteorlake_info),
+	INTEL_ARL_IDS(INTEL_PCI_ID_INIT, &intel_meteorlake_info),
 
 	INTEL_PVC_IDS(INTEL_PCI_ID_INIT, &intel_pontevecchio_info),
 
-	XE_LNL_IDS(INTEL_PCI_ID_INIT, &intel_lunarlake_info),
+	INTEL_LNL_IDS(INTEL_PCI_ID_INIT, &intel_lunarlake_info),
 
-	XE_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
+	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
 
 	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
 };
diff --git a/lib/i915_pciids.h b/lib/pciids.h
similarity index 92%
rename from lib/i915_pciids.h
rename to lib/pciids.h
index 3e39d644e..32480b556 100644
--- a/lib/i915_pciids.h
+++ b/lib/pciids.h
@@ -22,30 +22,23 @@
  * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  * DEALINGS IN THE SOFTWARE.
  */
-#ifndef _I915_PCIIDS_H
-#define _I915_PCIIDS_H
-
-/*
- * A pci_device_id struct {
- *	__u32 vendor, device;
- *      __u32 subvendor, subdevice;
- *	__u32 class, class_mask;
- *	kernel_ulong_t driver_data;
- * };
- * Don't use C99 here because "class" is reserved and we want to
- * give userspace flexibility.
- */
-#define INTEL_VGA_DEVICE(id, info) { \
-	0x8086,	id, \
-	~0, ~0, \
-	0x030000, 0xff0000, \
-	(unsigned long) info }
-
-#define INTEL_QUANTA_VGA_DEVICE(info) { \
-	0x8086,	0x16a, \
-	0x152d,	0x8990, \
-	0x030000, 0xff0000, \
-	(unsigned long) info }
+#ifndef __PCIIDS_H__
+#define __PCIIDS_H__
+
+#ifdef __KERNEL__
+#define INTEL_VGA_DEVICE(_id, _info) { \
+	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
+	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
+	.driver_data = (kernel_ulong_t)(_info), \
+}
+
+#define INTEL_QUANTA_VGA_DEVICE(_info) { \
+	.vendor = PCI_VENDOR_ID_INTEL, .device = 0x16a, \
+	.subvendor = 0x152d, .subdevice = 0x8990, \
+	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
+	.driver_data = (kernel_ulong_t)(_info), \
+}
+#endif
 
 #define INTEL_I810_IDS(MACRO__, ...) \
 	MACRO__(0x7121, ## __VA_ARGS__), /* I810 */ \
@@ -771,16 +764,71 @@
 	INTEL_ATS_M150_IDS(MACRO__, ## __VA_ARGS__), \
 	INTEL_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
 
+/* ARL */
+#define INTEL_ARL_H_IDS(MACRO__, ...) \
+	MACRO__(0x7D51, ## __VA_ARGS__), \
+	MACRO__(0x7DD1, ## __VA_ARGS__)
+
+#define INTEL_ARL_U_IDS(MACRO__, ...) \
+	MACRO__(0x7D41, ## __VA_ARGS__) \
+
+#define INTEL_ARL_S_IDS(MACRO__, ...) \
+	MACRO__(0x7D67, ## __VA_ARGS__), \
+	MACRO__(0xB640, ## __VA_ARGS__)
+
+#define INTEL_ARL_IDS(MACRO__, ...) \
+	INTEL_ARL_H_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_ARL_U_IDS(MACRO__, ## __VA_ARGS__), \
+	INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
+
 /* MTL */
 #define INTEL_MTL_IDS(MACRO__, ...) \
 	MACRO__(0x7D40, ## __VA_ARGS__), \
-	MACRO__(0x7D41, ## __VA_ARGS__), \
 	MACRO__(0x7D45, ## __VA_ARGS__), \
-	MACRO__(0x7D51, ## __VA_ARGS__), \
 	MACRO__(0x7D55, ## __VA_ARGS__), \
 	MACRO__(0x7D60, ## __VA_ARGS__), \
-	MACRO__(0x7D67, ## __VA_ARGS__), \
-	MACRO__(0x7DD1, ## __VA_ARGS__), \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
-#endif /* _I915_PCIIDS_H */
+/* PVC */
+#define INTEL_PVC_IDS(MACRO__, ...) \
+	MACRO__(0x0B69, ## __VA_ARGS__), \
+	MACRO__(0x0B6E, ## __VA_ARGS__), \
+	MACRO__(0x0BD4, ## __VA_ARGS__), \
+	MACRO__(0x0BD5, ## __VA_ARGS__), \
+	MACRO__(0x0BD6, ## __VA_ARGS__), \
+	MACRO__(0x0BD7, ## __VA_ARGS__), \
+	MACRO__(0x0BD8, ## __VA_ARGS__), \
+	MACRO__(0x0BD9, ## __VA_ARGS__), \
+	MACRO__(0x0BDA, ## __VA_ARGS__), \
+	MACRO__(0x0BDB, ## __VA_ARGS__), \
+	MACRO__(0x0BE0, ## __VA_ARGS__), \
+	MACRO__(0x0BE1, ## __VA_ARGS__), \
+	MACRO__(0x0BE5, ## __VA_ARGS__)
+
+/* LNL */
+#define INTEL_LNL_IDS(MACRO__, ...) \
+	MACRO__(0x6420, ## __VA_ARGS__), \
+	MACRO__(0x64A0, ## __VA_ARGS__), \
+	MACRO__(0x64B0, ## __VA_ARGS__)
+
+/* BMG */
+#define INTEL_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)
+
+/* PTL */
+#define INTEL_PTL_IDS(MACRO__, ...) \
+	MACRO__(0xB080, ## __VA_ARGS__), \
+	MACRO__(0xB081, ## __VA_ARGS__), \
+	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB090, ## __VA_ARGS__), \
+	MACRO__(0xB091, ## __VA_ARGS__), \
+	MACRO__(0xB092, ## __VA_ARGS__), \
+	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
+	MACRO__(0xB0A2, ## __VA_ARGS__)
+
+#endif /* __PCIIDS_H__ */
diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 17abfa454..db614b732 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -21,9 +21,9 @@
 #include "intel_hwconfig_types.h"
 #include "ioctl_wrappers.h"
 #include "linux_scaffold.h"
+#include "pciids.h"
 #include "xe_ioctl.h"
 #include "xe_oa.h"
-#include "xe_pciids.h"
 #include "xe_query.h"
 
 #include "xe_oa_metrics_tglgt1.h"
@@ -119,8 +119,8 @@ static bool
 is_acm_gt1(const struct intel_xe_perf_devinfo *devinfo)
 {
 	static const uint32_t devids[] = {
-		XE_DG2_G11_IDS(DEVID),
-		XE_ATS_M75_IDS(DEVID),
+		INTEL_DG2_G11_IDS(DEVID),
+		INTEL_ATS_M75_IDS(DEVID),
 	};
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
 		if (devids[i] == devinfo->devid)
@@ -134,7 +134,7 @@ static bool
 is_acm_gt2(const struct intel_xe_perf_devinfo *devinfo)
 {
 	static const uint32_t devids[] = {
-		XE_DG2_G12_IDS(DEVID),
+		INTEL_DG2_G12_IDS(DEVID),
 	};
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
 		if (devids[i] == devinfo->devid)
@@ -148,8 +148,8 @@ static bool
 is_acm_gt3(const struct intel_xe_perf_devinfo *devinfo)
 {
 	static const uint32_t devids[] = {
-		XE_DG2_G10_IDS(DEVID),
-		XE_ATS_M150_IDS(DEVID),
+		INTEL_DG2_G10_IDS(DEVID),
+		INTEL_ATS_M150_IDS(DEVID),
 	};
 	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
 		if (devids[i] == devinfo->devid)
diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
deleted file mode 100644
index 73d972a8a..000000000
--- a/lib/xe_pciids.h
+++ /dev/null
@@ -1,218 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-/*
- * Copyright © 2022 Intel Corporation
- */
-
-#ifndef _XE_PCIIDS_H_
-#define _XE_PCIIDS_H_
-
-/*
- * Lists below can be turned into initializers for a struct pci_device_id
- * by defining INTEL_VGA_DEVICE:
- *
- * #define INTEL_VGA_DEVICE(id, info) { \
- *	0x8086, id,			\
- *	~0, ~0,				\
- *	0x030000, 0xff0000,		\
- *	(unsigned long) info }
- *
- * And then calling like:
- *
- * XE_TGL_12_GT1_IDS(INTEL_VGA_DEVICE, ## __VA_ARGS__)
- *
- * To turn them into something else, just provide a different macro passed as
- * first argument.
- */
-
-/* TGL */
-#define XE_TGL_GT1_IDS(MACRO__, ...)		\
-	MACRO__(0x9A60, ## __VA_ARGS__),	\
-	MACRO__(0x9A68, ## __VA_ARGS__),	\
-	MACRO__(0x9A70, ## __VA_ARGS__)
-
-#define XE_TGL_GT2_IDS(MACRO__, ...)		\
-	MACRO__(0x9A40, ## __VA_ARGS__),	\
-	MACRO__(0x9A49, ## __VA_ARGS__),	\
-	MACRO__(0x9A59, ## __VA_ARGS__),	\
-	MACRO__(0x9A78, ## __VA_ARGS__),	\
-	MACRO__(0x9AC0, ## __VA_ARGS__),	\
-	MACRO__(0x9AC9, ## __VA_ARGS__),	\
-	MACRO__(0x9AD9, ## __VA_ARGS__),	\
-	MACRO__(0x9AF8, ## __VA_ARGS__)
-
-#define XE_TGL_IDS(MACRO__, ...)		\
-	XE_TGL_GT1_IDS(MACRO__, ## __VA_ARGS__),\
-	XE_TGL_GT2_IDS(MACRO__, ## __VA_ARGS__)
-
-/* RKL */
-#define XE_RKL_IDS(MACRO__, ...)		\
-	MACRO__(0x4C80, ## __VA_ARGS__),	\
-	MACRO__(0x4C8A, ## __VA_ARGS__),	\
-	MACRO__(0x4C8B, ## __VA_ARGS__),	\
-	MACRO__(0x4C8C, ## __VA_ARGS__),	\
-	MACRO__(0x4C90, ## __VA_ARGS__),	\
-	MACRO__(0x4C9A, ## __VA_ARGS__)
-
-/* DG1 */
-#define XE_DG1_IDS(MACRO__, ...)		\
-	MACRO__(0x4905, ## __VA_ARGS__),	\
-	MACRO__(0x4906, ## __VA_ARGS__),	\
-	MACRO__(0x4907, ## __VA_ARGS__),	\
-	MACRO__(0x4908, ## __VA_ARGS__),	\
-	MACRO__(0x4909, ## __VA_ARGS__)
-
-/* ADL-S */
-#define XE_ADLS_IDS(MACRO__, ...)		\
-	MACRO__(0x4680, ## __VA_ARGS__),	\
-	MACRO__(0x4682, ## __VA_ARGS__),	\
-	MACRO__(0x4688, ## __VA_ARGS__),	\
-	MACRO__(0x468A, ## __VA_ARGS__),	\
-	MACRO__(0x468B, ## __VA_ARGS__),	\
-	MACRO__(0x4690, ## __VA_ARGS__),	\
-	MACRO__(0x4692, ## __VA_ARGS__),	\
-	MACRO__(0x4693, ## __VA_ARGS__)
-
-/* ADL-P */
-#define XE_ADLP_IDS(MACRO__, ...)		\
-	MACRO__(0x46A0, ## __VA_ARGS__),	\
-	MACRO__(0x46A1, ## __VA_ARGS__),	\
-	MACRO__(0x46A2, ## __VA_ARGS__),	\
-	MACRO__(0x46A3, ## __VA_ARGS__),	\
-	MACRO__(0x46A6, ## __VA_ARGS__),	\
-	MACRO__(0x46A8, ## __VA_ARGS__),	\
-	MACRO__(0x46AA, ## __VA_ARGS__),	\
-	MACRO__(0x462A, ## __VA_ARGS__),	\
-	MACRO__(0x4626, ## __VA_ARGS__),	\
-	MACRO__(0x4628, ## __VA_ARGS__),	\
-	MACRO__(0x46B0, ## __VA_ARGS__),	\
-	MACRO__(0x46B1, ## __VA_ARGS__),	\
-	MACRO__(0x46B2, ## __VA_ARGS__),	\
-	MACRO__(0x46B3, ## __VA_ARGS__),	\
-	MACRO__(0x46C0, ## __VA_ARGS__),	\
-	MACRO__(0x46C1, ## __VA_ARGS__),	\
-	MACRO__(0x46C2, ## __VA_ARGS__),	\
-	MACRO__(0x46C3, ## __VA_ARGS__)
-
-/* ADL-N */
-#define XE_ADLN_IDS(MACRO__, ...)		\
-	MACRO__(0x46D0, ## __VA_ARGS__),	\
-	MACRO__(0x46D1, ## __VA_ARGS__),	\
-	MACRO__(0x46D2, ## __VA_ARGS__)
-
-/* RPL-S */
-#define XE_RPLS_IDS(MACRO__, ...)		\
-	MACRO__(0xA780, ## __VA_ARGS__),	\
-	MACRO__(0xA781, ## __VA_ARGS__),	\
-	MACRO__(0xA782, ## __VA_ARGS__),	\
-	MACRO__(0xA783, ## __VA_ARGS__),	\
-	MACRO__(0xA788, ## __VA_ARGS__),	\
-	MACRO__(0xA789, ## __VA_ARGS__),	\
-	MACRO__(0xA78A, ## __VA_ARGS__),	\
-	MACRO__(0xA78B, ## __VA_ARGS__)
-
-/* RPL-U */
-#define XE_RPLU_IDS(MACRO__, ...)		\
-	MACRO__(0xA721, ## __VA_ARGS__),	\
-	MACRO__(0xA7A1, ## __VA_ARGS__),	\
-	MACRO__(0xA7A9, ## __VA_ARGS__),	\
-	MACRO__(0xA7AC, ## __VA_ARGS__),	\
-	MACRO__(0xA7AD, ## __VA_ARGS__)
-
-/* RPL-P */
-#define XE_RPLP_IDS(MACRO__, ...)		\
-	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
-	MACRO__(0xA720, ## __VA_ARGS__),	\
-	MACRO__(0xA7A0, ## __VA_ARGS__),	\
-	MACRO__(0xA7A8, ## __VA_ARGS__),	\
-	MACRO__(0xA7AA, ## __VA_ARGS__),	\
-	MACRO__(0xA7AB, ## __VA_ARGS__)
-
-/* DG2 */
-#define XE_DG2_G10_IDS(MACRO__, ...)		\
-	MACRO__(0x5690, ## __VA_ARGS__),	\
-	MACRO__(0x5691, ## __VA_ARGS__),	\
-	MACRO__(0x5692, ## __VA_ARGS__),	\
-	MACRO__(0x56A0, ## __VA_ARGS__),	\
-	MACRO__(0x56A1, ## __VA_ARGS__),	\
-	MACRO__(0x56A2, ## __VA_ARGS__),	\
-	MACRO__(0x56BE, ## __VA_ARGS__),	\
-	MACRO__(0x56BF, ## __VA_ARGS__)
-
-#define XE_DG2_G11_IDS(MACRO__, ...)		\
-	MACRO__(0x5693, ## __VA_ARGS__),	\
-	MACRO__(0x5694, ## __VA_ARGS__),	\
-	MACRO__(0x5695, ## __VA_ARGS__),	\
-	MACRO__(0x56A5, ## __VA_ARGS__),	\
-	MACRO__(0x56A6, ## __VA_ARGS__),	\
-	MACRO__(0x56B0, ## __VA_ARGS__),	\
-	MACRO__(0x56B1, ## __VA_ARGS__),	\
-	MACRO__(0x56BA, ## __VA_ARGS__),	\
-	MACRO__(0x56BB, ## __VA_ARGS__),	\
-	MACRO__(0x56BC, ## __VA_ARGS__),	\
-	MACRO__(0x56BD, ## __VA_ARGS__)
-
-#define XE_DG2_G12_IDS(MACRO__, ...)		\
-	MACRO__(0x5696, ## __VA_ARGS__),	\
-	MACRO__(0x5697, ## __VA_ARGS__),	\
-	MACRO__(0x56A3, ## __VA_ARGS__),	\
-	MACRO__(0x56A4, ## __VA_ARGS__),	\
-	MACRO__(0x56B2, ## __VA_ARGS__),	\
-	MACRO__(0x56B3, ## __VA_ARGS__)
-
-#define XE_DG2_IDS(MACRO__, ...)		\
-	XE_DG2_G10_IDS(MACRO__, ## __VA_ARGS__),\
-	XE_DG2_G11_IDS(MACRO__, ## __VA_ARGS__),\
-	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
-
-#define XE_ATS_M150_IDS(MACRO__, ...)		\
-	MACRO__(0x56C0, ## __VA_ARGS__),	\
-	MACRO__(0x56C2, ## __VA_ARGS__)
-
-#define XE_ATS_M75_IDS(MACRO__, ...)		\
-	MACRO__(0x56C1, ## __VA_ARGS__)
-
-#define XE_ATS_M_IDS(MACRO__, ...)		\
-	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
-	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
-
-/* MTL / ARL */
-#define XE_MTL_IDS(MACRO__, ...)		\
-	MACRO__(0x7D40, ## __VA_ARGS__),	\
-	MACRO__(0x7D41, ## __VA_ARGS__),	\
-	MACRO__(0x7D45, ## __VA_ARGS__),	\
-	MACRO__(0x7D51, ## __VA_ARGS__),        \
-	MACRO__(0x7D55, ## __VA_ARGS__),	\
-	MACRO__(0x7D60, ## __VA_ARGS__),	\
-	MACRO__(0x7D67, ## __VA_ARGS__),	\
-	MACRO__(0x7DD1, ## __VA_ARGS__),        \
-	MACRO__(0x7DD5, ## __VA_ARGS__)
-
-/* PVC */
-#define XE_PVC_IDS(MACRO__, ...)		\
-	MACRO__(0x0B69, ## __VA_ARGS__),	\
-	MACRO__(0x0B6E, ## __VA_ARGS__),	\
-	MACRO__(0x0BD4, ## __VA_ARGS__),	\
-	MACRO__(0x0BD5, ## __VA_ARGS__),	\
-	MACRO__(0x0BD6, ## __VA_ARGS__),	\
-	MACRO__(0x0BD7, ## __VA_ARGS__),	\
-	MACRO__(0x0BD8, ## __VA_ARGS__),	\
-	MACRO__(0x0BD9, ## __VA_ARGS__),	\
-	MACRO__(0x0BDA, ## __VA_ARGS__),	\
-	MACRO__(0x0BDB, ## __VA_ARGS__),	\
-	MACRO__(0x0BE0, ## __VA_ARGS__),	\
-	MACRO__(0x0BE1, ## __VA_ARGS__),	\
-	MACRO__(0x0BE5, ## __VA_ARGS__)
-
-#define XE_LNL_IDS(MACRO__, ...) \
-	MACRO__(0x6420, ## __VA_ARGS__), \
-	MACRO__(0x64A0, ## __VA_ARGS__), \
-	MACRO__(0x64B0, ## __VA_ARGS__)
-
-#define XE_BMG_IDS(MACRO__, ...) \
-	MACRO__(0xE202, ## __VA_ARGS__), \
-	MACRO__(0xE20B, ## __VA_ARGS__), \
-	MACRO__(0xE20C, ## __VA_ARGS__), \
-	MACRO__(0xE20D, ## __VA_ARGS__), \
-	MACRO__(0xE212, ## __VA_ARGS__)
-
-#endif
-- 
2.43.0

