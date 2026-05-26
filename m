Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F74CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 08:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284D810E1CA;
	Tue, 26 May 2026 08:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbPddJeH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F1B10E60B
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 08:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779783900; x=1811319900;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=xVvmIUVnm6EXWYAwW7I9ywnkJPPO/oYK5WRF5PBSS7Y=;
 b=UbPddJeH2PZgpu1fo1LyzmmdjEp+kOkD8VgWsyHDL8NaG+ceIJJlzLe7
 lzBxKj2un8708xw8LyFkXaZPUgTacPcUdk8F4bQgm9CguaYRBrb13R57T
 f5hZtVYQklW7Oql1GIzSPfskKGEBBMh3SjOeOPCu+24qtrQIlQepQHsrU
 rf5qj6IvaHBGaGpHui3Vf9ZLiU5iD+4Zx7tJ94FKuHkZhEj4oZuP4NDRy
 phd8ny6cG/zss/9yXKk1wFcgC0soR7x7iak0Jyqk9H74MZipYFvxzCzHK
 +DdLZh45LSxvx4EVKQCJdcvfsHpcafomNpHiUH8z49b8S9egIIjWMgy+D g==;
X-CSE-ConnectionGUID: NvS+/9xMR/+ADRH7vbi1Vw==
X-CSE-MsgGUID: ZgAknDa0Rc2pdXUDXfibwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91698123"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="91698123"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 01:24:59 -0700
X-CSE-ConnectionGUID: wTxHa4cjQLy7vkwhahLkRw==
X-CSE-MsgGUID: p5bORdzfSuGdaO3iGYNq9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="242017367"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 01:24:57 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 26 May 2026 10:23:38 +0200
Subject: [PATCH] lib/meson.build: add rebuild_iga64 target
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-rebuild_iga64-v1-1-531eff7e3e24@intel.com>
X-B4-Tracking: v=1; b=H4sIAIlYFWoC/yWM2wrCMBAFf6Xss8GaXgj+iohs0rVdsbXsJiKU/
 ruJPs7hzGygJEwK52oDoTcrv5YMp0MFYcJlJMNDZrC17evO9kbIJ34ONx6xb01wTRew8a51HWR
 nFbrz59e7XP+syT8oxBIpD49KxgsuYSpTWjUK4XycUSMJ7PsXkWkfj5MAAAA=
X-Change-ID: 20260526-rebuild_iga64-c835ca3b8485
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=xVvmIUVnm6EXWYAwW7I9ywnkJPPO/oYK5WRF5PBSS7Y=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBqFViPJXGAU2aZKFln9mdN5JnqFgX1FBiJT0477
 SAS6zIhsX2JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCahVYjwAKCRAjYrKT3hD9
 177VC/99K4Tb5XXD/v2i5PE3jgM3jwZq04B0kGJgCuKvDElhJp0l8J/H27XOdAbXmB5zbG+RWvM
 9l1xwa0yB5UMRP49cHtScwQlem1SlvEiNfemNYmB/W9VgeeajEdRTzbY0oz0JPjl+6MULesKO2a
 wokc0AXOKc6agLc0qzRJJoZjdNqNZebeoTGd5LG94cOCIgY50pvxeZPo5sbAswBPWZ5cKp50Zpn
 QAXKG+A/eZt2Dv/525sbBXo42Q6Op/FHLYYNraojdUY8cV/Xt93PvXeSnEiovpaTj69a9o+Ir3G
 0hFSC5wayzbmX3fN+E54hJlGnZkAZpgF9/pcRKbDA20PUFOovCvUcCVHJVBlBxY8vOIl40OadAp
 g2MLwuxMskRi9XbegPccT0OivtA2seoI3sqT0VGZPWRCSOQViJx6FRgr2CoCvogsxMW7wFh2X4P
 56jeNe9+E8Wnf8RZHBZ7R1vE9RrruzC02PC3DKGKy1M/6aGEYpkL0oxwMJ1nuLlqONvTs=
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

In some circumstances rebuilding all GPU asms is desirable.
There is already a way to do it, but it is complicated.
rebuild_iga64 virtual target encapsulates it in single command:
$ ninja rebuild_iga64

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/meson.build b/lib/meson.build
index ce2c329fbbcd..a8d6566aecca 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -322,6 +322,9 @@ endforeach
 
 lib_intermediates += static_library('iga64_gpu_codes', iga64_codes_targets)
 
+run_target('rebuild_iga64',
+    command : [ 'bash', '-c', 'ninja -t clean lib/libiga64_asms.a && FORCE_IGA64_REBUILD=1 ninja lib/libiga64_gpu_codes.a' ])
+
 lib_igt_build = shared_library('igt',
     ['dummy.c'],
     link_whole: lib_intermediates,

---
base-commit: d88ebc53b2e92095f8717f5bacd567becf7f0c1d
change-id: 20260526-rebuild_iga64-c835ca3b8485

Best regards,
--  
Andrzej Hajda <andrzej.hajda@intel.com>

