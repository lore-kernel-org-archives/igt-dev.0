Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9B0C54791
	for <igt-dev@archiver.kernel.org>; Sun, 10 Mar 2024 14:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978C810E05C;
	Sun, 10 Mar 2024 14:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ameQbpO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3344910E05C
 for <igt-dev@lists.freedesktop.org>; Sun, 10 Mar 2024 14:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710080214; x=1741616214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QFDLDW5KIMUv23f/FPxMuCn1gBIQ8TahOPUfU+1PZTQ=;
 b=ameQbpO1zwMgQuisKRQf9KKU0geQeV1jl4/IqRZL7Sjs7ZfuwFWcRSZM
 JllSy5g4eg074ZICTtdYHTvAooaWAqSW3/rNNwnKm0Nwp4KOFkXjoCc1h
 jCylZMc3v06sCzOuhunbtvOfVaxigOCf1Se4D+8UftFzF5dJDnQfHyq4S
 Z1wNeGXUUEK62xHGKIIHHoqgaWB2N/+4WV6KH9Q15Jb0du94mTYC4RdG/
 xgle0b+57j+Ag/fFeEmDLLAZgcdwki/zGPKTfTjl7HRuFXgizQdTFmQR8
 ZD+G04KLhKXOo6L+1kYUEk7qV8CFKKd7uTVQclkuA6DLYrffRAstTbKoY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="4916450"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="4916450"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 07:16:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; d="scan'208";a="11324229"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 07:16:52 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/4] revamp big joiner test
Date: Sun, 10 Mar 2024 19:57:17 +0530
Message-Id: <20240310142721.874315-1-kunal1.joshi@intel.com>
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

modify test to support multiple big joiner outputs
simultaneously, support for ignoring fused pipes and
addition of subtests for testing force joiner support for
which is added by below in kmd.

drm/i915: Add bigjoiner force enable option to debugfs

Kunal Joshi (4):
  lib/igt_kms: move bigjoiner_mode_found to lib
  tests/intel/kms_big_joiner: revamp bigjoiner
  lib/igt_kms: add helper to enable/disable force joiner
  tests/intel/kms_big_joiner: add tests for force joiner

 lib/igt_kms.c                |  84 +++++++
 lib/igt_kms.h                |   4 +
 tests/intel/kms_big_joiner.c | 467 +++++++++++++++++++----------------
 3 files changed, 346 insertions(+), 209 deletions(-)

-- 
2.34.1

