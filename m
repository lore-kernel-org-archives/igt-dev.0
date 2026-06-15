Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DD3CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 17:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A208710E4C1;
	Mon, 15 Jun 2026 17:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRP7sB/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5058F10E4C1
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781545470; x=1813081470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=06TMXeUcqqNsU5m2iz5LMfqXuZv6UA2IP4NOgb5nINw=;
 b=aRP7sB/Y0OOBykkcuku+e2ZaZLXY/RA7L2jjtcrq2VxysU18cRxS7Ikm
 kOZacK5+dwrmwHpLI3oKee3h0AHr9Wu4BlT1W+YlT+jqclWxqVaeUjAHJ
 l/PPgpn2rkXRhz7+iMoRTJNZHQ6cWK4iODaPgsbRNmTceLSgIqkimeNk7
 hbsG1x0Se/eh5ENYk858cytQB1/AQkNypVogq5DhtB96bb4enYWIEnHJM
 x3kvfVnQvnkhLkLyjIrHNhuoApI4qwYwdloOnBqLwZDW7RQbPBHnfhMJF
 tAT6r2xuZTCbA6lrEtiLqwQ7ESd4VdzT07Udr2PYYPyicLdFrdfgqcONY Q==;
X-CSE-ConnectionGUID: HZGCljXJRzW8RWIQ4uS56Q==
X-CSE-MsgGUID: 1phirW61SxSyZKSLw1bfnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82035418"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82035418"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 10:44:29 -0700
X-CSE-ConnectionGUID: md8rCqxdSkWrUM8zwEV1mg==
X-CSE-MsgGUID: Ci8xRezgRmG2d4FG4M391g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="251451861"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.51])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 10:44:28 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, enh <enh@google.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v1] include/linux_scaffold: drop _AC macro
Date: Mon, 15 Jun 2026 19:44:22 +0200
Message-ID: <20260615174422.212996-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

The macro _AC is causing a compilation error on current android
using linux 7.0 uapi headers on RISCV. It seems the macro is not
really needed as it is encoding only two constants, 0UL/0ULL and
1UL/1ULL. Drop _AC macro and write out directly these numbers.

Cc: enh <enh@google.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/linux_scaffold.h | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
index 0c970c860..39f68b8d2 100644
--- a/include/linux_scaffold.h
+++ b/include/linux_scaffold.h
@@ -22,30 +22,14 @@ static inline s64 sign_extend64(u64 value, int index)
 	return (s64)(value << shift) >> shift;
 }
 
-#ifndef _AC
-#  define _AC(X, Y)      X##Y
-#else
-#  error "_AC macro already defined"
-#endif
-
 /* Make IGT build with Kernels < 4.17 */
-#ifndef _AC
-#  define _AC(X, Y)	__AC(X, Y)
-#endif
-#ifndef _UL
-#  define  _UL(x)		(_AC(x, UL))
-#endif
-#ifndef _ULL
-#  define _ULL(x)		(_AC(x, ULL))
-#endif
-
 #define GENMASK(h, l) \
-	(((~_UL(0)) - (_UL(1) << (l)) + 1) & \
-	(~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
+	((~0UL - (1UL << (l)) + 1) & \
+	(~0UL >> (BITS_PER_LONG - 1 - (h))))
 
 #define GENMASK_ULL(h, l) \
-	(((~_ULL(0)) - (_ULL(1) << (l)) + 1) & \
-	(~_ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
+	((~0ULL - (1ULL << (l)) + 1) & \
+	(~0ULL >> (BITS_PER_LONG_LONG - 1 - (h))))
 
 #define BITS_PER_BYTE 8
 #define BITS_PER_TYPE(t) (sizeof(t) * BITS_PER_BYTE)
-- 
2.54.0

