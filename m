Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF63C7EE2A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 20:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A5310E7F8;
	Wed, 25 Jun 2025 20:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTyLv1vG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A6D10E7F7
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 20:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750882116; x=1782418116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y9P2cHnT4nBXytz8iCHbtvfJJM4xtPnhzq0LEimCCTM=;
 b=kTyLv1vGhyPwDIS7NDpWD4FtNe6klFsI18eA+oECoi5YO2M00+BU5PR7
 z0sTF1NeLTjH2lc11o0Ms7LHeOYI3CElqeNCzOjUYL+Z/zRfpyh4lyIlv
 Eh0zEmdPMFvVVeLjRqb5moAm0p8RlZQUjcwB57oPd1vWj1AcYx0AM+SqT
 JE6vMrnKYws33V7Mb/H3/UfUFAgdPDEZY0QxqhcogmqGzTLZj4w2XPSV/
 7AdFRPAFdZld8tF67bhWKe18Ajyc6h0lf9zjx0Sc5rdcwsgg4zlKWm0Rt
 rlTZe8ynh3sOeAJlAdcgK/sdr83LierHXopeClNkR3HOjSts2+2pUIORD w==;
X-CSE-ConnectionGUID: tWkE6hnnRR+6hmD55LV/Tg==
X-CSE-MsgGUID: aj+dj1z3QYyp0ZXJZMHKSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63766191"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="63766191"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:08:36 -0700
X-CSE-ConnectionGUID: eQiERnqlQ/iCOctTLgSQxw==
X-CSE-MsgGUID: Tvsudt1FTR+N5esN5U04BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="153033384"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa010.fm.intel.com with ESMTP; 25 Jun 2025 13:08:35 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 5/7] tests/intel/kms_fbcon_fbt: Enable the tests support
 variations based on the WAs
Date: Thu, 26 Jun 2025 01:37:36 +0530
Message-Id: <20250625200738.34381-6-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625200738.34381-1-mohammed.thasleem@intel.com>
References: <20250625200738.34381-1-mohammed.thasleem@intel.com>
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
 tests/intel/kms_fbcon_fbt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index fedacec94..542efa759 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -40,6 +40,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
+#include "i915/intel_fbc.h"
 
 /**
  * SUBTEST: fbc
@@ -65,6 +66,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure.");
 
 #define MAX_CONNECTORS 32
+#define WA_FBC_DISABLED "16023588340"
 
 struct drm_info {
 	int fd, debugfs_fd, crtc_id, devid;
@@ -455,7 +457,7 @@ igt_main
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc") {
 		/* FBC disabled: Wa_16023588340 */
-		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
+		igt_skip_on_f(!intel_is_fbc_supported(drm.fd, WA_FBC_DISABLED), "WA has disabled FBC on BMG\n");
 		subtest(&drm, &fbc, false);
 	}
 
@@ -468,7 +470,7 @@ igt_main
 		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc-suspend") {
 		/* FBC disabled: Wa_16023588340 */
-		igt_require_f(!IS_BATTLEMAGE(drm.devid), "FBC isn't supported on BMG\n");
+		igt_skip_on_f(!intel_is_fbc_supported(drm.fd, WA_FBC_DISABLED), "WA has disabled FBC on BMG\n");
 		subtest(&drm, &fbc, true);
 	}
 
-- 
2.34.1

