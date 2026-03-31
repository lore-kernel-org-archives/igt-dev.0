Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46D7109B492
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 15:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17110EA8E;
	Tue, 31 Mar 2026 15:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAOiAwkC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6E710EA26
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 15:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774972622; x=1806508622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nzRZnyLCTwHQKNXpa/3OJf7urfHuAAE9P3uVfvLGGgk=;
 b=LAOiAwkC5Z3ixmVxXLcigjYj77Pb2VfiAVuDuqozTUAA1CV6JnT9EpRA
 KO2Y+muYy8Me+DgDwx1kEyi8B0E/Wd2TUWtN0Y6r9ulLNMuoGhPDfY0jy
 MD7jEjueIvh8ymaZQ+dEJzE8oIFguSZIjULa3DTMJ+G82d5a7QV1wAZjr
 HLUsAl8t83PM0RKp3PKt3NZKnn0EfxbtAz3Taa/vEED3NRW53X0uMX0J6
 L9BjcXgyq1JxvzCwHjsP1o9uFKhqH5GiyniWv0KH9T/7GpQtc8+rfUHDl
 OcSW82nb8RTQADU+PU8AetY+MmW9csWoFcRKHTs/YQCEb2odp3QqQCUzI w==;
X-CSE-ConnectionGUID: mOlK9y6OQBeQcSLUokEbiw==
X-CSE-MsgGUID: CtNx/YazRcSdD+2+N52uLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75026169"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="75026169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:57:01 -0700
X-CSE-ConnectionGUID: JSxaY8G0SzamIa+Je/u6Dg==
X-CSE-MsgGUID: S6FmcdKtTra5ekWwKvhZPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="219744538"
Received: from dut4449lnl.fm.intel.com ([10.105.8.75])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:57:01 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, stuart.summers@intel.com, shuicheng.lin@intel.com,
 nishit.sharma@intel.com
Subject: [PATCH v8 0/4] tests/intel/xe_vm: Add drm_xe_vm_get_property tests
Date: Tue, 31 Mar 2026 15:57:01 +0000
Message-ID: <20260331155700.7245-6-jonathan.cavitt@intel.com>
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

