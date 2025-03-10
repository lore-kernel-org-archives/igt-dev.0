Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DA6C28B30
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 21:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0858C10E31E;
	Mon, 10 Mar 2025 21:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m1jb7nDL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDE010E2C1
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741640625; x=1773176625;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MX99grvquVWkLV17+OAwwc/grqBA0ZeY6fgqeiqkEWE=;
 b=m1jb7nDLwCsNGsx3H8olu/x1W8poC5HeYmc+DkSXoNKjbR0cayoYkFIg
 GwyAt2dj0VwGJsWcTcnoIWL/a9hV4581x/P3V0PI37ym6ls7BPh+SnaRE
 ZonIU41phQwcpiUG3Z2Vi19L95hLztNj6lpMm3h9WT/QZ1WLW/eM4Y7m7
 q5oEXdbNcOGRwSYBWe3siGrDntvV1bRPWOvFJmT2JCrgLC5bdyOYUrGfD
 Aw7YPeB+g1k3mvbaRMrrptUpEbND+0XCTnP1zuqi4Be3UfWFMQNVXRpw4
 8ien3YdEEEeEJrbGCbw8ywGP0vy+rQGiqdO9P+r2kAj9cKC1PyvqVaIM6 w==;
X-CSE-ConnectionGUID: TP7RU+u4T9OIkoK6jT+ckQ==
X-CSE-MsgGUID: zoKvPQtfTcqgz2+aO51BTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60061544"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="60061544"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:44 -0700
X-CSE-ConnectionGUID: fnD9pFVkSSap58rsi1hrkQ==
X-CSE-MsgGUID: a/T+kGChSMqPKMWjoscH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="120630397"
Received: from dut4432lnl.fm.intel.com ([10.105.10.85])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:44 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com
Subject: [PATCH 0/4] tests/intel/xe_vm: Add drm_xe_vm_get_faults tests
Date: Mon, 10 Mar 2025 21:03:39 +0000
Message-ID: <20250310210343.204246-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add tests that exercise the new drm_xe_vm_get_faults uapi, specifically
for ioctl input validation and for determining that pagefaults are
correctly tracked and returned by the reporter.

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Zhang Jianxun <jianxun.zhang@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>

Jonathan Cavitt (4):
  drm-uapi/xe: Declare xe_vm_get_faults_ioctl
  lib/xe/xe_ioctl: Add xe_vm_get_faults helper function
  tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_FAULTS validation tests
  tests/intel/xe_vm: Test DRM_IOCTL_XE_VM_GET_FAULTS fault reporting

 include/drm-uapi/xe_drm.h |  49 ++++++++
 lib/xe/xe_ioctl.c         |   5 +
 lib/xe/xe_ioctl.h         |   1 +
 tests/intel/xe_vm.c       | 256 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 311 insertions(+)

-- 
2.43.0

