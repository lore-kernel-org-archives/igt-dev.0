Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80040F506CF
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 05:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3530910E098;
	Tue, 17 Mar 2026 05:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvDvUeau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A1710E098
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 05:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773725563; x=1805261563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MQ5gR21cm6xJRQXSPoeQU4LoH20IGDbWVOhRzfr1XCg=;
 b=gvDvUeaune9R1ifm1kuhROuAf1sitRN4J4pI7lUOroIdKMm6Bg1cjsJ7
 ii+CTVTfFwMJENI9ICwBTKRPdwQ+iczAmW0a7jWmtEnzje6dy7m6D0/mw
 nRgb1aDYmCfKEbhl6i9X1IOoUzZAowzhPA06+NQKE0diabz4hUWZCIEwI
 82ofEoddumNqK4qwh99dmFH1mVMDsexSAGW+5S1av0zsFun2ofcbxQiZN
 hXevflUXt6dzPT+vLLZ75/USi2KPTIjwxmS+JSr0/iKE6hUEAH9tAEAya
 mSzvQxic0TwddAP6HhzbIZwiSHoYqoUcwIXuiWjwn1aZ3+rtAndV59g5F w==;
X-CSE-ConnectionGUID: eVm63SyVQNmMUcxLA2JaiQ==
X-CSE-MsgGUID: MPnKS+GsQbu9dvT/y/19ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="100204853"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="100204853"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:32:43 -0700
X-CSE-ConnectionGUID: rqBLWotnQbyENM72Cn/G2g==
X-CSE-MsgGUID: iX3rvb/YTgWQtgbjLlAgIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226829360"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 22:32:41 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 0/2] Use lowest mode for crc subtest
Date: Tue, 17 Mar 2026 11:00:36 +0530
Message-Id: <20260317053038.51570-1-santhosh.reddy.guddati@intel.com>
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

Introduce helpers to get lowest clk and highest clock modes.
Use low clock mode in async flip crc test.

Santhosh Reddy Guddati (2):
  lib/igt_kms: Add lowclk and highclk modes
  tests/kms_async_flips: Use lowest mode for crc subtest

 lib/igt_kms.c           | 36 ++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h           |  2 ++
 tests/kms_async_flips.c |  5 +++--
 3 files changed, 41 insertions(+), 2 deletions(-)

-- 
2.34.1

