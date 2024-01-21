Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EACC47422
	for <igt-dev@archiver.kernel.org>; Sun, 21 Jan 2024 12:48:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7082910E010;
	Sun, 21 Jan 2024 12:48:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB9E10E010
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Jan 2024 12:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705841305; x=1737377305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0AsccJI98u1f+yE/sr1NfZUw7xAIgIKGEO8wtIcngyY=;
 b=oIdZFPkYgIyaDeAdBi4pWu5g3WxIUU0sUOVwKGkPVVkw0oSzwReLDvOQ
 Yu9r8PgeaJ/BNA1hZUoceZ7/RKe29vDKeIDyF2UXVn91swlh+GFudu+ln
 IbYA40xVwF4ygKeFa6OHbm8nGC6FZCH2COJcGw4AtwA7mStHMmj3SFaz+
 eMu9kwzaJBp91MmWWliE0sk4L3wX1iJnf3X5tPE6slw2WVKzm7/sjw86B
 k/YOGGuyhCG5QtlUbadr6k1LiB/FPbNT/0CGVZeYMLHDK3leKcDU6KhD4
 sCkjqpJZGF5+3qyVAQE8yVZX/nzX8Zkaw1OKBmfPoMOKDuusrw1j3K45T A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="487167503"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; d="scan'208";a="487167503"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 04:48:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="953613"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 04:48:21 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] extend psr2_sf test for pr_sf
Date: Sun, 21 Jan 2024 18:27:42 +0530
Message-Id: <20240121125744.1129837-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

kmd series [1] adds supports for panel replay selective fetch,
modify lib and kms_psr2_sf to extend kms_psr2_sf tests to validate
panel replay selective fetch as well.

[1] https://patchwork.freedesktop.org/patch/575163/?series=128193&rev=3

Kunal Joshi (2):
  lib/igt_psr.c: add support for panel replay sf
  tests/intel/kms_psr2_sf: extend tests for panel replay sf

 lib/igt_psr.c             |  46 +++++++++-----
 lib/igt_psr.h             |   6 +-
 tests/intel/kms_psr2_sf.c | 127 ++++++++++++++++++++++----------------
 tests/kms_async_flips.c   |   4 +-
 tests/kms_cursor_legacy.c |   2 +-
 5 files changed, 111 insertions(+), 74 deletions(-)

-- 
2.25.1

