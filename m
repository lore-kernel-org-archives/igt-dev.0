Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E803BC36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 14:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D99F10E5CD;
	Tue,  1 Apr 2025 14:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnTG+u7L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87D110E5C0
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743516331; x=1775052331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iE/hpvEc2eJ/XeuxycWNmXiDm0kaJ4EgKi4Oh7nahLo=;
 b=JnTG+u7L5C0fYdlFiYL6TIcj8IA16jQx6xdip/x6Guloe5DutfhcipNc
 7G4VZqc6xOOmAP+PDRlZ/1aea39pWwfIjaRC+aHYyNG58Q2+Pr3p7emRx
 9AkAV4UoCzeRGPf7xi3wNz0kzaBx9tEwPzljbHg12nadbsIrJalN0485X
 i4zFK/k8pwankWKAw5+QyqphEumtxahTTZ66YUgg8cOt/lnu5wsYxAEJG
 jmHqWV93n+PG/fB/5LTJtHyE0uxDz+VnrBsXw6t1lr/jdunj0YC006q62
 NUkbMzoik3lwAR8f0gTyOoWe9d9EIgHqjfVK853PvYpiPHWe/jxoIYenh g==;
X-CSE-ConnectionGUID: C7xRn61cT2G5bE16TMzrTA==
X-CSE-MsgGUID: ZcDm7cRBRjKSKGY//gx+fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70198586"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="70198586"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:05:30 -0700
X-CSE-ConnectionGUID: bUUjxspZTsOW/uKylIuZyw==
X-CSE-MsgGUID: HfmJ0OuiT3+E0lvgMDd+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126364583"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.4])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:05:29 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v4 1/5] lib/intel_blt: Promote MEM_COPY_MOCS_SHIFT
Date: Tue,  1 Apr 2025 16:00:56 +0200
Message-ID: <20250401140510.38142-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401140510.38142-1-francois.dugast@intel.com>
References: <20250401140510.38142-1-francois.dugast@intel.com>
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

Move MEM_COPY_MOCS_SHIFT to the header to use it elsewhere without code
duplication.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c | 1 -
 lib/intel_blt.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index b2fb3151e..16e395c8f 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -21,7 +21,6 @@
 
 #define BITRANGE(start, end) (end - start + 1)
 #define GET_CMDS_INFO(__fd) intel_get_cmds_info(intel_get_drm_devid(__fd))
-#define MEM_COPY_MOCS_SHIFT                     25
 
 /* Blitter tiling definitions sanity checks */
 static_assert(T_LINEAR == I915_TILING_NONE, "Linear definitions have to match");
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 5d6191ac9..d0ee4172d 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -53,6 +53,7 @@
 #include "intel_cmds_info.h"
 
 #define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
+#define MEM_COPY_MOCS_SHIFT                     25
 
 enum blt_color_depth {
 	CD_8bit,
-- 
2.43.0

