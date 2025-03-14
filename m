Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA7CC282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 14:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C1810EA04;
	Fri, 14 Mar 2025 14:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceW+1LpC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F03210EA07
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 14:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741964370; x=1773500370;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=b1ZEq/+IsTw+puG2g9nliBV0q3leV4XVK7wUKNO16A8=;
 b=ceW+1LpCsagSZHGGd81hmGAIt/j8b2ckdYyk5sm3C4VvaFyppbhXjxvY
 vX9OvPG/3g/p3NFuGygwHWAhhSYa6FDojZHbdijZ0V6/jl2thOi1biO/s
 Lw6DLt/304/tNjwctZ8sip9laLOcWMxAxajUV9/t292C+BgkElsQUQR3F
 CD8um43pndwuD/cq/5vOperRncjgr4TIaBJOe1NXD0TwCaNLzX67z9udj
 dtRS40Ly5VCoQdZCgt0dnYkjEAO1BqO656GFME1otyNKFtQzBi/QWRGbn
 yNBpua23+GAspdCD+NVrg0jNUm4BNNBBPok0hVahTnO+4eDRcNerWrt5/ w==;
X-CSE-ConnectionGUID: pGTGrxjPTwe+ude2MhSWQg==
X-CSE-MsgGUID: ht9ikOXtRFujy0JBKYu+mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43025077"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43025077"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:29 -0700
X-CSE-ConnectionGUID: QNT48YAGQm2NPb4hgD4GYg==
X-CSE-MsgGUID: Uvk2IL2nQUC59AaaaFki5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126178690"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 07:59:28 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 14 Mar 2025 15:59:08 +0100
Subject: [PATCH 1/4] lib/iga64: fix send macro for DG2 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-iga64_misc-v1-1-b2d1337b808d@intel.com>
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
In-Reply-To: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=b1ZEq/+IsTw+puG2g9nliBV0q3leV4XVK7wUKNO16A8=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBn1ERNjbpXezP90LbK5+AP2KyGkgBH64ol1oQ/IRWp
 jq8WcX+JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ9RETQAKCRAjYrKT3hD91650C/
 4yaOapULpCggsMl4hQcRlhei/3joiGgfQNKFwpYoRh7F3s+k6FARebwSe5pys7Xhwj0QMdD6ISm8Hr
 lVTFD1s8NwJIgozEDK1PW7k/3Ty0psEE3ompqiDFW7mLsCxVLuyG7a2n221E6IWGWtJSS2gD0n5lJ3
 zMAX9iVRfO3qS3cxMV8MeFIDSLtmTj0qSsgpghDH4UB8jgBa6Fyc8MnoWXU391CluZGJZN0Mmpn7Lq
 nafhVEs9YZgOI6osr/66AsJ7GLjUeY7FQccYWSuUgLAFPmjovbzw6HIImGriBIGyncp+GL6SrLixyR
 vs69ZR06xmL+Xn24s6ISu9MRJRwLKc0CWd+OOPXoak/SzvJhjBc1yMQXB1F9drayVqD53aOvDJt2iM
 Tgt4OqXoCpKGEILAAIjMp4jWgQeFhfcKpSYVegv/YHHZk03qqSzQx3joHuxl7ZJGmcXiFHJQeV8KJB
 umXNo2cjo9VxbH0HQjswCfCrqih1LyQmKzgLunlUGdSwo=
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

src1 argument should be in form of null:0 for some platforms,
use special macro src1_null for it.

iga64 -Xauto-deps -Wall -p=12p71 lib/iga64_generated_codes.c.d/iga64_assembly_media_block_write_aip.12p71.asm
line 3.31: warning: Src1.Length should suffix src1 register (e.g. r10:4)
(W) send.dc1 (1) null r4 null 0x0 0x40A8000

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/iga64_generated_codes.c | 2 +-
 lib/iga64_macros.h          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
index a74a8864e5ca..551dead2be17 100644
--- a/lib/iga64_generated_codes.c
+++ b/lib/iga64_generated_codes.c
@@ -3,7 +3,7 @@
 
 #include "gpgpu_shader.h"
 
-#define MD5_SUM_IGA64_ASMS 80bb609ce27131259d19629dc74e349f
+#define MD5_SUM_IGA64_ASMS 22a5a4671242c3257209f4051f1c0c7e
 
 struct iga64_template const iga64_code_gpgpu_fill[] = {
 	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
diff --git a/lib/iga64_macros.h b/lib/iga64_macros.h
index ac482e47c05e..8e452cf634f9 100644
--- a/lib/iga64_macros.h
+++ b/lib/iga64_macros.h
@@ -70,7 +70,7 @@
 #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_BLOCK_MSG_HDR(dst, y, width)
 #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_BLOCK_MSG_HDR(dst, x, y, width)
 #define LOAD_SPACE_DW(dst, src) send.dc1 (1)	dst	src	src1_null 0x0	0x2190000
-#define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	null	0x0	0x40A8000
+#define STORE_SPACE_DW(dst, src) send.dc1 (1)	null	dst	src1_null 0x0	0x40A8000
 #else
 #define SET_SHARED_SPACE_ADDR(dst, y, width) SET_SHARED_MEDIA_A2DBLOCK_PAYLOAD(dst, y, width)
 #define SET_THREAD_SPACE_ADDR(dst, x, y, width) SET_THREAD_MEDIA_A2DBLOCK_PAYLOAD(dst, x, y, width)

-- 
2.34.1

