Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1652C282D0
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 00:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59ECD10E0CF;
	Wed,  5 Mar 2025 00:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vy8c73U+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD9510E0CF
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 00:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741136241; x=1772672241;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yF7tWpfGZqYrwumig3WFmv4QkYQNoP2vciP42fFS2dw=;
 b=Vy8c73U+WzxjHhC0VSmGY9QxYMHizLu/cwlrpQpc1UOCfzItNkvXmZtk
 7Bgcellk3xBTSzRg4LCIuuVbB9b7US/gNqBkjlFaSmaym64JwvA9Wk2CW
 G6a2WI6TXmqjB/QftxA/hPRPpTCzMRqcGzoWL1Ud8h4IUBTe1l8JYhR/R
 O0urAjxynFa9OYNJE7rvKi3STaEus/SwBcDtyREHpd7J4DxsXE1Opl0w+
 emUmbYAUGNPhcm4jyPUrxnL/D+fUYC6Syg3uD/i5QhFdjZM+FMvG+OlYt
 Js04wNW09C2+i4kO5A5+AZ29m/X+AYJGnBZ7u2bXPCNwRPUIs+VXUCv24 Q==;
X-CSE-ConnectionGUID: a8TO6jPnT7KE0zwWeEiNog==
X-CSE-MsgGUID: TsxB8R4PS725pogU/Fh1RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44889460"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; d="scan'208";a="44889460"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 16:57:20 -0800
X-CSE-ConnectionGUID: IgPwLASLQHWFoY/Qmjbs0Q==
X-CSE-MsgGUID: bm3h0H/6TK62r5Z4o3aFew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119043937"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 16:57:20 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 0/2] Modify some OA tests for simulation
Date: Tue,  4 Mar 2025 16:57:14 -0800
Message-Id: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
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

Modify some OA tests to account for slow simulation execution.

Most tests just end up using faster OA exponents. Some tests that are
heavily dependent on timing are skipped. For other tests the scope is
reduced to run them in reasonable time.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  tests/intel/xe_oa: Do not discard single reports in oa-formats
  tests/intel/xe_oa: Enable OA tests for simulation

 tests/intel/xe_oa.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

-- 
2.45.2

