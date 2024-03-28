Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C0CC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 08:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F20010E0B1;
	Thu, 28 Mar 2024 08:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hr+DlEDw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C78C10E0B1
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711614531; x=1743150531;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2MDnv7mc51ysPILf2uVXMAHx0PLMGqCB/2Ur4PtC3OM=;
 b=Hr+DlEDwsS1uFKIc39n0rG0F7vzfGDL6BDPkNPRYdW7otGKbNJLq9JD0
 MiMlm9SKkRUU1XWBuZtFBvhyu/kNlHo0oyqonE7X2t3kxulLltvs308+K
 +IZxGa1UCM2i05ProgIVh4BdNf+2BrXGo7eQ/fg7daVx/AWEYBFJdTd51
 c8lCc75NM2YROmD+DU13uYfEOJU2RkwMmZsafOfu2GBHji4ua1KVhFiay
 vvHH5diwD+nSgti16dLWz4lUmnd9T4sht1kmGVGItTkLF6jtx6jRwFvzF
 u/916tEw1+QlvJRVL4UixRk7mIpUFPIcfjTd/h9dYD5EVAXPbzNUouMP9 w==;
X-CSE-ConnectionGUID: MkhjzxxLQt+ebZs5tLfQZg==
X-CSE-MsgGUID: wgfd+3fkQB2tzN287eMKzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="32157698"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="32157698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 01:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="47553179"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 01:28:49 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/4] revamp big joiner test
Date: Thu, 28 Mar 2024 14:09:35 +0530
Message-Id: <20240328083939.1361225-1-kunal1.joshi@intel.com>
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

modify test to support multiple big joiner outputs
simultaneously, support for ignoring fused pipes and
addition of subtests for testing force joiner support for
which is added by below in kmd.

drm/i915: Add bigjoiner force enable option to debugfs

Kunal Joshi (4):
  lib/igt_kms: move bigjoiner_mode_found to lib
  tests/intel/kms_big_joiner: revamp bigjoiner
  lib/igt_kms: add helper to enable/disable force joiner
  tests/intel/kms_big_joiner: add tests for force joiner

 lib/igt_kms.c                |  79 ++++++
 lib/igt_kms.h                |   4 +
 tests/intel/kms_big_joiner.c | 477 ++++++++++++++++++++---------------
 3 files changed, 359 insertions(+), 201 deletions(-)

-- 
2.25.1

