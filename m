Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC7BC47DDF
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 14:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C5710E814;
	Tue, 23 Jan 2024 14:09:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A33510E812
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706018945; x=1737554945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ssbvWRafQ/dU/mPoeGCj9tzc5ScbH8d/zcwaMiYNwdY=;
 b=ktUWNpAyW8WOmzVRp0nnRwThKp90sCxmXlCxn3G+KNjLLdfWnsJA1Wtf
 y7wVA24T1ak4Zn3sGcvXExyWFG+pYUmhb8b1pKJINszpatYLpoBjJhAPQ
 Y2z18fSGIGAbwnhCljDegNTpoSqAcAWpr9iAEQ0OcwqkCoWJl5muBdv4T
 nspjOuIfQ2zitYxJodH2gvVU9bFFWRHOqKPBcI398t0aQz4BR0yC1pgHn
 XM8RF/sK7+Yf8fsZzk8SUV1Ac7BP5vxkaxCgQh38LnGFLdCFA+R3ahT2i
 QHYxUtgvQfjogBGvcyf8+mAqwvfQi+SPjsGv+xNCgTV17VhEvzlun+Apk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="15047224"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="15047224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 06:09:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1558998"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 06:09:03 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] check modparam before enabling psr mode
Date: Tue, 23 Jan 2024 19:48:33 +0530
Message-Id: <20240123141835.1211107-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

with i915.enable_psr modparam, one can enable required psr version

i915.enable_psr = 0 PSR_1 and PSR_2 tests should skip
i915.enable_psr = 1 PSR_1 tests should run but PSR_2 tests should skip
i915.enable_psr = 2 PSR_1 and PSR_2 tests should run

fix test to check modparam before enabling through psr_debug debugfs

Kunal Joshi (2):
  lib/igt_psr: add helper to check of given psr mode can be enabled
  tests/intel/kms_psr: enable given psr mode only after checking
    enable_psr modparam

 lib/igt_psr.c         | 23 +++++++++++++++++++++++
 lib/igt_psr.h         |  1 +
 tests/intel/kms_psr.c | 12 ++++++++++++
 3 files changed, 36 insertions(+)

-- 
2.25.1

