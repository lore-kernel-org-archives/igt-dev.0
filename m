Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6C6C54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 16:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96DC11235C;
	Fri, 15 Mar 2024 16:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7p53RaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00A311235C
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 16:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710520032; x=1742056032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F+hV2DxFSBUWbG0bHkG2S30bSUf2oJ7hZeQXQRlBFHM=;
 b=C7p53RaQvIxhvDcgWN/yC/XwZfceTZLjaT5iVE28trvgcChG7STEhoc9
 rMK6sYm7VJMlBiuBjvyXbWnYxy/6lAxdKBJiKgzgSi126KKtUo77iq2C6
 J1Qx3tRSoueviEB1JZO93dpw7EXXptZJlGprUJWvj0x8PYdjXUX37RGrL
 hks4SY/SSEfk33ZIqDOcdCgIq4Qm8/6EIuCJ0PXE2dEVEH1AMWcmn8E1D
 4QK2YC5mjEKRVNbJwBmDaGOo2VDkjnh54bc+rm3WQwKQInTlMHKr27Quh
 QoO+aT5duK9GYu071DmpmnB3X3bNQ6VKlxXyxL2DHr8EEY8pgOiuxDi1m Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5607144"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5607144"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 09:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="12791509"
Received: from unknown (HELO mwauld-mobl1.intel.com) ([10.245.244.251])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 09:27:10 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t] tests/intel/xe_ccs: fix bo size for ccs
Date: Fri, 15 Mar 2024 16:27:01 +0000
Message-ID: <20240315162701.309560-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Don't just assume it will always fit into the default page size. When
passing in custom -W or -H the raw CCS size could be larger than BO,
leading to assertions.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/xe_ccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index d6f5408a7..aec83a057 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -108,7 +108,7 @@ static void surf_copy(int xe,
 	const uint32_t bpp = 32;
 	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
 	uint64_t bb_size, ccssize = mid->size / CCS_RATIO(xe);
-	uint64_t ccs_bo_size = xe_get_default_alignment(xe);
+	uint64_t ccs_bo_size = ALIGN(ccssize, xe_get_default_alignment(xe));
 	uint32_t *ccscopy;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(xe);
 	uint32_t sysmem = system_memory(xe);
-- 
2.44.0

