Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5361FE65D25
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 05:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E78D10E1D1;
	Fri, 22 Nov 2024 05:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lc9GpEcH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C602810E1D1
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 05:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732253604; x=1763789604;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jgWDYzr+gAOEnLgL5bUCy/TydI8AS5Ap4mmIRs2c0LA=;
 b=Lc9GpEcH/s9iBfBELW6l0edGFpI5yqMDizqcsmJi8sh5pGKmMi0G9KZS
 EBVhWZbwmeKsjdKIqySWS0r9+pMFjskpSF5Dt9OhL9I4TCur3dy6Od30d
 T23/B0CG+i3NmHPQsMB8Or1dEc4sntlGY89s6nbl3EdjAAjbDkruGia5k
 6LkJjJ9omdYIY5rgshyJ35K78eJ5IINPuSCpxWYECWBf6tq5y+AmCeymU
 SZ2e45cOXnacu+eQJlXeYDrsujHsu0WrYySFSHrtdK/4Y27Qi12qDdhLe
 5lFQOVshERlYvoSLftOlWAwtjFzkClULWeLKUD6BXccloXbEoavwCZ/wr g==;
X-CSE-ConnectionGUID: R5HL35bbQGugIvxcwqTaxA==
X-CSE-MsgGUID: zbBPhtBMRlCwSLKwKyT04g==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43040397"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="43040397"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 21:33:23 -0800
X-CSE-ConnectionGUID: 3khzIVgUTXiulfGo5RX4xg==
X-CSE-MsgGUID: UUKm5sTlRuCiwA3LyjWp7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="113753606"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2024 21:33:21 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/2] tests/intel/kms_big_fb: Intel display version 20
 onwards doesn't do hflip with tile4
Date: Fri, 22 Nov 2024 11:03:58 +0530
Message-Id: <20241122053400.1931176-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

Intel display version 20 onwards, Tile4 no longer can be used with
horizontal flip.

Bspec: 69853

v2: Fix the shadowing global declaration warn (Jeevan)

Pranay Samala (2):
  tests/intel/kms_big_fb: Intel display version 20 onwards doesn't do
    hflip with tile4
  HAX: Do not merge

 tests/intel-ci/fast-feedback.testlist    |  5 +++++
 tests/intel-ci/xe-fast-feedback.testlist |  5 +++++
 tests/intel/kms_big_fb.c                 | 15 +++++++++++++++
 3 files changed, 25 insertions(+)

-- 
2.34.1

