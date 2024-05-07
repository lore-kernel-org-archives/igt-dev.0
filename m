Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10988C25B4F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 07:58:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5FE10ED3E;
	Tue,  7 May 2024 07:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HN0gtLRT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5033A10FDAA
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715068729; x=1746604729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2tG5KIZdKg/nFD5BtNUoLDIFM9Tu/bMzzVw14yCNFKI=;
 b=HN0gtLRToDVbnU6GKD2r5n+6Duy5nji3cR+hMmQg0XY6Su/0KJ/uglWV
 DWPRbA7wCB3Vh3UMXbgrP/ES2yX0JVLXCux37HQPezXZt4mrWPXBxJWlW
 keLGRokyviOc8cwouMzHSmigSBtnPN4JOMnob7BPjBacVrMeC3yqlAQCO
 1rvW/0XWJtDX6tE+3I73z3voLsRlERoCJEr3TMW9ptnFJjugvLXTEfxpZ
 WXaeXGn8KpyWvIq4ffADS1dMomqD6ud23FKl8mo8xpIrfe0ucX/GPf3Uv
 P5d8HFSxNNsR1tEJ5cwfyHsNx4hAWLHP5+428z4cvPQXivqvFPTiyGMnV g==;
X-CSE-ConnectionGUID: zfguqygFRs6dBWXKZT649A==
X-CSE-MsgGUID: jpGq/UE9R36a5/Zy2i3Zbg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14656296"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="14656296"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:58:48 -0700
X-CSE-ConnectionGUID: Vf0y7XLYSJed/5WpOzqN2w==
X-CSE-MsgGUID: qH+RhE4NS0mejsz7vcvf6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="32943806"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:58:47 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 00/11] Add render-copy compression on Xe+
Date: Tue,  7 May 2024 09:58:25 +0200
Message-Id: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
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

Zbigniew Kempczyński (11):
  lib/intel_bufops: Store devid on buffer ops creation
  lib/intel_blt: Rename confusing fb tile to i915 tile
  lib/intel_blt: Add i915 -> blt tile helper converter
  lib/intel_bufops: Restrict tilings on non-flatccs platforms
  lib/intel_bufops: Start supporting compression on Xe2+
  lib/rendercopy_gen9: Allow to use all tilings on flatccs platforms
  lib/intel_cmds_info: Define tiling macros
  lib/intel_cmds_info: Introduce render tilings
  lib/intel_blt: Add render tilings and compression support helper
  tests/xe_render_copy: Add subtest which exercises compression
  tests/xe_intel_bb: Use supported tilings instead hardcoded ones

 lib/intel_blt.c              |  54 +++++++++++++-
 lib/intel_blt.h              |   4 +-
 lib/intel_bufops.c           |  62 ++++++++++-----
 lib/intel_bufops.h           |   1 +
 lib/intel_cmds_info.c        | 141 ++++++++++++++++++-----------------
 lib/intel_cmds_info.h        |   6 ++
 lib/rendercopy_gen9.c        |   2 +-
 tests/intel/xe_intel_bb.c    |  25 +++----
 tests/intel/xe_render_copy.c |  93 +++++++++++++++++++++--
 9 files changed, 278 insertions(+), 110 deletions(-)

-- 
2.34.1

