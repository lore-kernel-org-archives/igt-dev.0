Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6174109C02F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 15:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9217910E7BD;
	Wed, 25 Mar 2026 15:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNUmsPre";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3008A10E7BD
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453060; x=1805989060;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6r0ft4wnsv0a96WigNpMa6ptJHDjE9PCUMlsA7qRxC4=;
 b=JNUmsPrex4Vg0q8Bjw1mQ2GuNzXTnvmMaYaNrnlF0e5qU6r9Xxw5Pou4
 zlVHVCVMhbzrE9GENRz2IiC9Bis5CKkJrNZ86M2NaclEXbUlb0fynGzF/
 011Oitgsjav+M2+rpAuWqUYmbd0+UhffaKhvOgnAeoHt0Dte/nM1/cyp8
 DfnqZp3a4fV+O1c5dsS28bAOs+pey/6ZLDnKeqmlP03iiKEuLgnD0G7pg
 yAvoVfq6I0br5VZ+41sjA5vjBxk3jDyuzZ85gAr8Y5nWFO5mPadpVYSw5
 HFjwqTgJgsp8NzTlAa44E3FygqLUsE2kBBlNYkh0aPyLdnABzDImUJgIF g==;
X-CSE-ConnectionGUID: wpRg3o1lT8+CCGRmrVOOsg==
X-CSE-MsgGUID: VdNgRbRyQRev1NIO/jSl/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75209556"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75209556"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:37:40 -0700
X-CSE-ConnectionGUID: ycjoFOnCSKSgAMzVTqbdRg==
X-CSE-MsgGUID: XeqJ9rMETWusT3bMGecLkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="228784625"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:37:35 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 tvrtko.ursulin@igalia.com, tursulin@ursulin.net, lucas.de.marchi@gmail.com
Subject: [PATCH i-g-t v9 2/5] tools/gputop.src/utils: Add clamp macro to
 remove dependency on lib/xe/*
Date: Wed, 25 Mar 2026 21:00:35 +0530
Message-Id: <20260325153038.2099329-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325153038.2099329-1-soham.purkait@intel.com>
References: <20260325153038.2099329-1-soham.purkait@intel.com>
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
 tools/gputop.src/utils.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/gputop.src/utils.h b/tools/gputop.src/utils.h
index 00befed56..de7548168 100644
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

