Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB82D3B7E3
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 07:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0FD10E38F;
	Mon, 25 Nov 2024 07:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VyA/x2Gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB5810E38A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 07:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732519933; x=1764055933;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=pF2dehF7wSMsPJJv4Wgl24mPnqGvtGJK8/CZ1FkZbYo=;
 b=VyA/x2GpjvLaLxcndj4KZWWg8x5Xxd7OSWikkVu+a9GMIOqbKAKPhWMm
 da+YBrud6OmfRBRXazcIUnwfpti2dveArtLi5wjnDa55Iaus2CeUKESQW
 iceEYYTjZ72UjjinmPv3cciOoV+9oOR626UwdNZ4abWvltYq/uXAWHeUx
 K6STTW+3SkWWYXEFFLjC0HctcKQddIVdQsINUmbugfeJ2n+fz2SN4VHlA
 GVasPxQAxroTMvHDbryqvtRPNRHJiqrdSpQgtEkUvSfeAb3gSDutGebYZ
 ub4MMRtQHjZQeGalHaFEqzUMp+odH6R/ATLpAoFBPTvYz8uVpkqtldxXO Q==;
X-CSE-ConnectionGUID: eows3IOxQHuf7JckuLQg6w==
X-CSE-MsgGUID: ZlMJFX4PTH68nylQHeaSXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="31972851"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="31972851"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:13 -0800
X-CSE-ConnectionGUID: VwgtTO2mQwasjT1eUfHlMg==
X-CSE-MsgGUID: C5c6h5ZWTuqq47E0JfOVOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91595727"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:32:12 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 25 Nov 2024 08:31:52 +0100
Subject: [PATCH v4 3/4] lib/gpgpu_shader: pass surface desription to
 shaders via inline data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-gpgpu_send_rework-v4-3-c16b568a1f3d@intel.com>
References: <20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com>
In-Reply-To: <20241125-gpgpu_send_rework-v4-0-c16b568a1f3d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2968;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=pF2dehF7wSMsPJJv4Wgl24mPnqGvtGJK8/CZ1FkZbYo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnRCf0FrDoFWsZFTixDI2C4niWNGbhqu6jv4OTia/0
 f2m6WqmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ0Qn9AAKCRAjYrKT3hD912c6C/
 4nPnWKeDcq4z4CNC00Tq+jsXur3ERxCbM+sQ2lsP0lzDpc/QLuekqqvUh49wQg5IHI76Y0KJMiPTJS
 CXgByjcf9VMQCeLpgLZhSHhLNuYtEXIlN/nAt+WEIktCnW3/Qd0kByhOO8DXTJUNeTcBZBbklMxFK0
 wTA7oeJivNGdkdMOBIif/IPnXBZqvSrQqmWRDyMWzONVC1NQIsMedg0vgnZKFG1KEuIY9EvmvJ1Fs/
 UaeBLS08UhfGqaq5+/DMvTec/BtZxAND/9oMFWtwBUfdVxEMzvbXiaP/b2+LdDdDVs6PM9dsSQSafz
 9O//+GpLIkf+LRK1/YT1+QqrjkjJrHA8ipvQcPtrycGW8ylnLRX09lDRYcO7T8OEeNvVixp29HWW33
 yiy5Ss0Z8eFYWSEzbEWwWAWzIWZBTWNFSuLH7Z/3IqGYh/xtFDjxp3rfgw/42QNdSjlCdu0ZSh2qOc
 RsTnwKdhxqRKZMRYbSJjIDHqzIZ6ydjj3X4LJTDgrKlYs=
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
---
 lib/gpgpu_shader.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 363435e7efd3..52506705e517 100644
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

