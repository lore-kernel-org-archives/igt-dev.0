Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C22C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 07:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3927610FB10;
	Tue, 23 Apr 2024 07:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rwl0cJgA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB87010FB10
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713855899; x=1745391899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Soixw7FiLNpzT6paJemLh3yDwiv1WA9f0BJeaVwOWko=;
 b=Rwl0cJgAyecKAt9u7s4UQPRSUo2IRanAInfv/US9K4JfqdaXa/vSp0U7
 eVIE65nGqTxxntB0j9/LSZXBIZTO81cvB+LflYmLVnx3Psj7FU2U+LkRE
 F6L6bI66T6F95W7tiJq93eTTf9Bw5lGb1qhZESG3i8AiDPJ8sBo0f2yjx
 iFqS/HaLB3jnQ9HuQaIKQEp7XAaHbG5RCx3iUxxGUi4JbRXARW8cq8asu
 CZxLPjcmDjz0qLLcgVOc7TkmH3Z34nqHBxgOr5rWjooQlbjk24/xHw7lO
 Fv94C+ySUlcL1mTscFzhU1bXbK8D3F8/ZRbUptx30iWmN/xzS6Kx8BVou Q==;
X-CSE-ConnectionGUID: ikjf80MlRlCAepBZkBylMg==
X-CSE-MsgGUID: oBWVszxeR6mgtRXncwuHEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13258652"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13258652"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:04:59 -0700
X-CSE-ConnectionGUID: LbmD3eGETvKQAD+YX7zomw==
X-CSE-MsgGUID: b2VOrxgMQzWANwJ1Gywtpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24882250"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.22])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 00:04:59 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 1/2] lib/rendercopy: Fix horizontal stride
Date: Tue, 23 Apr 2024 09:04:48 +0200
Message-Id: <20240423070449.150518-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
References: <20240423070449.150518-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

According to regioning spec horizontal stride must be 0. There's
no functional change in render-copy execution on hardware.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/i915/shaders/ps/gen20_render_copy.asm | 8 ++++----
 lib/rendercopy_gen9.c                     | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/i915/shaders/ps/gen20_render_copy.asm b/lib/i915/shaders/ps/gen20_render_copy.asm
index 48057f441e..c4e12a3687 100644
--- a/lib/i915/shaders/ps/gen20_render_copy.asm
+++ b/lib/i915/shaders/ps/gen20_render_copy.asm
@@ -1,8 +1,8 @@
 L0:
-(W)     mad (16|M0)              acc0.0<1>:f   r6.0<0;0>:f      r1.0<1;1>:f       r6.6<0>:f
-(W)     mad (16|M0)              r113.0<1>:f   acc0.0<1;1>:f    r1.0<1;1>:f       r6.1<0>:f
-(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f      r1.0<1;1>:f       r6.4<0>:f
-(W)     mad (16|M0)              r114.0<1>:f   acc0.0<1;1>:f    r2.0<1;1>:f       r6.5<0>:f
+(W)     mad (16|M0)              acc0.0<1>:f   r6.0<0;0>:f      r1.0<1;0>:f       r6.6<0>:f
+(W)     mad (16|M0)              r113.0<1>:f   acc0.0<1;0>:f    r1.0<1;0>:f       r6.1<0>:f
+(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f      r1.0<1;0>:f       r6.4<0>:f
+(W)     mad (16|M0)              r114.0<1>:f   acc0.0<1;0>:f    r2.0<1;0>:f       r6.5<0>:f
 (W)     send.smpl (16|M0)        r12      r113  null:0  0x0            0x04420001           {F@1,$0} // wr:2+0, rd:4; simd16 sample:u+v+r+ai+mlod using sampler index 0
 (W)     send.rc (16|M0)          null     r12   null:0  0x0            0x08031400           {EOT,$0} // wr:4+0, rd:0; full-precision render target write SIMD16; last render target to surface 0
 L96:
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 392d68653b..7c7563d50c 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -138,10 +138,10 @@ static const uint32_t gen12p71_render_copy[][4] = {
 };
 
 static const uint32_t xe2_render_copy[][4] = {
-	{ 0x8010005b, 0x200002a0, 0x020a0604, 0x06640105 },
-	{ 0x8010005b, 0x710402a8, 0x020a2001, 0x06140105 },
-	{ 0x8010005b, 0x200002a0, 0x020a0634, 0x06440105 },
-	{ 0x8010005b, 0x720402a8, 0x020a2001, 0x06540205 },
+	{ 0x8010005b, 0x200002a0, 0x020a0604, 0x06640104 },
+	{ 0x8010005b, 0x710402a8, 0x020a2000, 0x06140104 },
+	{ 0x8010005b, 0x200002a0, 0x020a0634, 0x06440104 },
+	{ 0x8010005b, 0x720402a8, 0x020a2000, 0x06540204 },
 	{ 0x80122031, 0x0c240000, 0x20027114, 0x00800000 },
 	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
 };
-- 
2.34.1

