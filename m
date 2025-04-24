Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33450C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 20:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE63C10E86A;
	Thu, 24 Apr 2025 20:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GCayse5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048E210E1AF
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 20:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745527368; x=1777063368;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hg+hwM8mHcVIwQhvch6OqU893DslGHy9+0REX8UsjFA=;
 b=GCayse5XKkq5n9yzRFTyTkreyEPh95Dsg55adp6Jbxvt0UayQfCTCH8B
 6pHTyEyeL0/ZxKQ5pS1iNRz1fjwJlFkp0mLHBSjD/v7tm9zW4C1rh3z4e
 0KiOzsAh3zHjENLta9DASm2PgS4pIiTchPLAgFEbIFPtP7SpiaWUKGaXD
 ef1m/WJGZeTDpk/obdKkHEeiLkgQeh21Lj1/EAlJPRqwQn1G0J3JXFvGq
 ROBSvjpL0VZjXGTQjAAXPdV2gQWrjowBlX1BNhTTSnHZFJjXis8DxZZeO
 bVgSuzrSE3JdIP8Vi8CbwqAQW6g2Ec27MopksKY1DAxpZ6eXbP2eZpDjt g==;
X-CSE-ConnectionGUID: DBvgGNpISuehkGFjkhYcKg==
X-CSE-MsgGUID: FBXsdd8YTciZ2lCK+PibxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57820397"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="57820397"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 13:42:47 -0700
X-CSE-ConnectionGUID: NTckT73+SPia/0UQW4LiZQ==
X-CSE-MsgGUID: 5HK9dqq5TZSz3IwOtalBjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="132458192"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 13:42:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: francois.dugast@intel.com
Subject: [PATCH v3 0/2] Add system_allocator test
Date: Thu, 24 Apr 2025 13:44:04 -0700
Message-Id: <20250424204406.656794-1-matthew.brost@intel.com>
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

Matthew Brost (2):
  uapi/xe: Sync latest uAPI KMD headers
  tests/xe: Add system_allocator test

 include/drm-uapi/xe_drm.h              |   49 +-
 lib/xe/xe_ioctl.c                      |   12 +
 lib/xe/xe_ioctl.h                      |    1 +
 tests/intel/xe_exec_system_allocator.c | 1849 ++++++++++++++++++++++++
 tests/meson.build                      |    1 +
 5 files changed, 1909 insertions(+), 3 deletions(-)
 create mode 100644 tests/intel/xe_exec_system_allocator.c

-- 
2.34.1

