Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D84CCF9EB
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 11:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E76810E7AD;
	Wed, 29 Oct 2025 11:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SonIahpq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BAD10E7AF
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761739016; x=1793275016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T1i5Rx8YfanF1lm44QN485QJGwuNgwtSGk4UQ+lEc68=;
 b=SonIahpqYdBXMRBKd0P9InDwLEma21YzLiH0r8aaJjWfm4Soq9RdTcq6
 UABNbx5xLj7Wq3JcvNoJspe57+braAfcih1gz5Kl+fSIRrsrF6o1hr7Fv
 h5lT9+GjCctr7JTy4v9zsrnzlPQuH/uc/ImS3bTaqTohrmP+QMOIye/TW
 j1L1MSXpzarFj9ubUfmwRkeX1cAUYSqG9fLOCeujOmdU4kpUdMv23tcC0
 I+GJ5P4klLmwv07vn0lQLEIqa5LJYrg/jHv7JIu/Qk7YYdXRF24Qgaldw
 HFoMGU/pzs842zyFwQIk8uhpve4rmK1FXUaOFPi6snMxvaadlhfbn2afJ w==;
X-CSE-ConnectionGUID: VZQf0o9sRyipWO+UDRjP0g==
X-CSE-MsgGUID: b7SCAGhzStm4fgvtHCV6ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="75305468"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="75305468"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:56:56 -0700
X-CSE-ConnectionGUID: rBNmYtA6TK2kz3doE8C9mA==
X-CSE-MsgGUID: XxZTzFIcRGuvqpV3/M+UIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="190772017"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:56:54 -0700
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] include/drm-uapi-experimental: Drop stale macros from
 intel_drm_local.h
Date: Wed, 29 Oct 2025 17:21:31 +0530
Message-ID: <20251029115130.2206789-2-sanjay.kumar.yadav@intel.com>
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

Remove temporary macros (DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER,
DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT, and
DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY) that are now part of
upstream drm-next and are therefore in include/drm-uapi/xe_drm.h.
These were originally added for early development
and are no longer needed.

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 include/drm-uapi-experimental/intel_drm_local.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index 3aaf1eeb9..b48c9e219 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -20,11 +20,6 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
-#define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER	(1 << 0)
-
-#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT      (1 << 0)
-#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY        (1 << 1)
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.43.0

