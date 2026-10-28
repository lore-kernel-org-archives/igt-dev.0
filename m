Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97AA606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XvufnbxH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC4510FCE9;
	Wed, 28 Oct 2026 14:49:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47D910FCF2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793198810; x=1824734810;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=/Eg68eqEWDyW9jnGoj0j98dTbGzTesxmMpxyHGWGH7Y=;
 b=XvufnbxH98RIb9sJNvETkbeHzWE3h5MtBHPaepxGKuK7nnECzvWIq0jJ
 ljvNcGm4f3Ec7buCOdYVOl910ItpFkWWwRBGKSzK5OF4lrF5/yTWaPcmX
 rrF2bx06jk+ifMMr8d397djraxhYzy+PozXUJffEw7p16ZZNcWi59j+M3
 umB0R4K8M5FL3ZA/KtJRYMiha+UdvQxutTILGen8NoHdW+ZJq8Jv1iyBQ
 zrxyQvPNNsI9XTxJjh3QvDSABNC/EA4D++XMREPi3rciNyuKaNkRy+5AQ
 ZKnq5zBk8dKG321yHXwtIlslxEuEMK8uwTjrbEOyxdjibd9Kl9YpQiLXj Q==;
X-CSE-ConnectionGUID: 3CHlaP1gRHWQTiYrItdACA==
X-CSE-MsgGUID: ORdKfQiuQJm2SYOmcbvU5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1924487"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1924487"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 07:46:50 -0700
X-CSE-ConnectionGUID: S3FLDlJvQrC+98MYR/j2Xw==
X-CSE-MsgGUID: Kz4IzDJ8SzyyRPLIpgiECw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5208422"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 07:46:49 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 28 Oct 2026 15:44:29 +0100
Subject: [PATCH v2 2/2] tests/intel/xe_prefetch_fault: remove explicit
 regioning and channel offsets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-remove_gpu_asm_annotations-v2-2-270a5878b2fc@intel.com>
References: <20261028-remove_gpu_asm_annotations-v2-0-270a5878b2fc@intel.com>
In-Reply-To: <20261028-remove_gpu_asm_annotations-v2-0-270a5878b2fc@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.17-dev-6be7c
X-Developer-Signature: v=1; a=openpgp-sha256; l=3398;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=/Eg68eqEWDyW9jnGoj0j98dTbGzTesxmMpxyHGWGH7Y=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBq4gpXqP+SEXxrUUbQe3ov5W5ulauHbrSY2rDvw
 Ypa6rDPB8CJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCauIKVwAKCRAjYrKT3hD9
 188iDACcQhUE/uVlIitAGaJxoUKWKKplclNHXH2VdEY84ne9l08KmwpQel1iMMf89KYD3478E3+
 bWuTR2ET+2Hwb6KhMUdtRCL7m0qLxiZYYf1CMvFAQpXoU3qdNPvGMm+z2162XrEBJ502ptrmH+k
 mGJRap9bh4dFPBzDr/nePmdgclRkNylI/+bgO8ygfpWzmyPMXINkP+7czeZ8PQu4a4ELomty4+H
 rVcKk5qfhy8Ynf29/8tkFcOmG3n3W247wnagJB0MEiQa1vSJju/BgHfe6S6dur70vrwAUWXaioR
 cK7BoJDyqBchofiNqugchH4jOU6nNMH3jjtbH6SbUze4ABRAj2SIH6HPJhr3Rm9qtxLCwSqc1X8
 0Kklv93+ehixIegPriJe34sRNQI8KKvESjOFglo0LkasRDoZchgB8+oXgMVzBfQU5l11AevSUFq
 qAn25Jeps4gfTvTYJdq/oay6U7O3kD9bJAcbrXVPgIOdc3tQJGbin0siul7U95OdMqBFw=
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
- exec size follows mnemonic after one space,
- flag modifiers, if any, are placed after exec size,
- arguments starts from 3rd tab,
- no tabs/multi-spaces between/after arguments

The changes do not affect produced binary code.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_prefetch_fault.c                   | 16 ++++++++--------
 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
index ce741d5b229b..91c3797c3219 100644
--- a/tests/intel/xe_prefetch_fault.c
+++ b/tests/intel/xe_prefetch_fault.c
@@ -54,11 +54,11 @@ static void gpgpu_shader__prefetch_fault(struct gpgpu_shader *shdr,
 #if GFX_VER >= 3500
 L0:
 // Set base address with scalar register
-(W)	mov (1)		s0.0<1>:ud		ARG(0):ud
-(W)	mov (1)		s0.1<1>:ud		ARG(1):ud
+(W)	mov (1)		s0.0:ud ARG(0):ud
+(W)	mov (1)		s0.1:ud ARG(1):ud
 
 // A64 offset
-(W)	mov (8)		r30.0<1>:uq		0x0:uq
+(W)	mov (8)		r30.0:uq 0x0:uq
 
 // efficient 64bit Read with cached L1, cached L2 and cached L3
 // sendg ugm load with SBID 3
@@ -75,7 +75,7 @@ L0:
 //      [9:7] Vector Size: 0 (Vector length 1)
 //      [5:0] Opcode: 0 (Load)
 // Prefetch operations are implemented using a NULL destination register.
-(W)	sendg.ugm (1|M0)	null	r30:1	null:0	s0.0	0x99C00	{A@1,$5}
+(W)	sendg.ugm (1)	null r30:1 null:0 s0.0 0x99C00 {A@1,$5}
 
 #endif
 	)", lower_32_bits(addr), upper_32_bits(addr));
@@ -149,16 +149,16 @@ static struct gpgpu_shader *get_l2_prefetch_shader(int fd)
 #if GFX_VER >= 3500
 L0:
 // Set base address with scalar register
-(W)   mov (1)                s0.0<1>:ud                         ARG(0):ud
-(W)   mov (1)                s0.1<1>:ud                         ARG(1):ud
+(W)	mov (1)		s0.0:ud ARG(0):ud
+(W)	mov (1)		s0.1:ud ARG(1):ud
 
 // A64 offset
-(W)   mov (8)                r30.0<1>:uq                       0x0:uq
+(W)	mov (8)		r30.0:uq 0x0:uq
 
 // Prefetch operations are implemented using a NULL destination register.
 // L1 uncached forces the prefetch to bypass LSC, making L2 the fault source.
 // load.ugm.d64t.a64.uc.ca.uc [src0]
-(W)   sendg.ugm (1)          null         r30:1      null:0     s0.0        0x49C00
+(W)	sendg.ugm (1)	null r30:1 null:0 s0.0 0x49C00
 #endif
 	)", lower_32_bits(addr), upper_32_bits(addr));
 
diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
index 5d387aa08f1b..a4d9f8c71c04 100644
--- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
+++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 712da12709dd4ebfeffc82119c37c556
+#define MD5_SUM_IGA64_ASMS 814fcd58b85fe7295c5017059f3db49e
 
 struct iga64_template const iga64_code_xe_l2_prefetch_fault_prefetch[] = {
 	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {

-- 
2.55.0

