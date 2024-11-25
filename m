Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A922ED58D50
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 14:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B6310E66F;
	Mon, 25 Nov 2024 14:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C0vl7+Po";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBBD10E66E
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732545240; x=1764081240;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=2P0PmecFbhZTLfGy/zNcQk6RhKm9VMk4bvJyD60TQtI=;
 b=C0vl7+Po0BJOfmK0/OeAlEcTtFs6EXUSBJN1HouENisvPK/8h/8R5nyH
 L6vnEE7xd3vLP0ddEEEMXoiYKzFxUa1NV6yoNhEhMqt5s3lnOZExiJcVv
 Whg/dpYq/kU97ZOFPt99nW6LTt6EDZB1zeVNKHOtFD1PkdUKNkvO+vphD
 iE6WOO4R+AU8LLXBEHPg2/thRSiqBE4NIquk0vhq3FXu/S57sFzdM8Csh
 qi1N3ErC0CkQxFLIIFhVh93o4pyTCYIbPV2jx5DTQQmxTbidID7F6q/di
 JwHuhHpJfBtWQKsIryngcSqNrrPomNK+d6/EYeGFq3m8HXfyKZCjoRZoV g==;
X-CSE-ConnectionGUID: 2ohX2pN0QWGEMV/doab//Q==
X-CSE-MsgGUID: zIrCb7xeSniLEjvjHRE8FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="50177110"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="50177110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 06:33:59 -0800
X-CSE-ConnectionGUID: 5IM4k6ivR8yZliafyJbfHQ==
X-CSE-MsgGUID: O3ifnvARQaeftq3Q2rpqdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="96350040"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 06:33:57 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 25 Nov 2024 15:33:02 +0100
Subject: [PATCH v5 3/4] lib/gpgpu_shader: pass surface desription to
 shaders via inline data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-gpgpu_send_rework-v5-3-4454df13e1e1@intel.com>
References: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
In-Reply-To: <20241125-gpgpu_send_rework-v5-0-4454df13e1e1@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3032;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=2P0PmecFbhZTLfGy/zNcQk6RhKm9VMk4bvJyD60TQtI=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnRIrOeO7Nfzs7UpxO/dIYuVeFDjkKkiXWaW24MACU
 5o6yDvGJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ0SKzgAKCRAjYrKT3hD917esDA
 CSbWnlk+YYpfpfOwWTfcL9w0rC9nZs9VQY7qobeA3rnqMx2ThhrP09dSr+3sBaRDqjeIaowEFZxBwO
 hufzcW8bNcriQBRUErphgpaSwq2wAnDhKo87kSvz67OjlchZDEM8fH/JM1zANCdtICmOQSUym3kNOd
 7k1eiFOsUjrksRrKUKzB5F7jcjD69enFa2wPeUpz+8mMeCWNBhGE+5Ler5ZFh57s1OLAvn+YFW1be2
 shHcMRczFJa8e+Tvh2ZzTmK8UpMNERUKhhf1xfNg98QHdXumzMeagfIudijDBr1UnfbdtuuKxxXjnO
 1esa2yqVSufyMJ7A3OXlXKesImmkRwqcP9DDsS4rjqa/WgFWXYZHtoD4hBf5gAVR6b/OjEYh7G+ArI
 m4mb6bZ33p724EroUUf5eCYOtqnPIxlhXx7NZ6NW8mou73n0gMmeOyDxWMkRH/OFYmgDB43cDdii4T
 hBoh8TZnf2UYphDmNK2LcdBBQUniSjCM8a2RzlXP3gyi4=
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

Since newer architectures require stateless load/stores we need to pass
surface description to the shader. Instead of doing it for every call
we can use inline data which is passed by COMPUTE_WALKER and is stored
in GRF register r1.

v4:
  - moved gpgpu_alloc_gpu_addr changes from next patch here (Dominik),
  - pass vm_id to intel_allocator (Dominik).

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpgpu_shader.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index d9b511d4a474..c591eb119b91 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -148,6 +148,16 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
 		      engine | I915_EXEC_NO_RELOC, false);
 }
 
+static void
+fill_inline_data(uint32_t *inline_data, uint64_t target_offset, struct intel_buf *target)
+{
+	igt_assert(target->surface[0].stride == intel_buf_width(target) * target->bpp/8);
+	*inline_data++ = lower_32_bits(target_offset);
+	*inline_data++ = upper_32_bits(target_offset);
+	*inline_data++ = target->surface[0].stride;
+	*inline_data++ = intel_buf_height(target);
+}
+
 static void
 __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 		      struct intel_buf *target,
@@ -159,6 +169,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 	struct xehp_interface_descriptor_data idd;
 	uint32_t sip_offset;
 	uint64_t engine;
+	uint32_t *inline_data;
 
 	intel_bb_add_intel_buf(ibb, target, true);
 
@@ -186,7 +197,10 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 	if (sip_offset)
 		emit_sip(ibb, sip_offset);
 
+	/* Inline data is at 31th/32th dword of COMPUTE_WALKER, BSpec: 67028 */
+	inline_data = intel_bb_ptr(ibb) + 4 * (shdr->gen_ver < 2000 ? 31 : 32);
 	xehp_emit_compute_walk(ibb, 0, 0, x_dim * 16, y_dim, &idd, 0x0);
+	fill_inline_data(inline_data, CANONICAL(target->addr.offset), target);
 
 	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
 	intel_bb_ptr_align(ibb, 32);
@@ -196,6 +210,17 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 		      engine | I915_EXEC_NO_RELOC, false);
 }
 
+static void gpgpu_alloc_gpu_addr(struct intel_bb *ibb, struct intel_buf *target)
+{
+	uint64_t ahnd;
+
+	ahnd = intel_allocator_open_vm_full(ibb->fd, ibb->vm_id, 0, 0, INTEL_ALLOCATOR_SIMPLE,
+					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	target->addr.offset = intel_allocator_alloc(ahnd, target->handle,
+						    target->surface[0].size, 0);
+	intel_allocator_close(ahnd);
+}
+
 /**
  * gpgpu_shader_exec:
  * @ibb: pointer to initialized intel_bb
@@ -221,6 +246,9 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
 	igt_assert(ibb->size >= PAGE_SIZE);
 	igt_assert(ibb->ptr == ibb->batch);
 
+	if (target->addr.offset == INTEL_BUF_INVALID_ADDRESS)
+		gpgpu_alloc_gpu_addr(ibb, target);
+
 	if (shdr->gen_ver >= 1250)
 		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
 				      ring, explicit_engine);

-- 
2.34.1

