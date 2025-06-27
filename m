Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED76C7EE2A
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 06:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A0210E971;
	Fri, 27 Jun 2025 06:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFYelPyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DBE10E971
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 06:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751004048; x=1782540048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=siMFiTjz9BmpbEsxTjsyqLZ+cipsQkVbACDF0SJ5BgA=;
 b=VFYelPyJoDmW8+vh0G4lQlWQO0ZCYZZVw6r7GmzbiBqHdKVfkLjD25ig
 GS3T43u3T3xZyau8fqSBOCx2ns00dve7TZwqOjFAWsuvzwpH3zmeswddH
 YZ6bGm3hzXfd7zaYSxGTqoB1BZvwqhXn4BoXPnYnIaxhLEi4rDFRpWfWU
 pCMUJymWpr9S8+5gMSJXPVE6ipgJ2tKYElxUKJc/YZz2IdPKY0omBPacY
 HdAIcDFHfuYI+2Gsp+IeMM+90GT4KhMD3swO00DJSShH+uAM+9iEY6OX6
 omnIlIQKLuSTlTHtlU13rYUyoTr/yltyLirOy0umHHHbC5x7/pgMD3l+R g==;
X-CSE-ConnectionGUID: Pkgd6zNzRy2jalIvod+nVQ==
X-CSE-MsgGUID: kzZQmc8cTK+dYD7IbL2TGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53278513"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="53278513"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:00:48 -0700
X-CSE-ConnectionGUID: +LMJFLo+RUCBujh8peXsMg==
X-CSE-MsgGUID: B4z2bkm9R2WeJ1rg6XEGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152809477"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 23:00:46 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 5/7] tests/intel/kms_fbcon_fbt: Enable the tests support
 variations based on the WAs
Date: Fri, 27 Jun 2025 11:34:44 +0530
Message-Id: <20250627060446.29615-6-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627060446.29615-1-mohammed.thasleem@intel.com>
References: <20250627060446.29615-1-mohammed.thasleem@intel.com>
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index fedacec94..eaf611adf 100644
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
+		igt_skip_on_f(!intel_is_fbc_disabled_by_wa(drm.fd), "WA has disabled FBC on BMG\n");
 		subtest(&drm, &fbc, false);
 	}
 
@@ -468,7 +469,7 @@ igt_main
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc-suspend") {
 		/* FBC disabled: Wa_16023588340 */
-		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
+		igt_skip_on_f(!intel_is_fbc_disabled_by_wa(drm.fd), "WA has disabled FBC on BMG\n");
 		subtest(&drm, &fbc, true);
 	}
 
-- 
2.34.1

