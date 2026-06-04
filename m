Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF46CD6E6E
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 20:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B4D11A2CB;
	Thu,  4 Jun 2026 20:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAzorHwF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E21711A2CA
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 20:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780603331; x=1812139331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KEeojQwWzvArqNHVWz7uuIWDMMcebojzjblCvCK0m0U=;
 b=hAzorHwFZOdEBBoYhdSIup10HoJS3+3dN8kNmv/lC2baleQ1FCkrZyyg
 610nf3RzhucTcRTGays83JnGfWqEFP1ZlljPRYQCy33j213V0RMAQGCOr
 D3g059yf6UN+CGcYaxAcjVQCfkFDPbtRPUxjUUNaOQvH0mdL0FHoSYZhj
 uuKgLBdKOtAcPXMrPgkePHK1z8ZOiC4vidJVQgwN9o/htHs33Fqk3CO/9
 T3GuASxhRdW56nheidCs5nsVFw8vPPgb5QaJbUUJ06l4XpANVE5F24v2D
 +eFK2dhvGtkBG0QF9A8k0y2P058VSMPmz921Ot2ib3KQ9m30WkqLDMlLt g==;
X-CSE-ConnectionGUID: zQRBJUfeQ2KsWSjY4kEqJw==
X-CSE-MsgGUID: BNBsMDGER6uX1vVvQ1xwlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81621998"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="81621998"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 13:02:10 -0700
X-CSE-ConnectionGUID: mO8muxteTYyYvULhoZ5w0A==
X-CSE-MsgGUID: jcEndfFDQKGV4hbQjdk/NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="248573273"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 13:02:08 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v8 0/5] Add dsc+bigjoiner subtest 
Date: Fri,  5 Jun 2026 01:40:57 +0530
Message-Id: <20260604201102.2583200-1-swati2.sharma@intel.com>
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
  tests/intel/kms_dsc: Add force dsc and joiner variants

 tests/intel/kms_dsc.c           | 321 ++++++++++++++++++++++----------
 tests/intel/kms_dsc_helper.c    |  68 +++++++
 tests/intel/kms_dsc_helper.h    |   5 +
 tests/intel/kms_joiner.c        |   8 +-
 tests/intel/kms_joiner_helper.c |  55 ++++++
 tests/intel/kms_joiner_helper.h |   3 +
 tests/meson.build               |  17 +-
 7 files changed, 365 insertions(+), 112 deletions(-)

-- 
2.25.1

