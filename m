Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E24D49C90
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 09:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B61C10E2C4;
	Fri, 30 Jan 2026 09:58:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+ZPdjHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A9610E941
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769767117; x=1801303117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8kSzZPOueHIg8KUsLnkZAIf/9m8aOiczE7ZhJfq05M=;
 b=n+ZPdjHFEk3p2bJqHJt1CO0ckL4AsNZCedWRuoHQ+luzxHOyZHgyp2KT
 tmRfVWuTPAwXmeN6mdkg16HxavUMIK/Ody/X/nwZZIgkNqYmlxq1jmQ/4
 N0qz3Cij631m4iUfO19wLI3PquwRY305nH+QXlXTSQlikEixZdCRxk450
 FsYuIvrNoVNZXOdsTTW42OnbpEhF3CkFQEaIbbce+6TzxHJJSGpRRRWDR
 /swGBU1pmrzpucc/W9wkd6ryyHy0FF3KaOcVdcgazHZyMIRr6NT0ynnBf
 60BZqAWV9GxwJj6KVm8Fy751mdUHX5zkpcnWCqa48F7ixuNs7HPYPypul w==;
X-CSE-ConnectionGUID: uS1QzTyjSh65dNUs3pjaMw==
X-CSE-MsgGUID: vFLOPYJyR82loPpI7in90Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58595947"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="58595947"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:58:37 -0800
X-CSE-ConnectionGUID: 90FEjrxqS86LunSHuwyyww==
X-CSE-MsgGUID: QW42I7SpRm+xZ16fSdLdKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208413983"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:58:34 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v7 2/5] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Date: Fri, 30 Jan 2026 15:23:15 +0530
Message-Id: <20260130095318.644256-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130095318.644256-1-soham.purkait@intel.com>
References: <20260130095318.644256-1-soham.purkait@intel.com>
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
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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

