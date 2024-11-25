Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F349D3B7EF
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 08:23:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF4810E12A;
	Mon, 25 Nov 2024 08:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7dpWH4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7E710E12A
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732522986; x=1764058986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mxaoJ4d95ZUgNlJqgl4tBU0B0PcNfqKom6G6NLIrvD0=;
 b=S7dpWH4Pcu8rW9Jx2xU6Fet+etWUV+5vf2hpAupLlDj85K3/ug55grpS
 ou2zkqvihHRhuaWaPV8DQ+PyOGsfWY8TBNKkrMBriStJUCVsVENKcbg6A
 KwQ9FfPnexNkux56DjQJdthRlE2ULEJJyNU2TsUq+u3OzIuhBQfjGN6U1
 yXG7VasJAYs4s9AzP6g+GRUDj+5MBDsnTJeLhk9uJcspZReyjPdC2M70y
 0XcR0tK/clyCHippRxKrQDxxwwU22t/XuHwqFAf7wZPpXaPlCIKVG3zG6
 1XYB+x8Jxkkri9OL2Mo0dvtVpV8VVPJ8oQGGnMpG9WXrppoeou5SY91gi w==;
X-CSE-ConnectionGUID: LgI7aHk9SnqX+WiEGuARNA==
X-CSE-MsgGUID: 40vAIY/eSgeMcQmRZXzLxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="20206649"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="20206649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 00:23:05 -0800
X-CSE-ConnectionGUID: Pfe3ylDiTG6BpBB39flTFQ==
X-CSE-MsgGUID: ECiT++hgS0a1Yx/8PohJPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="96118801"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 00:23:03 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v7 0/6] GPGPU fill improvements
Date: Mon, 25 Nov 2024 09:22:52 +0100
Message-Id: <20241125082258.74889-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Series adds some improvements helpful for adding implementation for
new platforms.

v4 (v2-v3 were retests) - add gem_gpgpu_fill@offset-16x16 + some addons
v6 (v5 was retest) - retrieve incidentally removed fixture part (Dominik)
v7 - fix x/y/width/height usage (catched by CI)

Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Zbigniew Kempczyński (6):
  tests/xe_gpgpu_fill: Add command line switch to dump the surface
  tests/xe_gpgpu_fill: Add width/height/x/y command line args
  tests/xe_gpgpu_fill: Add offset-16x16 subtest
  tests/gem_gpgpu_fill: Add command line switch to dump the surface
  tests/gem_gpgpu_fill: Add width/height/x/y command line args
  tests/gem_gpgpu_fill: Add offset-16x16 subtest

 tests/intel/gem_gpgpu_fill.c | 107 +++++++++++++++++++++++++++++------
 tests/intel/xe_gpgpu_fill.c  | 107 +++++++++++++++++++++++++++++------
 2 files changed, 182 insertions(+), 32 deletions(-)

-- 
2.34.1

