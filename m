Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1C0C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 12:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373FF112D07;
	Tue, 12 Mar 2024 12:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJMEeEnk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CC8112D07
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710246425; x=1741782425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MsgdgSYtsDVDBPY/nzgfGV/wc0KrN3JtiLN/Zx6WxU8=;
 b=OJMEeEnk7tADBWNj+4+fnze3YOSEiw09LiK9bejihgZ6vy3z1TQgizHn
 +p7u/0HAaTvtpQwlgNvgCSQvftzpryY/TyH8mYjTOMWW9ncopE/pWEl62
 rp04t++MQ0ANMdCi9YgUn323yx+YPvgE0Sx7nCOP0Sfz4D1Bh3wEMiPbX
 xwMkqoYe4S2IQnpys+w69JYIByjuh/rYIUlh+j5jxhnz7HqkDRP3Tg0GB
 G7tnN7VN9y0ZEKY1eyUq45ZsKKuwrGecGkWFp1eT8sPr5/zTB2hVt2gVe
 J1S1XghNEHsW+/wb2okwGUGXuobAVp0fiTk4ZlXikss56CAvUgqeYzbGN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15508482"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="15508482"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16222378"
Received: from unknown (HELO localhost) ([10.245.244.207])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:27:01 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 1/2] lib/intel_common: Add placeholder for common i915
 and xe functions
Date: Tue, 12 Mar 2024 13:26:53 +0100
Message-Id: <20240312122654.73689-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Some constructs like querying if device is discrete or getting memory
region origin are common so add new file to place those functions into.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_common.c | 91 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_common.h | 25 +++++++++++++
 lib/meson.build    |  1 +
 3 files changed, 117 insertions(+)
 create mode 100644 lib/intel_common.c
 create mode 100644 lib/intel_common.h

diff --git a/lib/intel_common.c b/lib/intel_common.c
new file mode 100644
index 0000000000..3cc7b7f2be
--- /dev/null
+++ b/lib/intel_common.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "drmtest.h"
+#include "intel_chipset.h"
+#include "intel_common.h"
+#include "i915/intel_memory_region.h"
+#include "xe/xe_query.h"
+
+/**
+ * is_intel_dgfx:
+ * @fd: drm fd
+ *
+ * Check if Intel device opened at @fd is discrete regardless driver (i915/xe).
+ *
+ * Returns: True if device is Intel discrete, false otherwise
+ */
+bool is_intel_dgfx(int fd)
+{
+	return get_intel_driver(fd) == INTEL_DRIVER_XE ? xe_has_vram(fd) :
+							 gem_has_lmem(fd);
+}
+
+/**
+ * is_intel_system_region:
+ * @fd: drm fd
+ * @region: region id
+ *
+ * Check if @region is system region on @fd opened Intel device.
+ *
+ * Returns: True if @region is system memory, false otherwise
+ */
+bool is_intel_system_region(int fd, uint64_t region)
+{
+	enum intel_driver driver = get_intel_driver(fd);
+	bool is_system;
+
+	if (driver == INTEL_DRIVER_I915)
+		is_system = IS_SYSTEM_MEMORY_REGION(region);
+	else
+		is_system = (region == system_memory(fd));
+
+	return is_system;
+}
+
+/**
+ * is_intel_vram_region:
+ * @fd: drm fd
+ * @region: region id
+ *
+ * Check if @region is vram (device memory) region on @fd opened Intel device.
+ *
+ * Returns: True if @region is vram, false otherwise
+ */
+bool is_intel_vram_region(int fd, uint64_t region)
+{
+	enum intel_driver driver = get_intel_driver(fd);
+	bool is_vram;
+
+	if (driver == INTEL_DRIVER_I915)
+		is_vram = IS_DEVICE_MEMORY_REGION(region);
+	else
+		is_vram = (region & (all_memory_regions(fd) & (~system_memory(fd))));
+
+	return is_vram;
+}
+
+/**
+ * is_intel_region_compressible:
+ * @fd: drm fd
+ * @region: region id
+ *
+ * Check if @region is compressible on @fd opened Intel device.
+ *
+ * Returns: True if @region is compressible, false otherwise
+ */
+bool is_intel_region_compressible(int fd, uint64_t region)
+{
+	bool is_dgfx = is_intel_dgfx(fd);
+	bool is_vram = is_intel_vram_region(fd, region);
+
+	if (is_dgfx && is_vram)
+		return true;
+
+	if (AT_LEAST_GEN(intel_get_drm_devid(fd), 20) && !is_dgfx)
+		return true;
+
+	return false;
+}
diff --git a/lib/intel_common.h b/lib/intel_common.h
new file mode 100644
index 0000000000..924802473b
--- /dev/null
+++ b/lib/intel_common.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef __INTEL_COMMON_H__
+#define __INTEL_COMMON_H__
+
+/**
+ * SECTION:intel_common
+ * @short_description: i915/xe common library code
+ * @title: Intel library
+ * @include: intel_common.h
+ *
+ */
+
+#include <stdbool.h>
+#include <stdint.h>
+
+bool is_intel_dgfx(int fd);
+bool is_intel_system_region(int fd, uint64_t region);
+bool is_intel_vram_region(int fd, uint64_t region);
+bool is_intel_region_compressible(int fd, uint64_t region);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 6122861d8b..934bac5c67 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -59,6 +59,7 @@ lib_sources = [
 	'intel_bufops.c',
 	'intel_chipset.c',
 	'intel_cmds_info.c',
+	'intel_common.c',
 	'intel_compute.c',
 	'intel_compute_square_kernels.c',
 	'intel_ctx.c',
-- 
2.34.1

