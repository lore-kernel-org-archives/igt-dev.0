Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516E606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mOUekbHS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941C1112228;
	Thu, 19 Nov 2026 09:54:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132EC112228
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 09:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795082016; x=1826618016;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7b4AR2GoGTupltEy7m6BsVuJC+680GVPwviH4jwsBqE=;
 b=mOUekbHSwCjbyF8hDxuFbNLJCfpj83/aC1S6r/nHEeQCu6DTLZ7ZW+JG
 5ZnZJyNWXgUljN3j2x3i63AzAKa/KXM5Aw5geyi+icNFqh+JhYek1R1hr
 PX330oxKsdF5H9gEmQ+YIiptghS31S6ixQCeSarCn8QNfgxvn2ylviTbj
 4O+29mn5972ePQM9MLWmE5qj9FcBKX1/KiBPdKg73/qVc3jZbYahWseGA
 VjfeY4mnwOzhR1w3jz4vecGyDooCjcQfBphAYd+C7KR9x6iEVrePq8JaM
 nTPLLBjWwa5fH5T9k8HvqsNiricyLB8GeXedsfJtmj16ciABe01qtW0xp Q==;
X-CSE-ConnectionGUID: OrqRpUaORmihSc8b/L8WNA==
X-CSE-MsgGUID: +TjT0X3lTwaANe57YtArXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3929150"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3929150"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 01:53:36 -0800
X-CSE-ConnectionGUID: k5mKGIPRR/yN1UZlm+6+3g==
X-CSE-MsgGUID: y/DM4jTgR8a/ZL0uSmosLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10478295"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa001.jf.intel.com with ESMTP; 19 Nov 2026 01:53:35 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Subject: [PATCH v1 0/2] xe: Limit migration debug log vo
Date: Thu, 19 Nov 2026 09:53:31 +0000
Message-ID: <20261119095333.182110-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nishit Sharma <nishit.sharma@intel.com>

Add a reusable Xe helper that clears DRM_UT_DRIVER from the DRM debug mask
when running under CI, while preserving other debug categories and
restoring the original mask on exit.

Use the helper in xe_exec_system_allocator, where large migration
workloads can otherwise produce excessive driver logs on big-VRAM devices.
Same helper can be called from other tests as well.

Nishit Sharma (2):
  lib/xe: Add helper to limit driver debug logs in CI
  tests/intel/xe_exec_system_allocator: Limit driver debug logs in CI

 lib/xe/xe_util.c                       | 28 ++++++++++++++++++++++++++
 lib/xe/xe_util.h                       |  2 ++
 tests/intel/xe_exec_system_allocator.c |  3 +++
 3 files changed, 33 insertions(+)

-- 
2.43.0

