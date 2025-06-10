Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8399AC5B552
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 17:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6FB10E2E3;
	Tue, 10 Jun 2025 17:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="boReqFbt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAE110E2B2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749577145; x=1781113145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=++bh63vY9zo1B00Lj1w9gNEgsVjXDYzGsVhFzSD+u5c=;
 b=boReqFbtbAPnJWC/ABA+nWSTCBidD74vRhlvNm4Gim0DKE49FqbDULMm
 beDjC2yT7txTSI1MkTnk5MeUDls67KQF4sdgCtIDl1F1wcQQPFhmdox0E
 XBCgG6GXbuJAe1soV6JhU1zgZUP6SPaVdLE9tS63Wr8bHMTKJLIHmEd7C
 WOhb5cbc63YoUdRB6A62HkoIBqFcKnsz68BCKR7O6nNZ7Powwf9aCC6TA
 IqU1tWU0C/eccktmboB+jCsQBEDSw7PYPco/9J061/NUwuh1cLIB069fV
 uhrkfPaPjDJyYuYXobqaL9tM6/ZKca4+Ven6Po0M9Ipo6c5cOC2Auxwo6 Q==;
X-CSE-ConnectionGUID: KWsZ8YX4QVGx11Z3bj4v7Q==
X-CSE-MsgGUID: QfsGC9K0RgSHPp0ODgfwKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="55505947"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="55505947"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 10:39:05 -0700
X-CSE-ConnectionGUID: Dmb/NeY4S0ehalt2sndUBg==
X-CSE-MsgGUID: VzqquRTBSNqUQrtIk5TImg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; d="scan'208";a="147854445"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by orviesa008.jf.intel.com with ESMTP; 10 Jun 2025 10:39:04 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 4/7] tests/intel/kms_dirtyfb: Enable the tests support
 variations based on the WAs
Date: Tue, 10 Jun 2025 23:12:41 +0530
Message-Id: <20250610174244.1292-5-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610174244.1292-1-mohammed.thasleem@intel.com>
References: <20250610174244.1292-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index a5707c5b1..e587042b3 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -49,6 +49,7 @@ IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
 #endif
 #define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
 #endif
+#define WA_FBC_DISABLED "16023588340"
 
 typedef struct {
 	int drm_fd, devid;
@@ -381,8 +382,9 @@ igt_main
 					data.mode = igt_output_get_mode(data.output);
 
 					/* FBC disabled: Wa_16023588340 */
-					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
-						       "FBC isn't supported on BMG\n");
+					igt_skip_on_f(data.feature == FEATURE_FBC &&
+						      !intel_is_fbc_supported(data.drm_fd, WA_FBC_DISABLED),
+						      "WA has disabled FBC on BMG\n");
 
 					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
 					if (data.feature == FEATURE_FBC &&
-- 
2.34.1

