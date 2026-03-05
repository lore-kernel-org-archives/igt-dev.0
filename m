Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012B6EDEC1D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 05:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8088110EB0B;
	Thu,  5 Mar 2026 05:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeNbhu8w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272E410EB0B
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 05:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772688861; x=1804224861;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AU1z+DoIK3aVuZEbUCCCntEJOUnK0Y+gx34M1Ei4RGo=;
 b=BeNbhu8wPpl4rcxPHk8NdOFL+ir//ZjzBSJxs9uj4NnYDEemp3KBT2+Y
 mcv8Ep/AHJsmC9PFx+KGNXStugvVyBZKUu8oizewCR0g1HxBx7I1oWf1g
 WNUEKp8CEbR4m/X1WLVA5FwtFNrU9lpD2GuW5yEXHXrWDhBQa/l874TNu
 GAKNrFellhnwc1+w/TJycysiYI41Js6E5Pxzn5JxnAOPbTKpaGSvkAoVW
 p3MbzNIyEBkKmhhKNekovh+rfRlnSt4src8PW1YDx+fUg18qcO7AGq+ez
 fFQaH/RNMARZvfYv9VuK9jqQObgA60d7qaBLwgJShbdnpVrFrMVyJlmzM w==;
X-CSE-ConnectionGUID: bqYuZzKCRmuI62FK7P1fGw==
X-CSE-MsgGUID: cw9wFb7YTxqrnb40svk4fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73833737"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="73833737"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 21:34:21 -0800
X-CSE-ConnectionGUID: HHTv1GTLRK6bzWpGawunpQ==
X-CSE-MsgGUID: cACo35+XSAaKVWrgop0x8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="216388792"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2026 21:34:19 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t v3 0/5] Add support for xe3p and prefetch fault test
Date: Thu,  5 Mar 2026 11:04:14 +0530
Message-ID: <20260305053413.1734922-7-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Patch series contain:
Introduce gpu execution commands for an efficient 64bit mode.
Add support for xe3p efficient 64bit addressing.
Add canonical helper for 48/57 bit vas.
Add support for xe3p and xe3 in generate_iga64_codes scripts.
Add prefetch fault test.

v2: Address comments related to xe_canonical_va, use it wherever
required. Make some minute changes.

v3: Remove unrequired graphics version and update graphic platform.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com> 

Andrzej Hajda (1):
  lib/gpgpu_shader: Add support for xe3p efficient 64bit addressing

Gwan-gyeong Mun (1):
  lib/[gpu_cmds|xehp_media]: Introduce gpu execution commands for an
    efficient 64bit mode.

Priyanka Dandamudi (2):
  scripts/generate_iga64_codes: Add support for xe3p and xe3
  tests/intel/xe_prefetch_fault: Add test for prefetch fault

Zbigniew Kempczyński (1):
  lib/xe_util.h: add canonical helper for 48/57 bit vas

 include/intel_gpu_commands.h                  |   1 +
 lib/gpgpu_fill.c.gen.iga64_codes.c            |   2 +-
 lib/gpgpu_shader.c                            |  63 +++++-
 lib/gpgpu_shader.c.gen.iga64_codes.c          | 196 +++++++++++++++-
 lib/gpu_cmds.c                                | 208 +++++++++++++++++
 lib/gpu_cmds.h                                |  17 ++
 lib/iga64_macros.h                            |   5 +-
 lib/meson.build                               |   2 +-
 lib/xe/xe_util.h                              |   5 +
 lib/xehp_media.h                              |  65 ++++++
 scripts/generate_iga64_codes                  |   2 +-
 .../xe_eudebug_online.c.gen.iga64_codes.c     |  45 +++-
 tests/intel/xe_prefetch_fault.c               | 212 ++++++++++++++++++
 .../xe_prefetch_fault.c.gen.iga64_codes.c     |  21 ++
 tests/meson.build                             |   1 +
 15 files changed, 838 insertions(+), 7 deletions(-)
 create mode 100644 tests/intel/xe_prefetch_fault.c
 create mode 100644 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c

-- 
2.43.0

