Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22019C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 09:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0002510ECC6;
	Fri, 14 Jun 2024 09:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eK0Ul8a4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9010B10ECC6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 09:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718358627; x=1749894627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fvdNmMjstcOfv1c3CmXcpYdW7JNPZ3XeSUD8ZFOLMsw=;
 b=eK0Ul8a4s8Dv3KAST9qJvw5qGnyeagz5ir4Wttm925Yieq7S4cQJx2vu
 jmJnYpKRnO0NfEVGqkUn1IBxbi+htP8hXdazKHUqdH4BPiEs5B92GVSIQ
 Jq1j2AehqLJBLgbdM87SYe9SW7m3NAnAt5dNlJIWnr3KR2aGKoJTkAh5X
 St3ej27HCa1bY64b5LVBPSVDW+Kw3Mzrj+AzkwQtwK4fvV+m1/w/hh5Qw
 RvCOhMjRC0zvmnWmeuEbULsxCtyZ8Jm3tL34tdGnx6lSuX+giHaQPiiI9
 haKVtK/BQVqNLJAp8t81ksO99uKw46fJbB6SG9QgpObDSC27Plb5MmZTo g==;
X-CSE-ConnectionGUID: 4jftni7fSXa7eqvFfV00Zw==
X-CSE-MsgGUID: gcvXNjtuQySWi3e4Jt7zIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="14970724"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="14970724"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 02:50:15 -0700
X-CSE-ConnectionGUID: pw9v9liZS8O0bPETTLjgpQ==
X-CSE-MsgGUID: NNaOueRkSqWESFNdZ/nr1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="41129621"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 02:50:14 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinay.belgaumkar@intel.com
Subject: [PATCH i-g-t 1/2] Revert "tests/intel/xe_gt_freq: Fix freq_low_max
 test"
Date: Fri, 14 Jun 2024 15:37:11 +0530
Message-Id: <20240614100712.38276-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614100712.38276-1-badal.nilawar@intel.com>
References: <20240614100712.38276-1-badal.nilawar@intel.com>
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

This reverts commit 1a1e668e774ebe982abc943c3620da7b1a6b1cdf.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_gt_freq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index d2e4d1a09..24333612b 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -277,9 +277,7 @@ static void test_freq_low_max(int fd, int gt_id)
 	rpe = get_freq(fd, gt_id, "rpe");
 
 	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
-
-	if (!xe_is_gt_in_c6(fd, gt_id))
-		igt_assert(get_freq(fd, gt_id, "act") == rpe);
+	igt_assert(get_freq(fd, gt_id, "act") == rpe);
 }
 
 /**
-- 
2.34.1

