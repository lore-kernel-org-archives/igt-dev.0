Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8245AC4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 05:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ED111277D;
	Mon, 22 Apr 2024 05:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KRsjaIv3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE8611277D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 05:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713763444; x=1745299444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h2CfeJjYRbqsllmz/qs2W7OTyye2ESdn3qo1E88+B2I=;
 b=KRsjaIv3eJC6YALISFRGKpri5e1xdrGf/FeJe1mnJ/OfR7FZ+wvX/rG4
 iH6HqTYo77umhmpVcJBOrTPYdmZK7m8BRMxwKvSwywS1KV9SZBWWPtHHy
 Y9HfFJ6JryQ4+qCh2G6TAhf6FG4t3Wj2aceHia2LNirDBSP7ry3E8Hp1n
 jkyCm+KAGhx4iSMDVQBKdq5X7+sFlwO18YMArPpDRoOBxHNd5zV3X3aj6
 2wK+LtAVd/in/2GaZifUcOEI3f1n8vgPO/xkWXYKMwkCk0RhD5qkPO8xI
 C1B53IvIMyC5I3ty+/9SZGUdxvCxKUdc3tK7wJxNWTBx22h+jfmxFFslV w==;
X-CSE-ConnectionGUID: V3JS7J/nTjCdI04+vW26aQ==
X-CSE-MsgGUID: /YvB8OE4RXmDqxbde37vjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9113784"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9113784"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 22:24:03 -0700
X-CSE-ConnectionGUID: FZpHHyNFT5CDnYToNKg0LA==
X-CSE-MsgGUID: WH/lw/cCTVKcI6dMGkhe0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; d="scan'208";a="23981091"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 22:24:01 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/7] cleanup and fixes for kms_big_joiner
Date: Mon, 22 Apr 2024 11:04:47 +0530
Message-Id: <20240422053454.2523989-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

fixes and cleanup for kms_big_joiner test

Kunal Joshi (7):
  lib/igt_kms: don't run on unsupported platform
  tests/intel/kms_big_joiner: fix crash in multi joiner test
  tests/intel/kms_big_joiner: add missing commit after reset
  lib/igt_kms: add support for forcing bigjoiner on particular connector
  tests/intel/kms_big_joiner: use kmstest_force_connector_bigjoiner
  lib/igt_kms: remove unused igt_force_and_check_bigjoiner_status
  HAX: Do not merge

 lib/igt_kms.c                         | 109 +++++++++++++++++++-------
 lib/igt_kms.h                         |   2 +-
 tests/intel-ci/fast-feedback.testlist |   5 +-
 tests/intel/kms_big_joiner.c          |  28 ++++---
 4 files changed, 102 insertions(+), 42 deletions(-)

-- 
2.25.1

