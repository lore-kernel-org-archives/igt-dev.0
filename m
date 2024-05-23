Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1DAC25B75
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 09:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A362D10E13B;
	Thu, 23 May 2024 09:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnnoGF3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E974310E103
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716457852; x=1747993852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HshoILE9ijWaWDJ1nXGClFDEJ0pPdCoAT8sR7dOfc/8=;
 b=ZnnoGF3+Jj8OAr/A4nKYPT2/TH0VqTafSUAR/ujaaiSDPTh2c+rneHqb
 OA7L+fG3//k2apU/scqmGAElljEM0bPXhrBjaKItA8SKOP+XqbBew7Hbi
 L3hPoAgJh1RfcBpMK3xYuT1d/+nIBkchbVZeicQRGYwrFKNR/qz+Ym8uF
 veZfMGbZp9x6VeEOW74f1HuW5SP0ELWSefIRuPjI6DQC41R+yyM8uS3WM
 SMyYbLdytZUv7j2oKv3GqggryuNSq2RAf65QM3mjEbzvLpaykewUiH5zE
 8IbQemBlb0VS9b5T5XIwPCRy4tmP1nAa++TtuEvCspJQ3S0fpbsbletWS Q==;
X-CSE-ConnectionGUID: KlQa6oV5SeGyNwH7FHXk0w==
X-CSE-MsgGUID: yk/sc7ppRx2to2cVHYJ1jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="15711463"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="15711463"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 02:50:52 -0700
X-CSE-ConnectionGUID: 56nzVwUdStaBLFA0n4mHcw==
X-CSE-MsgGUID: pWGUJ85VRvaI5n9YIAPy0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="34148324"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 02:50:52 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] fix kms_bw test
Date: Thu, 23 May 2024 15:32:45 +0530
Message-Id: <20240523100248.230989-1-kunal1.joshi@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

first patch converts the test structure to a dynamic subtest format,
reducing skip counts due to missing configurations.
The second patch restricts the test to run only on
physically connected displays, addressing issues with
forced 4K EDID on disconnected connectors.

Kunal Joshi (3):
  tests/kms_bw: convert to dynamic subtest
  tests/kms_bw: allow physically connected only
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist |  5 +-
 tests/kms_bw.c                        | 81 +++++++++++++--------------
 2 files changed, 42 insertions(+), 44 deletions(-)

-- 
2.25.1

