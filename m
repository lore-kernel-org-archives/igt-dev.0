Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F338C25B79
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 08:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A621810E33C;
	Fri, 24 May 2024 08:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqjD9Iek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EA810E13E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716540556; x=1748076556;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=HHDlIp41TXmGjua2BhL5dvBfFYTJo1GD4Pv2Dnni8AM=;
 b=JqjD9Iekh0FgI3T29bYttLMFTeQHySPE11YrTG5r1vNAvkk02jDHV4X9
 deVeCu/4eZQo/vSP0k8g0XWSV4Fz8W/3Nvfb5XYwlwU9bf8P0f0F5Gwzx
 5UyDq5Q8B8Lx0thwpWUTNPwpO2+CJbTtsST+/JjzUtKxfQ99gsxwWtqjR
 IV54niN0z0amz0f7scY1x8JAPG4LkyuD/bpxKqdMkjBL43JRHjgef1uOv
 H9SZDvlyVeD4QpPIeLmaM806gGi0Huh+Rdu6LvUltB5REe2N5yvtHs0CJ
 za9KO6fabTkbjPXvSSvnLJufzwF+DkEPf/7KuPJu2TAJZUTtD5X9QigMF g==;
X-CSE-ConnectionGUID: DcWb5dvhS5y1jscW3dEU0w==
X-CSE-MsgGUID: LxVDdB/IQw6s2WuHrBeFXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12692327"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="12692327"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:16 -0700
X-CSE-ConnectionGUID: xkZ6EjP7SxmBcnP4s1gaew==
X-CSE-MsgGUID: GpNepi2CTXKrpsIo9oaI6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33940907"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 01:49:14 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 24 May 2024 10:49:02 +0200
Subject: [PATCH v3 2/5] lib/gpgpu_shader: tooling for preparing and running
 gpgpu shaders
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240524-iga64_inline_ups-v3-2-62427617ced3@intel.com>
References: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
In-Reply-To: <20240524-iga64_inline_ups-v3-0-62427617ced3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8051;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=HHDlIp41TXmGjua2BhL5dvBfFYTJo1GD4Pv2Dnni8AM=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmUFSFR0j5QwfahQgebEYSbgMVtQSAVTOoKLEzvQiN
 QreHkBiJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZlBUhQAKCRAjYrKT3hD91xg9C/
 4z36aByhKxIZEtvUNexkEibeDzRPXVWbwPUxoIPKbyMyu3aTOMPNG3gfcDj2KWmpisEqnXhtJW4wXG
 YToGqo19K4jqh0ozx0vnsoT6UQt9BRtQQQibi5IAo+lzVyHnlAnNHeEtnMob1+FFitLUMXwnNF0iRl
 /Dcv7c6F0zOnY3Suhyuwu/K8fO+FyiOYc6+XeE0QKbPMChs0hvPEcclwHImpnTxKdu7Y9+pG7ZB6uB
 H2zw1MerqzgtoZTRh3tydK6ww86xfKcZ4NTgitJiKrtNvpFmbd6sYO1h+LL5PbpqTzAqIEpvJG4c0o
 LQjsucEi839mKVfY/T8Jn96XLXwt+3u19ewl02kSOtQyKAnk+kCEOC/Ivvn3iR/raV5z4O3iLAOehT
 1F02khpRBH/GLxmXx8950sQ20HAsRFdRFx/yt23wdtRQE25yyVUmEQYPca8gvmEPqjGu0AS5SLlpJH
 bfJPsHAfOdPRqt8vemcecOnMj/GJ9LFfyeXDwwydqnIlQ=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Implement tooling for building shaders for specific generations.
The library allows you to build and run shader from precompiled blocks
and provides an abstraction layer over gpgpu pipeline.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c | 211 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/gpgpu_shader.h |  38 ++++++++++
 lib/meson.build    |   1 +
 3 files changed, 250 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
new file mode 100644
index 000000000000..d14301789421
--- /dev/null
+++ b/lib/gpgpu_shader.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ *
+ * Author: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
+ */
+
+#include <i915_drm.h>
+
+#include "ioctl_wrappers.h"
+#include "gpgpu_shader.h"
+#include "gpu_cmds.h"
+
+#define SUPPORTED_GEN_VER 1200 /* Support TGL and up */
+
+#define PAGE_SIZE 4096
+#define BATCH_STATE_SPLIT 2048
+/* VFE STATE params */
+#define THREADS (1 << 16) /* max value */
+#define GEN8_GPGPU_URB_ENTRIES 1
+#define GPGPU_URB_SIZE 0
+#define GPGPU_CURBE_SIZE 0
+#define GEN7_VFE_STATE_GPGPU_MODE 1
+
+static uint32_t fill_sip(struct intel_bb *ibb,
+			 const uint32_t sip[][4],
+			 const size_t size)
+{
+	uint32_t *sip_dst;
+	uint32_t offset;
+
+	intel_bb_ptr_align(ibb, 16);
+	sip_dst = intel_bb_ptr(ibb);
+	offset = intel_bb_offset(ibb);
+
+	memcpy(sip_dst, sip, size);
+
+	intel_bb_ptr_add(ibb, size);
+
+	return offset;
+}
+
+static void emit_sip(struct intel_bb *ibb, const uint64_t offset)
+{
+	intel_bb_out(ibb, GEN4_STATE_SIP | (3 - 2));
+	intel_bb_out(ibb, lower_32_bits(offset));
+	intel_bb_out(ibb, upper_32_bits(offset));
+}
+
+static void
+__xelp_gpgpu_execfunc(struct intel_bb *ibb,
+		      struct intel_buf *target,
+		      unsigned int x_dim, unsigned int y_dim,
+		      struct gpgpu_shader *shdr,
+		      struct gpgpu_shader *sip,
+		      uint64_t ring, bool explicit_engine)
+{
+	uint32_t interface_descriptor, sip_offset;
+	uint64_t engine;
+
+	intel_bb_add_intel_buf(ibb, target, true);
+
+	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
+
+	interface_descriptor = gen8_fill_interface_descriptor(ibb, target,
+							      shdr->instr,
+							      4 * shdr->size);
+
+	if (sip && sip->size)
+		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
+	else
+		sip_offset = 0;
+
+	intel_bb_ptr_set(ibb, 0);
+
+	/* GPGPU pipeline */
+	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+		     PIPELINE_SELECT_GPGPU);
+
+	gen9_emit_state_base_address(ibb);
+
+	xelp_emit_vfe_state(ibb, THREADS, GEN8_GPGPU_URB_ENTRIES,
+			    GPGPU_URB_SIZE, GPGPU_CURBE_SIZE, true);
+
+	gen7_emit_interface_descriptor_load(ibb, interface_descriptor);
+
+	if (sip_offset)
+		emit_sip(ibb, sip_offset);
+
+	gen8_emit_gpgpu_walk(ibb, 0, 0, x_dim * 16, y_dim);
+
+	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
+	intel_bb_ptr_align(ibb, 32);
+
+	engine = explicit_engine ? ring : I915_EXEC_DEFAULT;
+	intel_bb_exec(ibb, intel_bb_offset(ibb),
+		      engine | I915_EXEC_NO_RELOC, false);
+}
+
+static void
+__xehp_gpgpu_execfunc(struct intel_bb *ibb,
+		      struct intel_buf *target,
+		      unsigned int x_dim, unsigned int y_dim,
+		      struct gpgpu_shader *shdr,
+		      struct gpgpu_shader *sip,
+		      uint64_t ring, bool explicit_engine)
+{
+	struct xehp_interface_descriptor_data idd;
+	uint32_t sip_offset;
+	uint64_t engine;
+
+	intel_bb_add_intel_buf(ibb, target, true);
+
+	intel_bb_ptr_set(ibb, BATCH_STATE_SPLIT);
+
+	xehp_fill_interface_descriptor(ibb, target, shdr->instr,
+				       4 * shdr->size, &idd);
+
+	if (sip && sip->size)
+		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
+	else
+		sip_offset = 0;
+
+	intel_bb_ptr_set(ibb, 0);
+
+	/* GPGPU pipeline */
+	intel_bb_out(ibb, GEN7_PIPELINE_SELECT | GEN9_PIPELINE_SELECTION_MASK |
+		     PIPELINE_SELECT_GPGPU);
+	xehp_emit_state_base_address(ibb);
+	xehp_emit_state_compute_mode(ibb);
+	xehp_emit_state_binding_table_pool_alloc(ibb);
+	xehp_emit_cfe_state(ibb, THREADS);
+
+	if (sip_offset)
+		emit_sip(ibb, sip_offset);
+
+	xehp_emit_compute_walk(ibb, 0, 0, x_dim * 16, y_dim, &idd, 0x0);
+
+	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
+	intel_bb_ptr_align(ibb, 32);
+
+	engine = explicit_engine ? ring : I915_EXEC_DEFAULT;
+	intel_bb_exec(ibb, intel_bb_offset(ibb),
+		      engine | I915_EXEC_NO_RELOC, false);
+
+}
+
+/**
+ * gpgpu_shader_exec:
+ * @ibb: pointer to initialized intel_bb
+ * @target: pointer to initialized intel_buf to be written by shader/sip
+ * @x_dim: gpgpu/compute walker thread group width
+ * @y_dim: gpgpu/compute walker thread group height
+ * @shdr: shader to be executed
+ * @sip: sip to be executed, can be NULL
+ * @ring: engine index
+ * @explicit_engine: whether to use provided engine index
+ *
+ * Execute provided shader in asynchronous fashion. To wait for completion,
+ * caller has to use the provided ibb handle.
+ */
+void gpgpu_shader_exec(struct intel_bb *ibb,
+		       struct intel_buf *target,
+		       unsigned int x_dim, unsigned int y_dim,
+		       struct gpgpu_shader *shdr,
+		       struct gpgpu_shader *sip,
+		       uint64_t ring, bool explicit_engine)
+{
+	igt_require(shdr->gen_ver >= SUPPORTED_GEN_VER);
+	igt_assert(ibb->size >= PAGE_SIZE);
+	igt_assert(ibb->ptr == ibb->batch);
+
+	if (shdr->gen_ver >= 1250)
+		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
+				      ring, explicit_engine);
+	else
+		__xelp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
+				      ring, explicit_engine);
+}
+
+/**
+ * gpgpu_shader_create:
+ * @fd: drm fd - i915 or xe
+ *
+ * Creates empty shader.
+ *
+ * Returns: pointer to empty shader struct.
+ */
+struct gpgpu_shader *gpgpu_shader_create(int fd)
+{
+	struct gpgpu_shader *shdr = calloc(1, sizeof(struct gpgpu_shader));
+	const struct intel_device_info *info;
+
+	info = intel_get_device_info(intel_get_drm_devid(fd));
+	shdr->gen_ver = 100 * info->graphics_ver + info->graphics_rel;
+	shdr->max_size = 16 * 4;
+	shdr->code = malloc(4 * shdr->max_size);
+	return shdr;
+}
+
+/**
+ * gpgpu_shader_destroy:
+ * @shdr: pointer to shader struct created with 'gpgpu_shader_create'
+ *
+ * Frees resources of gpgpu_shader struct.
+ */
+void gpgpu_shader_destroy(struct gpgpu_shader *shdr)
+{
+	free(shdr->code);
+	free(shdr);
+}
diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
new file mode 100644
index 000000000000..02f6f1aad1e3
--- /dev/null
+++ b/lib/gpgpu_shader.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef GPGPU_SHADER_H
+#define GPGPU_SHADER_H
+
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdlib.h>
+
+struct intel_bb;
+struct intel_buf;
+
+struct gpgpu_shader {
+	uint32_t gen_ver;
+	uint32_t size;
+	uint32_t max_size;
+	union {
+		uint32_t *code;
+		uint32_t (*instr)[4];
+	};
+};
+
+struct gpgpu_shader *gpgpu_shader_create(int fd);
+void gpgpu_shader_destroy(struct gpgpu_shader *shdr);
+
+void gpgpu_shader_dump(struct gpgpu_shader *shdr);
+
+void gpgpu_shader_exec(struct intel_bb *ibb,
+		       struct intel_buf *target,
+		       unsigned int x_dim, unsigned int y_dim,
+		       struct gpgpu_shader *shdr,
+		       struct gpgpu_shader *sip,
+		       uint64_t ring, bool explicit_engine);
+
+#endif /* GPGPU_SHADER_H */
diff --git a/lib/meson.build b/lib/meson.build
index e2f740c116f8..0a3084f8aea2 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -72,6 +72,7 @@ lib_sources = [
 	'media_spin.c',
 	'media_fill.c',
 	'gpgpu_fill.c',
+	'gpgpu_shader.c',
 	'gpu_cmds.c',
 	'rendercopy_i915.c',
 	'rendercopy_i830.c',

-- 
2.34.1

