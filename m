Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B610BC71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 08:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624F010E2E4;
	Mon, 16 Jun 2025 08:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l0Mnj2Aw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E90FD10E2E4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 08:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750064074; x=1781600074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HB+V76zBkr8evroPd2O22tvRM1ADc1q9byiOxqPAAoI=;
 b=l0Mnj2AwAZhGUSrG9b1bsjyRnfwSSP2E05XMu4koL/BSfnad/0WJCZUX
 E+ITyAcj/7Oh+n8DfpPU2Rb305P8NxaEXFUEbGlf429d/KMCRC5mxrpX6
 fpesvHtNxMGFgqf0tQ5+QdIR3rpigztQwyulnPNCpX/rGa+9PsymY20Jg
 vGFQaoQ6reU/D6v0BdIpl/Orw+gZAcc6KdPX/03ZyAj2HS4P9qq9IgkQd
 LLcDU1GXndXK+9aIdwC+dl7kwNLOHkBixXUpEggJigXVUKvuLXdORcr1X
 LxUE6GtLv8qhSFRYmkP6/MD31lbXNnL+xeus4+64EZ+uU44kzJ1YjpcVy A==;
X-CSE-ConnectionGUID: HH8UTLk/SsS6c8zJoxuRGw==
X-CSE-MsgGUID: t5A2vzu8RcaGqcUpgVQd8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63615228"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="63615228"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:54:34 -0700
X-CSE-ConnectionGUID: fUreDni0Rr28QX9Ixxla/A==
X-CSE-MsgGUID: dshbibUwRd6h3mq7AcmK3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153285696"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:54:32 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, kamil.konieczny@intel.com, lukasz.laguna@intel.com
Subject: [PATCH i-g-t v2 0/2] tests/xe: Use NEEDS_VISIBLE_VRAM flag
Date: Mon, 16 Jun 2025 10:54:15 +0200
Message-Id: <20250616085417.20178-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Set DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM flag when creating BOs
that will be CPU-mapped, to ensure that the corresponding VRAM
allocation will use the CPU accessible part of VRAM.

This is essential for small-bar systems, where omitting the flag may
cause failures or SIGBUS crashes due to the CPU accessing non-visible
VRAM.

Additionally, in xe_exec_atomic test, replace
I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS with the correct
DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM.

v2: Split patches (Kamil)

Lukasz Laguna (2):
  tests/intel/xe_*: Use NEEDS_VISIBLE_VRAM flag where it's missing
  tests/intel/xe_exec_atomic: Fix incorrect GEM create flag

 tests/intel/xe_exec_atomic.c | 2 +-
 tests/intel/xe_pat.c         | 3 ++-
 tests/intel/xe_spin_batch.c  | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.40.0

