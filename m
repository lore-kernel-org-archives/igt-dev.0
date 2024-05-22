Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37AFC25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 12:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749C910F3E4;
	Wed, 22 May 2024 12:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPFCKzCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02CC10EDBF
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 12:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716379366; x=1747915366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=F1pTwUnMhAmfpRIedeUTjBj3jG94+X8V5aZfeKKqOMY=;
 b=bPFCKzCAdeyWcN4pfLyLwEHS2Inn/JJxXpbQV6Mp5UHa5VbG3tRZPSUP
 ClhfhuIgObrqSWtY0UpnVyXFMNUB2dtEvSZzArJuuNsVdvexGQIqKwYAU
 e+bFOh3wSZnOOp2sQJ7y0WRoC0KSgOVG91qHDe8MeHmBfdcu1loHt7T0M
 7oeiSbk1afQDYdh+V0k/Q9G08bwWR6OwZ7KZe22SY7kloMgFKHcqAVIaO
 qgdCe3ajTOvfJ2Pm5bHL9doQklo2dU4hjrlD2eFWBoQYPhmyQFs29Hgr5
 Su6V5s3n9kNN83dhiUrQUc0KWfUiFbyEi1Kx9zTyI21w95lpl2bx0FmkF w==;
X-CSE-ConnectionGUID: +CgIy+8iT1+X2q6ZSrgW2Q==
X-CSE-MsgGUID: oIZJxhd6TAu04D5nXmIrmQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="23235943"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="23235943"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 05:02:45 -0700
X-CSE-ConnectionGUID: ewg9Jh7aQ86jqVzSknJfFA==
X-CSE-MsgGUID: 6zxrJr7QQT6nLkAehMbApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="33326498"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 05:02:44 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.245.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2BD5120BF42F;
 Wed, 22 May 2024 05:02:44 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1s9kg6-00000000Cbt-0LoU; Wed, 22 May 2024 14:02:42 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	katarzyna.piecielska@intel.com
Subject: [PATCH i-g-t v4] tools/mk_detect_intel_gpu: add a tool to detect
 Intel GPUs from their PCI IDs
Date: Wed, 22 May 2024 14:02:40 +0200
Message-ID: <20240522120240.48463-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Such tool parses the Kernel drivers for both i915 and Xe and
generates a script that helps detecting Intel GPU models.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tools/mk_detect_intel_gpu/Makefile  |  57 ++++++++
 tools/mk_detect_intel_gpu/get_gpu.c | 216 ++++++++++++++++++++++++++++
 2 files changed, 273 insertions(+)
 create mode 100644 tools/mk_detect_intel_gpu/Makefile
 create mode 100644 tools/mk_detect_intel_gpu/get_gpu.c

diff --git a/tools/mk_detect_intel_gpu/Makefile b/tools/mk_detect_intel_gpu/Makefile
new file mode 100644
index 000000000000..ea24307ce19c
--- /dev/null
+++ b/tools/mk_detect_intel_gpu/Makefile
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright © 2022-2024 Intel Corporation
+# Author: Mauro Carvalho Chehab <mchehab@kernel.org>
+#
+# Usage: specify either:
+#  make KERNEL_DIR=<directory to copy files for both i915 and Xe Intel drivers>
+# or:
+#  make XE_DIR=<directory to copy files for Xe Intel driver> I915_DIR=<directory to copy files for i915 Intel driver>
+
+XE_DIR :=
+I915_DIR :=
+
+all: intel_detect_gpu.pl
+
+clean:
+	rm i915_pciids.h i915_id.h xe_pciids.h xe_pci.c get_gpu intel_detect_gpu.pl
+
+ifneq ($(KERNEL_DIR),)
+  XE_DIR := $(KERNEL_DIR)
+  I915_DIR := $(KERNEL_DIR)
+endif
+
+ifeq ($(XE_DIR),)
+  $(error Need a directory with the XE driver)
+endif
+
+ifeq ($(I915_DIR),)
+  $(error Need a directory with the i915 driver)
+endif
+
+intel_detect_gpu.pl: get_gpu
+	./get_gpu >intel_detect_gpu.pl
+	chmod 755 intel_detect_gpu.pl
+
+i915_pciids.h:
+	cp ${I915_DIR}/include/drm/i915_pciids.h .
+	sed s,"(unsigned long) info }","info }", -i i915_pciids.h
+
+xe_pci_ids.h:
+	cp ${XE_DIR}/include/drm/xe_pciids.h .
+
+xe_pci.c:
+	cp ${XE_DIR}/drivers/gpu/drm/xe/xe_pci.c .
+
+i915_id.h: i915_pciids.h xe_pci.c
+	echo "static struct pci_device_id pci_ids[] = {" > i915_id.h
+	tac i915_pciids.h |grep define|perl -ne 'if (/define\s+INTEL_(\w+)_IDS/) { print "\tINTEL_$$1_IDS(\"$$1\"),\n" }' >> i915_id.h
+
+	cat xe_pci.c|perl -ne 'if (m/(XE_)([\w_]+)(_IDS\(INTEL_VGA_DEVICE)/) { print "\t$$1$$2$$3, \"$$2\"),\n"}' >> i915_id.h
+
+	echo "};" >> i915_id.h
+
+get_gpu: get_gpu.c i915_id.h i915_pciids.h xe_pci_ids.h
+	gcc -g -Wall get_gpu.c -o get_gpu
+
+.PHONY: i915_id.h i915_pciids.h
diff --git a/tools/mk_detect_intel_gpu/get_gpu.c b/tools/mk_detect_intel_gpu/get_gpu.c
new file mode 100644
index 000000000000..44fee08d398b
--- /dev/null
+++ b/tools/mk_detect_intel_gpu/get_gpu.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022-2024 Intel Corporation
+ * Author: Mauro Carvalho Chehab <mchehab@kernel.org>
+ */
+
+
+#include "i915_pciids.h"
+#include "xe_pciids.h"
+
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+
+struct pci_device_id {
+	unsigned int vendor, device;
+	unsigned int subvendor, subdevice;
+	unsigned int class, class_mask;
+	char *name;
+};
+
+#include "i915_id.h"
+
+#define ARRAY_SIZE(arr) sizeof(arr)/sizeof(*arr)
+
+#define TGL "TGL_12"
+
+int cmpfunc (const void *_a, const void *_b) {
+        int ret;
+
+        const struct pci_device_id *a = _a;
+        const struct pci_device_id *b = _b;
+
+        ret = strcmp(a->name, b->name);
+        if (ret)
+                return ret;
+
+        ret = a->vendor - b->vendor;
+        if (ret)
+                return ret;
+
+        ret = a->device - b->device;
+        if (ret)
+                return ret;
+
+        ret = a->subvendor - b->subvendor;
+        if (ret)
+                return ret;
+
+        ret = a->subdevice - b->subdevice;
+        if (ret)
+                return ret;
+
+        ret = a->class - b->class;
+        if (ret)
+                return ret;
+
+        ret = a->class_mask - b->class_mask;
+
+        return ret;
+}
+
+
+int main(void)
+{
+	int i;
+	int shown[0x10000] = { [0 ... 0xffff] = -1 };
+	int ignore[ARRAY_SIZE(pci_ids)] = { 0 };
+	int other[ARRAY_SIZE(pci_ids)] = { [0 ... ARRAY_SIZE(pci_ids) - 1] = -1 };
+	char last[80] = "";
+
+	printf("#!/usr/bin/perl\n\n");
+	printf("$ENV{'LC_ALL'} = 'C';\n\n");
+
+        qsort(pci_ids, ARRAY_SIZE(pci_ids), sizeof(*pci_ids), cmpfunc);
+
+	/*
+	 * Step 1: Handle non-subvendor specific devices, discovering duplicates
+	 */
+	for (i = 0; i < ARRAY_SIZE(pci_ids); i++) {
+		if (pci_ids[i].subvendor != (unsigned int)-1)
+			continue;
+
+		if (!strncmp(pci_ids[i].name, TGL, strlen(TGL))) {
+			char *tmp = strdup(pci_ids[i].name);
+			pci_ids[i].name = tmp;
+			strcpy(pci_ids[i].name + 3, tmp + strlen(TGL));
+		}
+
+		if (shown[pci_ids[i].device] >= 0) {
+			ignore[i] = i;
+
+                        // If it is duplicated, just ignore it
+                        if (!cmpfunc(&pci_ids[i], &pci_ids[shown[pci_ids[i].device]]))
+                                continue;
+
+			fprintf(stderr, "PCI ID: %04x:%04x %s is a subtype of %s\n",
+			        pci_ids[i].vendor, pci_ids[i].device,
+			        pci_ids[i].name,
+				pci_ids[shown[pci_ids[i].device]].name);
+
+			other[shown[pci_ids[i].device]] = i;
+			continue;
+		}
+		shown[pci_ids[i].device] = i;
+
+		if (pci_ids[i].device == 0x56c0)
+			pci_ids[i].name = "ATS_M1";
+
+		if (pci_ids[i].device == 0x56c1)
+			pci_ids[i].name = "ATS_M3";
+
+		fprintf(stderr, "Adding: %s: vendor: %04x:%04x\n",
+		        pci_ids[i].name,
+		        pci_ids[i].vendor, pci_ids[i].device);
+	}
+
+	/*
+	 * Step 2: output array with all other devices
+	 */
+	printf("my %%intel_pci_id = (");
+
+	for (i = 0; i < ARRAY_SIZE(pci_ids); i++) {
+		if (ignore[i] > 0)
+			continue;
+
+		if (strcmp(last, pci_ids[i].name)) {
+			strcpy(last, pci_ids[i].name);
+			printf("\n");
+		}
+
+		printf("\t\"%04x:%04x\" => \"%s\",\n",
+		       pci_ids[i].vendor, pci_ids[i].device,
+		       pci_ids[i].name
+		);
+	}
+	printf(");\n\n");
+
+	/*
+	 * Step 3: output array with all other devices
+	 */
+	printf("my %%intel_pci_id_alt_name = (");
+
+	last[0] = '\0';
+	for (i = 0; i < ARRAY_SIZE(pci_ids); i++) {
+		if (ignore[i] > 0)
+			continue;
+
+		if (other[i] < 0)
+			continue;
+
+		if (strcmp(last, pci_ids[i].name)) {
+			strcpy(last, pci_ids[i].name);
+			printf("\n\t# %s alternative names\n", pci_ids[i].name);
+		}
+
+		printf("\t\"%04x:%04x\" => \"%s\",\n",
+		       pci_ids[i].vendor, pci_ids[i].device,
+		       pci_ids[other[i]].name
+		);
+	}
+	printf(");\n\n");
+
+	/*
+	 * Step 4: output array for devices with subvendor/subdevice
+	 */
+	printf("my %%intel_pci_subvendor_id = (\n");
+
+	for (i = 0; i < ARRAY_SIZE(pci_ids); i++) {
+		if (pci_ids[i].subvendor == (unsigned int) -1)
+			continue;
+
+		fprintf(stderr, "Adding: %s: vendor: %04x:%04x, subvendor: %04x:%04x\n",
+		        pci_ids[i].name,
+		        pci_ids[i].vendor, pci_ids[i].device,
+		        pci_ids[i].subvendor, pci_ids[i].subdevice);
+
+		printf("\t\"%04x:%04x %04x:%04x\" => \"%s\",\n",
+		       pci_ids[i].vendor, pci_ids[i].device,
+		       pci_ids[i].subvendor, pci_ids[i].subdevice,
+		       pci_ids[i].name
+		);
+
+		ignore[i] = 1;
+	}
+	printf(");\n\n");
+
+	printf("sub fix_id($) {\n");
+	printf("\tmy $id = shift;\n");
+	printf("\t$id = $intel_pci_id{$id} if defined($intel_pci_id{$id});\n");
+	printf("\treturn $id;\n}\n\n");
+	printf("my @gpus;\n");
+	printf("my $id;\n\n");
+	printf("open IN, \"lspci -nm|\";\n");
+	printf("while (<IN>) {\n");
+	printf("\tif (m/\"(8086)\"\\s\"([\\da-f]+)\".*\"([^\\\"]*)\"\\s\"([^\\\"]*\")/) {\n");
+	printf("\t\tmy $pci_id_sub = \"$1:$2 $3:$4\";\n");
+	printf("\t\tmy $pci_id = \"$1:$2\";\n");
+	printf("\t\tif (defined($intel_pci_subvendor_id{$pci_id_sub})) {\n");
+	printf("\t\t\t$id = $intel_pci_subvendor_id{$pci_id};\n");
+	printf("\t\t} elsif (defined($intel_pci_id{$pci_id})) {\n");
+	printf("\t\t\t$id = $intel_pci_id{$pci_id};\n");
+	printf("\t\t}\n");
+	printf("\t\tif ($id) {\n");
+	printf("\t\t\tmy $subtype = \"\";\n");
+	printf("\t\t\t$subtype = \" (\" . $intel_pci_id_alt_name{$pci_id} .\")\" if defined($intel_pci_id_alt_name{$pci_id});\n");
+	printf("\t\t\tprint \"Detected GPU PCI device: $id$subtype, PCI ID: $pci_id\\n\";\n");
+	printf("\t\t\tundef($id);\n");
+	printf("\t\t\tpush @gpus, $id;\n\t\t}\n\t}\n}\n");
+	printf("close IN;\n\n");
+	printf("if (@gpus == 0) {\n");
+	printf("\tprint STDERR \"Warning: No Intel GPUs detected.\\n\";\n");
+	printf("} elsif (@gpus > 1) {\n");
+	printf("\tprint STDERR \"Warning: More than one Intel GPUs detected.\\n\";\n");
+	printf("}\n");
+}
-- 
2.44.0

