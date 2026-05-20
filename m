Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6373ECD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 09:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1345210EFD3;
	Wed, 20 May 2026 09:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dU+rWRz9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D8510EFAF
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779271084; x=1810807084;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=qSF88phu66S6fJ0hxSU9l9byXbWivpvxXqU30BOaJyo=;
 b=dU+rWRz96BDlQIzc1G8tYa5Ndzt9Wz02oyFZR5p4Bo1hl1VpdWuJqmp1
 6pFRqWk599K6etnm7tRTEeshdi6RdBC+t2pXptEV7d+A8ZdsVuE36YH92
 SK4RGcUpFaUmMnm1OTqN8ie/T0e3LWR7Vm6PnmDLy6OLtfK5YRSjjgD+W
 qO+K4r0F2Dx7/uEpo4hmwrLSTRNNQ5ljJi4Z7jCJ13HEEdVgHE/rCAP5h
 OvlQLPNQeaVurqli2hjPns28bEoIn9Pqfr9dyTPXQss3Q/B/3wwFH6eCk
 VCkK3/SAXSMCDVWu3G7r2rxlE3RaEXkWIaltGqkbFie+XhJc1TabsmQbD g==;
X-CSE-ConnectionGUID: Hinkvk5oTAifzOkbPRpaFA==
X-CSE-MsgGUID: Z9OdIhD/SWuzgEsKOBLN6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79188878"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="79188878"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:58:04 -0700
X-CSE-ConnectionGUID: Dy18NERnT8OKLP0EqECgkw==
X-CSE-MsgGUID: Ys6ynKvDSaCmWNYRPhE5Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="239971523"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 02:58:03 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 20 May 2026 11:56:22 +0200
Subject: [PATCH 2/3] lib/gpgpu_shader: replace open coded ibb data copy
 with helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ibb_fixes-v1-2-d0c8ab2d07d3@intel.com>
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
In-Reply-To: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=qSF88phu66S6fJ0hxSU9l9byXbWivpvxXqU30BOaJyo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqDYVeEsRYlc55yASfN2Kl8P3KYtaLELN2zRmQS
 jRrrXZJ64aJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCag2FXgAKCRAjYrKT3hD9
 13hzC/0f6/YHjIlCwKJ5pBJreizH076vAhsuslz55FhzddV8r2z9L2YZImtabrDN3zUuu62sGOI
 lIhLIrXDMkIa/7bUoyi88c1qxar8luwG0JLmOd1xISw3uNeFXdbihf4Kzo95Y6XRON15RfPCMRX
 SwRXw5I9HfNdYe3Z+V5Ap4eVlidW1gi7riPFP+BMjcdG44E5Ypv0OQkq8GjegN8x6IHKy11IeL2
 H5x5rRZLHccwd4OK+bn4Fz3eWnaBsoJL+YpAjyBspVV7tz5c6BJ2QcYGbfab42Z2kfbeHQ0WyQb
 XqpX5Mq5Lg8HaBEfA1SeFJZdf6t+lkd7Ab28b7TcWoHOPhWwy1xO9ROq52ssVF7PzVbqEZKC6fm
 2WZpqXqwXLXsihSQRCiLwBA8pbgfd/Syb1eEzOZI3qD5F9G0ydv42ZNe7RfkkvXL+t0zhnDzbJR
 0157+K/UH/BEUTyDqUn6GutaesMJaQzn8LT8FjJXuy3JSxG00VbqNNrPLPvb7w6HJlDx4=
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

Helper, beside code compaction and increased readability, adds buffer
overflow checks, which are missing here.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/gpgpu_shader.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
index dbaa9a459454..72b05959e879 100644
--- a/lib/gpgpu_shader.c
+++ b/lib/gpgpu_shader.c
@@ -76,18 +76,7 @@ static uint32_t fill_sip(struct intel_bb *ibb,
 			 const uint32_t sip[][4],
 			 const size_t size)
 {
-	uint32_t *sip_dst;
-	uint32_t offset;
-
-	intel_bb_ptr_align(ibb, 16);
-	sip_dst = intel_bb_ptr(ibb);
-	offset = intel_bb_offset(ibb);
-
-	memcpy(sip_dst, sip, size);
-
-	intel_bb_ptr_add(ibb, size);
-
-	return offset;
+	return intel_bb_copy_data(ibb, sip, size, 16);
 }
 
 static void emit_sip(struct intel_bb *ibb, const uint64_t offset)

-- 
2.54.0

