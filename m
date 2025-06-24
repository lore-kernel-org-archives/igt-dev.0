Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2190EC77B7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Jun 2025 11:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88DF10E03A;
	Tue, 24 Jun 2025 11:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOeRICAM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335D910E506
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Jun 2025 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750753802; x=1782289802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vAo3D9rAe3+CYihreyUDP4eLTefPAVSSPFMixN5Tv8c=;
 b=TOeRICAMdnjGDy9Hq3RebWFX4jTjy9U3DpSLm4clQbMROuHnOVnjPr70
 +fx2OqGcCjWhxmX1TYBrBYkM0aEao2ZiMqhr1ofnnfSFniBbyCPyPkIw9
 d+FPzN4muBH+p+mAtzF1PqNwf9Pbx88/faA+FdTtc+x3ZhavOomsWHHLM
 O8IfqPVR20D3vlx1WJqWFwxN/PN9GvJqIx4KDnXAjb4rq7Zb2ynfepbaa
 4z+f0l5tyqRT0oWAT/VJP22+Z7LrEZGngAVxjNtyk6BqrlVPwoICK3buM
 gMTuT7xSMYnV3kkk/zuWZY3ZRFVay+IqSz5PipK1JshFV5kTrhQRD1EDu A==;
X-CSE-ConnectionGUID: mof64adiTgOEMwPRThBnMQ==
X-CSE-MsgGUID: DsrDd0GlS02C6OEaFFu9nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53075035"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="53075035"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 01:27:24 -0700
X-CSE-ConnectionGUID: luV9qBSlT3ey40au4/5T5w==
X-CSE-MsgGUID: Fug76OeRTnOEst11nxYXDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="152547601"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 01:27:21 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u24.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u24.habana-labs.com (8.18.1/8.18.1/Debian-2) with ESMTP id
 55O8RCSD2520631; Tue, 24 Jun 2025 11:27:12 +0300
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, ilia.levi@intel.com, koby.elbaz@intel.com,
 kamil.konieczny@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v3] tools/intel_reg: add support to hw address port
Date: Tue, 24 Jun 2025 11:26:17 +0300
Message-ID: <20250624082616.2520582-2-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 24 Jun 2025 11:08:18 +0000
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

For some platforms we want to access hw addresses.
For that we need a callback per platform that maps the hw address
to pci address. Add infrastructure to support that.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
---
changes since v2:
- add new lines where needed,
- replace %lx with PRIx64 in error message,

 tools/intel_reg.c      | 49 +++++++++++++++++++++++++++++++++++-------
 tools/intel_reg_spec.c | 37 +++++++++++++++++++++++++++++++
 tools/intel_reg_spec.h |  5 +++++
 3 files changed, 83 insertions(+), 8 deletions(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 49afe91c0..8729fb344 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -519,12 +519,17 @@ static int read_register(struct config *config, struct reg *reg, uint32_t *valp)
 		break;
 	case PORT_MCHBAR_16:
 	case PORT_MMIO_16:
+	case PORT_HWADDR_16:
 		val = INREG16(reg->mmio_offset + reg->addr);
 		break;
 	case PORT_MCHBAR_8:
 	case PORT_MMIO_8:
+	case PORT_HWADDR_8:
 		val = INREG8(reg->mmio_offset + reg->addr);
 		break;
+	case PORT_HWADDR_32:
+		val = INREG(reg->mmio_offset + reg->addr);
+		break;
 	case PORT_MMIO_VGA_AR:
 		val = vga_ar_read(reg->addr, true);
 		break;
@@ -610,6 +615,7 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 		break;
 	case PORT_MCHBAR_16:
 	case PORT_MMIO_16:
+	case PORT_HWADDR_16:
 		if (val > 0xffff) {
 			fprintf(stderr, "value 0x%08x out of range for port %s\n",
 				val, reg->port_desc.name);
@@ -619,6 +625,7 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 		break;
 	case PORT_MCHBAR_8:
 	case PORT_MMIO_8:
+	case PORT_HWADDR_8:
 		if (val > 0xff) {
 			fprintf(stderr, "value 0x%08x out of range for port %s\n",
 				val, reg->port_desc.name);
@@ -626,6 +633,9 @@ static int write_register(struct config *config, struct reg *reg, uint32_t val)
 		}
 		OUTREG8(reg->mmio_offset + reg->addr, val);
 		break;
+	case PORT_HWADDR_32:
+		OUTREG(reg->mmio_offset + reg->addr, val);
+		break;
 	case PORT_MMIO_VGA_AR:
 		if (val > 0xff) {
 			fprintf(stderr, "value 0x%08x out of range for port %s\n",
@@ -750,6 +760,14 @@ static int parse_engine(struct reg *reg, const char *s)
 	return reg->engine == NULL;
 }
 
+/*
+ * Get codename for a gen5+ platform to be used for finding register spec file.
+ */
+static const char *get_codename(uint32_t devid)
+{
+	return intel_get_device_info(devid)->codename;
+}
+
 /* s has [(PORTNAME|PORTNUM|ENGINE|MMIO-OFFSET):](REGNAME|REGADDR) */
 static int parse_reg(struct config *config, struct reg *reg, const char *s)
 {
@@ -792,6 +810,29 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
 	case PORT_MCHBAR_8:
 		reg->mmio_offset = mcbar_offset(config->devid);
 		break;
+	case PORT_HWADDR_32:
+	case PORT_HWADDR_16:
+	case PORT_HWADDR_8:
+		{
+			uint64_t dev_addr = strtoull(p, &endp, 16);
+			uint32_t pci_addr;
+			const char *codename = get_codename(config->devid);
+
+			ret = hwaddr_to_pciaddr(codename, dev_addr, &pci_addr);
+			if (ret) {
+				if (ret == -ENOENT)
+					fprintf(stderr, "platform %s does not support hwaddr\n",
+						codename);
+				else
+					fprintf(stderr,
+						"mapping hw addr 0x%" PRIx64 " to pci bar failed (%d)\n",
+						dev_addr, ret);
+
+				return ret;
+			}
+
+			return set_reg_by_addr(config, reg, pci_addr);
+		}
 	default:
 		break;
 	}
@@ -1077,14 +1118,6 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
 	return EXIT_SUCCESS;
 }
 
-/*
- * Get codename for a gen5+ platform to be used for finding register spec file.
- */
-static const char *get_codename(uint32_t devid)
-{
-	return intel_get_device_info(devid)->codename;
-}
-
 /*
  * Get register definitions filename for devid in dir. Return 0 if found,
  * negative error code otherwise.
diff --git a/tools/intel_reg_spec.c b/tools/intel_reg_spec.c
index 632db6b9f..29c89fc82 100644
--- a/tools/intel_reg_spec.c
+++ b/tools/intel_reg_spec.c
@@ -32,6 +32,27 @@
 
 #include "intel_reg_spec.h"
 
+struct hwaddr {
+	const char *codename;
+	int (*hwaddr_lookup)(uint64_t dev_addr, uint32_t *pci_addr);
+};
+
+static const struct hwaddr hwaddr_lookups[] = {
+	{ .codename = NULL, /* sentinel */}
+};
+
+int hwaddr_to_pciaddr(const char *codename, uint64_t dev_addr, uint32_t *pci_addr)
+{
+	int i;
+
+	for (i = 0; hwaddr_lookups[i].codename; i++) {
+		if (strcmp(codename, hwaddr_lookups[i].codename) == 0)
+
+			return hwaddr_lookups[i].hwaddr_lookup(dev_addr, pci_addr);
+	}
+	return -ENOENT;
+}
+
 static const struct port_desc port_descs[] = {
 	{
 		.name = "mmio",
@@ -83,6 +104,22 @@ static const struct port_desc port_descs[] = {
 		.port = PORT_MMIO_VGA_CR,
 		.stride = 1,
 	},
+	{
+		.name = "hwaddr",
+		.port = PORT_HWADDR_32,
+		.stride = 4,
+	},
+	{
+		.name = "hwaddr16",
+		.port = PORT_HWADDR_16,
+		.stride = 2,
+	},
+	{
+		.name = "hwaddr8",
+		.port = PORT_HWADDR_8,
+		.stride = 1,
+	},
+
 	{
 		.name = "portio",
 		.port = PORT_PORTIO,
diff --git a/tools/intel_reg_spec.h b/tools/intel_reg_spec.h
index af396a294..ccf4fd366 100644
--- a/tools/intel_reg_spec.h
+++ b/tools/intel_reg_spec.h
@@ -34,6 +34,10 @@ enum port_addr {
 	PORT_MCHBAR_16,
 	PORT_MCHBAR_8,
 
+	PORT_HWADDR_32,
+	PORT_HWADDR_16,
+	PORT_HWADDR_8,
+
 	PORT_MMIO_VGA_AR,
 	PORT_MMIO_VGA_SR,
 	PORT_MMIO_VGA_GR,
@@ -86,6 +90,7 @@ static inline void *recalloc(void *ptr, size_t nmemb, size_t size)
 	return realloc(ptr, nmemb * size);
 }
 
+int hwaddr_to_pciaddr(const char* codename, uint64_t dev_addr, uint32_t *pci_addr);
 int parse_port_desc(struct reg *reg, const char *s);
 ssize_t intel_reg_spec_builtin(struct reg **regs, uint32_t devid);
 ssize_t intel_reg_spec_file(struct reg **regs, const char *filename);
-- 
2.43.0

