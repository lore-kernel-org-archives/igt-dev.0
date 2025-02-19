Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06728C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 12:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B434810E7C8;
	Wed, 19 Feb 2025 12:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Br2YVzkZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C491E10E7C8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 12:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739967062; x=1771503062;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MwiQQUBOUIpIKpJ2UmfxcXgRT5ZYcf8KHljEZ4f2e0c=;
 b=Br2YVzkZm/e3nm4Qdh7QdEb1dDRKFgFYEobiCrsLSuwsc9mJQ2BXg0/a
 9bipNBWkhRMVwcNIqVdkSU9Pmvo3famxyhIBt42atpuR5m3JJMbVcorDi
 WVc4iqmpCg3Vp2j0DMpIGfoCu0FTb2Amu2nTXSzuj214HRkTdkk5uxbpX
 irudeydqF7OcbKpDANShbb8Wmpv5teG8uA17RJKrlFKinOrEHlGARoizv
 SSFwEqMFsNV1zFXsmgCWPQ8DEU+kqbfx8ZrdUGcnm6HXkJXV1y0DVE3yA
 MLdO64QYdrYQsBKU880N6LsAo5AS9Gp0qF6yuoXlSyeJfI3Flm4JfLRQ2 g==;
X-CSE-ConnectionGUID: mn1ZXs3vTZCe6+g/7bCIpA==
X-CSE-MsgGUID: SrjkKNzUSbaymsrDvkydWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44346363"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="44346363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 04:11:00 -0800
X-CSE-ConnectionGUID: 4APKIlHST+2eXueaYaf80Q==
X-CSE-MsgGUID: 5psTXuHmRRCx/6+Jji+07Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="119808916"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.6])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 04:10:58 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?=C5=81ukasz=20=C5=81aguna?= <lukasz.laguna@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] tools/intel_reg: Add --pci-slot option
Date: Wed, 19 Feb 2025 13:10:50 +0100
Message-ID: <20250219121050.71831-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.48.1
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

From: Łukasz Łaguna <lukasz.laguna@intel.com>

Add device selection by PCI slot with new option

--pci-slot <domain>:<bus>:<device>[.<func>]

Examples:

intel_reg dump --pci-slot 0000:01:00.0
intel_reg dump --pci-slot=0:8c:0
intel_reg --pci-slot 0:8c:0 read 0x138108

This should help in multi-GPU scenario when someone uses two or
more discrete GPUs. Also while at this update copyright years.

v1: address review comments from Jani (Kamil)
v2: address review - added =BDF in help (Adam)
  removed refactored code, add helper info when option is not
  used, renamed function checking PCI card and improved
  printed info (Krzysztof)
  remove --help from commands arrary as unrelated change (Kamil)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Łukasz Łaguna <lukasz.laguna@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---

This is a re-work of Lukasz Laguna patch from
https://patchwork.freedesktop.org/series/131155/
("tools/intel_reg: add possibility to select device")

Example usage on two dGPU:
sudo ./intel_reg --pci-slot 0000:8c:00.0 read 0x00138108
                                    (0x00138108): 0xf4e57b26
sudo ./intel_reg --pci-slot 0000:87:00.0 read 0x00138108
                                    (0x00138108): 0xf4162825

---
 man/intel_reg.rst |  5 ++-
 tools/intel_reg.c | 90 ++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 93 insertions(+), 2 deletions(-)

diff --git a/man/intel_reg.rst b/man/intel_reg.rst
index 059d8834a..64e4fa57f 100644
--- a/man/intel_reg.rst
+++ b/man/intel_reg.rst
@@ -9,7 +9,7 @@ Intel graphics register multitool
 :Author: Jani Nikula <jani.nikula@intel.com>
 :Date: 2016-03-01
 :Version: |PACKAGE_STRING|
-:Copyright: 2015-2016 Intel Corporation
+:Copyright: 2015-2025 Intel Corporation
 :Manual section: |MANUAL_SECTION|
 :Manual group: |MANUAL_GROUP|
 
@@ -56,6 +56,9 @@ Some options are global, and some specific to commands.
     Pretend to be PCI ID DEVID. Useful with MMIO bar snapshots from other
     machines.
 
+--pci-slot <domain>:<bus>:<device>[.<func>]
+    Find Intel GPU by PCI slot. Useful with multi-GPU hardware.
+
 --spec=PATH
     Read register spec from directory or file specified by PATH; see REGISTER
     SPEC DEFINITIONS below for details. This option implies --decode.
diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index bb1ab2889..49afe91c0 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -39,6 +39,7 @@
 #include "intel_chipset.h"
 
 #include "intel_reg_spec.h"
+#include "igt_device_scan.h"
 
 
 #ifdef HAVE_SYS_IO_H
@@ -89,6 +90,13 @@ struct config {
 	int verbosity;
 };
 
+struct igt_pci_slot {
+	int domain;
+	int bus;
+	int dev;
+	int func;
+};
+
 /* port desc must have been set */
 static int set_reg_by_addr(struct config *config, struct reg *reg,
 			   uint32_t addr)
@@ -1055,6 +1063,9 @@ static int intel_reg_help(struct config *config, int argc, char *argv[])
 	printf(" --devid=DEVID  Specify PCI device ID for --mmio=FILE\n");
 	printf(" --decode       Decode registers. Implied by commands that require it\n");
 	printf(" --all          Decode registers for all known platforms. Implies --decode\n");
+	printf(" --pci-slot=BDF Decode registers for platform described by PCI slot\n"
+	       "		<domain>:<bus>:<device>[.<func>]\n"
+	       "                When this option is not provided use first matched Intel GPU\n");
 	printf(" --binary       Binary dump registers\n");
 	printf(" --verbose      Increase verbosity\n");
 	printf(" --quiet        Reduce verbosity\n");
@@ -1164,6 +1175,62 @@ builtin:
 	return config->regcount;
 }
 
+static int parse_pci_slot_name(struct igt_pci_slot *st, const char *slot_name)
+{
+	st->domain = 0;
+	st->bus = 0;
+	st->dev = 0;
+	st->func = 0;
+
+	return sscanf(slot_name, "%x:%x:%x.%x", &st->domain, &st->bus, &st->dev, &st->func);
+}
+
+static bool is_intel_card_valid(struct pci_device *pci_dev)
+{
+	if (!pci_dev) {
+		fprintf(stderr, "PCI card not found\n");
+		return false;
+	}
+
+	if (pci_device_probe(pci_dev) != 0) {
+		fprintf(stderr, "Couldn't probe PCI card\n");
+		return false;
+	}
+
+	if (pci_dev->vendor_id != 0x8086) {
+		fprintf(stderr, "PCI card is non-Intel\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool find_dev_from_slot(struct pci_device **pci_dev, char *opt_slot)
+{
+	struct igt_pci_slot bdf;
+	bool ret;
+
+	if (parse_pci_slot_name(&bdf, opt_slot) < 3) {
+		fprintf(stderr, "Cannot decode PCI slot from '%s'\n", opt_slot);
+		return false;
+	}
+
+	if (pci_system_init() != 0) {
+		fprintf(stderr, "Couldn't initialize PCI system\n");
+		return false;
+	}
+
+	igt_devices_scan();
+	*pci_dev = pci_device_find_by_slot(bdf.domain, bdf.bus, bdf.dev, bdf.func);
+	ret = is_intel_card_valid(*pci_dev);
+	igt_devices_free();
+
+	if (!ret)
+		fprintf(stderr, "Cannot find PCI card given by slot '%s'\n", opt_slot);
+
+	return ret;
+}
+
 enum opt {
 	OPT_UNKNOWN = '?',
 	OPT_END = -1,
@@ -1173,6 +1240,7 @@ enum opt {
 	OPT_POST,
 	OPT_DECODE,
 	OPT_ALL,
+	OPT_SLOT,
 	OPT_BINARY,
 	OPT_SPEC,
 	OPT_VERBOSE,
@@ -1184,6 +1252,7 @@ int main(int argc, char *argv[])
 {
 	int ret, i, index;
 	char *endp;
+	char *opt_slot = NULL;
 	enum opt opt;
 	const struct command *command = NULL;
 	struct config config = {
@@ -1208,6 +1277,7 @@ int main(int argc, char *argv[])
 		/* options specific to read, dump and decode */
 		{ "decode",	no_argument,		NULL,	OPT_DECODE },
 		{ "all",	no_argument,		NULL,	OPT_ALL },
+		{ "pci-slot",	required_argument,	NULL,	OPT_SLOT },
 		{ "binary",	no_argument,		NULL,	OPT_BINARY },
 		{ 0 }
 	};
@@ -1257,6 +1327,14 @@ int main(int argc, char *argv[])
 		case OPT_DECODE:
 			config.decode = true;
 			break;
+		case OPT_SLOT:
+			opt_slot = strdup(optarg);
+			if (!opt_slot) {
+				fprintf(stderr, "strdup: %s\n",
+					strerror(errno));
+				return EXIT_FAILURE;
+			}
+			break;
 		case OPT_BINARY:
 			config.binary = true;
 			break;
@@ -1298,7 +1376,14 @@ int main(int argc, char *argv[])
 			fprintf(stderr, "--devid without --mmio\n");
 			return EXIT_FAILURE;
 		}
-		config.pci_dev = intel_get_pci_device();
+
+		if (opt_slot) {
+			if (!find_dev_from_slot(&config.pci_dev, opt_slot))
+				return EXIT_FAILURE;
+		} else {
+			config.pci_dev = intel_get_pci_device();
+		}
+
 		config.devid = config.pci_dev->device_id;
 	}
 
@@ -1327,5 +1412,8 @@ int main(int argc, char *argv[])
 	if (config.fd >= 0)
 		close(config.fd);
 
+	if (opt_slot)
+		free(opt_slot);
+
 	return ret;
 }
-- 
2.48.1

