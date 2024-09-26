Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731E6CDE00B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 14:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A5410EB6C;
	Thu, 26 Sep 2024 14:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYJHjoB/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A4210EB64
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727359768; x=1758895768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TtcQA6gwXV1i357KCJMqFBmkUkPwQe90Zm6Kfst/4i0=;
 b=QYJHjoB/aAYXrgDRGgi1L4+/J8G0jWMSe5onFnyRxJF/j2dEHbj/1Xuh
 +DuPFGZ3kfQah9PI4uEptsJVDExmoq4p6fggqJSPITam4QhIpvnLvPheh
 1xz8CEZZJ/eYsF91UtHDLgbm1Ll3sYDA8g4MEmaUsaj5xQ50roCxTFbKT
 eT7Z2J1Hhqd9rlHGVwCx0wC4iawe8gFUamrYfRmCUUf+QHyj8ioimKs3Q
 npRiik8LEueWZ3blP63l+synfPbMFjDIss7Z1cPA7r0dhDpKptutSd6RL
 1EOBId1UdMRT4ikdWfSHoM4AOkYym8Ls7bnkORuW1IU30itrsZaB/BUiQ Q==;
X-CSE-ConnectionGUID: eLs4k6azQC+A6g7et5+hUg==
X-CSE-MsgGUID: VAKoKww/Qw+dxalgevepOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="30251794"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="30251794"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:09:15 -0700
X-CSE-ConnectionGUID: dMLNfnYZQkaUcZEYiavLSA==
X-CSE-MsgGUID: 5SGRS3VJTrmyVvkvyzArLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76529085"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 07:09:13 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/2] Async flip with atomic commit
Date: Thu, 26 Sep 2024 19:38:34 +0530
Message-Id: <20240926140836.939153-1-santhosh.reddy.guddati@intel.com>
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

This patch introduces new subtests to validate async flips with atomic
path

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: subtests to validate async flips on atomic path
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 183 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 289 +----------------------
 tests/kms_async_flips.c                  | 143 +++++++++--
 3 files changed, 148 insertions(+), 467 deletions(-)

-- 
2.34.1

