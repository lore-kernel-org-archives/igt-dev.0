Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF3FC25B4F
	for <igt-dev@archiver.kernel.org>; Sun, 12 May 2024 15:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5D410E2EE;
	Sun, 12 May 2024 15:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEOZMlC7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0AA10E2C4
 for <igt-dev@lists.freedesktop.org>; Sun, 12 May 2024 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715529075; x=1747065075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lKH/ADCdWiW+/UbNNuKWX0qX98q2m5tIGdyFGxBYwQ8=;
 b=XEOZMlC7ajY2QnPM7ziElCb9xaRUgTdRHjzGevbmxeIo7ojGPJq73mZi
 cmwKp5J58XyjeqfCPKZ87dpMhUi3ovNpmwKFEniNWKIfNi9K1NNjSUOmL
 h6pIFriz8w8nr1Ps5yS28LczGlmCoONxcJh9JPSSHU0EjuexAcSbmU+71
 HR80mYWhR0tq3dYF8V+MzX0qj3v3a+iRO4El7cUbTAxamuYdiU0OflexF
 bbxk3yDVDX0f/FbtLdR/zTiB3Mwo4UCYMrMljzAAhOw6WzfxMX2lJB6IE
 ZY+rSoNwQBQ71lfS/8VtsKHd725V3tBmuVnG+J1p+sRIkEvQnDLNC9PG3 w==;
X-CSE-ConnectionGUID: I1t31b42SZaWCexFSocRVQ==
X-CSE-MsgGUID: ecLcPkrQQQm4ta7MASxarQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22137092"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="22137092"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:51:15 -0700
X-CSE-ConnectionGUID: zlysSi7gRzOTOEfL7JSulA==
X-CSE-MsgGUID: Ave+c7u8QGuqGNPtoOtbqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="34623221"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 08:51:14 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/3] HAX patch do not merge
Date: Sun, 12 May 2024 21:31:58 +0530
Message-Id: <20240512160158.3328235-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240512160158.3328235-1-kunal1.joshi@intel.com>
References: <20240512160158.3328235-1-kunal1.joshi@intel.com>
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

HAX patch do not merge

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..10f54d516 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,9 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_bw@linear-tiling-1920x1080p
+igt@kms_bw@linear-tiling-2560x1440p
+igt@kms_bw@linear-tiling-3840x2160p
+igt@kms_bw@linear-tiling-2160x1440p
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.34.1

