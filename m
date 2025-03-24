Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A489C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 09:04:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EEE310E081;
	Mon, 24 Mar 2025 09:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fn5BQGTG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4657C10E081
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742807068; x=1774343068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cMqNj/8FWRCxro3CPNcw4frz7n3vqEZaoUPaMmo1wEQ=;
 b=fn5BQGTGgSnxKZXi2kIWGFIp7ayiuVvUFEjcsJ45VWjv92w4eBkB+0h4
 S1KAnJGlwDo1mfghtGOERTVf1FYkSef3dZKv1C21Bo+Aro3aF3VLyFs7K
 tVj/t1ZfItjHs2EiEqs66S3NBo3jq17nCgTucU/HkzZmg0oRxtitUF35g
 8MegejkVEQJu93RnKiK/cb4ogQMNeofU5x3UcAX/j29nljbDTMwdc0Guu
 APFj+UWVrRC6714YsBLNk01u2L25FFZnc8Cc/7obgM443nuvWzfazlOLB
 7gEna300k8HTmKBGKTORnBJYCZIhCNnAchvr6mU/5oZTHpURBCJzPHY+M g==;
X-CSE-ConnectionGUID: jZQV+80pRBWOSB4UfMC7vg==
X-CSE-MsgGUID: XiO2LJR3QJCcjD4xpsTspQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="54999660"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="54999660"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:04:27 -0700
X-CSE-ConnectionGUID: Rgj88m3VQpm4FFC6xQ6R9A==
X-CSE-MsgGUID: OdJ3UzrNToaRfGj5jKnUkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="129097347"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:04:25 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/3] Fix ctm-limited subtest
Date: Mon, 24 Mar 2025 14:39:46 +0530
Message-Id: <20250324090949.614233-1-swati2.sharma@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Fix ctm-limited subtest

Swati Sharma (3):
  lib/igt_chamelium: Add chamelium_frame_match_or_dump_frame_pair()
  tests/chamelium/kms_chamelium_color: Fix ctm-limited-range subtest
  tests/chamelium/kms_chamelium_color: Set rgb_full to 1.0

 lib/igt_chamelium.c                   | 60 +++++++++++++++++++++++++++
 lib/igt_chamelium.h                   |  6 +++
 tests/chamelium/kms_chamelium_color.c | 56 +++++++++++++------------
 3 files changed, 96 insertions(+), 26 deletions(-)

-- 
2.25.1

