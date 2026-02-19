Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ECDE9A048
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 09:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4641F10E280;
	Thu, 19 Feb 2026 09:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dikk93it";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9489410E280
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771494841; x=1803030841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x8kSzZPOueHIg8KUsLnkZAIf/9m8aOiczE7ZhJfq05M=;
 b=dikk93it9TIlIz0K8FeW8dfkIXFHz3IrF3hwKipFyvMyV3WpaToXaPxS
 6SRjR6ox+MM4788xJvxSO/jTTvc8OMrZ5XkCVToqLVDm1JP51rddwo8sZ
 xch3hBn+juYRTtssEvCSa6Yax/RGreB++/9v0imBv6w/v5bELmMs5G0Wq
 kPH3Ft0/GWAV2lJlwp1CKWd5yLmi7cSU7q2Bw1BR1+hAzHxdmvzo3VYg/
 SgJuX2VIxDh/4lPlTBLiHuQSvVYJH1N8GrDlQ8TjWf7BETXR7bfM9aLSF
 EASPgOGaiFZNyWdVIqLdYEdSIv4AbIpTqneIScQHfWV8Z+K6OSf9ELiQg g==;
X-CSE-ConnectionGUID: 4oQJO08qQ8e7Xa7G/1QU+g==
X-CSE-MsgGUID: 3OvOfmzfS+Oqu1fVdRXaog==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="82901424"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="82901424"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:54:01 -0800
X-CSE-ConnectionGUID: IInr7ar3RvCBCRdiQ5e8SQ==
X-CSE-MsgGUID: kM0pkLsNQ0uWtRmoaNVYOQ==
X-ExtLoop1: 1
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:53:59 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com, vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v8 2/5] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Date: Thu, 19 Feb 2026 15:18:01 +0530
Message-Id: <20260219094804.835429-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219094804.835429-1-soham.purkait@intel.com>
References: <20260219094804.835429-1-soham.purkait@intel.com>
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

