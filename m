Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C387ECFC29F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6F010E8F4;
	Fri, 21 Nov 2025 19:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ovk0ht/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F409110E8F4
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763753749; x=1795289749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0sK6xnGQm5cifxyT0jTdc73vNHTMZA5X5GeBuuwYqeE=;
 b=Ovk0ht/Vykb1x0pFcYYjmMomiNhO2wG3T38SJuTxLKP2OgSfigkdke4A
 C96Y3ZWM6+jK0XPMFw7H1ZLfq3xjQKblJcf3C+v5XZILG8N98rUJrlWbt
 Jjhqf6ftjxpLs22IllI2CdV7Xgg4PzP6jM24n/4XqlzRpuTqld5BS5wsd
 +jMoIJl1rFNw+yy06dolsO3dTzFyqTuHHFDFZPyrjAev4ptpxRn8cux//
 GehrmlE73gPdJIeZK4RbziVi39LVZerBwVnqzyInB+zJ1w1bscLarPlY4
 usfGGXZ5qxV8JFv5cZ/b3M/Pyx/Nd1PVTMDQUXrHeyotPik9mLCZklOGu g==;
X-CSE-ConnectionGUID: +RM573cYSWmbYHBnmhQLXg==
X-CSE-MsgGUID: Dqbn0nzcTvyqWQ+weekPhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69720443"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="69720443"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:35:48 -0800
X-CSE-ConnectionGUID: 2zkV4qUZRcqaLXIr99tWRg==
X-CSE-MsgGUID: pJqsJXzaRJmEZamhZ5ARkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="191657007"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.48])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:35:47 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v2 0/3] intel_gpu_frequency: Allow printing frequencies
 by regular user
Date: Fri, 21 Nov 2025 20:35:21 +0100
Message-ID: <20251121193539.195005-1-kamil.konieczny@linux.intel.com>
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
printing program name and print only it, without a full path.
In second patch, I addressed problem when no Intel card is
present.

v2: split device detection to separate patch (Kamil)
  changed opening for writing (Kamil)

Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Xin Wang <x.wang@intel.com>

Kamil Konieczny (3):
  tools/intel_gpu_frequency: print short program name
  tools/intel_gpu_frequency: Change Intel card detection
  tools/intel_gpu_frequency: Allow printing by regular user

 tools/intel_gpu_frequency.c | 171 +++++++++++++++++++++++++++++++++---
 1 file changed, 159 insertions(+), 12 deletions(-)

-- 
2.52.0

