Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C96C531DC
	for <igt-dev@archiver.kernel.org>; Fri, 23 Aug 2024 18:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA50B10E08B;
	Fri, 23 Aug 2024 18:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjjRT1EX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E845F10E08B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Aug 2024 18:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724437362; x=1755973362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1dLcbWj3m74QuD2OTvTAztDWUXGbsZYpSVFz7UnVl7o=;
 b=MjjRT1EXkQoKbFVUa2X/HJXaZ5sBCJuxAEqsuEG+axM8JTgYKJYOKZ2A
 M+CFxqTObynPmUIbiaIqW7T0PzCtZekyYFuhOA9p5NUdchn4+3Pjitlcf
 Xx7th/lIzLGuvqoIvihCQGfzZlvzkKc6FfGUsVpGQSoLXKWL/mrPlvhqs
 WAylUc5HoT+pbw96ZXArSiqYUr2YUFsRLiETgWcd2zloQpCP3OE9l5FWJ
 OTciewWk0GsE2n5SNId53TW5hXlsxm+qh5k1k4HmWNbRTaa8sOLhmPrXx
 O2ucB4FMe6rkhEORFZ6niQ08JJlyL92w1soMuo3sahx8EnuFzPlaYQcZV Q==;
X-CSE-ConnectionGUID: KNDvS38bSxatA6FOQZ2ZQw==
X-CSE-MsgGUID: 9fKZgDT9RTGfwvnVuX84vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34079267"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="34079267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:22:42 -0700
X-CSE-ConnectionGUID: 6O7j4brmTHCakyR8ZtLHMw==
X-CSE-MsgGUID: hRcTKtyPTOq8fNfaq2IzFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="92606021"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.10])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:22:37 -0700
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
Subject: [PATCH i-g-t v4 01/17] drm-uapi/xe: Sync with oa uapi fix
Date: Fri, 23 Aug 2024 20:22:06 +0200
Message-Id: <20240823182222.305965-2-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823182222.305965-1-christoph.manszewski@intel.com>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
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

