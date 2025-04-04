Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F0DC3601E
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 04:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1DC10E25D;
	Fri,  4 Apr 2025 04:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFoKFzlQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02EA10E22B
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 04:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743741573; x=1775277573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VcLZ02wENc1jKrYZKkhJrqtF64T3XhT8Hes2PbaBiCk=;
 b=AFoKFzlQh5L57AXrzkrGEqa4IeYCqXgC65rA6IgTIDArHVyKEPN56wfq
 HIDmuwt7jPQElxhxJcFbGbfIEw1tY/10bnHYP7332IHMKhtkiozQE6mMm
 p+qXmZBW3y2NmJdMlE8n5rO5QZpkhcBF/jyQ8K8oaPd/sNQY//NPm5gsu
 Qrh406AovZ3NbSbpw0aUqZ1GuMXBzb7wdgWZ380rpwpHxFKcg1Jy6Euwp
 X1uyyH00EzHBkAvWC3Tk0JXwrjIfh0RaVNsQFjYVkKGRUItYMzAeQ3J02
 ppqNiqK9KZ5zHyejLh8JeEHm3y26st5H79F2moGzbA4pdOVNC5Acypemp w==;
X-CSE-ConnectionGUID: TnbqftoCQb6nH0c7eZPOQg==
X-CSE-MsgGUID: OJKL9DdXQuSXS6w0YzWwxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45294696"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="45294696"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 21:39:31 -0700
X-CSE-ConnectionGUID: OCQJLbe+RamGY6zYDtsr/g==
X-CSE-MsgGUID: V6osNpSrTrezMsKkHjK9aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="128062189"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2025 21:39:29 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, ramanaidu.naladala@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com
Subject: [PATCH v3 2/3] tests/kms_vrr: Increase readability of kms_vrr
Date: Fri,  4 Apr 2025 10:07:07 +0530
Message-ID: <20250404043709.955109-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250404043709.955109-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20250404043709.955109-1-mitulkumar.ajitkumar.golani@intel.com>
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
index ccf32f453..4d308aced 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -487,8 +487,10 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 
 		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
 
-		igt_info("Requested rate[%d]: %"PRIu64" ns, Expected rate between: %"PRIu64" ns to %"PRIu64" ns\n",
-				i, rates_ns[i], threshold_hi[i], threshold_lo[i]);
+		igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz), Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f Hz)\n",
+			 i, rates_ns[i], (float)NSECS_PER_SEC / rates_ns[i], threshold_hi[i],
+			 (float)NSECS_PER_SEC / threshold_hi[i], threshold_lo[i],
+			 (float)NSECS_PER_SEC / threshold_lo[i]);
 	}
 
 	/* Align with the flip completion event to speed up convergence. */
@@ -513,8 +515,9 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
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

