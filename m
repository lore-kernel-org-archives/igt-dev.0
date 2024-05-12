Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66BFC25B4F
	for <igt-dev@archiver.kernel.org>; Sun, 12 May 2024 15:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CBC10E28D;
	Sun, 12 May 2024 15:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYd58G/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CF110E28D
 for <igt-dev@lists.freedesktop.org>; Sun, 12 May 2024 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715529072; x=1747065072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H9CKVnewyzPTf45tlkBjUaYrvgE1Xy2aoQNWZ1lBSeA=;
 b=HYd58G/+J/gonRwPEwCTotATNElaq+6NRQmBtoGiuaKSrMgFJdIHikkf
 Z4wbzhfEMd1fD9g3ezaItY8iT50gDndBIhsrNgOMSHEiRRKJVdKjOm4js
 TQaxDQW25sKmyCeMBCipRVPpIvk+8AtfoYUDXwh222qlbmg/HsRth9/RJ
 6vtO5wtLNnMMIo8WicdELu5AhsaMMFZt45wkET5WCYH1AB2jniYg+Od0X
 Iw1j9iRMldv0SWj45ZPVJyRbGK3n0y6dX7RmM9ir2dhVLvtnOZqf7NC+u
 D1j4d1t0ayqu6uFrE5mfNu8sXlzIA7USpJ4B35dszhnb5C4KNDih+7Apr w==;
X-CSE-ConnectionGUID: 6Lgyr9j3SbCLHrJfbHsGiA==
X-CSE-MsgGUID: z/XOY0VuRBexPW7HsrMpZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22137084"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="22137084"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:51:11 -0700
X-CSE-ConnectionGUID: m+3+pSwyR4C1A8qvcq4gtw==
X-CSE-MsgGUID: RY6sbnEhTMW4Oesrt5xCGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="34623206"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 08:51:10 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/3] fix kms_be test
Date: Sun, 12 May 2024 21:31:55 +0530
Message-Id: <20240512160158.3328235-1-kunal1.joshi@intel.com>
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
2.34.1

