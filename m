Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539DACD6E49
	for <igt-dev@archiver.kernel.org>; Sat, 30 May 2026 19:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAC8112989;
	Sat, 30 May 2026 19:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwbWR0rf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDAF112989
 for <igt-dev@lists.freedesktop.org>; Sat, 30 May 2026 19:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780169275; x=1811705275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uQOtYln+hXx1G7HZQ115NqZoBh2EcrhafnL9Pw1g91k=;
 b=VwbWR0rf6L77qIWrGBvsDHZNiRSWbMb0iK2pv9xkF2LpH9Cqto+IiX6Y
 j7tOw7NEp8uHAr2OFykwKT+qKug79nKZO/OmWL9IbNo0pE1rw1i+gV87D
 sSMJcUpN3/wJUXquY1EF2R8jLGMb70kYibUQlT4Bf2Cnhm1S0egftQ26Y
 Tz0uRdgW6LzqUQmb5NWfH3NCRMwqzHA7OIJaToxKGusj8i/oG1afNUZCU
 S4dKUaBTcitOG33V3bija3cqbVXTEhM6I0SHylNUxATes2wa6ZKB1k9EH
 MkyFFNtSpr4S74nJfTiJ9VFsvkSFHd5BDn42sM8ZKS5Jr8vxgwaeAPI4j Q==;
X-CSE-ConnectionGUID: xTk2TH2WT0SpzvABTtO3Zg==
X-CSE-MsgGUID: H/xmvX1cQeKUFhKHgWLeZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="103657572"
X-IronPort-AV: E=Sophos;i="6.24,178,1774335600"; d="scan'208";a="103657572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2026 12:27:54 -0700
X-CSE-ConnectionGUID: jLUGA3GeSyGdiCLbgj/AWw==
X-CSE-MsgGUID: QAbT8KafSEeNn43sPOEJJw==
X-ExtLoop1: 1
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 12:27:53 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v7 0/5] Add dsc+bigjoiner subtest
Date: Sun, 31 May 2026 01:06:35 +0530
Message-Id: <20260530193640.2551688-1-swati2.sharma@intel.com>
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

This series adds big-joiner and ultra-joiner variants for all DSC
subtests in kms_dsc, along with the necessary helper infrastructure.

The joiner force logic works as follows:
- Non-joiner tests use igt_get_non_joiner_mode() to pick a mode that
  does not require joiner.
- Joiner tests use the highest-clock mode. If the mode naturally
  triggers the desired joiner type (clock > max_dotclock), no force
  is applied. If not, joiner is forced via debugfs.
- Cleanup resets joiner force to DEFAULT so the kernel exposes all
  modes naturally for subsequent subtests.

Patch breakdown:
1. Store valid DSC outputs in an array for reuse across pipe iterations
2. Add igt_get_joined_pipes_name() helper to kms_joiner_helper
3. Add igt_is_joiner_supported_by_source() helper
4. Add check_dsc_joiner_constraints() to kms_dsc_helper
5. Add DSC with joiner test cases using the above infrastructure

Swati Sharma (5):
  tests/intel/kms_dsc: Store valid DSC outputs
  tests/intel/kms_joiner_helper: Add igt_get_joined_pipes_name()
  tests/kms_joiner_helper: Add igt_is_joiner_supported_by_source()
  tests/intel/kms_dsc_helper: Add helper func()
  tests/intel/kms_dsc: Add DSC with joiner test cases

 tests/intel/kms_dsc.c           | 318 ++++++++++++++++++++++----------
 tests/intel/kms_dsc_helper.c    |  67 +++++++
 tests/intel/kms_dsc_helper.h    |   5 +
 tests/intel/kms_joiner.c        |   8 +-
 tests/intel/kms_joiner_helper.c |  55 ++++++
 tests/intel/kms_joiner_helper.h |   3 +
 tests/meson.build               |  17 +-
 7 files changed, 361 insertions(+), 112 deletions(-)

-- 
2.25.1

