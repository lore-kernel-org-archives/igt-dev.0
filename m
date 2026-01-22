Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7769EC44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 06:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2983510E8F1;
	Thu, 22 Jan 2026 06:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+YE4w78";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9E610E249
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 06:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769064133; x=1800600133;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uxC+1tjokU/LX39F5AywBrHJK2rM4NJEp4iuvj2QGdw=;
 b=Q+YE4w78usib8g3InPZZAaASTaJJn3hv2E8sn992brVX2z72nzLiEhD6
 nFbbpYKZZji6Buw9IKMoYnZ4eJ72Ui0PUI7PXzXJRFRl7DIZIkA6XUCw9
 rOTt2sRr3rzvBSeMjaZPomTjDPKmLI6yKMwu4RHaCxFFkIUw1vN+1u1m2
 2YAs4HLlOI8/VM8Ey4saPoXM20rgnP/D5/X3CegnaEX9T3P+XfXhb5cVa
 qrX9IWyzVwUfPS4ndRElbIvbt/RUm5bvNbUXIuAhH/sunDMWGKvZDwfqM
 HWvMHOeZVVEKM6BOb7+n720D+QcxA2DTs2twvkxbIPIEZoxylA2chRfvu Q==;
X-CSE-ConnectionGUID: Y86X1Xc1SdSZPeNLBNoBjg==
X-CSE-MsgGUID: 3YFVcoh0SoeD9defINMFnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="74152303"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="74152303"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 22:42:13 -0800
X-CSE-ConnectionGUID: n2t5tjkESGWc042bJMjM5A==
X-CSE-MsgGUID: gBtQ5l5AQ1eI3Y5O9WRBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="210807522"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 22:42:10 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v5 2/5] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Date: Thu, 22 Jan 2026 12:06:59 +0530
Message-Id: <20260122063702.524450-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122063702.524450-1-soham.purkait@intel.com>
References: <20260122063702.524450-1-soham.purkait@intel.com>
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

