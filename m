Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F4ACD98F2
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 12:08:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323EB10EE09;
	Thu, 18 Jun 2026 12:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wl2dhWLV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B48C10EE09
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 12:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781784507; x=1813320507;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dcjvBGT4jy1BrN4kAcCheVaWZxi1s0ooOS3ZsMYsJNo=;
 b=Wl2dhWLV0AvR2TJzX4U5E272sxH9xOjpYCix+2Y2tFbbs55zkyXN8poS
 d1p78ugbYzcWTR2z5bsSZlKHP1gj3CIbNo4BOVBJcHJl0N4MGd4nSgLC6
 MNS7Ooxrnc4UNdnep/hNGAmQTrSuwKv6/qMbAZLchFVpwFn1pVRTK94VJ
 7qFd0CjprCGQIzHo/XzPTi2qWN7Xysu9UO2rtt22xfcpBOyK318NN/p8W
 NMkWo7M5reyrxOGxvm40jL58rEtR+w8stHCLDfRnx/ieooBptz5xcj3gC
 nToYQY6JDf1vscrXmIWRdI/HCGms49X4LelKVQu6QYdKFb6VGC2uhhFYm A==;
X-CSE-ConnectionGUID: 552oBUTkTZqbjH9aJ5fU6g==
X-CSE-MsgGUID: fbY2f4hGQP+rzzuyXkhePQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81726097"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="81726097"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 05:08:22 -0700
X-CSE-ConnectionGUID: jCjPoWCdSHW+HEEZemvpqQ==
X-CSE-MsgGUID: ML7nxyrER1uhISwLXkjnqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="241973955"
Received: from amilburn-desk.amilburn-desk (HELO localhost.localdomain)
 ([10.245.244.8])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 05:08:20 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v2 i-g-t 0/3] Remove EUdebug tests
Date: Thu, 18 Jun 2026 14:08:04 +0200
Message-Id: <20260618120807.14377-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Remove EUdebug tests due to lack of upstream kernel with EUdebug
feature to be supported by them.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

v2: Rebase on upstream

Dominik Karol Piątkowski (3):
  tests/xe_eudebug: Remove xe_eudebug test
  tests/xe_exec_sip_eudebug: Remove xe_exec_sip_eudebug test
  tests/xe_eudebug_online: Remove xe_eudebug_online test

 lib/meson.build                               |    2 +-
 tests/intel/xe_eudebug.c                      | 2986 -----------------
 tests/intel/xe_eudebug_online.c               | 2819 ----------------
 .../xe_eudebug_online.c.gen.iga64_codes.c     |   86 -
 tests/intel/xe_exec_sip_eudebug.c             |  367 --
 tests/meson.build                             |    3 -
 6 files changed, 1 insertion(+), 6262 deletions(-)
 delete mode 100644 tests/intel/xe_eudebug.c
 delete mode 100644 tests/intel/xe_eudebug_online.c
 delete mode 100644 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
 delete mode 100644 tests/intel/xe_exec_sip_eudebug.c

-- 
2.34.1

