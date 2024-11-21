Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389DBD6ED17
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:33:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E8A10E2FD;
	Thu, 21 Nov 2024 12:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEVfRd7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCC010E2FD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192394; x=1763728394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wqQinYv4oXpBx4zxvfxxxND7jqYWWZGFQwUr033GUeA=;
 b=kEVfRd7wq1xOKK57ZPZ5DNCGHKdiXmdubnzMlJY8JVRPoRdtKT4ot3Yv
 fA7eLKDESC896WISM6uOc6B94MVdFwUwn+T2C/dh3U92Q0bhK0vlTafYo
 +P9hCy9PjRqtM5hEHs4WFK0V4Xxh2YdS+n3qZDne+CzXuPzWqdSVJIMiL
 Yoa3nUTTWiFukCiQWylxupB16UDNzRBalG7cCTZRVakeEfmm5x0OxJQQT
 lx94UDMzRtC5zYs2j8zxXGRdrMHbSgwO0IUz/d1jVRx1g/xv1fGa+Lsjd
 spwX3Gd7khhRfyVwO2ulR/mlKTtn1rKWIsxA7oEWokf0ldWq4rq5QuzKk Q==;
X-CSE-ConnectionGUID: lZCgPHWaRbakiZNE/yKLzQ==
X-CSE-MsgGUID: uNpy4ucDQzKlTNgopHn2Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32152165"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32152165"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:14 -0800
X-CSE-ConnectionGUID: 7LJx/bWeTOC9xDnPPQUyhw==
X-CSE-MsgGUID: v7TixDlSRCiEvbnMv4xfgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="95043544"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:12 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v4 0/6] GPGPU fill improvements
Date: Thu, 21 Nov 2024 13:33:02 +0100
Message-Id: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
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

Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Zbigniew Kempczyński (6):
  tests/xe_gpgpu_fill: Add command line switch to dump the surface
  tests/xe_gpgpu_fill: Add width/height/x/y command line args
  tests/xe_gpgpu_fill: Add offset-16x16 subtest
  tests/gem_gpgpu_fill: Add command line switch to dump the surface
  tests/gem_gpgpu_fill: Add width/height/x/y command line args
  tests/gem_gpgpu_fill: Add offset-16x16 subtest

 tests/intel/gem_gpgpu_fill.c | 108 +++++++++++++++++++++++++++++------
 tests/intel/xe_gpgpu_fill.c  | 107 ++++++++++++++++++++++++++++------
 2 files changed, 182 insertions(+), 33 deletions(-)

-- 
2.34.1

