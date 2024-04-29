Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CB4C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 29 Apr 2024 12:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05516112BE8;
	Mon, 29 Apr 2024 12:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoQhl8JP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98096112BF5
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Apr 2024 12:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714392527; x=1745928527;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Gr+Kqh3MgIWzjRlr3xkUEaY5XmHZjiK6ks/8Rdznw2U=;
 b=BoQhl8JPulrbAS71eI1pzr/my06isKYVnpdBSzRTzVcCTYah8iXrIgRN
 t41IlBWTNGDOX+L637/1vaUs6lyaB0E1ODbZvWFm9xR/Gx/TAfLUsasyC
 OQDdmEBzIXbPFM08HStuzZr/UKnLzRxKrucOGiwuAKoYb59OknzLu5+kx
 sfJguGJg+6JJX7Gk58fwepMkVpq1o8j7qcLmlmR8UMe3p4rTU0Nc9RrUu
 DOyz7SI2DVSR/vVlRfDiJNq45SlpWVbpE99K1eDa+K+Y9HJNdlkPQmtIS
 WJ0NLDLfa6T5T6fZHlE4vqECbRYOKk/shoRZLc/XEoOOrYXmENb/vbEV7 g==;
X-CSE-ConnectionGUID: fEeoIzoaS66noqow2AAs9g==
X-CSE-MsgGUID: s6FCltDPSPizP9JZvcJqXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13823220"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="13823220"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:08:47 -0700
X-CSE-ConnectionGUID: dFjr+vgFSE+DgX32g0gXgg==
X-CSE-MsgGUID: F5eWq6jTRBOsG6BVfoofww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="30772366"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:08:46 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 29 Apr 2024 14:08:18 +0200
Subject: [PATCH 2/4] lib/gpgpu_shader: tooling for preparing and running
 gpgpu shaders
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240429-iga64_inline_ups-v1-2-2e9ac46cf6ba@intel.com>
References: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
In-Reply-To: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8186;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=Gr+Kqh3MgIWzjRlr3xkUEaY5XmHZjiK6ks/8Rdznw2U=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmL43Jqb64u2p/pCWuoMYjRpbjPl3/z49vodILubzf
 ubIJx5GJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZi+NyQAKCRAjYrKT3hD9139sC/
 wJimzKl1UAcCbz03pYNA3Z1TlKX66SsBAjTlQYmkYs65xdU6PEvtDPgINPwY1HMTC9Epicz3KJomi9
 uioS/3PAvRLhDsCKI2ZkHJjwcSSS2NdM3QyQpP0GQFNn1PHzOb1iGbNNvWkFQB0l+sie3Xzg79uT9Z
 jNmm2XxLV8EOR5GsBbbKhDfsTdWj8zLIOy6+yEtoKT+F+MMXT/7HBH3PIxwxVq+wPZXZSUoTbqrhSy
 C1JJOMEK6GiT8m9vtLEdkcZZh2zImUefh2Q5D3YitdWGurG/V9A3TytvqO9DlzcIwr0LIrpY1T2fyQ
 dgmvoU7btiUE6crb24zkn2dHs3AsG0rAXovNVkuQS8tWnhB/d7lQ98WR/5UU0b3bq71+Tk1t4/JvLc
 Of9I1otfCnZSuox1D7/5FFBAqpAzwPntipuoO57nuSb1/rIwuup1ytBYy30536aP0qnn8tgAJhDZn6
 YTNiqfFFuyrrT9D/9ezYWwzHdfwkpZJFn0SlYXESMbgGs=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
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

