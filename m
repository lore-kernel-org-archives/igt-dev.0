Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D93C369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 09:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBED10EA6D;
	Thu, 17 Apr 2025 09:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MCqNQ+vs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D0B10EA6D
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 09:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744881446; x=1776417446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Ny3Fps6jNSobPXJBJwOfrGOo4L+EVITaI+vqQatlZk=;
 b=MCqNQ+vsyjOzz0VGqCXC2xTGinGA+/JEbMNlSBCN2zsRNlJwWYFgeiAN
 xdJqDW+iWcmPdU0fNUdk2u6FBR894HDGIJ7f8jKAaO+R0byetEadUua1O
 pS6zD1tlgSfL8Ee3IjpBTatHfSGs7GqpOLS0l2NDVGqgl+8crat01bwNS
 Us1ycG1zZmW5temXXJUqh81NHApcqTX6K4i8atoHtBIdx0e4gOSEobtWa
 npFsvhMEbTV025ATz2L+0dXrsmwaHCtLMjqj1LfQT46998zq6e4AeKa5h
 RI1/evueBE3pbeBSv7B2bSYjz52NwFUMHZYZSilDRvKR49OBH8DVoyg2l g==;
X-CSE-ConnectionGUID: ni4wKl7TTmGVFqHDuMQ2oA==
X-CSE-MsgGUID: iQRI8fVKRSq5E4kQvKASLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63996145"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="63996145"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 02:17:26 -0700
X-CSE-ConnectionGUID: hvF7BICFTMSjbr3+K9FR0w==
X-CSE-MsgGUID: 6kUHs+7ZQpqXR8f2LDwuNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="161792651"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa001.fm.intel.com with ESMTP; 17 Apr 2025 02:17:25 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	ramanaidu.naladala@intel.com
Subject: [PATCH v4 2/2] tests/kms_vrr: Increase readability of kms_vrr
Date: Thu, 17 Apr 2025 14:45:13 +0530
Message-ID: <20250417091514.1794527-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417091514.1794527-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250417091514.1794527-1-mitulkumar.ajitkumar.golani@intel.com>
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
---
 tests/kms_vrr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index c9059c897..91e3c12a6 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -510,8 +510,10 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 
 		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
 
-		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
-				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
+		igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz), Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f Hz)\n",
+			 i, rates_ns[i], (float)NSECS_PER_SEC / rates_ns[i], threshold_hi[i],
+			 (float)NSECS_PER_SEC / threshold_hi[i], threshold_lo[i],
+			 (float)NSECS_PER_SEC / threshold_lo[i]);
 	}
 
 	/* Align with the flip completion event to speed up convergence. */
@@ -536,8 +538,9 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
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

