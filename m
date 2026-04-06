Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6C5E9D83B
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 06:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E51010E023;
	Mon,  6 Apr 2026 06:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfjCGt7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6EC10E023
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775455902; x=1806991902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w6twkM/tRojN1vdSzbfmRZHHoKXZWOwGe5tuYaD22m0=;
 b=LfjCGt7yIn2dOYRqd6L2vxzF7BRRYpcXVzs3h8KN2RqUzkgOT20Pf/Je
 yKHgVjr3VfNMm/sWlFsgnXvW3kniiwsh29r9GzmHCar0/Qe6kbMXJ6ye+
 xXL81LPd6+m0UBVZYXhBQQefeFJ/hyXk2KioH07tKStHEzs6utLKIrHcN
 N2r+uB4yR4SFRFsFDpVfaTPaTFilQ6L/ErYdxQbOpFDhypsBOLz9D3umK
 a2xe0GQD1KdWXP4YF7zzLaG6UI4MJ7z/HTVdJ1urMxRkgGpD+HlqwUbZR
 3Ajy5yb6y85jxO4ns8nQRMP0ZeR8ktFJxUN00up3l24zD5zO/LKM+5/QT w==;
X-CSE-ConnectionGUID: obk3SLXzQ6KW9vNh0rNEcg==
X-CSE-MsgGUID: SehPOQqLTzSeJ/5da3sXYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76421193"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76421193"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:11:41 -0700
X-CSE-ConnectionGUID: WbFX1VqQSt27elwC5kjovg==
X-CSE-MsgGUID: WBIjL6jWSTKNBOdqMDCxYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="226968744"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:11:38 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 tvrtko.ursulin@igalia.com, tursulin@ursulin.net, lucas.de.marchi@gmail.com
Subject: [PATCH i-g-t v10 2/5] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Date: Mon,  6 Apr 2026 11:34:25 +0530
Message-Id: <20260406060428.2734117-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260406060428.2734117-1-soham.purkait@intel.com>
References: <20260406060428.2734117-1-soham.purkait@intel.com>
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

Add clamp helper macro to utils.h to remove dependency on lib/xe/*

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/gputop.src/utils.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/gputop.src/utils.h b/tools/gputop.src/utils.h
index 00befed56..981c23bb0 100644
--- a/tools/gputop.src/utils.h
+++ b/tools/gputop.src/utils.h
@@ -1,12 +1,11 @@
 /* SPDX-License-Identifier: MIT */
 /*
- * Copyright © 2025 Intel Corporation
+ * Copyright © 2025-2026 Intel Corporation
  */
 
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
@@ -50,7 +59,7 @@ struct device_operations {
 			    struct igt_device_card *card);
 	void *(*init_engines)(const void *obj, int index);
 	int (*pmu_init)(const void *obj, int index);
-	void (*pmu_sample)(const void *obj, int index);
+	int (*pmu_sample)(const void *obj, int index);
 	int (*print_engines)(const void *obj, int index, int lines,
 			     int w, int h);
 	void (*clean_up)(void *obj, int len);
-- 
2.34.1

