Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC474CFC26E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 12:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B1210E030;
	Fri, 21 Nov 2025 12:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRV93yhd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CAB89F49
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763727883; x=1795263883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dxwxN9nG2lZ4Mi0HK7k7UFIejnQ3XFt0QMhX5tPfq+w=;
 b=WRV93yhdvaaazZ8bXoPxwGpNAlWPTp8DWIW3MdMGM2jpyvticaVJsl5C
 5jJEDU9iJv/faShcv/WLoq0c5nga7S0FDGwFOeYfUgAbFk+rme+JLE4AP
 sTEx9MS8YCUQrN3ad3K2P3o0/5zPz99eVryZFqCO8aiPkudOV25q36nPI
 RYxUJqTV4863QfQgWuLzz07o/pC0Zr2xlxQjfBHQzwrx5gts0ERRSjOvi
 9Kw6Ki/N7cY4B+erBMh45w3RdtQb6wCNxwAoVwE4nosMTpbT5aRafN4Gp
 PnMV9mu6SnGx/6hgvjg3SzapPZuYAWkowwessgZclVnZneLy/RwBLkSxl w==;
X-CSE-ConnectionGUID: CDbJs3g2Tk+ATnEdT5gKEQ==
X-CSE-MsgGUID: Bv7yL3duTiy3qn6SCs213w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77289565"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="77289565"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 04:24:43 -0800
X-CSE-ConnectionGUID: dbOjJV5IRRyw70uT4LMYnw==
X-CSE-MsgGUID: fBTxnmLXRmmdHGg3qoP49w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="215047337"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:24:42 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/6] intel-ci: Add sharpness filter chamelium test
Date: Fri, 21 Nov 2025 18:01:29 +0530
Message-Id: <20251121123134.1099006-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121123134.1099006-1-swati2.sharma@intel.com>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
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

Add the Chamelium-based test for validating the display engine
sharpness filter.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/i915.chamelium-only.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
index 22e12108d..99d2f2409 100644
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ b/tests/intel-ci/i915.chamelium-only.testlist
@@ -65,4 +65,5 @@ igt@kms_chamelium_hpd@vga-hpd-fast
 igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
 igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@vga-hpd-without-ddc
+igt@kms_chamelium_sharpness_filter@filter-basic
 igt@kms_tiled_display@basic-test-pattern-with-chamelium
-- 
2.25.1

