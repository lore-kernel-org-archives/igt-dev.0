Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCF5C5AD2B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456310E463;
	Fri,  7 Aug 2026 22:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lqr3GaGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7E110E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142873; x=1817678873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O9zMmbn0Npsdhi/y1i1ZdtYq4TnRMInOot1slB+F6fE=;
 b=Lqr3GaGPAxdnBt0GYOx7+n3gf5/Zi8oSXUx7hgNYFik+nBPwv0fZSnky
 I7d+/Un8v7gCiDG2ZCKpEnZQGBzgTWFyesp+WDii9mYg6mclTu3EHDtOk
 Cyp0pxad2tjmLwzoXO6XwcA7BKMbO++TdqD44npzHobvI/hXoK0IwbHOm
 +ybmC1uW4CIgPFKRBK4cGK8zC+NTCQbqrCyJCgHaMhOsFdTI+q1QVDzfe
 utpXtH+bHKMeFJbJZIytVf3GAU33mlZGBbmn6xXW9jf8qJjWKSBIOY2UU
 Y5RWUFvY+k4SJC1qoVBa+zW18p2sVh87agg0jwzWwVmGAv+xGv8O3x9eN g==;
X-CSE-ConnectionGUID: BaAo6xCDTVWhqrG4ka/YyA==
X-CSE-MsgGUID: de/A5NVMSx+OZEOPSUGrvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835797"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835797"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:47:52 -0700
X-CSE-ConnectionGUID: +xN6M03bTZeLR1KM880P9w==
X-CSE-MsgGUID: V9aUYFLuReS1tWnENSXLrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655400"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:47:51 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 02/16] lib/igt_kms: s/pipe/crtc/
Date: Sat,  8 Aug 2026 00:47:32 +0200
Message-ID: <20260807224746.3554064-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260807224746.3554064-1-michal.grzelak@intel.com>
References: <20260807224746.3554064-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Refer to crtc instead of pipe.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_kms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 521a03c01d..c89aa95c84 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -773,7 +773,7 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
  *
  * If you only need to test a single output for each pipe, use
  * for_each_crtc_with_single_output(), if you only need an
- * output for a single CRTC, use igt_get_single_output_for_pipe().
+ * output for a single CRTC, use igt_get_single_output_for_crtc().
  */
 #define for_each_crtc_with_valid_output(display, crtc, output) \
 	for ((output) = &(display)->outputs[0], (crtc) = &(display)->crtcs[0]; \
-- 
2.45.2

