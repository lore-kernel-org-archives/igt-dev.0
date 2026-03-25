Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4E5106B504
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 21:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E669C10E88B;
	Wed, 25 Mar 2026 21:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGW+llHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A0610E02B
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 21:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774473731; x=1806009731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kG1x/YEKrRXZaf5KNaAk4d7p2K9I0ouVP5VLrLskxXo=;
 b=dGW+llHU3/AupzifmP17C/vCZCaoJylukLOcdBfDr9pUI788N5tbIqe8
 E12tuK8PDpzGAwyy1KnJxRRawJ31qpY3q0LQbTIfs36MGzvgcFjt0R/qI
 jqJiRf3bKcGOC5gSKaJrHq4NxF7AsiZVG7equ9bFKI5h1BWuJV7ZWmSJQ
 ZmM/abSyIZEZpv13+iV+k7eUJyppcZGAoIg7bfBNFuXw4BDs/cdcCVcYE
 LVYSCjHVoqjVpkRalXLtukpoMgOKXLGnwELae/CpxGZTb0H2RGRbwIrUb
 N/f35M/Nv+cApq6bh9zlJVpHimN75J/UqP6sBw4CIZJQ2McLcu68xSjc4 A==;
X-CSE-ConnectionGUID: xNmPC005Q5ebY26wADnypw==
X-CSE-MsgGUID: NZGIy5YsQQmB6mD/1UFN3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="74551983"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="74551983"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:22:10 -0700
X-CSE-ConnectionGUID: Af/fw67fT/yLvEO6FhBNCw==
X-CSE-MsgGUID: 0wD6LV2SRCqYPT9WuOkdhw==
X-ExtLoop1: 1
Received: from dut4086lnl.fm.intel.com ([10.105.10.101])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 14:22:10 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, stuart.summers@intel.com, shuicheng.lin@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v7 0/4] tests/intel/xe_vm: Add drm_xe_vm_get_property tests
Date: Wed, 25 Mar 2026 21:22:09 +0000
Message-ID: <20260325212208.85743-6-jonathan.cavitt@intel.com>
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

Add tests that exercise the new drm_xe_vm_get_property uapi,
specifically for ioctl input validation and for determining that
pagefaults are correctly tracked and returned by the reporter.

v2:
- Remove engine class and instance (Ivan)

v3:
- Add declares for fault type, access type, and fault level (Matt Brost,
  Ivan)

v4:
- Make vm creation consistent between patches (jcavitt)
- s/pageproperty/pagefaults

v5:
- Rebase
- Use correct ID for ioctl

v6:
- Rebase

v7:
- Clarify canonicity of fault address
- Use xe_vm_get_property in test

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Zhang Jianxun <jianxun.zhang@intel.com>
Suggested-by: Stuart Summers <stuart.summers@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>

Jonathan Cavitt (4):
  drm-uapi/xe: Declare xe_vm_get_property_ioctl
  lib/xe/xe_ioctl: Add xe_vm_get_property helper function
  tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_PROPERTY validation tests
  tests/intel/xe_vm: Test DRM_IOCTL_XE_VM_GET_PROPERTY fault reporting

 include/drm-uapi/xe_drm.h |  86 ++++++++++++++
 lib/xe/xe_ioctl.c         |   5 +
 lib/xe/xe_ioctl.h         |   1 +
 tests/intel/xe_vm.c       | 237 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 329 insertions(+)

-- 
2.43.0

