Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FDBC27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 05:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289BE10E04F;
	Fri, 14 Jun 2024 05:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ue4/PhoJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBAC10E055
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 05:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718343535; x=1749879535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=haG00ljzvf7WzDqySHYQ1tl3BUEn3kasIzYba5Atbiw=;
 b=Ue4/PhoJ1cZBfzQSeZsjLB64Zz2Jdy8vqEFrAsG40m2Iy1Wd06rw/f/Y
 8rKSJFYbNw1C1if9/Xa2pqnQ0DpcUlXYUoUCfeo1bTgyIiXGzCll/SvcJ
 ty5zrtkWI3xZP7oCWpaOfP0D7ht3riM9+j5Yhn0B234XbnDDuVR8SuI+t
 yI25kppqYWZW5RzZay/Z7MJe3Y/AYWI0jUk7z0GITeVwLbZ17+fNHBN5v
 4XZAhP5lYjmB90HjYBkVxXJW2TlJrt0ekBpmu4llZufZ/rKRMlTTnkqxA
 ogdXpqF+wLZrtWqallJcA3gVBUyWU4JExKDx+V3dOd51feT5IK1GwkX15 A==;
X-CSE-ConnectionGUID: mZSfSgC5RFe78t/7TPuzuA==
X-CSE-MsgGUID: TZDYaxeLQKCm4oSD+Y6ykw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26331584"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="26331584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:38:54 -0700
X-CSE-ConnectionGUID: coL++nQXRvm+jZZKdUUApw==
X-CSE-MsgGUID: Z2nSRdDFTwKICJp26IQlEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="77864029"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:38:52 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v3 0/7] Panel Replay eDP changes
Date: Fri, 14 Jun 2024 08:38:32 +0300
Message-Id: <20240614053839.1822879-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This patch set modifies igt testcases using PSR/Panel Replay to work
on setups having eDP panel supporting Panel Replay. Following
testcases are tested being working:

kms_frontbuffer_tracking
kms_psr2_sf
kms_pm_dc
kms_psr_stress_test
kms_psr

It is tested using current drm-tip without any patches and with
patches from following patch set applied:

https://patchwork.freedesktop.org/series/133684/

v3:
  - adjust poll intervals in igt_psr
v2:
  - fix PR_MODE sink support check
  - set stored mode instead of PSR_MODE_2_SEL_FETCH

Jouni Högander (7):
  lib/igt_psr: Set Panel Replay disable bit for PSR modes
  lib/igt_psr: Psr status debugfs interface print "enabled" not
    "Enabled"
  lib/igt_psr: Handle PR_MODE2_SEL_FETCH and eDP PR_* in psr active
    check
  tests/intel/kms_psr_stress_test: Provide output to psr_wait_entry
  tests/kms_psr2_sf: Use stored psr mode instead of 
    PSR_MODE_2_SEL_FETCH
  lib/igt_psr: Fix PR_MODE sink support check
  lib/igt_psr: Adjust igt_wait intervals

 lib/igt_psr.c                     | 60 +++++++++++++++++++++----------
 tests/intel/kms_psr2_sf.c         |  9 +++--
 tests/intel/kms_psr_stress_test.c |  2 +-
 3 files changed, 46 insertions(+), 25 deletions(-)

-- 
2.34.1

