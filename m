Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7ABC48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 11:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B3C10F0CC;
	Mon, 26 Feb 2024 11:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mQMr5LHj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C24210F0CD
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 11:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708947921; x=1740483921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nZk9YVH12/nEOxDlFGDW6U4CWEE9/6gGjAyMFSA0G64=;
 b=mQMr5LHjgQE77hoPSz5HocG1Ukyjp52+Gvu0pwzjzflocR1dhKjOaLZa
 lkNBNBx++JD9+S5n8yCz74RJpysyL293WEplvd+KgCM9f+TwXINeOe2nB
 Kr8WQz2FzfB7sOlQQvJgkwLpomvlCkgx6B5IgzdLB4g0Ka+i3MzV+6Nza
 dGwkTNW0cjR0shNMA+vAvleJJ+d/PQ02aOpmgAie7w2NRwXX5NlOto9q4
 D1yhsExxAls3vbPQY+D1OjX++2Ac02571wImJNcag0jAccGZp37tySRZt
 6isoaMrRARInfhg6TBhhpuT6+WSurh5y0wK3k+/HhVsYGEg+R/BtnSE74 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="13869549"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="13869549"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:45:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6534353"
Received: from unknown (HELO localhost) ([10.246.6.22])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:45:17 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] lib/rendercopy: Fix Xe2 pixel shader
Date: Mon, 26 Feb 2024 12:45:11 +0100
Message-Id: <20240226114511.51753-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

On Xe2 start and coefficient for barycentric positions are passed
in different location of grf register (r6). I wasn't able to find
this information explicitly in the documentation so I've dumped
all registers involved in the operation and deduce r6 values
meaning. This means I may be wrong but tests which are previously
failing on render-copy now are working fine.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
---
 lib/i915/shaders/ps/gen20_render_copy.asm | 4 ++--
 lib/rendercopy_gen9.c                     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/i915/shaders/ps/gen20_render_copy.asm b/lib/i915/shaders/ps/gen20_render_copy.asm
index 330417966d..48057f441e 100644
--- a/lib/i915/shaders/ps/gen20_render_copy.asm
+++ b/lib/i915/shaders/ps/gen20_render_copy.asm
@@ -1,7 +1,7 @@
 L0:
-(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f      r1.0<1;1>:f       r6.0<0>:f
+(W)     mad (16|M0)              acc0.0<1>:f   r6.0<0;0>:f      r1.0<1;1>:f       r6.6<0>:f
 (W)     mad (16|M0)              r113.0<1>:f   acc0.0<1;1>:f    r1.0<1;1>:f       r6.1<0>:f
-(W)     mad (16|M0)              acc0.0<1>:f   r6.7<0;0>:f      r1.0<1;1>:f       r6.4<0>:f
+(W)     mad (16|M0)              acc0.0<1>:f   r6.3<0;0>:f      r1.0<1;1>:f       r6.4<0>:f
 (W)     mad (16|M0)              r114.0<1>:f   acc0.0<1;1>:f    r2.0<1;1>:f       r6.5<0>:f
 (W)     send.smpl (16|M0)        r12      r113  null:0  0x0            0x04420001           {F@1,$0} // wr:2+0, rd:4; simd16 sample:u+v+r+ai+mlod using sampler index 0
 (W)     send.rc (16|M0)          null     r12   null:0  0x0            0x08031400           {EOT,$0} // wr:4+0, rd:0; full-precision render target write SIMD16; last render target to surface 0
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index a4220d78da..dd5f1dd448 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -138,9 +138,9 @@ static const uint32_t gen12p71_render_copy[][4] = {
 };
 
 static const uint32_t xe2_render_copy[][4] = {
-	{ 0x8010005b, 0x200002a0, 0x020a0634, 0x06040105 },
+	{ 0x8010005b, 0x200002a0, 0x020a0604, 0x06640105 },
 	{ 0x8010005b, 0x710402a8, 0x020a2001, 0x06140105 },
-	{ 0x8010005b, 0x200002a0, 0x020a0674, 0x06440105 },
+	{ 0x8010005b, 0x200002a0, 0x020a0634, 0x06440105 },
 	{ 0x8010005b, 0x720402a8, 0x020a2001, 0x06540205 },
 	{ 0x80122031, 0x0c240000, 0x20027114, 0x00800000 },
 	{ 0x8010c031, 0x00000004, 0x58000c24, 0x00c40000 },
-- 
2.34.1

