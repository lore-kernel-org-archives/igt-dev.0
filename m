Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0EEE65D2C
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 07:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B653C10E049;
	Fri, 22 Nov 2024 07:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNUbxtIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580EE10E049
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 07:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732260554; x=1763796554;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HQm1uC7ia0ZAnlJChP2kWzjofL1F25Ps/hjhM+K3mWM=;
 b=fNUbxtIgiObjbsFQHFO5DFYMs668ahOylbnbTRyFMSRYvzOHM4PKsBBG
 QB1Tc6Eogs/FVgG4DKrU+ceilFdNZipr2UFMkmoZclQBfBbUbpM1tzlGf
 HByOOa7/kCC5NegtS5sdvmVGfmarqw/To2aVlNgH/dv/78dFw2ENvjr1F
 /q7w+2pSI5Z/03BidBDfUFTcDa17TCCaiqWMzCfhg6YwtbUwiwBZnVWQR
 DEyrjSFxsRitSzMRJaUVm0uCVQlqLO2MQ6lY0zvIurMlaYYTlk17PS0//
 TEb+yTbIDL4ejLjcgR9My0qYssTW7zgR3DetVAAaDMrvfgfvbiptitk73 A==;
X-CSE-ConnectionGUID: 0xFmMS2XStqvD3LTBqWPJg==
X-CSE-MsgGUID: AiYVFlvOSVesbQKbSZbvPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36070071"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="36070071"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:29:14 -0800
X-CSE-ConnectionGUID: DCAqBQagQ6mN0QZe6s4v7g==
X-CSE-MsgGUID: rhYNdbDXQOuImuo/hmgmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90916734"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:29:13 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v6 0/6] GPGPU fill improvements
Date: Fri, 22 Nov 2024 08:28:58 +0100
Message-Id: <20241122072904.164247-1-zbigniew.kempczynski@intel.com>
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

Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Zbigniew Kempczyński (6):
  tests/xe_gpgpu_fill: Add command line switch to dump the surface
  tests/xe_gpgpu_fill: Add width/height/x/y command line args
  tests/xe_gpgpu_fill: Add offset-16x16 subtest
  tests/gem_gpgpu_fill: Add command line switch to dump the surface
  tests/gem_gpgpu_fill: Add width/height/x/y command line args
  tests/gem_gpgpu_fill: Add offset-16x16 subtest

 tests/intel/gem_gpgpu_fill.c | 105 +++++++++++++++++++++++++++++-----
 tests/intel/xe_gpgpu_fill.c  | 107 +++++++++++++++++++++++++++++------
 2 files changed, 181 insertions(+), 31 deletions(-)

-- 
2.34.1

