Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9484CF8860
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 14:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFC110E758;
	Thu, 20 Nov 2025 14:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzCIpOI1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBA510E761
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763648895; x=1795184895;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=r2ITVAU6LaroPgpoX7JGdLISHMLxVLqGhfe8520hOcE=;
 b=gzCIpOI1kvtF7G4WCnwBoWbkZQaSVf9QA+rWrvTqdy3r4Y9vEWqRcSvX
 UNH+JweTo9/jWYn0uczSVcGTVN+1YAYIlEwTPM6DzlYx32IegO3DTK6Ov
 Ro92IuOL7H2N2vG+iCU53M8uFmypEM+rSAYqQXyLH+DkHGJLmbjMjTjuV
 Y7EUZUsEg2idbZKFb3jfiCcN8RSZoZBFame0pwmsHhaGgABHy4ffz5I/+
 Ka1CB/vIEU4lHFnFxA3M/lIazBVg9qAubPFz0fUjBQyNAHhOSCTZi1NxD
 L0VBsCmzaeXCyyOmPvgUXUES2gyBRuaDM0WrO8G7Ahv0x/S9jOcqpgMz4 w==;
X-CSE-ConnectionGUID: wdRiykKkQW6U069lBlpS4A==
X-CSE-MsgGUID: FgaeLAaHSoSyBX9LtQxjgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76824136"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76824136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:14 -0800
X-CSE-ConnectionGUID: jlcGOTLVSVytzxT3Bo9Pmg==
X-CSE-MsgGUID: jIrfCBYsQYKCATOny2Knkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191057678"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:28:13 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 20 Nov 2025 15:25:42 +0100
Subject: [PATCH v4 5/6] lib/xe/xe_query: introduce iterator for GT topology
 masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-xe_query_helpers-v4-5-2ed6dc04dd94@intel.com>
References: <20251120-xe_query_helpers-v4-0-2ed6dc04dd94@intel.com>
In-Reply-To: <20251120-xe_query_helpers-v4-0-2ed6dc04dd94@intel.com>
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
 bh=r2ITVAU6LaroPgpoX7JGdLISHMLxVLqGhfe8520hOcE=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBpHyUwnXS7Q0BmHcNwyy/GOu87TAoYXZ/UAd7Bb
 9PLhiAsiBmJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCaR8lMAAKCRAjYrKT3hD9
 1/rqDACCKUBT4yaEPLOL/vytspIQCUK46rNPOcUMtTqiPfuTw6fAMaEi8IF4X3xPI3DRj/xlLy6
 ZRXfPt1RupRzt2gAkVTLtn9veQ7QUUfw8mW0qGNbidYKwWGpOeWjzjj9BKi1J6Sx1SELE3X1P9y
 vlzszpM/SbBsrRSbFWBgS33uKxamOvX/wxXb3gmkYmqTMBHC06pc7zS2LxZJek8yCTvgsDDgrZP
 VXlQiGeulKCs0AwHflmAxS/flRKxl4y6AqyJZczqFMNSwV1Hun1eQk2WgpUSyoiRL5LqWiE1o4G
 okqEIOrMVoFmpje8BF3Ktj5Elhv0RXkvdE3rXKwNocAj/kipqD+Q6mvGMRsy3JhaGli1cgCJX/c
 QlZ05dLnTSnW8b3F5R6hHwNHJ9DqmmPBa5cYY9rgQ7CvqLg7hajtq57QBUTmW9Fx4f4QBdX5u4Y
 5Uq9KenxbgRfm90xm0JBrbsACl9roRfyUSa7f2PeQb8nhJGSGFNCynUlL2SHOlh2G3MXU=
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
index 3e4d73e01b922b47f29731d3cbccc72f67b4c4e1..0e944eb79a18977b015d5baf3da036f55d294a20 100644
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

