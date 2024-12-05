Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66988E7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 12:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A5C10EE2E;
	Thu,  5 Dec 2024 12:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4iQ8Usw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB3210EE2E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733401616; x=1764937616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I5tBmshP4wOXMSJpLcO1R4z8liIyOD5Z4aHo5v1Tirk=;
 b=E4iQ8UswLBfdC6gAztwymjGHyHFxzNXVpoIq3f3B4LCBfYGHCdzDrcQX
 IRCeEwxTl4usznzgcavTIwJy+Z3ePZD5m1Y6nAt1xiKoK15gRUa0OucEK
 3IvwpwKVtxbAZF5nbmcOcCBfTLsz+XmA2207RkN0F62l3pLPMaRUIabMU
 FxHzLUhCB2Yd329DN2vq4lXjNVs8ZbvrZuP27bPgoETNexX/MuEpDDpxT
 n6g+MnN8vnA5O9hGNLIHYYvGrho39dJg8O2LriGEZ0Inq2kUcuj5Pi8/1
 CyIlJFhFJoWh5tAcW9zeX1CiCkXE1/YNChtlr3aAJWpItQ3zljY6Cp1AW g==;
X-CSE-ConnectionGUID: V9kcx/5qRuCgMPSDh4oigQ==
X-CSE-MsgGUID: vZyjYTW7Qp2kKQyQc+MUqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33842365"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33842365"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 04:26:55 -0800
X-CSE-ConnectionGUID: Myy0AOVLT2yJCh7kVidHiA==
X-CSE-MsgGUID: C8gABjc1SjOpn3n27llhIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99121133"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 04:26:54 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Update skip messages in scaling modes
Date: Thu,  5 Dec 2024 17:55:26 +0530
Message-ID: <20241205122528.3761118-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

These changes improve the clarity of test logs, making it easier
to understand why certain tests are skipped.

Naladala Ramanaidu (2):
  tests/kms_scaling_modes: Add informative messages for skipped scaling
    mode tests
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 171 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 282 +----------------------
 tests/kms_scaling_modes.c                |   5 +-
 3 files changed, 12 insertions(+), 446 deletions(-)

-- 
2.43.0

