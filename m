Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9287CC43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 06:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DB410F656;
	Fri,  3 Jul 2026 06:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V5eqER+D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA19210F66C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 06:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783060717; x=1814596717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JaFeM6zTTbwR0/jRNwD+Md953vy1aO/4B8PsbabOZ10=;
 b=V5eqER+DFM1WjS1vSJYKbKsMjW3sJneDi4O76XY8guz3xkqKA4j0woXn
 24e9YSQ9DOjAD7ibk2lsvB2EIWDFoYFyo8eL67pA2yDTB7SospPINqxxE
 e90UXIDdLuhyKVj9Oye43n63dFV6O4hnql1yWiz+MJVajMPCwdFOHeUJM
 e91bJIlaVmR9+p4rNa3c6O1WzxbIfGakh/0AI7Qjf5Zdx8zcVAt8r2ayT
 l1y6hlk/9WbvfGT+2oGj6DnkR9T+xWBN/fqu6AJhIj0HOF7F26Oxixbbd
 AlNKhWwgN8yeA60giRiZBaHOt4zhHPad0ZaeP0E1zqqn1/wvB8E70hAsp Q==;
X-CSE-ConnectionGUID: gnxZdzepQTC8ZsBCGcgyng==
X-CSE-MsgGUID: Ue6antm8TSKZVf55qSDs4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="94168532"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="94168532"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:38:36 -0700
X-CSE-ConnectionGUID: hibcSw8YTKqKq2Pw2ipBAA==
X-CSE-MsgGUID: KiyL6hv6Q860WSKtm09PLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="291166941"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.245.97])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 23:38:36 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v5 i-g-t 0/7] Remove EUdebug tests
Date: Fri,  3 Jul 2026 08:38:14 +0200
Message-Id: <20260703063821.11560-1-dominik.karol.piatkowski@intel.com>
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
v3: Remove xe_eudebug_sriov test and EUdebug section from tests/meson
v4: Remove EUdebug library, experimental uapi and EUdebug section from meson
v5: Don't remove xe_eudebug meson option yet - breaks CI pipelines' build

Dominik Karol Piątkowski (7):
  tests/xe_eudebug: Remove xe_eudebug test
  tests/xe_exec_sip_eudebug: Remove xe_exec_sip_eudebug test
  tests/xe_eudebug_online: Remove xe_eudebug_online test
  tests/xe_eudebug_sriov: Remove xe_eudebug_sriov test
  tests/meson: Remove Xe EUdebug
  lib/xe_eudebug: Remove EUdebug library
  drm-uapi-experimental/xe_drm_eudebug: Remove EUdebug uapi

 .../drm-uapi-experimental/xe_drm_eudebug.h    |  355 --
 lib/meson.build                               |    7 +-
 lib/xe/xe_eudebug.c                           | 2566 --------------
 lib/xe/xe_eudebug.h                           |  273 --
 tests/intel/xe_eudebug.c                      | 2986 -----------------
 tests/intel/xe_eudebug_online.c               | 2819 ----------------
 .../xe_eudebug_online.c.gen.iga64_codes.c     |   86 -
 tests/intel/xe_eudebug_sriov.c                |  154 -
 tests/intel/xe_exec_sip_eudebug.c             |  367 --
 tests/meson.build                             |   12 -
 10 files changed, 1 insertion(+), 9624 deletions(-)
 delete mode 100644 include/drm-uapi-experimental/xe_drm_eudebug.h
 delete mode 100644 lib/xe/xe_eudebug.c
 delete mode 100644 lib/xe/xe_eudebug.h
 delete mode 100644 tests/intel/xe_eudebug.c
 delete mode 100644 tests/intel/xe_eudebug_online.c
 delete mode 100644 tests/intel/xe_eudebug_online.c.gen.iga64_codes.c
 delete mode 100644 tests/intel/xe_eudebug_sriov.c
 delete mode 100644 tests/intel/xe_exec_sip_eudebug.c

-- 
2.34.1

