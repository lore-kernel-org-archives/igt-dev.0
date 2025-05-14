Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCDEC2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 13:34:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBE010E886;
	Thu, 15 May 2025 13:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uxb+mGj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DE510E297
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747248060; x=1778784060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=04mdXw64Gd/j4MgmUuJhhoUBNl3Pz4haemNd/306gWc=;
 b=Uxb+mGj+kJHhcC6dIc5eucjMoyulqg6H0hnpfopdI2fOqABmRBJmoW7P
 mX3W4URGhFY4eOLgtxZSia247Qef7f6RY/F91vZv6rJ15dwhbmFVP7d9F
 rK/MAXmKAHsYHuftZbqmVErTsuN1SIER2FX3KOfUyzdwuHdkjdeLfyFV6
 6GRRKCgBMFP/weQ0gcJbB1jQNE/aNrZ0ymN36VsvUu+izL8j4aAIicbH1
 aK3bRSly2+AM6RtYLvFd1k7nh3d7Xp/d8mQoN63r60r8sU6pWu27TZN33
 17SLqsYT5GiSLwx6XDhGWjMFiuO+weBSHxf9+ymSaPu3ArVproUUjdSqK Q==;
X-CSE-ConnectionGUID: lzwhNPZgQTGjzBqPWGAhuw==
X-CSE-MsgGUID: J5bj05yDRj+0kC0J3JwsTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49234743"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="49234743"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:40:59 -0700
X-CSE-ConnectionGUID: DBgvMa+pRRyD8D/0PBkW0Q==
X-CSE-MsgGUID: lLv9qbGPRbuPyhczYSia2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="142149250"
Received: from intelmailrelay-02.habana-labs.com ([10.111.11.21])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 11:40:58 -0700
Received: internal info suppressed
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 54EIenUO769913
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 14 May 2025 21:40:49 +0300
Received: (from dhirschfeld@localhost)
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 54EIemPH769912;
 Wed, 14 May 2025 21:40:48 +0300
From: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: koby.elbaz@intel.com, lucas.demarchi@intel.com, ilia.levi@intel.com,
 Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Subject: [PATCH] intel_reg: add support to hw address port
Date: Wed, 14 May 2025 21:40:42 +0300
Message-Id: <20250514184042.769898-1-dafna.hirschfeld@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 May 2025 13:34:51 +0000
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
 tools/intel_reg.c      | 48 +++++++++++++++++++++++++++++++++++-------
 tools/intel_reg_spec.c | 36 +++++++++++++++++++++++++++++++
 tools/intel_reg_spec.h |  5 +++++
 3 files changed, 81 insertions(+), 8 deletions(-)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 49afe91c0..28df7904f 100644
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
@@ -792,6 +810,28 @@ static int parse_reg(struct config *config, struct reg *reg, const char *s)
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
+						"mapping hw addr 0x%llx to pci bar failed (%d)\n",
+						dev_addr, ret);
+
+				return ret;
+			}
+			return set_reg_by_addr(config, reg, pci_addr);
+		}
 	default:
 		break;
 	}
@@ -1077,14 +1117,6 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
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
index 632db6b9f..f98d51928 100644
--- a/tools/intel_reg_spec.c
+++ b/tools/intel_reg_spec.c
@@ -32,6 +32,26 @@
 
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
+			return hwaddr_lookups[i].hwaddr_lookup(dev_addr, pci_addr);
+	}
+	return -ENOENT;
+}
+
 static const struct port_desc port_descs[] = {
 	{
 		.name = "mmio",
@@ -83,6 +103,22 @@ static const struct port_desc port_descs[] = {
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
2.34.1

