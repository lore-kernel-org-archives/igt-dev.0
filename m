Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABD8C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 08:51:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E807110E02E;
	Thu, 22 Jan 2026 08:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vsb1Ikvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A7C10E94C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769071876; x=1800607876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uxC+1tjokU/LX39F5AywBrHJK2rM4NJEp4iuvj2QGdw=;
 b=Vsb1IkvvpuXfyDFKwpo6Yp2QgU/qXmxx1eh0lCaMmyoP/zRObimH10up
 O7X7kWlKk1R7s+5+/RiDXGIx6rCY/+UFhdNp4nZPCJ/cLjAei8QiMwF2b
 JouyizOLHHNKOSAXNCSnuu7qf1ugSMZT8Nt2ufPFTfo8RHqs8QuYYyKyZ
 uLWf/lhWwoKN33Wg5KAruL1VGWFQC3I+fh5Khdwfyt86RpHr1MZ7HNFnj
 bWeGPSVAqsbFDOsOu6TbQuU/PaSsCwTxHkOnNm2q9xR8lctXzRMj9978D
 LLAvL2h67zGPNiDhcBIGCDrT9uCwhoZhlxl1I/F6er0vuJ0c7i7WCJHKO A==;
X-CSE-ConnectionGUID: wlzm9yezRhSwsQ4xrJmtNw==
X-CSE-MsgGUID: jZ0pZ7DhQdShKMl+igeNyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70031123"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="70031123"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:50:38 -0800
X-CSE-ConnectionGUID: 9BGSoG7LQi+ACzq6B8dt7A==
X-CSE-MsgGUID: rs0BqlZRR/ybItwKHximPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="244280506"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:50:35 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v5 2/5] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Date: Thu, 22 Jan 2026 14:15:23 +0530
Message-Id: <20260122084526.538837-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122084526.538837-1-soham.purkait@intel.com>
References: <20260122084526.538837-1-soham.purkait@intel.com>
MIME-Version: 1.0
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

Add clamp helper macro to utils.h to remove dependency on lib/xe/*

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tools/gputop.src/utils.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/gputop.src/utils.h b/tools/gputop.src/utils.h
index 00befed56..7f3e2ac76 100644
--- a/tools/gputop.src/utils.h
+++ b/tools/gputop.src/utils.h
@@ -6,7 +6,6 @@
 #ifndef COMMON_GPUTOP_H
 #define COMMON_GPUTOP_H
 
-#include <glib.h>
 #include <math.h>
 #include <stdbool.h>
 #include <stdio.h>
@@ -19,6 +18,16 @@
 
 #define PERCLIENT_ENGINE_WIDTH 8
 
+#ifndef clamp
+#define clamp(val, lo, hi)			\
+({						\
+	__typeof__(val) _v = (val);		\
+	__typeof__(lo)  _lo = (lo);		\
+	__typeof__(hi)  _hi = (hi);		\
+	_v < _lo ? _lo : (_v > _hi ? _hi : _v);	\
+})
+#endif
+
 /**
  * struct gputop_driver
  *
-- 
2.34.1

