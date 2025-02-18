Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7429FC021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B133610E79B;
	Wed, 19 Feb 2025 09:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kthbYxbG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C9910E10C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 09:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739869295; x=1771405295;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GcQtq8o5jMWMW8qWsA7nZkFNjtF7zptkK8gr83epehc=;
 b=kthbYxbGtarc03bTlBt1gfo5ME0ctZPiSHw9Uy9CQ/bsexprsNvEIPdU
 Pj/pI7UCeY64/QJd758Me7y2nHhFaMivCvVXAI1GUbBVtSMoEgUePudhW
 5MswLLAvhnrXDcJJOyDF3vrqCbaqBpTWyl+fQe6Jf/pyRMjUbTnd581E8
 D6t9advfZg04pQsCNG6kowce34srjAHTuP3OKzLC5geYpJnS/Lymg83MP
 u3mi5CtrlRi4AFX/BkE1sNRnStRbn2TCzYn+XS9BUG1VLoF/nGOT9MwEO
 JxFxrKY6OGI3EwwAlG+bSEyuxIGBF8dSQ5SwJfb7ANy3gwXX1tJrBGc6L Q==;
X-CSE-ConnectionGUID: TZl/YlicRRGUjBvUO9yFqQ==
X-CSE-MsgGUID: GVP8w9d0RmCWsxczrP9/7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40810064"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="40810064"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 01:01:34 -0800
X-CSE-ConnectionGUID: QSiVzEB6SaG2Z7yyfFrhGA==
X-CSE-MsgGUID: U2mKyTqdRE64yxLcUwMQZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="114076895"
Received: from intelmailrelay-01.habana-labs.com ([10.111.11.20])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 01:01:33 -0800
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 51I91NYC245676
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2025 11:01:23 +0200
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 51I91Nax245675;
 Tue, 18 Feb 2025 11:01:23 +0200
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, koby.elbaz@intel.com, lucas.demarchi@intel.com,
 Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Subject: [PATCH] intel_reg: add support to reading reg with debugfs ioctl
Date: Tue, 18 Feb 2025 11:01:22 +0200
Message-Id: <20250218090122.245662-1-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:29:26 +0000
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

use the new debugfs mmio ioctl in Xe driver to read/write
registers in the intel_reg tool

to use the debugfs ioctl, run:
sudo intel_reg write debugfs:0x71D05000 1
sudo intel_reg read debugfs:0x71D05000
      debugfs:0x71d05000 (debugfs:0x71d05000): 0x00000001

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
---
The Xe driver patch is:
https://patchwork.freedesktop.org/patch/594198/?series=133505
(mailinglist archv) https://lore.kernel.org/intel-xe/20240515165244.156194-1-kelbaz@habana.ai/

 lib/xe/xe_debugfs_mmio.h | 39 +++++++++++++++++++++++
 tools/intel_reg.c        | 69 ++++++++++++++++++++++++++++++++++++++++
 tools/intel_reg_spec.c   |  5 +++
 tools/intel_reg_spec.h   |  2 ++
 4 files changed, 115 insertions(+)
 create mode 100644 lib/xe/xe_debugfs_mmio.h

diff --git a/lib/xe/xe_debugfs_mmio.h b/lib/xe/xe_debugfs_mmio.h
new file mode 100644
index 000000000..a715487c7
--- /dev/null
+++ b/lib/xe/xe_debugfs_mmio.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_DEBUGFS_MMIO_H_
+#define _XE_DEBUGFS_MMIO_H_
+
+#include <drm/drm.h>
+
+#define XE_DEBUGFS_MMIO_32BIT		0x1
+#define XE_DEBUGFS_MMIO_64BIT		0x2
+#define XE_DEBUGFS_MMIO_BITS_MASK	(XE_DEBUGFS_MMIO_32BIT | XE_DEBUGFS_MMIO_64BIT)
+#define XE_DEBUGFS_MMIO_READ		0x4
+#define XE_DEBUGFS_MMIO_WRITE		0x8
+#define XE_DEBUGFS_MMIO_OPS_MASK	(XE_DEBUGFS_MMIO_READ | XE_DEBUGFS_MMIO_WRITE)
+
+#define XE_DEBUGFS_MMIO_VALID_FLAGS (XE_DEBUGFS_MMIO_BITS_MASK | XE_DEBUGFS_MMIO_OPS_MASK)
+
+struct xe_debugfs_mmio_ioctl_data {
+	/** @extensions: Pointer to the first extension struct, if any */
+	__u64 extensions;
+
+	__u32 addr;
+
+	__u32 flags;
+
+	__u64 value;
+
+	/** @reserved: Reserved */
+	__u64 reserved[2];
+};
+
+#define XE_DEBUGFS_MMIO_IOCTL_NR	0x00
+
+#define XE_DEBUGFS_MMIO_IOCTL \
+	_IOWR(0x20, XE_DEBUGFS_MMIO_IOCTL_NR, struct xe_debugfs_mmio_ioctl_data)
+
+#endif /* _XE_DEBUGFS_MMIO_H_ */
diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index bb1ab2889..36f549385 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -31,6 +31,7 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <unistd.h>
+#include <sys/ioctl.h>
 
 #include "i915/gem_create.h"
 #include "igt.h"
@@ -39,6 +40,7 @@
 #include "intel_chipset.h"
 
 #include "intel_reg_spec.h"
+#include "xe/xe_debugfs_mmio.h"
 
 
 #ifdef HAVE_SYS_IO_H
@@ -497,6 +499,67 @@ static void vga_cr_write(uint8_t index, uint8_t value, bool mmio)
 	vga_idx_write(vga_crx(mmio), vga_crd(mmio), index, value, mmio);
 }
 
+static uint64_t debugfs_ioctl_write(uint64_t addr, uint32_t val)
+{
+	int ret, fd, fd_dbg;
+	struct xe_debugfs_mmio_ioctl_data args;
+
+	fd = __drm_open_driver(DRIVER_ANY);
+	if (fd == -1)
+		exit(EXIT_FAILURE);
+
+	fd_dbg = igt_debugfs_open(fd, "mmio", O_RDWR);
+	if (fd_dbg == -1)
+		exit(EXIT_FAILURE);
+
+	memset(&args, 0, sizeof(args));
+	args.addr =  addr;
+	args.flags = XE_DEBUGFS_MMIO_WRITE | XE_DEBUGFS_MMIO_32BIT;
+	args.value = val;
+
+	ret = ioctl(fd_dbg, XE_DEBUGFS_MMIO_IOCTL, &args);
+	if (ret) {
+		fprintf(stderr, "error writing register with debugfs ioctl: %s",
+				strerror(errno));
+		close(fd_dbg);
+		close(fd);
+		exit(EXIT_FAILURE);
+	}
+	close(fd_dbg);
+	close(fd);
+	return 0;
+}
+
+static uint64_t debugfs_ioctl_read(uint64_t addr)
+{
+	int ret, fd, fd_dbg;
+	struct xe_debugfs_mmio_ioctl_data args;
+
+	fd = __drm_open_driver(DRIVER_ANY);
+	if (fd == -1)
+		exit(EXIT_FAILURE);
+
+	fd_dbg = igt_debugfs_open(fd, "mmio", O_RDWR);
+	if (fd_dbg == -1)
+		exit(EXIT_FAILURE);
+
+	memset(&args, 0, sizeof(args));
+	args.addr =  addr;
+	args.flags = XE_DEBUGFS_MMIO_READ | XE_DEBUGFS_MMIO_32BIT;
+
+	ret = ioctl(fd_dbg, XE_DEBUGFS_MMIO_IOCTL, &args);
+	if (ret) {
+		fprintf(stderr, "error reading register with debugfs ioctl: %s",
+				strerror(errno));
+		close(fd_dbg);
+		close(fd);
+		exit(EXIT_FAILURE);
+	}
+	close(fd_dbg);
+	close(fd);
+	return args.value;
+}
+
 static int read_register(struct config *config, struct reg *reg, uint32_t *valp)
 {
 	uint32_t val = 0;
@@ -546,6 +609,9 @@ static int read_register(struct config *config, struct reg *reg, uint32_t *valp)
 	case PORT_PORTIO_VGA_CR:
 		val = vga_cr_read(reg->addr, false);
 		break;
+	case PORT_DEBUGFS_IOCTL:
+		val = debugfs_ioctl_read(reg->mmio_offset + reg->addr);
+		break;
 	case PORT_BUNIT:
 	case PORT_PUNIT:
 	case PORT_NC:
@@ -650,6 +716,9 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 		}
 		vga_cr_write(reg->addr, val, true);
 		break;
+	case PORT_DEBUGFS_IOCTL:
+		val = debugfs_ioctl_write(reg->mmio_offset + reg->addr, val);
+		break;
 	case PORT_PORTIO:
 		if (val > 0xff) {
 			fprintf(stderr, "value 0x%08x out of range for port %s\n",
diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
index 632db6b9f..5c3ded213 100644
--- a/tools/intel_reg_spec.c
+++ b/tools/intel_reg_spec.c
@@ -108,6 +108,11 @@ static const struct port_desc port_descs[] = {
 		.port = PORT_PORTIO_VGA_CR,
 		.stride = 1,
 	},
+	{
+		.name = "debugfs",
+		.port = PORT_DEBUGFS_IOCTL,
+		.stride = 4, /* we only support 4 bytes read for debufs */
+	},
 	{
 		.name = "bunit",
 		.port = PORT_BUNIT,
diff --git a/tools/intel_reg_spec.h b/tools/intel_reg_spec.h
index af396a294..39337e0e9 100644
--- a/tools/intel_reg_spec.h
+++ b/tools/intel_reg_spec.h
@@ -46,6 +46,8 @@ enum port_addr {
 	PORT_PORTIO_VGA_GR,
 	PORT_PORTIO_VGA_CR,
 
+	PORT_DEBUGFS_IOCTL,
+
 	PORT_NONE = 0,
 
 	/* vlv */
-- 
2.34.1

