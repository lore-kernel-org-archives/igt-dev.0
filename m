Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE02AC25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 10:35:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E663A10ED3D;
	Wed, 22 May 2024 10:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKdW+BTC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BD710EE59
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716374152; x=1747910152;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e8syI/13/OCv1xVoilDAm7IaR74vM1+9eBhZ1X31P7A=;
 b=RKdW+BTCiyyi+vy6cYxHMFRW7CnXOe/NQBF3KmtZd3gaQ+JfRdNj6mKq
 b+rjxPO8nsri4Hp6UsvAhKkUg6FmOn9i7H5RNj1Xkd58M6JR/fRTasnjI
 D0e+6asdAeNishT32QVjM0/xOc5cM4zx/ly10pRqJZJjf0dRDsUqryrah
 Q3K93TACLiw/gSVmlkbaHRLiYiBTHjib+jjnRpuJNevWpGfBZyyyeyN/B
 6bB9yNL3IHjx7bIisg1HZByzTVGh7NDolq8pwwkQgAJ7EaXejrJW1gN+5
 K1v7BZ+ov6e9wVfwkCQDtMUS6dzUuHTnFSxtSRuzQtBJAShHB1Dek+rSD Q==;
X-CSE-ConnectionGUID: zkC7gLrUQ4KAVMyTjY7M/A==
X-CSE-MsgGUID: 6wdGC3KdQ9O/gdC9OLxDpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="24029232"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="24029232"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:52 -0700
X-CSE-ConnectionGUID: Uv++RPq1R7qy+m9IO+/cWg==
X-CSE-MsgGUID: gCcQ4bdOTHmWDuz1ZsQMOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="37827680"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 03:35:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 06/10] lib: sync i915_pciids.h with kernel commit
 bfbda4722767
Date: Wed, 22 May 2024 13:35:19 +0300
Message-Id: <c4db2d04b9f09a2221a7beb472d6cf0253fbfecc.1716373923.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716373923.git.jani.nikula@intel.com>
References: <cover.1716373923.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Synchronize i915_pciids.h with kernel commit:

bfbda4722767 ("drm/i915/pciids: remove 11 from INTEL_ICL_IDS()")

and update the references in intel_device_info.c.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/i915_pciids.h       | 2 +-
 lib/intel_device_info.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/i915_pciids.h b/lib/i915_pciids.h
index 0c5a20d59801..ecfd7f71e2e7 100644
--- a/lib/i915_pciids.h
+++ b/lib/i915_pciids.h
@@ -597,7 +597,7 @@
 	INTEL_VGA_DEVICE(0x8A70, info), \
 	INTEL_VGA_DEVICE(0x8A71, info)
 
-#define INTEL_ICL_11_IDS(info) \
+#define INTEL_ICL_IDS(info) \
 	INTEL_ICL_PORT_F_IDS(info), \
 	INTEL_VGA_DEVICE(0x8A51, info), \
 	INTEL_VGA_DEVICE(0x8A5D, info)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 0bff1ab4ee95..79e3796dbefe 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -594,7 +594,7 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_CNL_IDS(&intel_cannonlake_info),
 
-	INTEL_ICL_11_IDS(&intel_icelake_info),
+	INTEL_ICL_IDS(&intel_icelake_info),
 
 	INTEL_EHL_IDS(&intel_elkhartlake_info),
 	INTEL_JSL_IDS(&intel_jasperlake_info),
-- 
2.39.2

