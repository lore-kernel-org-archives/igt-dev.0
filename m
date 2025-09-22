Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04D5CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 04:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1438D10E3A0;
	Mon, 22 Sep 2025 04:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AaSgU6cR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FC810E3A0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 04:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758516189; x=1790052189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1eJQ0IkbNxh6BEUsgz/z3kej6wiEyOO1GrGaw2iY0IE=;
 b=AaSgU6cRlfI5+vwRfXn+ImEXQcAZS2GYWaIbLkYBlPR1Cbx2qGsBLIhX
 Jv6ZxLLKF+3Jz5mLPXc6V+4Yv8PNbXUgP/EMqwdStoD7JfixXF4VgDwGk
 2A/kT2uzVaX0VdksZGbdFtQAMKzzan0m6GLllgS7at0htszID5lvq5n7S
 4Tgj4mi1DfTJ85ByZ14ir4sDK8B2yIebiGcS4AJTR5iQjQVBWNcMBlvQZ
 UU8MjSMSLP9DuCnWYk4+lCErIIVI8AU1t+ITLlkZB/FncezBGhZU9o5fj
 eCF0xs/xldD7izU1YTwC4z18sq4RN3rijz56vwerVRkYHjsG0mhjiazVG w==;
X-CSE-ConnectionGUID: j0LusWnZRHa3rxUPy2DDjg==
X-CSE-MsgGUID: L5V7UnPpQEWI600ISVexSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60467118"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="60467118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 21:43:09 -0700
X-CSE-ConnectionGUID: ju4G7Z4BT6Obaaqb02lNaA==
X-CSE-MsgGUID: FolXBy1mTZ6yT14DZQsbBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="207344443"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 21:43:07 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Mon, 22 Sep 2025 10:12:47 +0530
Message-ID: <20250922044249.1374338-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

If an eDP connector is present, prefer selecting its default mode for
cloning. Some eDP panels support only high refresh rate (HRR) modes,
which may not be compatible with external displays. To avoid invalid
clone configurations and test failures, we choose the default mode
from the eDP connector when available.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  tests/kms_setmode: simplify mode selection by removing goto
  tests/kms_setmode: Fix clone mode mismatch by preferring eDP mode

 tests/kms_setmode.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

-- 
2.43.0

