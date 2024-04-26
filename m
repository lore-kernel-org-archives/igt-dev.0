Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95A1C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4560910EF1B;
	Fri, 26 Apr 2024 09:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HeC2HReI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1CE10EF1B
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122085; x=1745658085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qEW21HLwQ4x1Qx6ckqUB5i23GVN0SrYb7NmtK2wu/Gc=;
 b=HeC2HReIBUr+PxvApqyU2Vrs71/czhXq2mCg6srTEWW0h1R0iBt2EV1A
 EyQdjy7tvYyMrsm+hntj10+1Mo8XMHSftuL0wykK83TPW68hiiQU9Ss1/
 vTrGKdVp5uj5eZ03S3ptc63nSZxCUUVwQEp8uO6uy+ZVcIKxmmDPuLSSn
 jFzb844IvqsluTM68B4+NUMdqjtTZByqzvtOyZCbXxo92TbnciJ0KfLu6
 ro+C0EkcDbL9M0+BjY4uyXlzPFftnXXPmllU/DHWDaDBpMvZ+/f1gBSoN
 OVoTMpl0WbXw7oU1rlbaDYzxuk0ZLG6FSNmZ0oc8evHu9+5i/FLHsRql7 w==;
X-CSE-ConnectionGUID: EpgE58FxR/GFR0PiABFaZg==
X-CSE-MsgGUID: NWNwI/lOQzSw1J4eNIYOgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20537301"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="20537301"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:24 -0700
X-CSE-ConnectionGUID: gZL5e3tTQFipjKnIBCiaxg==
X-CSE-MsgGUID: W01w5zbCTs6FHG3NqjDDUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25867020"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:23 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 00/10] Add render-copy compression on Xe+
Date: Fri, 26 Apr 2024 11:01:07 +0200
Message-Id: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
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

Zbigniew Kempczyński (10):
  lib/intel_bufops: Store devid on buffer ops creation
  lib/intel_blt: Rename confusing fb tile to i915 tile
  lib/intel_blt: Add i915 -> blt tile helper converter
  lib/intel_bufops: Drop tilings restrictions
  lib/intel_bufops: Start supporting compression on Xe2+
  lib/rendercopy_gen9: Allow to use all tilings on flatccs platforms
  lib/intel_cmds_info: Define tiling macros
  lib/intel_cmds_info: Introduce render tilings
  lib/intel_blt: Add render tilings and compression support helper
  tests/xe_render_copy: Add subtest which exercises compression

 lib/intel_blt.c              |  54 +++++++++++++-
 lib/intel_blt.h              |   4 +-
 lib/intel_bufops.c           |  46 +++++++++---
 lib/intel_bufops.h           |   1 +
 lib/intel_cmds_info.c        | 136 +++++++++++++++++------------------
 lib/intel_cmds_info.h        |   6 ++
 lib/rendercopy_gen9.c        |   2 +-
 tests/intel/xe_render_copy.c |  93 ++++++++++++++++++++++--
 8 files changed, 254 insertions(+), 88 deletions(-)

-- 
2.34.1

