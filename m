Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE031C3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 13:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FCA10E277;
	Fri,  9 May 2025 13:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLnhSwDh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2758710EA55
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 13:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746798264; x=1778334264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=raqcU1NLhCNgKHozaeJWPsz1IYOMzIwrTuIjls41NhU=;
 b=GLnhSwDhDSmZn7ilHS1Arxh7uxDI1idUcPotcm29XX/0nJmp0ubS3PrT
 lTU3dG32g0BIYrD43sCCrOmtlma07aXyzu7xV2YqgXIJX1aSSKsP19Opr
 cLLcWZWHRXcAsK9N3hghmA4pGaAXS+vZZbZj09GChVcY1j8XY5hvF9YTX
 DmpIWSC6bHNxxaUyowOVB1ZszW1HF/3toVy94uc7wJDKp+YX62aDQickn
 gqVSrBBkseNdmY7JK4+3+si4YmXqz3thIJS04J4r+XzYb+oVFRmRMJ/CJ
 8q6TUkp4DGxNDYUdsGtQWbK7g0EpaS1jAA263w7IRz8hcgTW+N19w8w7F A==;
X-CSE-ConnectionGUID: AETwJtY8Qs+ctpN8Gujtwg==
X-CSE-MsgGUID: CXbF3EBWQlmFTj0ms/bNtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="51282262"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="51282262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 06:44:24 -0700
X-CSE-ConnectionGUID: 0xrAH/h9TL6nUifb+96qeQ==
X-CSE-MsgGUID: 30oG95O2Sc6oSjZpzGkGfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="167696394"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 06:44:22 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t] intel-ci/xe.blocklist: Fix regex for blocked tests
Date: Fri,  9 May 2025 15:44:17 +0200
Message-ID: <20250509134417.28490-1-kamil.konieczny@linux.intel.com>
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

The regex should use '.*' at the end so, for example, in
generated testlist there should not occur:

igt@template@a
igt@template@b

igt@tools_test@sysfs_l3_parity
igt@tools_test@tools_test

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 541917393..7f4dbcd27 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -37,14 +37,14 @@ igt@xe_live_ktest@xe_bo_shrink
 # Exclude all other non-Xe tests
 ##################################################################
 igt@debugfs.*
-igt@device_reset
-igt@drm_read
+igt@device_reset.*
+igt@drm_read.*
 igt@dumb.*
 igt@prime_.*
-igt@sw_sync
+igt@sw_sync.*
 igt@syncobj_.*
-igt@template
-igt@tools_test
+igt@template.*
+igt@tools_test.*
 ##################################################################
 # KMS: Pipe E to Pipe P are not available on Intel hardware,
 # hence can't use more than 4 displays.
-- 
2.49.0

