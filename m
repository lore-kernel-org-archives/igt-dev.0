Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7DBD58CD0
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 05:00:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DD210E3C4;
	Mon, 23 Mar 2026 05:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3ywDoya";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF7B10E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 05:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774242005; x=1805778005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7BV+pk1GUOG0WmnzgZw5sJjQ5goyLSM6c5i8zFzGlYo=;
 b=g3ywDoyaU2QzllDssF8nTyoosehnXrqlOxFAygilsBLU67MkaQ7HETwC
 pU599Pr3lJebyO1mhY9O8qeyNunHdc9D6DE7lKRvJQtZplN5p9rSk0pb1
 GuN3BGMu+I53JGO7a19DyEEkUR7mCP4aEZyHE9QWRmOFH88+1AweMPGjL
 apWZPkPPshHNHrbZmLqOf5kY+g4lPO28zCxJC41Vf29tpipTsVqTHWIu2
 Vv1VOlbcO20HcKamNWSkggIaM9eEWY4ZvHOSx5qmS/8ogZ8L7R3d8XidP
 FRFxNjp8SsvC01ZdhaMPjQOWOdX4bx9rDIbHlR5G1hdU0Bv8FHN8f5eF6 w==;
X-CSE-ConnectionGUID: HS7SotmYSBKqz1LO0p3oJQ==
X-CSE-MsgGUID: 5vUnrrKVRW6x1jdw2FE0Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100687847"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="100687847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 22:00:05 -0700
X-CSE-ConnectionGUID: xSz+hLFkSmS76kn1VW7rXA==
X-CSE-MsgGUID: seMSFdrORGWMmJV/i9aO4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="219124913"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa006.fm.intel.com with ESMTP; 22 Mar 2026 22:00:03 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 0/2] Fix non-joiner mode helper and use it in test
Date: Mon, 23 Mar 2026 10:40:47 +0530
Message-Id: <20260323051049.2627387-1-pranay.samala@intel.com>
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

The get-non-joiner-mode helper returns a pointer to connected-owned
memory which could become invalid after display state changes, causing
stale mode data and test failures.

So 1st patch converts the helper to use an output-parameter, and 2nd patch
updates the test to use local stable mode for joiner bypass and applies
the selected mode to output before commit.

Pranay Samala (2):
  lib/igt_kms: Make helper use out-parameter
  tests/intel/kms_sharpness_filter: Use stable non-joiner mode for
    joiner bypass

 lib/igt_kms.c                      | 10 ++++++----
 lib/igt_kms.h                      |  2 +-
 tests/intel/kms_sharpness_filter.c | 10 +++++++---
 3 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.34.1

