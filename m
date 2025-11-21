Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4EFCFA776
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 11:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D0810E856;
	Fri, 21 Nov 2025 11:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0mwovBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B352C10E854
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763722834; x=1795258834;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=v/vuJl7CJZ2GZTCl0tHqLLhlRDSypPOvZQjQtno0+2o=;
 b=a0mwovBGlipliufuN1brNKLg4jYFvpqEvf5Tgcu3/A4hNJz53gUCPWNQ
 Sa9SzzJvsDGY64cyzKXEPsgKfBiP9k3nLVBLUuHqXoT9m/RsPDgT5dn+q
 v/Kuk1jXk8zrnI89dTu4ETo6cUtCzP+WdBdj8gkTKNPJ+l+5q5gpyyx08
 hq7ZoOSeI3vGv22cOE/W0nVXL8zfJoGBaXGLT6pPVmpyclzFKOnTVUA38
 ZMC/G6krnClcMmttAQK4mlQwiJ0RF5YCR3dYB+SZWGwM5/6owus/XUkJ/
 R0lJH+wwHDRnWZPpnvKmpp+9wUSA/7xr7CIxMSXLTSiVnYVq12Ty3P3a/ Q==;
X-CSE-ConnectionGUID: PNdBbD8dRhWH6mCC1mCqSw==
X-CSE-MsgGUID: AYIhok3kS8uFvRftGCijMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83203552"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="83203552"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:34 -0800
X-CSE-ConnectionGUID: p2H3s5oORPKESmeUN2qAWw==
X-CSE-MsgGUID: /zluZSXbTRODtubgQjqKhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="195953860"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:00:33 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 21 Nov 2025 11:59:03 +0100
Subject: [PATCH v5 4/5] lib/xe/xe_query: introduce iterator for GT topology
 masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-xe_query_helpers-v5-4-d69c1c160e96@intel.com>
References: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
In-Reply-To: <20251121-xe_query_helpers-v5-0-d69c1c160e96@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, 
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
 =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, 
 Christoph Manszewski <christoph.manszewski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=v/vuJl7CJZ2GZTCl0tHqLLhlRDSypPOvZQjQtno0+2o=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpIEYGIElQFtYmo2j2W6/cjtO8Q/50YCu+1g0ZD
 mjpsryUDGuJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaSBGBgAKCRAjYrKT3hD9
 12qOC/489IDCFZqFTGeR+DCCk8DuIsuBu65wYtmIPoUao7xE77/Oh8TdYDz11kOSwrSm2GLNoJO
 RDxPeNgA7338EuGHKbJvw08MgXchaN2b25TH2SSKkgIypeOsObgTcu5lbB7C1FOotCxzOhPNQ3R
 VTJ0bkfTO02dvK/vix10K45Em9ioVIl9ZukfbJtuYysep7Q4KB8ELOJI910UclZ4THVCDsAEVCC
 TfxFv6B9UF4Kms3LQP0lnkpBur78BusVHR1CGG2vH5uchiNomVgpKpbXiBvZKOLIYOYork+vLcq
 /TxdtH6jMyTTeSfnZRdrVu7zYtKHvAoJxz1+dnlSzKUXUNqhaVZk+B1uLkD8K24LN/62fSM5qhf
 E8fZCoQaU+dgqCk1+ag2c/eXLkl5m24LhNyuO86sL2yuzCBggbgwcV2tMiQURFlRG946w53k2yq
 ubT9S6yLNWKsW49UbT0NkMRPJL/8ar+MmnOgjbjBvcVZWftQnc1dAkGuI41umhVaZdPkQ=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Topology masks returned by device query DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
are placed sequentially in one blob of memory, moreover every mask can
have different size as they contains flexible arrays.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/xe/xe_query.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 15d5c26baf5be6e107495247ca1aaefea551d821..3eb05a6c0535f3f2edce8b8591d17198ee356b68 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -97,6 +97,12 @@ struct xe_device {
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
 #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
 
+#define xe_for_each_topology_mask(__masks, __size, __mask) \
+	for (__mask = (__masks); \
+	     (void *)__mask->mask - (void *)(__masks) < (__size) && \
+	     (void *)&__mask->mask[__mask->num_bytes] - (void *)(__masks) <= (__size); \
+	     __mask = (void *)&__mask->mask[__mask->num_bytes])
+
 /*
  * Max possible engine instance in drm_xe_engine_class_instance::engine_instance. Only
  * used to declare arrays of drm_xe_engine_class_instance

-- 
2.43.0

