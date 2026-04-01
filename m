Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEC01076386
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 17:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D82210E9C5;
	Wed,  1 Apr 2026 17:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7mbdiw1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B07910E9C5
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775063363; x=1806599363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1BqN3vtKHj3a64hlFI9P12EJ7iAfxNr/3KxtPr4JIjQ=;
 b=d7mbdiw1RQbkbo7s58xSKsg+yWK2YaLVWiOsgSiEW5djnJYW/Z+fFyHd
 tde93fcS1uxr7Hu1frzJgWLv5U1/htB1z5Q6y9J/gCUhDIXAb4XMWRHoW
 VixMPQxj4yV7gb4mtQ4zkuANIofKOZXXmNOUfEkeoY7tT822YJuEtCEA/
 /KdAE5s6eXtorykIOQFHnDOwlPrIa/8zkhX8oKvMalpP5h55RXI/GkIX8
 a0CZOsIC07OYUp5Zs1RakHeYsqMttOh8EEtJtM0Sipx/ieNweMINY8eW/
 kp20uWZhLSiday0HThKK5YR+Fj1rfhd+K6UZuqrmUD/kmmQqZa0zY4kwz w==;
X-CSE-ConnectionGUID: 6KJfVnFDQP2BS5oHPRkMvQ==
X-CSE-MsgGUID: p7RpVePKTDmxn5+2L1FFoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86724318"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="86724318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 10:09:16 -0700
X-CSE-ConnectionGUID: Gc6hIpD7QkeTPf3449GXZQ==
X-CSE-MsgGUID: biTvqcPKRiahYbm1u/X4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226593726"
Received: from dut4449lnl.fm.intel.com ([10.105.8.75])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 10:09:16 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, stuart.summers@intel.com, shuicheng.lin@intel.com,
 nishit.sharma@intel.com, matthew.auld@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v9 0/4] tests/intel/xe_vm: Add drm_xe_vm_get_property tests
Date: Wed,  1 Apr 2026 17:09:15 +0000
Message-ID: <20260401170914.16908-6-jonathan.cavitt@intel.com>
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

v8:
- Fix checkpatch issue - extra space in line (Sharma)

v9:
- Fix commit message (Kamil)
- Add missing invalid extensions and pad tests (Auld)

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Suggested-by: Zhang Jianxun <jianxun.zhang@intel.com>
Suggested-by: Stuart Summers <stuart.summers@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Nishit Sharma <nishit.sharma@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Jonathan Cavitt (4):
  drm-uapi/xe: Declare xe_vm_get_property_ioctl
  lib/xe/xe_ioctl: Add xe_vm_get_property helper function
  tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_PROPERTY validation tests
  tests/intel/xe_vm: Test DRM_IOCTL_XE_VM_GET_PROPERTY fault reporting

 include/drm-uapi/xe_drm.h |  86 +++++++++++++
 lib/xe/xe_ioctl.c         |   5 +
 lib/xe/xe_ioctl.h         |   1 +
 tests/intel/xe_vm.c       | 265 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 357 insertions(+)

-- 
2.43.0

