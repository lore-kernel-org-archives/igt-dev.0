Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC7FC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 09:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B142710EA80;
	Thu, 17 Apr 2025 09:51:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5MdqSGq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E6C10EA80
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744883480; x=1776419480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tkgoqB6vouAnY4v2VsI++aouPODA6Bg3qbc3NYAvgK4=;
 b=L5MdqSGq/YKvS3OLhHUwZ0iWHxihY2CIuHxKpZuaorZdd9gLHVLyljzF
 7tuPDgv9j6Csvk2jACf+E7NyFEJpl5oFW2l9DJ/lKWkNtZBLlvzAH/Adi
 wdX5m4qexgSFR3IJB8EmN+tauI346wahXbi1HIzxDbXcFMAMFi3x9/AK0
 O2IQrAd3rf+Wonz2kHL0ZcqEckfQ1rI+bNwJ2W9izfodHrnpYmtp59E43
 PDqry3B8Vn99fYEW7A77rW0MRXHER64wCjl76spWFkx3pb2jpi7A4dTXV
 +M0VYAQ93QMiDGlu/KoOgWHg8YSu087YsYOigCyPN6BKyKfOItfbErvp3 A==;
X-CSE-ConnectionGUID: gp6DOfA9RoCKDQUpasjj3g==
X-CSE-MsgGUID: agHqlvkBQuKJl6fW27QivQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45695998"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="45695998"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 02:51:20 -0700
X-CSE-ConnectionGUID: h/Zt5nEgSd2M/lZcqrgTnQ==
X-CSE-MsgGUID: +AY73cDCQpm77zLbyOmZfg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135564776"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2025 02:51:19 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	ramanaidu.naladala@intel.com
Subject: [PATCH v5 2/2] tests/kms_vrr: Increase readability of kms_vrr
Date: Thu, 17 Apr 2025 15:19:07 +0530
Message-ID: <20250417094908.1795432-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417094908.1795432-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250417094908.1795432-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add converted refresh rate value apart from nanosecond time prints
to increase readability of debug logs.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 182e7c2fa..15bc1e250 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -512,8 +512,10 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 
 		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
 
-		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
-				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
+		igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz), Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f Hz)\n",
+			 i, rates_ns[i], (float)NSECS_PER_SEC / rates_ns[i], threshold_hi[i],
+			 (float)NSECS_PER_SEC / threshold_hi[i], threshold_lo[i],
+			 (float)NSECS_PER_SEC / threshold_lo[i]);
 	}
 
 	/* Align with the flip completion event to speed up convergence. */
@@ -538,8 +540,9 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		 */
 		event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
 
-		igt_debug("event_ns - last_event_ns: %"PRIu64"\n",
-						(event_ns - last_event_ns));
+		igt_debug("event_ns - last_event_ns: %" PRIu64 " (%.2f Hz)\n",
+			  event_ns - last_event_ns,
+			  (float)NSECS_PER_SEC / (event_ns - last_event_ns));
 
 		/*
 		 * Check if the difference between the two flip timestamps
-- 
2.48.1

