Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290C1C7EE31
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 09:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFD610E991;
	Fri, 27 Jun 2025 09:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drfieEsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C98010E991
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 09:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751015496; x=1782551496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=87U1jAmFttv4JzfT0M6sz2ct0mluziqqmdzMEvOwWzY=;
 b=drfieEsTMBYb76Y4UlUOUv29O4tm6vBNiMuUmGFBqOIZVHYa09U4U1gM
 qoRMIkGHw6zRF8TGiAZRcOtpI+OTyxHhyrKQ7ibfuLcJ9vrN38KdZ0PBS
 WEylbdEtvEle6TaXglWCMp3Zj9nkp13X+2ULucMHs601g7CSaZy08GwOL
 DJJQpKs658TR6rPLmjWiSyZ0hLV4CJsrQx7nBWv5YMylfpmmC2XkwUAPc
 eM/xKi//0L+RpawPc2nZ3R449dBq0lgmMKaybVCQ014eRfoqCNp7r74AJ
 sRwi40zKZc//LIs3PopbiE8SWHvn8woHzmkvt77j7otpf/et7gk8reAb/ A==;
X-CSE-ConnectionGUID: C3G2VtrwSGG//9sQr6ZRKg==
X-CSE-MsgGUID: Jk4S3NGoSFm26aTbHyH+8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53449939"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53449939"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:11:35 -0700
X-CSE-ConnectionGUID: VE/3JGEnQYKSfv73aX4xhA==
X-CSE-MsgGUID: 5QyTUJVwQrSy5k2tTbusCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="189950501"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 02:11:34 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flips: Fix compilation warning
Date: Fri, 27 Jun 2025 11:11:28 +0200
Message-ID: <20250627091128.64951-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

Fix compiler warning:

Compiling C object tests/kms_async_flips.p/kms_async_flips.c.o
../tests/kms_async_flips.c: In function 'skip_async_format_mod':
../tests/kms_async_flips.c:874:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
  874 |         struct format_mod rf = {
      |         ^~~~~~

Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Fixes: aa4b2e0b81d2 ("tests/kms_async_flips: Add test for all async format modifiers")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_async_flips.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index dc3a0f92a..97f90733d 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -860,6 +860,8 @@ static bool skip_async_format_mod(data_t *data,
 			    uint32_t format, uint64_t modifier,
 			    struct igt_vec *tested_formats)
 {
+	struct format_mod rf;
+
 	/* igt doesn't know how to sw generate UBWC: */
 	if (is_msm_device(data->drm_fd) &&
 	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
@@ -871,10 +873,8 @@ static bool skip_async_format_mod(data_t *data,
 		return true;
 
 	/* test each format "class" only once in non-extended tests */
-	struct format_mod rf = {
-		.format = igt_reduce_format(format),
-		.modifier = modifier,
-	};
+	rf.format = igt_reduce_format(format);
+	rf.modifier = modifier;
 
 	if (igt_vec_index(tested_formats, &rf) >= 0)
 		return true;
-- 
2.49.0

