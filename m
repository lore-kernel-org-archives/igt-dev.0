Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0C510E52E
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Dec 2022 12:40:15 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Dec 2022 18:10:05 +0530
Message-Id: <20221209124005.1409673-1-anshuman.gupta@intel.com>
In-Reply-To: <20221207102523.1028941-2-anshuman.gupta@intel.com>
References: <20221207102523.1028941-2-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/5] lib/igt_pci: helpers to get PCI
 capabilities offset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Added helper functions to search for PCI capabilities
with help of libpciaccess library.

v2:
- Added offset == 0 check at starts of capability loop. [Badal]
- Removed unused macro and removed inline from function. [Kamil]
- Added assertion when capability offset doesn't terminate. [Kamil]
- Made find_pci_cap_offset_at() static, exported only
  find_pci_cap_offset(). [Kamil]
v3:
- Initialized the offset and cap_header with 0xff. [Marchin]
- Removed a redundant !offset check. [Marchin]

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Co-developed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 lib/igt_pci.c   | 53 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pci.h   | 25 +++++++++++++++++++++++
 lib/meson.build |  1 +
 3 files changed, 79 insertions(+)
 create mode 100644 lib/igt_pci.c
 create mode 100644 lib/igt_pci.h

diff --git a/lib/igt_pci.c b/lib/igt_pci.c
new file mode 100644
index 0000000000..61aaf939d1
--- /dev/null
+++ b/lib/igt_pci.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <pciaccess.h>
+#include "igt_core.h"
+#include "igt_pci.h"
+
+static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
+				  int start_offset)
+{
+	uint8_t offset = 0xff;
+	uint16_t cap_header = 0xffff;
+	int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE)
+			/ sizeof(cap_header);
+
+	if (pci_device_cfg_read_u8(dev, &offset, start_offset))
+		return -1;
+
+	while (loop--) {
+		igt_assert_f(offset != 0xff, "pci config space inaccessible\n");
+
+		if (offset < PCI_TYPE0_1_HEADER_SIZE)
+			break;
+
+		if (pci_device_cfg_read_u16(dev, &cap_header, (offset & 0xFC)))
+			return -1;
+
+		if (!cap_id || cap_id == (cap_header & 0xFF))
+			return offset;
+
+		offset = cap_header >> 8;
+	}
+
+	igt_fail_on_f(loop <= 0 && offset, "pci capability offset doesn't terminate\n");
+
+	return 0;
+}
+
+/**
+ * find_pci_cap_offset:
+ * @dev: pci device
+ * @cap_id: searched capability id, 0 means any capability
+ *
+ * return:
+ * -1 on config read error, 0 if capability is not found,
+ * otherwise offset at which capability with cap_id is found
+ */
+int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
+{
+	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
+}
diff --git a/lib/igt_pci.h b/lib/igt_pci.h
new file mode 100644
index 0000000000..7cb23a26d8
--- /dev/null
+++ b/lib/igt_pci.h
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef __IGT_PCI_H__
+#define __IGT_PCI_H__
+
+#include <stdint.h>
+#include <endian.h>
+
+/* forward declaration */
+struct pci_device;
+
+#define PCI_TYPE0_1_HEADER_SIZE 0x40
+#define PCI_CAPS_START 0x34
+#define PCI_CFG_SPACE_SIZE 0x100
+
+enum pci_cap_id {
+	PCI_EXPRESS_CAP_ID = 0x10
+};
+
+int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 2c6ebce7b6..028c08c61c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -33,6 +33,7 @@ lib_sources = [
 	'igt_pipe_crc.c',
 	'igt_power.c',
 	'igt_primes.c',
+	'igt_pci.c',
 	'igt_rand.c',
 	'igt_stats.c',
 	'igt_syncobj.c',
-- 
2.25.1
