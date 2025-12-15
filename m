Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A16D5B879
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 23:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4E310E5B2;
	Mon, 15 Dec 2025 23:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCBdyiSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C28110E3B6
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 23:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765840148; x=1797376148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cUh0iuTavNv0D6qsGqwXVuAfCWbwUlVQ+PYt2tsBILY=;
 b=SCBdyiSHpyvOmb16zH3wQWgxhxnrkxbPaPKzAdX41AzRLzbXlqPtMLOw
 vj82CWBzkcB8QTE/gMvN16w4UrzanTIYEJfnmVQFiPwQtnldPa+0JBxjj
 /H9KPV1tpuJ+Jjg83qiG9u8qf4rtNxpDsUeybxiHW4fuule14CrdQ481f
 eiqGZQO/iTAM1MH5yuTI6+Z7gcSOPF36RwwFXs9GaOVGI9EllzZ6Bu2vx
 UdkG/1fF9eZhhsHXRhSDIu7Y6swaUgdc//lxGLnHhX/KSQVUKSWUGe563
 Qhno/uxFbvoJtGk0wBEXe3ihZGpWr+fbNvDqCe5SXZLYGPOmdKu4Brcc2 A==;
X-CSE-ConnectionGUID: 115U8NU9TOa5blQo59siQw==
X-CSE-MsgGUID: SFn+dpaTSWWI749zCT8wUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66939534"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="66939534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:07 -0800
X-CSE-ConnectionGUID: coaqkEvqQC+bjbU+LTl0tg==
X-CSE-MsgGUID: aWa9doC0QLSVUqlWv9oRpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="202259576"
Received: from dut4086lnl.fm.intel.com ([10.105.10.207])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 15:09:07 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, stuart.summers@intel.com, shuicheng.lin@intel.com,
 ivan.briano@intel.com, nishit.sharma@intel.com
Subject: [PATCH v6 0/4] tests/intel/xe_vm: Add drm_xe_vm_get_property tests
Date: Mon, 15 Dec 2025 23:09:06 +0000
Message-ID: <20251215230905.164341-6-jonathan.cavitt@intel.com>
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

