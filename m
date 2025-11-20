Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBA6CF857D
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 10:33:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270E710E0F0;
	Thu, 20 Nov 2025 10:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eiPq3yBb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C01110E0F0
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634790; x=1795170790;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bEvcS6BGOKGULC6pMFKqJJbBo+McUXQKKM/ni6v7zAs=;
 b=eiPq3yBbNyvcQQOQeUma/AG5PnqlgyQKK0mSndkIXyE7NU3yzcaRXVGn
 uQQ//KxcuWZcp30Ev+Rg2JLgMLZhghAUJuTZ5T1l/y0pYm8f/vVuUScDk
 wCyeqW7losSPO+ZuTN02CYYlGSUxaV7W7ZjVLYsGzCyUuW6BlAt8nYF/A
 JNmBL3AtfI0IZmzXKBvv0e0Z7ngG7RJTAXx/sAgd1uJJgROFSjRh4t+BD
 YX76/ovqnqytHWLfu4EEuGjZq6lbKzf+Hncvg91wPoaLGCn97Qam/N4P8
 gXILfimStbmc+ZZecnWaFdtPXzPOE8WWBT7jP36YK3fJycGPfm0g10Quc A==;
X-CSE-ConnectionGUID: U5BxKQLKRVy6K+LInADIpA==
X-CSE-MsgGUID: Q5lkU56UTvS4RIDVY1V3ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65736629"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="65736629"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:33:10 -0800
X-CSE-ConnectionGUID: MNn6JPk+SReZlvcSEpKpAw==
X-CSE-MsgGUID: ktE1RwD+TsmIAGIweHmVZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="222259856"
Received: from inaky-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:31:49 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v1 0/2] intel_gpu_frequency: Allow printing frequencies
 by regular user
Date: Thu, 20 Nov 2025 11:31:36 +0100
Message-ID: <20251120103139.17169-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Currently printing current frequencies with this tool without
sudo nor root rights ends with an assert and a FAIL, like in any
igt test:

$ build/tools/intel_gpu_frequency
(intel_gpu_frequency:3142) intel_chipset-CRITICAL: Test assertion failure function intel_get_drm_devid, file ../lib/intel_chipset.c:145:
(intel_gpu_frequency:3142) intel_chipset-CRITICAL: Failed assertion: is_intel_device(fd)
(intel_gpu_frequency:3142) intel_chipset-CRITICAL: Last errno: 9, Bad file descriptor
Stack trace:
  #0 ../lib/igt_core.c:2075 __igt_fail_assert()
  #1 ../lib/intel_chipset.c:155 intel_get_drm_devid()
  #2 ../tools/intel_gpu_frequency.c:312 main()
  #3 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
  #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
  #5 [_start+0x25]
Test (null) failed.
**** DEBUG ****
[cut]
(intel_gpu_frequency:3142) igt_core-INFO:   #5 [_start+0x25]
****  END  ****
FAIL (-1.000s)

This is a tool, not a test, so change it and allow a normal user
printing current Intel GPU frequencies. While at it, fix also
printing program name and print only program name, without a
full path.

Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Xin Wang <x.wang@intel.com>

Kamil Konieczny (2):
  tools/intel_gpu_frequency: print short program name
  tools/intel_gpu_frequency: Allow printing by regular user

 tools/intel_gpu_frequency.c | 141 +++++++++++++++++++++++++++++++++---
 1 file changed, 129 insertions(+), 12 deletions(-)

-- 
2.52.0

