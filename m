Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDECC7115E
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 19:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EFF10E15F;
	Tue, 17 Jun 2025 19:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWemOSSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976E910E152
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 19:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750188413; x=1781724413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=++bh63vY9zo1B00Lj1w9gNEgsVjXDYzGsVhFzSD+u5c=;
 b=PWemOSSKjZ3Y1yUPkif4OrbNuB6Tijjohy5qfy6YPCyteOGcErIwKOfR
 36O72DBiwoK/xH1CvBffFKaGihCt0qk1AyyUuVlQ4IhIZBNTvLDLsx3Ah
 EfUAB9Cdh60i1B5o05sSX1T8L7HZ0FK82lCEcsLw/aeVLOcFwfEyKMf0q
 CHHLziyh2rpxcYqciH7ii9VmOHl87BWhaAv9Ta4dwi+4Gz9QLx1te+bwu
 RxomcEdG9Jjn2WN/uIVxM0qJQhxMomWgrLs5/yaMrUhVlXCwzCnP2sVKB
 znL28dTnObG3SMtCXMfNbMrP1Bcv4AJoQgjAD8yUwb0294DT4kgaJ2cEt g==;
X-CSE-ConnectionGUID: vlQ66/+TRaaZiv4TYv5QzA==
X-CSE-MsgGUID: OoGASAqFREe1I0iDW7aEqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52523999"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="52523999"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 12:26:53 -0700
X-CSE-ConnectionGUID: +kpDUh2US2+lGiFOPF1vww==
X-CSE-MsgGUID: cm04KqhYThGxWuGCLxxNwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148807902"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2025 12:26:52 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 4/7] tests/intel/kms_dirtyfb: Enable the tests support
 variations based on the WAs
Date: Wed, 18 Jun 2025 01:00:25 +0530
Message-Id: <20250617193028.107483-5-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617193028.107483-1-mohammed.thasleem@intel.com>
References: <20250617193028.107483-1-mohammed.thasleem@intel.com>
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

