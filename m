Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462E1CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 16:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62C710EA2D;
	Thu, 16 Oct 2025 16:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqO8+6zm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF0010E9EB
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760630751; x=1792166751;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4cNFA+62VU02+WXM04Rq3R8kziIBBqWqmCf/chjQUXk=;
 b=OqO8+6zm7FYumFoKlkY0M9kBby7RxZC2DC7ZfpKOzz8+oRzAb09ZEybm
 09XLB4WReLvNO1vUt3PhDcPthVNgAkiP+FRz73mdhB4ApZcbOeEqTfb0z
 dvFLerARPmG/y5H1N3swAtJUkOQjYeQ6gcgbARw/iZSl+2zDI0R2MVLhz
 Dt6VFtrhDH1q9dRC5Czn9+O7MOEuIpaee68Bldgh8FgWgF2sBahVcCVoG
 ls2OOLQpzB1bnJfZNttNifKxcy0AIK+GTSMJdFWAHUTwyvEgclzQZOlDD
 bcZa3APVRC3r/aJWrl5WE7HBW5yyzoIhozhHBjRMEA60zDuPRU5c3lBL/ w==;
X-CSE-ConnectionGUID: ryE/Y+PpSZyiQTWlIzVapg==
X-CSE-MsgGUID: 69cg7j2mRR2ic6LN19pFgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80276488"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="80276488"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:05:51 -0700
X-CSE-ConnectionGUID: KaqveK+aRSmMXfOMcTu9vA==
X-CSE-MsgGUID: de6KsKfUSnWg/7mZ+o9q5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="213456977"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.225])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:05:48 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/1] Fix drm_open_driver() with IGT_FORCE_DRIVER and
 DRIVER_ANY
Date: Thu, 16 Oct 2025 18:05:42 +0200
Message-ID: <20251016160544.122657-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

With recent addition of VKMS it was discovered that
IGT_FORCE_DRIVER didn't help with testing on Virtual Machines.
Imho when user sets forced driver than DRIVER_ANY should allow
testing this driver even if it will cause skips or fails.

I tested this with the help of vgem driver, normal run without
any env vars:

$ sudo build/tests/core_getversion --r basic
IGT-Version: 2.2-NO-GIT (x86_64) (Linux: 6.14.0-33-generic x86_64)
Using IGT_SRANDOM=1760622038 for randomisation
Opened device: /dev/dri/card0
Starting subtest: basic
0: i915 v1.6 0 Intel Graphics
Subtest basic: SUCCESS (0.000s)

Now run with forced driver fails due to no fd opened:

$ sudo IGT_FORCE_DRIVER=vgem build/tests/core_getversion --r basic
...
(core_getversion:28545) CRITICAL: Test assertion failure function __igt_unique____real_main84, file ../tests/core_getversion.c:91:
(core_getversion:28545) CRITICAL: Failed assertion: fd >= 0
(core_getversion:28545) CRITICAL: Last errno: 2, No such file or directory
(core_getversion:28545) CRITICAL: file descriptor fd failed
(core_getversion:28545) igt_core-INFO: Stack trace:
(core_getversion:28545) igt_core-INFO:   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
(core_getversion:28545) igt_core-INFO:   #1 ../tests/core_getversion.c:106 __igt_unique____real_main84()
(core_getversion:28545) igt_core-INFO:   #2 ../tests/core_getversion.c:84 main()
(core_getversion:28545) igt_core-INFO:   #3 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
(core_getversion:28545) igt_core-INFO:   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
(core_getversion:28545) igt_core-INFO:   #5 [_start+0x25]
****  END  ****
Subtest basic: FAIL (0.000s)

After a proposed fix:

$ sudo IGT_FORCE_DRIVER=vgem build/tests/core_getversion --r basic
IGT-Version: 2.2-NO-GIT (x86_64) (Linux: 6.14.0-33-generic x86_64)
Using IGT_SRANDOM=1760622054 for randomisation
Opened device: /dev/dri/card1
Starting subtest: basic
0: vgem v1.0 0 Virtual GEM provider
Subtest basic: SUCCESS (0.000s)


Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Mark Yacoub <markyacoub@google.com>
Cc: José Expósito <jose.exposito89@gmail.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (1):
  lib/drmtest: Fix device opening with DRIVER_ANY

 lib/drmtest.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.51.0

