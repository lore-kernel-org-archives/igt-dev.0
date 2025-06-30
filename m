Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9151EC8302F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 13:37:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C48A10E222;
	Mon, 30 Jun 2025 13:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBGyhj8P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2330D10E44F
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 13:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751290660; x=1782826660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iVXlrNJ+GGjaxpUgoZ/rUdsYUegKo5o2MJIEvyzqMMM=;
 b=nBGyhj8PoEzjQmD+6A+9il7K25R2L18mFAGfIzg75UEWSvU8IjLx2bKm
 eNnHwv0HKv1mKoaUxNUSacT+aXEayEgDizDQkFRGozBojyIAPK3IeSOv7
 GJRoWbEmsBwN1esFoVqrZkoE5SstKaaLBdVVDjJPtz4SZ/BjehpR5n+Z3
 p6uQv6S+EIFNRUU2epLPK701idL9ZvlUHUCJoezKfecSEzYaCSQAnZyD9
 4/RtsTgEMRjLyWNgDGFbr/EUpgyu8mH/k6CRyv/fCE9WgAGWpnrM5KIBU
 UY/noSPzwB6mQPJzGuhMe7XhijJC74rgxE/93LwpzfjLTzpNt4iYuDGyI g==;
X-CSE-ConnectionGUID: Lsu4z4ogQuWYGfQgqFM6zQ==
X-CSE-MsgGUID: o5jL54tcQi2jNWCSO/rW0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57322570"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="57322570"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:37:40 -0700
X-CSE-ConnectionGUID: XRy0P05DSNymtKknhwVOGQ==
X-CSE-MsgGUID: 8LH7xNFEQ3yUQLFmjOZyVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="159188330"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.227.88.71])
 by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 06:37:39 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 5/7] tests/intel/kms_fbcon_fbt: Enable the tests support
 variations based on the WAs
Date: Mon, 30 Jun 2025 19:11:43 +0530
Message-Id: <20250630134145.836-6-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630134145.836-1-mohammed.thasleem@intel.com>
References: <20250630134145.836-1-mohammed.thasleem@intel.com>
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

v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)
v3: Updated logic at igt_skip_on_f. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index fedacec94..f3843cdb0 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -40,6 +40,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
+#include "i915/intel_fbc.h"
 
 /**
  * SUBTEST: fbc
@@ -455,7 +456,7 @@ igt_main
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc") {
 		/* FBC disabled: Wa_16023588340 */
-		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
+		igt_skip_on_f(intel_is_fbc_disabled_by_wa(drm.fd), "WA has disabled FBC on BMG\n");
 		subtest(&drm, &fbc, false);
 	}
 
@@ -468,7 +469,7 @@ igt_main
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc-suspend") {
 		/* FBC disabled: Wa_16023588340 */
-		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
+		igt_skip_on_f(intel_is_fbc_disabled_by_wa(drm.fd), "WA has disabled FBC on BMG\n");
 		subtest(&drm, &fbc, true);
 	}
 
-- 
2.25.1

