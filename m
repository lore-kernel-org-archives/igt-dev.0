Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB90DC19F4F
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 12:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F751128C3;
	Wed,  8 May 2024 12:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JROWLhn1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2F01128C3
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715172891; x=1746708891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Uypw/0rXqH7pMEZjXAAQESMgcVG+Y7Zhh56qFkvfza0=;
 b=JROWLhn1c7uRivBVT9eJ6X/n/aNEfxadFknP4sMhyOw8+M2N3DB41Fjo
 N8cRAdK/egc37a7+9uEZaA4tOTDgytbAPN3sg1f91oeWlG2uSg3sPGO39
 SP0UAb2Rj5ha8KTPVyADDJUC4tIeL+qbVjbO6tqPB9e9kuN2AdW6hE5vP
 vxRDGkKuUP4CMI4fdJgFsVsGI7uKbe11ROF9XpBuzhNsoE9CcGT88cG0M
 G43TSgJSKgFZKSeCp7qZ5Tb6LTUombcllsg2qkSTk+d5TaGy/nYeGtp8+
 U1svQE/GTbqUeJiyeGPIUkDRuCSo0v5+A+/xHmMRMdreUSbmVaTr2AVkC A==;
X-CSE-ConnectionGUID: 1B0jeu2eQBOeLthoc18/Rw==
X-CSE-MsgGUID: vLaggao+RbGhyZCH4m/Y9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10865066"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10865066"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:54:50 -0700
X-CSE-ConnectionGUID: F3aGCsjeTiqi/pgLewH9kQ==
X-CSE-MsgGUID: ly8CKNLtR367Vcp/ZQ4KQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33716307"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:54:48 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v4 00/11] Add render-copy compression on Xe+
Date: Wed,  8 May 2024 14:54:32 +0200
Message-Id: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
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

Fills the gap of testing render-copy compression with different
tilings.

v2: Extend cmds-info to collect supported tilings/compression for
    render copy

v3: Predefine simple tilings first, then complex (Karolina)
    Drop static test array in xe_intel_bb to be another
    helper function user (Karolina)

v4: Separate compression format between xe/xe2

Zbigniew Kempczyński (11):
  lib/intel_bufops: Store devid on buffer ops creation
  lib/intel_blt: Rename confusing fb tile to i915 tile
  lib/intel_blt: Add i915 -> blt tile helper converter
  lib/intel_bufops: Restrict tilings on non-flatccs platforms
  lib/intel_bufops: Start supporting compression on Xe2+
  lib/rendercopy_gen9: Separate xe and xe2 compression format
  lib/intel_cmds_info: Define tiling macros
  lib/intel_cmds_info: Introduce render tilings
  lib/intel_blt: Add render tilings and compression support helper
  tests/xe_render_copy: Add subtest which exercises compression
  tests/xe_intel_bb: Use supported tilings instead hardcoded ones

 lib/gen9_render.h            |  31 +++++---
 lib/intel_blt.c              |  54 +++++++++++++-
 lib/intel_blt.h              |   4 +-
 lib/intel_bufops.c           |  62 ++++++++++-----
 lib/intel_bufops.h           |   1 +
 lib/intel_cmds_info.c        | 141 ++++++++++++++++++-----------------
 lib/intel_cmds_info.h        |   6 ++
 lib/rendercopy_gen9.c        |  24 ++++--
 tests/intel/xe_intel_bb.c    |  25 +++----
 tests/intel/xe_render_copy.c |  93 +++++++++++++++++++++--
 10 files changed, 314 insertions(+), 127 deletions(-)

-- 
2.34.1

