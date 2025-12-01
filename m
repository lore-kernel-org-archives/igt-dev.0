Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E53D116F5
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 18:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF5110E457;
	Mon,  1 Dec 2025 18:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlynB2qx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E828510E06C
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 18:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764614994; x=1796150994;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OGV2IIv0D05BjMMjGgCnWyOmRa8vEnzbtI7aXVn7mWA=;
 b=AlynB2qxAT8mWpt/XDFZYPJQCo6DBxpLw3ozwk/Cq86PsCUBEVnCM+72
 BCrV3tHX3RV3l0lk2cbUD9Y9hagVnjZeFocwxFPJbPuR4TAS/belHwGeW
 qDoc3gS0qY3oit9G0DkzlvVTslt5rbJ2JPFntrjvLoKZVROKOn0b2raOP
 CiIILDRZO0fCVBFsj9cZnAGdGmTT/XtgijkfnneZR2tEGnDEZhqqGoNWe
 JTEDFPir0AOCvMQwy54MI68sPY7i/SPIgnhYcEPMm4sr5Ual9SSo3PpKL
 SJiDRSczlioQrN8XmjUKvIvMU3KKPcK6ACmx8zL5DOexD62pqhCRlONLa A==;
X-CSE-ConnectionGUID: H913DDv5Qz+W+rEhOv2WtA==
X-CSE-MsgGUID: G1LuOTGdQm2ETaOQDPHW3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66603134"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66603134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:47:32 -0800
X-CSE-ConnectionGUID: Ww4AijdXRPOF4QSwT5DWOA==
X-CSE-MsgGUID: yYHpAuSoQJ+Hy9NZd0GP2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="199277073"
Received: from dut4086lnl.fm.intel.com ([10.105.10.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:47:31 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, stuart.summers@intel.com, shuicheng.lin@intel.com,
 ivan.briano@intel.com, nishit.sharma@intel.com
Subject: [PATCH v5 0/4] tests/intel/xe_vm: Add drm_xe_vm_get_property tests
Date: Mon,  1 Dec 2025 18:47:30 +0000
Message-ID: <20251201184729.164799-6-jonathan.cavitt@intel.com>
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

