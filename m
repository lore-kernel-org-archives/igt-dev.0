Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA61C27C4F
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 01:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7F110E2A8;
	Mon,  1 Jul 2024 01:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fk/XNfhe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B1810E136
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 01:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719798104; x=1751334104;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E2egkMiGr8ulqkVehMQzc5NDOuYWgC2UuHPdtE22F88=;
 b=Fk/XNfhegWXickaYuhIK4KJ99JVnVtKklO2u1ARE/Rja8Tzil2ug3nvO
 MoMDc0wxWePkMdQNVJk3HY1xnBcozab0mWInM7+AegHoRQZIg9hKuT2d6
 Wo68cG//JM4bZZt7r6TI1PzEHoiwpj9mCa3sx4vjZJjw5Rn0oJnRoCTjc
 //g2OAeK25aAxdq0HFjXTJPevPWQsYwPLvHBUi4L4KBdkl9tM78s6MdcK
 lzpnSntOSkkueu4LmUfMqbj2pTSFhrJOacWJsLkncIARsxOl8rffLtaRw
 Xfw3GtBv60EHeIdObcqoYWjkiWb0q3PiR1zyNmgbmHIqVvx4QnvMcEhNf Q==;
X-CSE-ConnectionGUID: PSJh21K2RzmhOUH7OChV1A==
X-CSE-MsgGUID: PvRw9kGJSLS/nk9U0yvumw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="19801043"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="19801043"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 18:41:44 -0700
X-CSE-ConnectionGUID: aShsOOo6QqCjKM9f787p3g==
X-CSE-MsgGUID: V5y+PpidQCOKw/x+xYZffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="46091827"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2024 18:41:43 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v6 00/13] Intel Xe OA IGT's
Date: Sun, 30 Jun 2024 18:41:22 -0700
Message-ID: <20240701014135.2412560-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

The Xe OA lib's and tools have already been merged. This series now
contains the remaining Xe OA IGT's which are yet to be merged.

Ashutosh Dixit (13):
  tests/intel/xe_oa: Add first tests
  tests/intel/xe_oa: Add some negative tests
  tests/intel/xe_oa: Add "oa-formats" subtest
  tests/intel/xe_oa: Add oa exponent tests
  tests/intel/xe_oa: buffer-fill, non-zero-reason, enable-disable
  tests/intel/xe_oa: blocking and polling tests
  tests/intel/xe_oa: OAR/OAC tests
  tests/intel/xe_oa: Exclusive/concurrent access, rc6 and stress open
    close
  tests/intel/xe_oa: add remove OA config tests
  tests/intel/xe_oa: OA buffer mmap tests
  tests/intel/xe_oa: Register whitelisting and MMIO trigger tests
  tests/intel/xe_oa: Drop "xe-ref-count" subtest
  HAX: Add Xe OA tests to xe-fast-feedback.testlist

 lib/xe/xe_oa.h                           |    2 +-
 tests/intel-ci/xe-fast-feedback.testlist |   40 +
 tests/intel/xe_oa.c                      | 4707 ++++++++++++++++++++++
 tests/meson.build                        |    2 +
 4 files changed, 4750 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/xe_oa.c

-- 
2.41.0

