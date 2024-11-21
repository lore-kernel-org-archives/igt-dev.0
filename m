Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7865D7879A
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 17:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578FB10E9F4;
	Thu, 21 Nov 2024 17:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JY2suruQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE6510E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732209210; x=1763745210;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=6rtzZ4QJykIcm1FO6YRJLO5A05HsfGZL07OAJGx5qT0=;
 b=JY2suruQgxMgjNsEJhQu/stTqJLropHFjDfrXipKdfQyFXSlsK3YSv/2
 esTSMqsfjY9ZUrImMg/Yd5bclMuzF/GjMzNcBkSY/mxZuCTSvKnUQ3xmm
 7BE1v74nBUwLxhDwVM5QIBpKPRA+DVPR9yr40QyzeIG4tTRyyetFrrRSL
 ei6XTTVhqEWfqD5+1WOdrVNjiCIPDufxOR7PsNLQFlEayXzsdiUZc+Lsj
 iA6xe7HDw7kOoYaNFZGPjU4Uelw1V7hflg0iDfguc5QxSoXr6Oli1g2tF
 7ms8ms4e7SGuF7UE1AK/XPWUOJoWvS9SWci+Yco382+6udDCRHXxO5075 w==;
X-CSE-ConnectionGUID: TAs5Pf3jShaBTdX5U3lzcA==
X-CSE-MsgGUID: Ca3olsgRRVeTXrOG7heAPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42953412"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="42953412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:13:30 -0800
X-CSE-ConnectionGUID: RLahLa0IQwuQlGVZGeTSOA==
X-CSE-MsgGUID: ZXTxRjnNSmeUm+SrKg/jeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="95365435"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.102.138.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:13:28 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 21 Nov 2024 18:12:51 +0100
Subject: [PATCH v3 3/4] lib/gpgpu_shader: pass surface desription to
 shaders via inline data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-gpgpu_send_rework-v3-3-0b6aa48ab006@intel.com>
References: <20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com>
In-Reply-To: <20241121-gpgpu_send_rework-v3-0-0b6aa48ab006@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=6rtzZ4QJykIcm1FO6YRJLO5A05HsfGZL07OAJGx5qT0=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnP2owZu4OLao4Mw2q+/F4ks2gvzkNTCWBsjg7OelN
 cvmjDJaJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZz9qMAAKCRAjYrKT3hD910kfC/
 9zN04dC/xpqjaFBEW2ljyLKEPd8+hHsIYDbhHMMrJAz8xPMESRXgfiDVodZG3GviXMnsU+UnHif4/x
 JVBBgkRYNP6PfDiXOMmCyLO8simamAgWwzzvqkm2z3omh8P/CfrRqwhd0uKG+S3nIM0DgQFfu9Zg0e
 bocvM880TWRE3x29n7PccvpeOjX289AmUAG7rFmu9PHMVJAzcK8qSOp5dt0GQCbOIpG3Ty6gYOpl8W
 Bm8m39kHfQGQLtOoF7dmSEfj/CUaeX9KVpF2PacvKqO9ZtfhknAd/Lnqlfwzlfgu0BpHXGRzJ9h1U7
 qlyGRq1NLkbIMRv+cw5ugxT7aMlCoel9XhJdfHN3lAmbladXf04ng+CD1dNBuS5iz8COY1g+772oar
 YhuCEvPdYygGgPN9Y8deiONUnGZUjMAuNSnjOzR9khfIBfRQeQ/JMeuojbxPCqja5fXBfu3qVhNyrL
 FQm4XIx4SAGeZ2wCVFQjwbutbAP0AiFungEhOl6p5NCGs=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 363435e7efd3..518423158880 100644
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
@@ -217,10 +231,18 @@ void gpgpu_shader_exec(struct intel_bb *ibb,
 		       struct gpgpu_shader *sip,
 		       uint64_t ring, bool explicit_engine)
 {
+	uint64_t ahnd;
+
 	igt_require(shdr->gen_ver >= SUPPORTED_GEN_VER);
 	igt_assert(ibb->size >= PAGE_SIZE);
 	igt_assert(ibb->ptr == ibb->batch);
 
+	ahnd = intel_allocator_open_full(ibb->fd, 0, 0, 0, INTEL_ALLOCATOR_SIMPLE,
+					 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	target->addr.offset = intel_allocator_alloc(ahnd, target->handle,
+						    target->surface[0].size, 0);
+	intel_allocator_close(ahnd);
+
 	if (shdr->gen_ver >= 1250)
 		__xehp_gpgpu_execfunc(ibb, target, x_dim, y_dim, shdr, sip,
 				      ring, explicit_engine);

-- 
2.34.1

