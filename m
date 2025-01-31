Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C97C02194
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 20:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140A610E1FE;
	Fri, 31 Jan 2025 20:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/PVQXm6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A93010E1FE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738355385; x=1769891385;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=reHk9lg2wXjYUtjaV37T4hmNRKQ7xd5n0LmTfDjLeu0=;
 b=b/PVQXm6+6jerMdMIFzxbouya6FP069A3h750wVQAyFYMbelUifT5Yg2
 T+SMnZZfXXd/KUMZbGUlRJD8o04Z8WHe3NTUWd1drwagDw9zrjDyRBgYh
 T0uyLtX2buZrg9pmOUErGnbDSBGdefGC4olS21AU27qvKJ4jkNdnUL2lm
 VF4guCt6UahbLBLYnb8iB+awF0HhD02mgIgXk6KP2sr4Vip3WzrYzhvFl
 ksA+DIWXXz44/bj3jJl0juV3FVeek6JIkxiiiolXi/cB58XLs6iwv+wDJ
 FKwR2LyOrlUaB3cD8pBGondxlUZZQy1yi1kpRemU0GLtwukioMgO8R95b Q==;
X-CSE-ConnectionGUID: jcH4e9bJTuu7+jJoclGQ3w==
X-CSE-MsgGUID: Q0lQACL4T0uLNqza5cSLkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="56361411"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="56361411"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 12:29:45 -0800
X-CSE-ConnectionGUID: oxcDh9RhRbKpuhKXn/Jlug==
X-CSE-MsgGUID: KHlxNsRIT9eTm76KtLq6gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="109659437"
Received: from dut2949atsm.iind.intel.com ([10.49.63.13])
 by orviesa006.jf.intel.com with ESMTP; 31 Jan 2025 12:29:43 -0800
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Subject: [PATCH 1/2] lib/xe/intel_error_decode_xe: error decode support for xe
 driver
Date: Fri, 31 Jan 2025 20:29:39 +0000
Message-Id: <20250131202940.1124460-2-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131202940.1124460-1-sai.gowtham.ch@intel.com>
References: <20250131202940.1124460-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Adding error decode support for xe driver, this lib support helps us to decode
the errors generated in the dumps, this lib is enabled in the existing intel_error_decode tool
to extend them to work for xe dev core dumps.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 lib/meson.build                    |   1 +
 lib/xe/intel_error_decode_xe.c     | 287 +++++++++++++++++++++++++++++
 lib/xe/intel_error_decode_xe_lib.h |  26 +++
 3 files changed, 314 insertions(+)
 create mode 100644 lib/xe/intel_error_decode_xe.c
 create mode 100644 lib/xe/intel_error_decode_xe_lib.h

diff --git a/lib/meson.build b/lib/meson.build
index 9fffdd3c6..c48a64a2c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -112,6 +112,7 @@ lib_sources = [
 	'igt_msm.c',
 	'igt_dsc.c',
 	'igt_hook.c',
+        'xe/intel_error_decode_xe.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
 	'xe/xe_mmio.c',
diff --git a/lib/xe/intel_error_decode_xe.c b/lib/xe/intel_error_decode_xe.c
new file mode 100644
index 000000000..8da06775d
--- /dev/null
+++ b/lib/xe/intel_error_decode_xe.c
@@ -0,0 +1,287 @@
+/* SPDX-License-Identifier: MIT */
+/*
+* Copyright © 2025 Intel Corporation
+*
+* Authors:
+*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
+*/
+
+#include <stdbool.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <xe_drm.h>
+
+#include "drmtest.h"
+#include "instdone.h"
+#include "intel_chipset.h"
+#include "intel_reg.h"
+#include "i915/intel_decode.h"
+#include "xe/intel_error_decode_xe_lib.h"
+
+static uint32_t
+xe_print_head(unsigned int reg)
+{
+	printf("    head = 0x%08x, wraps = %d\n", reg & (0x7ffff<<2), reg >> 21);
+	return reg & (0x7ffff<<2);
+}
+
+static uint32_t
+xe_print_ctl(unsigned int reg)
+{
+        uint32_t ring_length =  (((reg & (0x1ff << 12)) >> 12) + 1) * 4096;
+
+#define BIT_STR(reg, x, on, off) ((1 << (x)) & reg) ? on : off
+
+        printf("    len=%d%s%s%s\n", ring_length,
+               BIT_STR(reg, 0, ", enabled", ", disabled"),
+               BIT_STR(reg, 10, ", semaphore wait ", ""),
+               BIT_STR(reg, 11, ", rb wait ", "")
+                );
+#undef BIT_STR
+        return ring_length;
+}
+
+static void
+xe_print_acthd(unsigned int reg, unsigned int ring_length)
+{
+        if ((reg & (0x7ffff << 2)) < ring_length)
+                printf("    at ring: 0x%08x\n", reg & (0x7ffff << 2));
+        else
+                printf("    at batch: 0x%08x\n", reg);
+}
+
+static void
+xe_print_instdone(uint32_t devid, unsigned int instdone, unsigned int instdone1)
+{
+        int i;
+        static int once;
+
+        if (!once) {
+                if (!init_instdone_definitions(devid))
+                        return;
+                once = 1;
+        }
+
+        for (i = 0; i < num_instdone_bits; i++) {
+                int busy = 0;
+
+                if (instdone_bits[i].reg == INSTDONE_1) {
+                        if (!(instdone1 & instdone_bits[i].bit))
+                                busy = 1;
+                } else {
+                        if (!(instdone & instdone_bits[i].bit))
+                                busy = 1;
+                }
+
+                if (busy)
+                        printf("    busy: %s\n", instdone_bits[i].name);
+        }
+}
+
+static uint16_t xe_get_engine_class(char *name)
+{
+        uint16_t class;
+
+        if (strcmp(name, "rcs") == 0) {
+                class = DRM_XE_ENGINE_CLASS_RENDER;
+        } else if (strcmp(name, "bcs") == 0) {
+                class = DRM_XE_ENGINE_CLASS_COPY;
+        } else if (strcmp(name, "vcs") == 0) {
+                class = DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+        } else if (strcmp(name, "vecs") == 0) {
+                class = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+        } else if (strcmp(name, "ccs") == 0) {
+                class = DRM_XE_ENGINE_CLASS_COMPUTE;
+        }
+
+        return class;
+}
+
+static const char *
+read_param(const char *line, const char *param)
+{
+	if (!(strstr(line, param)))
+		return NULL;
+
+	while (*line != ':')
+		line++;
+	line += 2;
+
+	return line;
+}
+
+/* parse lines like 'batch_addr[0]: 0x0000effeffff5000 */
+bool
+read_error_decode_xe_u64_hex(const char *line, const char *parameter, uint64_t *value)
+{
+   line = read_param(line, parameter);
+   if (!line)
+      return false;
+
+   *value = (uint64_t)strtoull(line, NULL, 0);
+   return true;
+}
+
+/* parse lines like 'PCI ID: 0x9a49' */
+bool
+read_error_decode_xe_hex(const char *line, const char *parameter, uint32_t *value)
+{
+   line = read_param(line, parameter);
+   if (!line)
+      return false;
+
+   *value = (int)strtoul(line, NULL, 0);
+   return true;
+}
+
+/* parse lines like 'rcs0 (physical), logical instance=0' */
+bool
+read_error_decode_xe_engine_name(const char *line, char *ring_name)
+{
+   int i;
+
+   if (!strstr(line, " (physical), logical instance="))
+      return false;
+
+   i = 0;
+   for (i = 0; *line != ' '; i++, line++)
+      ring_name[i] = *line;
+
+   ring_name[i] = 0;
+   return true;
+}
+
+bool
+read_error_decode_topic(const char *line, enum xe_topic *new_topic)
+{
+   static const char *xe_topic_strings[] = {
+      "**** Xe Device Coredump ****",
+      "**** GuC CT ****",
+      "**** Job ****",
+      "**** HW Engines ****",
+      "**** VM state ****",
+   };
+   bool topic_changed = false;
+
+   for (int i = 0; i < ARRAY_SIZE(xe_topic_strings); i++) {
+      if (strncmp(xe_topic_strings[i], line, strlen(xe_topic_strings[i])) == 0) {
+         topic_changed = true;
+         *new_topic = i;
+         break;
+      }
+   }
+
+   return topic_changed;
+}
+
+void read_xe_data_file(FILE *file)
+{
+	struct {
+		uint64_t *addrs;
+		uint8_t len;
+	} batch_buffers = { .addrs = NULL, .len = 0 };
+
+	unsigned int reg;
+	uint32_t devid, ring_length = 0;
+	char  *line = NULL;
+	size_t line_size;
+	enum xe_topic xe_topic = XE_TOPIC_INVALID;
+
+	while(getline(&line, &line_size, file) > 0) {
+		bool topic_changed = false;
+		bool print_line = true;
+
+		topic_changed = read_error_decode_topic(line, &xe_topic);
+		if(topic_changed) {
+			print_line = (xe_topic != XE_TOPIC_VM);
+			if(print_line)
+				fputs(line, stdout);
+			continue;
+		}
+
+		switch (xe_topic) {
+			case XE_TOPIC_DEVICE: {
+				uint32_t value;
+
+				if (read_error_decode_xe_hex(line, "PCI ID", &value)) {
+					devid = value;
+					printf("Detected GEN%i chipset\n", intel_gen(devid));
+				}
+
+				break;
+			}
+			case XE_TOPIC_HW_ENGINES: {
+				char engine_name[64];
+				uint64_t u64_reg;
+
+				if (read_error_decode_xe_engine_name(line, engine_name)) {
+					xe_get_engine_class(engine_name);
+					break;
+				}
+
+				if (read_error_decode_xe_hex(line, "RING_HEAD", &reg)) {
+					xe_print_head(reg);
+					break;
+				}
+
+				if (read_error_decode_xe_hex(line, "RING_CTL", &reg))
+					ring_length = xe_print_ctl(reg);
+
+				if (read_error_decode_xe_hex(line, "RING_INSTDONE", &reg)) {
+					fputs(line, stdout);
+					xe_print_instdone(devid, reg, -1);
+					break;
+				}
+
+				if (read_error_decode_xe_u64_hex(line, "ACTHD", &u64_reg)) {
+					fputs(line, stdout);
+					xe_print_acthd(u64_reg, ring_length);
+					break;
+				}
+
+				if (read_error_decode_xe_hex(line, "SC_INSTDONE", &reg)) {
+					fputs(line, stdout);
+					xe_print_instdone(devid, reg, -1);
+					break;
+				}
+
+				if (read_error_decode_xe_hex(line, "SC_INSTDONE_EXTRA", &reg)) {
+					fputs(line, stdout);
+					xe_print_instdone(devid, -1, reg);
+					break;
+				}
+
+				if (read_error_decode_xe_hex(line, "SAMPLER_INSTDONE", &reg)) {
+					fputs(line, stdout);
+					xe_print_instdone(devid, reg, -1);
+					break;
+				}
+
+				if (read_error_decode_xe_hex(line, "ROW_INSTDONE", &reg)) {
+					fputs(line, stdout);
+					xe_print_instdone(devid, reg, -1);
+					break;
+				}
+
+				break;
+			}
+			case XE_TOPIC_JOB: {
+				uint64_t u64_value;
+
+				if (read_error_decode_xe_u64_hex(line, "batch_addr[", &u64_value)) {
+					batch_buffers.addrs = realloc(batch_buffers.addrs, sizeof(uint64_t) * (batch_buffers.len + 1));
+					batch_buffers.addrs[batch_buffers.len] = u64_value;
+					batch_buffers.len++;
+				}
+
+				break;
+			}
+			default:
+				break;
+		}
+	}
+
+	free(batch_buffers.addrs);
+	free(line);
+}
diff --git a/lib/xe/intel_error_decode_xe_lib.h b/lib/xe/intel_error_decode_xe_lib.h
new file mode 100644
index 000000000..fc69f7cce
--- /dev/null
+++ b/lib/xe/intel_error_decode_xe_lib.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+* Copyright © 2025 Intel Corporation
+*
+* Authors:
+*    Sai Gowtham Ch <sai.gowtham.ch@intel.com>
+*/
+
+#include <stdbool.h>
+#include <stdint.h>
+
+enum xe_topic {
+   XE_TOPIC_DEVICE = 0,
+   XE_TOPIC_GUC_CT,
+   XE_TOPIC_JOB,
+   XE_TOPIC_HW_ENGINES,
+   XE_TOPIC_VM,
+   XE_TOPIC_INVALID,
+};
+
+void read_xe_data_file(FILE *file);
+bool read_error_decode_xe_u64_hex(const char *line, const char *parameter, uint64_t *value);
+bool read_error_decode_xe_hex(const char *line, const char *parameter, uint32_t *value);
+bool read_error_decode_xe_engine_name(const char *line, char *ring_name);
+
+bool read_error_decode_topic(const char *line, enum xe_topic *new_topic);
-- 
2.34.1

