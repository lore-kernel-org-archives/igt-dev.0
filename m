Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58E2C2BA1A
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 08:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2E910F0DC;
	Fri, 21 Jun 2024 08:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ilz1aoKb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BC610F0DC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718960119; x=1750496119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6v91Vmt6oFXHPIB4Dn3gB9x6Th5t/uyklBiEJ3Bn/GI=;
 b=Ilz1aoKbH1uqoAlM0InazZ5gWjC0/+lZpJyYkL3R3edNvc+iUH8kfM86
 Q4Ylu1+dc9V9zhwmX+Bzrg86enMXmv2cNHF7mMlhiYSSo9mpQFKlxYMYj
 oo16SG7tpYMiclFFknCWBm9z4lsBxD2s5f9XhBH5B+Utiz+tGNaV14pfB
 KR4hdwQbhQhS0NEW1HGTwb7iaMW8Hfhbkx/DXhr3viyeaYwFH++YbO5H1
 xnJfzc8FAu+IURZKImcgG8zYDFyBmv3K6R5qXZo2NjsXTnDzUDQCkiHAP
 k4QgFCWa+Mp/3ae73sya6veUYirvkfFG5sBTiO+twdexIf7Ug6SI0QZEc Q==;
X-CSE-ConnectionGUID: 9Ofc39iGS82g7UWigj50Tw==
X-CSE-MsgGUID: 1TWSXC1BQNy5qmnzZSjUbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="41387663"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="41387663"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:55:18 -0700
X-CSE-ConnectionGUID: fRb36pPHR2O2ChnEOFjJ2w==
X-CSE-MsgGUID: TVVQeQIwQfC9b4KeLuzdbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="42609034"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 01:55:17 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 0/4] VRR test Cleanup
Date: Fri, 21 Jun 2024 14:17:07 +0530
Message-ID: <20240621084711.68444-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

VRR test cleanup and fix for CMRR & seamless-virtual subtests.

Bhanuprakash Modem (4):
  tests/kms_vrr: Skip low RR mode check for seamless-virtual subtest
  tests/kms_vrr: Fix hardcoded step size
  tests/kms_vrr: Cleanup in creating the virtual mode
  tests/kms_vrr: Fix virtual mode for CMRR subtest

 tests/kms_vrr.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

-- 
2.43.2

