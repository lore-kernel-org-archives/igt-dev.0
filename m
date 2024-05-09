Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A651C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 05:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F57A10E13E;
	Thu,  9 May 2024 05:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGfyM86w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECD910E13E
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 05:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715232849; x=1746768849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EksRBSAi7+wwd+VBSBDrUwNPfMZHyCJAF4sTekAoAGo=;
 b=RGfyM86wFs4wi7N/jdm9h7If9LjoWbqa7DwWia0uKf1O3veTtPwcBAiB
 CXg1A9T3dNLQR5P4ckV/CF4tpFoQEPCGwekj6RtvcR5CFzyfETCnqWQyg
 d2ksCycyiq9Dxuyce2Z8Thf3DhuggjXBUps9Z+ePspQ8lRNeq5T/OlVDH
 wlwkWIlgfoIAXTkYB4GAxKwuWpmIrHLKLUGYwnDcc7qmbL6TprRDVw8vR
 cVLD1QOffEQ9VVyk4vXpqEXEasUVofrju3ucSEgdxcfgIpuzEZ7XZiQQg
 zD+gA41Lksna2srmOk4dAFi0CUVCkhDJCxv+7SEJQL0amwsU5/U+gpFhW g==;
X-CSE-ConnectionGUID: QC1xzhjXTxW6jkMgw3SRIA==
X-CSE-MsgGUID: cQv6ClPgReuDsvk1DFXnWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11000857"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11000857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:34:08 -0700
X-CSE-ConnectionGUID: 5LmDO5mJTlOP4lndWZ4qiw==
X-CSE-MsgGUID: FMOn8SclQoio6cWts0ho7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="29654381"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:34:06 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5 00/11] Add render-copy compression on Xe+
Date: Thu,  9 May 2024 07:33:48 +0200
Message-Id: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
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

v5: Add missing pat index in intel-buf when compression is enabled
    (Matt)

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
 lib/intel_bufops.c           |  70 ++++++++++++-----
 lib/intel_bufops.h           |   1 +
 lib/intel_cmds_info.c        | 141 ++++++++++++++++++-----------------
 lib/intel_cmds_info.h        |   6 ++
 lib/rendercopy_gen9.c        |  24 ++++--
 tests/intel/xe_intel_bb.c    |  25 +++----
 tests/intel/xe_render_copy.c |  93 +++++++++++++++++++++--
 10 files changed, 321 insertions(+), 128 deletions(-)

-- 
2.34.1

