Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05C606A329
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 14:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ye6nolYZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A43112E0E;
	Fri,  6 Nov 2026 14:12:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78715112E0F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793974218; x=1825510218;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jkra1o49DFIZkSbg+Sy4j+Dq+QITv+C/CKn17CDl44o=;
 b=Ye6nolYZ1RraMVLYr8R79iujaLEgkKnqhbPg3/gSV6uiGS4YhSA6PWHE
 mPgbe0CSse4VKwQX2huWTgYVBfDT855KpqrcfIofdRSApLnmPYi+3gUDM
 CyiWgj2j1H3tYmnpKewhX+bnA6VZpWjiRMt1y5YDZgt1vMlXVYMG7r2YL
 J+Ki0pHM6tqFnhchG3hP3vlhO8y90yvU9+4MislarPbbaWEAdZvgBzajX
 CflhOuihZfPm/Y4MUsDvIwc+7FBAf56Nv7KlKQKbMAy8Qt2lyDOVnABey
 XRnUlmWkhP6CGVdnlRhCJIivuN/M0NX8JBN9olIybrKuEwimaUAVIzinH g==;
X-CSE-ConnectionGUID: WeHUU3f3SOW/DEwgw8Q3cQ==
X-CSE-MsgGUID: Eg6gTrFTQhagf9VCQsxYMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2780583"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2780583"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:10:17 -0800
X-CSE-ConnectionGUID: 1rA7R4DjT9yXed0mO8nW+A==
X-CSE-MsgGUID: NGR75yO9SM26wYkvlV5V4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7451551"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:10:15 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 06 Nov 2026 15:07:55 +0100
Subject: [PATCH v3 2/2] tests/intel/xe_prefetch_fault: remove explicit
 regioning and channel offsets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-remove_gpu_asm_annotations-v3-2-f3c1e3cb71d7@intel.com>
References: <20261106-remove_gpu_asm_annotations-v3-0-f3c1e3cb71d7@intel.com>
In-Reply-To: <20261106-remove_gpu_asm_annotations-v3-0-f3c1e3cb71d7@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.17-dev-6be7c
X-Developer-Signature: v=1; a=openpgp-sha256; l=3431;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=jkra1o49DFIZkSbg+Sy4j+Dq+QITv+C/CKn17CDl44o=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBq7d9BfabRRgbKv8wbhoMs6q5BMg2yNyQHMa0Wj
 n63mMm9rg6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCau3fQQAKCRAjYrKT3hD9
 16hcDAC1pZ4YQ3o3ccHuX10f1uxksWN+HjAfnJXZ2q7BwUsvB2ZkHfGaWeh6XCNoCeyIrjybYfy
 ema10VggwoXZE6sVkrkyE2WLdo+67FeZKe9V2GAEI9zogwO52yiVG+AfyJMRIxi2VipV3oDB0PQ
 6uL99uZ5zT7QzpLhuwAMf2GYH549R0hOPHN3nFYV3JFp0ghqMRXT7RCWFHV+h3gHGhxgb1pHLbE
 2Bs31k91vbqNoaHnAKuS+kq4ZCBDBiPZHFQQqGkU389eZ1AHbVYhNw2I62gMjGpdiw2Io2jzUkE
 qFD7keN4Axx4wSr1Pr9hLAz3aSSEAx2JDNNTqPhZCFLnM8A5Ye0IxNAGH8z1VQ8tgOFjI8BC9fN
 Lxjnjj3SRhvMh+FWbRedt/ryRT2Eg8gHhbx5NAqwbCGyQIh3ESr4WrxRRU5B0V376onsZx9EAux
 jR2IbhUnPA1dOBrreldjLuBX6TToKIJ9Y3vPIuVSUk3VS3SQb789AKW1lY5rnG4EAPQLc=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is no need to specify regioning and channel offset in
most cases. Default genisa values are:
- <0;1,0> for source region,
- <1> for destination region,
- M0 for channel offset.
The patch also enforces common formating for all asms:
- preprocessor instructions and predicates start from beginning of the line,
- instruction mnemonic starts from 1st tab,
- mnemonic is followed by exec size without space,
- flag modifiers, if any, are placed after exec size,
- arguments starts from 3rd tab,
- args are tab aligned per shader - argN should be place at the same column

The changes do not affect produced binary code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_prefetch_fault.c                   | 16 ++++++++--------
 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
index ce741d5b229b..9864b3f9b519 100644
--- a/tests/intel/xe_prefetch_fault.c
+++ b/tests/intel/xe_prefetch_fault.c
@@ -54,11 +54,11 @@ static void gpgpu_shader__prefetch_fault(struct gpgpu_shader *shdr,
 #if GFX_VER >= 3500
 L0:
 // Set base address with scalar register
-(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
-(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
+(W)	mov(1)		s0.0:ud		ARG(0):ud
+(W)	mov(1)		s0.1:ud		ARG(1):ud
 
 // A64 offset
-(W)	mov (8)		r30.0<1>:uq		0x0:uq
+(W)	mov(8)		r30.0:uq	0x0:uq
 
 // efficient 64bit Read with cached L1, cached L2 and cached L3
 // sendg ugm load with SBID 3
@@ -75,7 +75,7 @@ L0:
 //      [9:7] Vector Size: 0 (Vector length 1)
 //      [5:0] Opcode: 0 (Load)
 // Prefetch operations are implemented using a NULL destination register.
-(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x99C00	{A@1,$5}
+(W)	sendg.ugm(1)	null		r30:1	null:0	s0.0	0x99C00		{A@1,$5}
 
 #endif
 	)", lower_32_bits(addr), upper_32_bits(addr));
@@ -149,16 +149,16 @@ static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
 #if GFX_VER >= 3500
 L0:
 // Set base address with scalar register
-(W)   mov (1)                s0.0<1>:ud                         ARG(0):ud
-(W)   mov (1)                s0.1<1>:ud                         ARG(1):ud
+(W)	mov(1)		s0.0:ud		ARG(0):ud
+(W)	mov(1)		s0.1:ud		ARG(1):ud
 
 // A64 offset
-(W)   mov (8)                r30.0<1>:uq                       0x0:uq
+(W)	mov(8)		r30.0:uq	0x0:uq
 
 // Prefetch operations are implemented using a NULL destination register.
 // L1 uncached forces the prefetch to bypass LSC, making L2 the fault source.
 // load.ugm.d64t.a64.uc.ca.uc [src0]
-(W)   sendg.ugm (1)          null         r30:1      null:0     s0.0        0x49C00
+(W)	sendg.ugm(1)	null		r30:1	null:0	s0.0	0x49C00
 #endif
 	)", lower_32_bits(addr), upper_32_bits(addr));
 
diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
index 5d387aa08f1b..b5fdec567089 100644
--- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
+++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 712da12709dd4ebfeffc82119c37c556
+#define MD5_SUM_IGA64_ASMS 546bddbd13ed40a4cc520c886248c178
 
 struct iga64_template const iga64_code_xe_l2_prefetch_fault_prefetch[] = {
 	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {

-- 
2.55.0

