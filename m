Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81752C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 06:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE5D10E336;
	Mon, 17 Feb 2025 06:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4wwPUVh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED0010E31A
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 06:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739773622; x=1771309622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iJTIVsZA+4CqstLnjh/ikagKpVgU8OkLueyri1iiCiw=;
 b=X4wwPUVhMox8DVWOyuw/O3scpUKSxuQoq0BXd/OXAdNWn6ysJCfDmKJs
 QRplOf/p1Bco1E2IAQ+sCX2V9aJag8xocO58wIjgKLYAukEFn5jh1w7SP
 AdrsaoazfuSkGnfmhksGBtTOukKVBjMn2J6bll4jHyBCtp85YGLYGVLns
 GxT4F/N/gCjzwdHdaeasqjsvxVaws8gxt83s7TAqxXyYYiZTFnGvzmzvw
 wvO0acHvpAhNFqlhdareeJza1gjkQQhkosJp2TnSxq4vgD8SCXFLc8FiW
 a4yyqnVO1zjGMoOwE8V372ow3BFGZYGCh0/DVjHbpasqtzSCvAm8RZ9Tl A==;
X-CSE-ConnectionGUID: RozmrCfhSOuQ4GpYu/aniw==
X-CSE-MsgGUID: 3bTUVMkOR7WbqJk7x84kWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40149651"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40149651"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 22:27:01 -0800
X-CSE-ConnectionGUID: C8B3t1wkRc2ncnGK8AXaNA==
X-CSE-MsgGUID: 1g7BwgAxTB6bIDVxPmd4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="114661943"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 22:27:00 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/4] add test to validate uhbr/non-uhbr over sst/mst
Date: Mon, 17 Feb 2025 12:12:35 +0530
Message-Id: <20250217064239.2019316-1-kunal1.joshi@intel.com>
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

Add new test kms_dp_link_training to validate both
UHBR and non-UHBR link rates over SST and MST configurations.
Add four new subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst)
to check if the link rates match the expected UHBR or NON-UHBR capability
and whether the outputs are MST or SST.

Kunal Joshi (4):
  tests/intel/kms_joiner: refactor set_all_master_pipes_for_platform
  tests/intel/kms_joiner_helper: add helper for joiner-related functions
  lib/igt_kms: add function to set link params
  tests/intel/kms_dp_link_training: add tests for UHBR/NON-UHBR over
    SST/MST

 lib/igt_kms.c                      |  33 +++
 lib/igt_kms.h                      |   2 +
 tests/intel/kms_dp_link_training.c | 378 +++++++++++++++++++++++++++++
 tests/intel/kms_joiner.c           |  15 +-
 tests/intel/kms_joiner_helper.c    | 181 ++++++++++++++
 tests/intel/kms_joiner_helper.h    |  20 ++
 tests/meson.build                  |   5 +
 7 files changed, 621 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/kms_dp_link_training.c
 create mode 100644 tests/intel/kms_joiner_helper.c
 create mode 100644 tests/intel/kms_joiner_helper.h

-- 
2.25.1

