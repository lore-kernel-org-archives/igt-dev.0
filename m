Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ACFC43458
	for <igt-dev@archiver.kernel.org>; Wed,  1 Jul 2026 12:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AAA10E9EE;
	Wed,  1 Jul 2026 12:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCAR0Shn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36E210E9EE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2026 12:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782907923; x=1814443923;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HdLZp6jPU/+JPCbg8zo3qN9zEL045YxTEZdc+ORe3wU=;
 b=RCAR0ShnZgoWg7IfmN8M06KlnekgJSJ/v/epW23qftLm4pzEigF4rD1x
 aBBsoxLDJIdefmbFBFp3Ie2Oe7M+upjb2Or8CappXzL485/PuDzi7xD6M
 jhiSW+b55PpkcM0fP1UxOPMFPCmY4vVfl6h0eMrmqPLZZHEknmt/Yxx7D
 zy0EpJlm6vYBNitDn+UGDOWtWJnf/LUJ9XlhItQCxuQpLAjYwaR9xVL3A
 pUgjsdDFWcMxgjCEunu/zWKQpAk5viOnsJgCDcGP+iDj19P9ez8Dvvk5k
 Y8PdirL+EaCMyjUabMLNdfiCayJquURXIDc1zbssendmAihN27UkFeRLa Q==;
X-CSE-ConnectionGUID: EAvsBKWKR3++pLeSPUG+6A==
X-CSE-MsgGUID: wKTT6kKfSjikHZTHjYcamg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83414358"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="83414358"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 05:12:02 -0700
X-CSE-ConnectionGUID: p3pVlEH2Rl+ihRZeg0ymtg==
X-CSE-MsgGUID: NiocbTthRAqRy5IU1n1CaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="254477191"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.244.55])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 05:12:01 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v4 i-g-t 0/8] Remove EUdebug tests
Date: Wed,  1 Jul 2026 14:11:41 +0200
Message-Id: <20260701121149.16639-1-dominik.karol.piatkowski@intel.com>
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

Dominik Karol Piątkowski (8):
  tests/xe_eudebug: Remove xe_eudebug test
  tests/xe_exec_sip_eudebug: Remove xe_exec_sip_eudebug test
  tests/xe_eudebug_online: Remove xe_eudebug_online test
  tests/xe_eudebug_sriov: Remove xe_eudebug_sriov test
  tests/meson: Remove Xe EUdebug
  lib/xe_eudebug: Remove EUdebug library
  drm-uapi-experimental/xe_drm_eudebug: Remove EUdebug uapi
  meson: Remove Xe EUdebug

 .../drm-uapi-experimental/xe_drm_eudebug.h    |  355 --
 lib/meson.build                               |    7 +-
 lib/xe/xe_eudebug.c                           | 2566 --------------
 lib/xe/xe_eudebug.h                           |  273 --
 meson.build                                   |    2 -
 meson_options.txt                             |    5 -
 tests/intel/xe_eudebug.c                      | 2986 -----------------
 tests/intel/xe_eudebug_online.c               | 2819 ----------------
 .../xe_eudebug_online.c.gen.iga64_codes.c     |   86 -
 tests/intel/xe_eudebug_sriov.c                |  154 -
 tests/intel/xe_exec_sip_eudebug.c             |  367 --
 tests/meson.build                             |   12 -
 12 files changed, 1 insertion(+), 9631 deletions(-)
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

