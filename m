Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD259D116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 17:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7187B10E155;
	Mon,  1 Dec 2025 17:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZLPhor4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655F110E155
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764610391; x=1796146391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=smmtxgx0YqmoE9eWaIOm1hKCcZOhggrZRVJeOp0vZC8=;
 b=QZLPhor4H0Zs8aqlbMImW3VzoLoHUxS6lm/6/5sluuwDQleEQY1Yd3Jv
 K/c+ZcYnWWCQAC9HoZ78VHR+K511FzMIUvxndRQaQMAy/mcCQWJvmZ13G
 XyTUdhIq6mWixLBXtqCb8F7AC8seegRIhPfdSyvI//VNSq0QTjLNJlZNo
 Ku3f5oDxpor0jcXtswBVzxKXBepAthh3bYnkvFRUCPUUpAlZ0H5QC/BIt
 7cr0Hcgz6AtR/jM3Byyup53C//NRXuMpKrPWyuybxMqa5AAMQ1yQgeRS7
 wVaod8nM0DyMQ+jEdaCn6kXJeRonXRotV32BqcLuaUHfHKBPFaQuRw3fk Q==;
X-CSE-ConnectionGUID: ZRyGYzrtSG2O5NEQeCQB6w==
X-CSE-MsgGUID: Lerd8j36SbyjRk5Qx2cgyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66590690"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66590690"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:33:11 -0800
X-CSE-ConnectionGUID: JibrtymZSZegH1zSy4OjUw==
X-CSE-MsgGUID: KW7hqS3WTB2AJyky3gAz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194126808"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:33:09 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v4 0/3] intel_gpu_frequency: Allow printing frequencies
 by regular user
Date: Mon,  1 Dec 2025 18:33:00 +0100
Message-ID: <20251201173305.111564-1-kamil.konieczny@linux.intel.com>
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
v3: corrected description and improved error prints (Krzysztof)
v4: corrected error reporting in patch 2/3 (Kamil)

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: S Sebinraj <s.sebinraj@intel.com>
Cc: Xin Wang <x.wang@intel.com>

Kamil Konieczny (3):
  tools/intel_gpu_frequency: print short program name
  tools/intel_gpu_frequency: Change Intel card detection
  tools/intel_gpu_frequency: Allow printing by regular user

 tools/intel_gpu_frequency.c | 173 +++++++++++++++++++++++++++++++++---
 1 file changed, 161 insertions(+), 12 deletions(-)

-- 
2.52.0

