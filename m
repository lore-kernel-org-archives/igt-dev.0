Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E001CD41D46
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 12:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656310E2A1;
	Thu, 14 Nov 2024 12:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6zMR9z8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA9210E2A1
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 12:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731585986; x=1763121986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F+Yt3cdbvQEy1PPD3kqJZ5XG2WH+iBdzpizWEc1j/GM=;
 b=j6zMR9z8MnuQ9zeOOYhuhm+FaZDZ3MR6gvDbcDQZYAWN2zG8wFgTjM/J
 4+vFUyxR2UHjr6idtoKV2aSKRWBWrbH7kJ2qQ8httYbZWq3NgKoN2vuiG
 q2UsYYvAAQCHC99ChBElvs9igCMarNe58Nms/YCHzWoBXax4Qbj/nnTnh
 lDjerwPJoqHWiorO0DD11m3/G9jverCbvl6cGGq7cwokAM1nBTfMlth7u
 G+jOwwOQ7iYy45pmYrOdmiSxxCdP3mOH0haEkqwNU1VT3r0IVJGDcHWll
 Vo6LOl/yWYs1poAH1rjX7RO4WSm8alhpjzqvPw8Y+HBZwWpz/WsEsuKTf g==;
X-CSE-ConnectionGUID: aPt1Y9bRTR+ZqrgwAOEXBA==
X-CSE-MsgGUID: XdvYFQk3ReaE6GWCn4xa+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="19129859"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="19129859"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 04:06:25 -0800
X-CSE-ConnectionGUID: FIveh79QQP+fanYFEoRZcw==
X-CSE-MsgGUID: /44uq0sgTf2YEBw2qCqBFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="87737928"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 04:06:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 0/3] GPGPU fill improvements
Date: Thu, 14 Nov 2024 13:06:13 +0100
Message-Id: <20241114120616.70229-1-zbigniew.kempczynski@intel.com>
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

Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Zbigniew Kempczyński (3):
  tests/xe_gpgpu_fill: Add command line switch to dump the surface
  tests/xe_gpgpu_fill: Add width/height/x/y command line args
  tests/xe_gpgpu_fill: Add offset-16x16 subtest

 tests/intel/xe_gpgpu_fill.c | 107 ++++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 16 deletions(-)

-- 
2.34.1

