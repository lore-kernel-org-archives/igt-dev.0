Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C876CFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 16:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D2410E81E;
	Thu, 27 Nov 2025 16:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luJVlU6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9535910E81E
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764260899; x=1795796899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NjaBp7m6+qoTdn39249Z/11tMWn1sJmkhBWnuTVLNBo=;
 b=luJVlU6y22LahOEjLaahhn3bl5EM1oU9X4UvM9ol1SzJN7Np9w1E7zee
 6331W43CXAzAieIXayCh+rdBpzdeOuOdggL0b3sNcJXfyggXfrv1mGVJB
 /Kw4ZpWZfJ6Y6+JfJKIGfwizNNN9YXl/Rtd6IvV0bAMIv/W7szMs0AG5c
 tY3JRlTJFRSKnkOUq6KsLQ7ykuAldw7PXyWtFQJOUoOVE+cCs9VVnJgXm
 U/xyAPlvTFdp10yHamMrI74UBT7uCPqwgx4xHWqxhIdwhdnpo7BB5iTJ/
 dej0+PDrBBUMVqknEE87XMLTOoiOyVNDOXR5UZVovmBSrJB9uNbvpfTD4 A==;
X-CSE-ConnectionGUID: Dx58KyxaQ6+gmcKX7tlYAg==
X-CSE-MsgGUID: RF1z3zHiS6CK28gxCi4f+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66204316"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66204316"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:28:18 -0800
X-CSE-ConnectionGUID: LrrZfvgsSi+kDNaw1F3hHg==
X-CSE-MsgGUID: c7+W88QwRYa5qFfriCnlzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193363912"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 08:28:17 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, Xin Wang <x.wang@intel.com>
Subject: [PATCH i-g-t v3 0/3] intel_gpu_frequency: Allow printing frequencies
 by regular user
Date: Thu, 27 Nov 2025 17:28:01 +0100
Message-ID: <20251127162806.173535-1-kamil.konieczny@linux.intel.com>
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

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
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

