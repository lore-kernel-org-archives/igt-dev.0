Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15974D63926
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 11:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA3110E700;
	Wed, 20 Nov 2024 11:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hin1+HOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2396010E700
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732100431; x=1763636431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lp5SIKaUbJAlnmcAOlxHNfSGY7NS/FYGKDmcCpRNhVM=;
 b=hin1+HOWdoXef/gNROfMvPnJUlLHU9gg8gk0qPwGiokG4Vaksb6GBoxb
 iz8Zwj6KilvE1KbBHpTH/rKW2AT+Dz6ZbV5QhfYMW0iAl6S5jIn52wi0e
 pkzAkg879CNii1LzxvRIqsAIXd9lE0CSVlArJJ1jp2rUa3IRblufrkRsR
 4bZUTtZucVXNGbxEdvG9X6/P5Xk3HrjFKQzqxrRmZpDt+Q1onCBrK/1qp
 gLSL21k66J71wFVwwM3dQAf8krff/lbg8tE+KCcZPA+Qi+nBPxInd9q2r
 NaApP+1RoAzBX+OFUt0mfwEqnCrAyPLgHMakAjbpTxrp2++Sq+JAd0Sy4 g==;
X-CSE-ConnectionGUID: ETFg5Gk6Q6GEktkavn2jvQ==
X-CSE-MsgGUID: skGMz+4YTKa0/K3TrpUn+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32081906"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="32081906"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:00:31 -0800
X-CSE-ConnectionGUID: BMHNSRv7QQyXP0apSZCJ5Q==
X-CSE-MsgGUID: //S1W6QDT7qodnRPq8QNCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="94334597"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:00:29 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 0/3] Drop PSR + DRRS tests
Date: Wed, 20 Nov 2024 16:19:37 +0530
Message-ID: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
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

As we can't test PSR & DRRS together, drop the tests those
are with this invalid combo. Also, no need to maintain
blocklists to keep the CI smooth.

This series will simply drops below tests:
 - igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*

Bhanuprakash Modem (3):
  tests/intel/kms_fbt: Drop invalid tests
  intel-ci/i915: Drop PSR + DRRS tests from blocklist
  intel-ci/xe: Drop PSR + DRRS tests from blocklist

 tests/intel-ci/blacklist.txt           |   5 -
 tests/intel-ci/xe.blocklist.txt        |   4 -
 tests/intel/kms_frontbuffer_tracking.c | 255 +------------------------
 3 files changed, 7 insertions(+), 257 deletions(-)

-- 
2.43.0

