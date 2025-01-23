Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14864C0218C
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 07:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB9510E779;
	Thu, 23 Jan 2025 07:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwG+7Zi2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0051A10E777
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737616886; x=1769152886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mreeBhNVSlnbbYVYPDqCAbrxq/laFQMnVGYTx2VWBeY=;
 b=RwG+7Zi2MlnQbfcXNNmSxYCrGOPu5TDfEHQDG3lByRcLXqDGqqvi+ygi
 QFma3ycsGCSxjN7htFv941M8SiCnzCh8Mi3ib/1kaFGE/OdXV4Ej1Dql0
 9hYy8jfDUNmW5fS0YdTfcoE+cKXVAxR3e/PDejo5HitlS2lEaki/wVDpR
 i7lRfXfQE/mLa50PL/Tzpopaa/zxYg/VT+ulJiFeQf0KaFjNPdlpV9emC
 k/9BL2a7c4p8if5y6+bn6p/ZHnD2Xb9FXJvqZJVR4SbybBOKk8CjRlD9S
 B8VeeGLAfVzsF/Bt241jebuUDjj0IPzT9rv8tm8z80za/fuZVr5NhSCLv w==;
X-CSE-ConnectionGUID: /6DHPVajRIWTMV0MTD1huw==
X-CSE-MsgGUID: YgHln+K+TISCt98/0oL+eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37984906"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="37984906"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 23:21:25 -0800
X-CSE-ConnectionGUID: KyiS9eM5S4e8acSljoy4iw==
X-CSE-MsgGUID: CWObTOhpTfCVPJ8DpDJ51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111392549"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:21:24 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] add dsc-fallback test
Date: Thu, 23 Jan 2025 13:06:58 +0530
Message-Id: <20250123073701.3113428-1-kunal1.joshi@intel.com>
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

Add test to check we fallback to dsc when current
link params cannot accomadate bw required by
the current mode.

Kunal Joshi (3):
  tests/intel/kms_mst_helper: Add helper for MST-related functions
  tests/intel/kms_dp_linktrain_fallback: add dsc-fallback test
  HAX: Do not merge

 tests/intel-ci/fast-feedback.testlist    |   3 +-
 tests/intel-ci/xe-fast-feedback.testlist |   3 +-
 tests/intel/kms_dp_linktrain_fallback.c  | 380 +++++++++++++++++++----
 tests/meson.build                        |   3 +
 4 files changed, 319 insertions(+), 70 deletions(-)

-- 
2.25.1

