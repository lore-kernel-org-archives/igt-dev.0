Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB2CCD5BA0
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C76810E7FB;
	Thu,  5 Sep 2024 09:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSEJQuWU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B2510E7FB
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528510; x=1757064510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1dLcbWj3m74QuD2OTvTAztDWUXGbsZYpSVFz7UnVl7o=;
 b=SSEJQuWUEeAxR70j/POpHONT4obOkWSrCD8+89XvbrEDgOu+5zJoBrDk
 Xlg2QP4cud9irVm+vQhF6hRM9w1/bcoZMPwRjPQrIGwDFXVDOCCO/na5s
 UgAD/7qEokqFH6Xa6IW7PVmUSqzsorF0/WkEmOi6DIK2HF2zvgiRZb79K
 Pji1nqc5F0s6sWEfsNYAkoFrFUDpEyq5zeqZbqEF4/MeC/ZSVaKECB5sW
 gXiiQVKLScTVycxIaelEuNrOOViw3Teqe/Od8huqZNlJanBKATcS1HAzM
 tYZFmBAjkrbvOLgO9Nt1gU1dF1bDhOuaDknt5Bah+0aY8D3ONz69kLyNX w==;
X-CSE-ConnectionGUID: t3h7GBNQQmmWccIMLW/Uxw==
X-CSE-MsgGUID: ieYtgNqIT0SK32/vjo42pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35590116"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="35590116"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:28 -0700
X-CSE-ConnectionGUID: G7mzR1s6R06yyRfSvmgRew==
X-CSE-MsgGUID: HLfpat6jRKaj8AHXHrfE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65404571"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:28:22 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v6 01/17] drm-uapi/xe: Sync with oa uapi fix
Date: Thu,  5 Sep 2024 11:27:56 +0200
Message-Id: <20240905092812.94553-2-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905092812.94553-1-christoph.manszewski@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
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

Align with kernel commit f2881dfdaaa9 ("drm/xe/oa/uapi: Make bit masks
unsigned"). Use built header instead of raw uapi header.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 include/drm-uapi/xe_drm.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 29425d7fd..f0a450db9 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _UAPI_XE_DRM_H_
-#define _UAPI_XE_DRM_H_
+#ifndef _XE_DRM_H_
+#define _XE_DRM_H_
 
 #include "drm.h"
 
@@ -134,7 +134,7 @@ extern "C" {
  * redefine the interface more easily than an ever growing struct of
  * increasing complexity, and for large parts of that interface to be
  * entirely optional. The downside is more pointer chasing; chasing across
- * the __user boundary with pointers encapsulated inside u64.
+ * the boundary with pointers encapsulated inside u64.
  *
  * Example chaining:
  *
@@ -1598,10 +1598,10 @@ enum drm_xe_oa_property_id {
 	 * b. Counter select c. Counter size and d. BC report. Also refer to the
 	 * oa_formats array in drivers/gpu/drm/xe/xe_oa.c.
 	 */
-#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xff << 0)
-#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xff << 8)
-#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xff << 16)
-#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xff << 24)
+#define DRM_XE_OA_FORMAT_MASK_FMT_TYPE		(0xffu << 0)
+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SEL	(0xffu << 8)
+#define DRM_XE_OA_FORMAT_MASK_COUNTER_SIZE	(0xffu << 16)
+#define DRM_XE_OA_FORMAT_MASK_BC_REPORT		(0xffu << 24)
 
 	/**
 	 * @DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT: Requests periodic OA unit
@@ -1698,4 +1698,4 @@ struct drm_xe_oa_stream_info {
 }
 #endif
 
-#endif /* _UAPI_XE_DRM_H_ */
+#endif /* _XE_DRM_H_ */
-- 
2.34.1

