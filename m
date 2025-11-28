Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A287D116F1
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 14:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA84310E8E5;
	Fri, 28 Nov 2025 14:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4futNfV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E2F10E90D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 14:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764339265; x=1795875265;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yDcZhY8ErJWmAx3PtAC7+Xjo5rag6c49FNkbSJtPiQg=;
 b=g4futNfV73t+tqjdPUDfBsZ4exSfEKwbN7KSx22gncWCOdQACTTC3mjD
 cyy/PO8C9+3iMe2YcCZ2v7iOJ4hFnfn5b4rbY6TgLfUP8SKUW4hACy7iy
 DcUKa8bmjrmAEXIVwsU2Q0gnKrUjxWVJFdYOoK2BIdkUX58rktzEYAjGi
 6f/5OBcotN3tqa/0xhKX3U79dvP1rd5W/Ny1vP+yFf7b8KRhnHBlB/6+p
 F4YpPXI90wPdBPNimrY9c3V/yz2U5UF/BvXZZGCm0FUeSTJ3Y7FOgtefH
 ODy9zfSCYRb64JGeGGztV87Kx7O4hu/uPHxn5yjMnNFEwngAoyAVs714s g==;
X-CSE-ConnectionGUID: FO/aaycFRO64HKzeZllIOQ==
X-CSE-MsgGUID: brwuBdmFTc6eKxyxET7sxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66261601"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="66261601"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:25 -0800
X-CSE-ConnectionGUID: Ae2aaB2rTSSixqcS+1yYXQ==
X-CSE-MsgGUID: cUq8HG4HRsmkXfCIyq6AlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="224173644"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 06:14:24 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 28 Nov 2025 15:12:07 +0100
Subject: [PATCH 03/11] lib/gpgpu_shader: use recently introduced helper to
 get EU thread count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-pagefault-one-of-many-v1-3-a8377a93da8f@intel.com>
References: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
In-Reply-To: <20251128-pagefault-one-of-many-v1-0-a8377a93da8f@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 Jan Maslak <jan.maslak@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=yDcZhY8ErJWmAx3PtAC7+Xjo5rag6c49FNkbSJtPiQg=;
 b=owEB7AET/pANAwAKASNispPeEP3XAcsmYgBpKa3ziV6m311QuVRMG+EkKbRRHg9eHr9pC859z
 sSpy75OOIqJAbIEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSmt8wAKCRAjYrKT3hD9
 15n8C/iEtCd1XPre5Zb+XAg+C8xhYyKIkJMVDMWA8jex0DOVpnL4xfNzJwjXY03MVzhaClVDPmW
 2Prv5bnmzjizTrxObAvpPd/G9I6LL9U4e/8o8gCrQEWseF1WpORsfLH+gqaKj+5MsgegTFfwCCw
 b9MewHIASJ+y5wcN6KygwXk3LKXKPGhIO1qqix3hHc2B8QYTR5PKsxrw3BMq2h9a1G4tHio0ZE3
 lwoB66LEosK2bxIE93PepZglF3m8BFV7+7WikQAk2MTK2sKYJrOUH3G1aqI0IESOzyOeQMFP/s0
 XGoIwtPLtG8EmB2RQSE3McHOX9/aAAks7zsap3F34UoXDLk0uim/mM5TyWebab4FlUVbDLd0hfg
 d73H7A2JCkuDk0ezfrWVqd8r4tXWKby3EZOCduIxgHhpiIFgcc0Ou3BBlzHHYENJYqGpcaZlxy6
 9dQtr5/4RRcKEvhu11lAsohwaTRvflc1i0BpuZ50FhsJUnc0oa4NPWmSbeMU4VqWzGhg==
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

The patch removes private implementation in favor of recently introduced
with support for Xe3 increased number of threads.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index 0c777d12df45..767bddb7ba54 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -11,6 +11,7 @@
 #include "ioctl_wrappers.h"
 #include "gpgpu_shader.h"
 #include "gpu_cmds.h"
+#include "xe/xe_query.h"
 
 struct label_entry {
 	uint32_t id;
@@ -131,7 +132,7 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
 
 	gen9_emit_state_base_address(ibb);
 
-	xelp_emit_vfe_state(ibb, THREADS, GEN8_GPGPU_URB_ENTRIES,
+	xelp_emit_vfe_state(ibb, xe_query_eu_thread_count(ibb->fd, 0), GEN8_GPGPU_URB_ENTRIES,
 			    GPGPU_URB_SIZE, GPGPU_CURBE_SIZE, true);
 
 	gen7_emit_interface_descriptor_load(ibb, interface_descriptor);
@@ -197,7 +198,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
 	xehp_emit_state_base_address(ibb);
 	xehp_emit_state_compute_mode(ibb, shdr->vrt != VRT_DISABLED);
 	xehp_emit_state_binding_table_pool_alloc(ibb);
-	xehp_emit_cfe_state(ibb, THREADS);
+	xehp_emit_cfe_state(ibb, xe_query_eu_thread_count(ibb->fd, 0));
 
 	if (sip_offset)
 		emit_sip(ibb, sip_offset);

-- 
2.43.0

