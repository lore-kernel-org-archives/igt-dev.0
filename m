Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47215C3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 19:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D8910E297;
	Mon, 22 Jul 2024 19:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ib5Wpxcz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A59A10E297
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721675258; x=1753211258;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bcOAoquw/LHwi36NKUHmrGeVkshuoj9OEE+7nLzGO7I=;
 b=Ib5WpxczjrGtvpPMKZ/qbXTFssVviJrJKr7jDRiY2wBqQgzMHgLgaauE
 sexeAj8njfwJXeCZSVGEYHV8D+ARmK3gIDKXCD7w8fiQowdLQOt42Fl81
 Kdf8KpOTesBlLGuCSghltBd+21yuyOZ8O9s/qQS2et0RNPHpADsHtrS3U
 2tCPYNKwRgh7l9jciQJlDp+IDlhIngTeH5rZIj6omYr9mzJA2POeYOPys
 WXRLjmXE/Oj4cfEIR0kIhEaLuPCEz2hMHjja9gzMD09Vj8f6saDXVOAgK
 QJ9xg0BFWhl6bPeQ8uj+c/GlJvyQpiSjMMxGWDvfj3WQx7GO4kaf0fhHS g==;
X-CSE-ConnectionGUID: hfvaRB9lTEGHfSjwA7QKWA==
X-CSE-MsgGUID: ECoPjxUPTP2uDhMssuiCYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30413962"
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="30413962"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 12:07:38 -0700
X-CSE-ConnectionGUID: lKzC2JpxSC+0e06rGgIXxA==
X-CSE-MsgGUID: 6zwP5GWwTT2kWAz0OUQ1zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,228,1716274800"; d="scan'208";a="52580454"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 12:07:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] lib/xe/oa: Handle SIMD16_EU_PER_DSS
Date: Mon, 22 Jul 2024 12:07:17 -0700
Message-ID: <20240722190717.57192-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Handle SIMD16_EU_PER_DSS the same way EU_PER_DSS is. Since this function
is mixing information from hwconfig and the topo query, this should be
more correct as now the numbers from the query match the hwconfig.

This fixes the assert triggering in the default case because
SIMD16_EU_PER_DSS was not handled:

	(xe_oa:4511) CRITICAL: Test assertion failure function xe_fill_topology_info, file ../lib/xe/xe_oa.c:532:
	(xe_oa:4511) CRITICAL: Failed assertion: 0
	(xe_oa:4511) CRITICAL: Last errno: 2, No such file or directory
	Test xe_oa failed.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_oa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
index 797458439..4764ed1fc 100644
--- a/lib/xe/xe_oa.c
+++ b/lib/xe/xe_oa.c
@@ -521,6 +521,7 @@ xe_fill_topology_info(int drm_fd, uint32_t device_id, uint32_t *topology_size)
 			ptr += ptopo->subslice_stride;
 			break;
 		case DRM_XE_TOPO_EU_PER_DSS:
+		case DRM_XE_TOPO_SIMD16_EU_PER_DSS:
 			for (i = 0; i < ptopo->max_subslices; i++) {
 				memcpy(ptr, topo->mask, ptopo->eu_stride);
 				ptr += ptopo->eu_stride;
-- 
2.43.0

