Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A6CE67A69
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 05:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0773910E630;
	Tue,  3 Mar 2026 05:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIGwz7ht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83C210E62F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 05:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772515867; x=1804051867;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/MX/D1zCk5aeFLlQG08NC3hE5PKt2/wf/C5bsZjwvRQ=;
 b=TIGwz7htqrYYe+68u4kDYSzoNnCwK1m3TB9as8omhVxyTY/BJ2d5ZbMq
 XmbOEAmmftfWszkT+OS7/Kq3Kc9CRlMyY6cWdDFlI3Jod7nsQwx7BgBsw
 +4RkLv4Bl3z+PUyZxGGFOno2jrYu6GmoBxfSwPeCBSHHBBkFbmHGr4KEo
 eW9iUkYSWHVwg6nO0Dj7RvyaCqEWDrMcPLbbSLhfL5Zg8tGoVUfqW/Xs/
 kIk6UBqXt5kSYt3zTa8SzA8kKREA+6QvRBvwnda/nmO3NGpbhG2icWAP+
 d0H5RDb/yYbE+B/v8nEGo3KljM6moWufp1FGE6gEGyKJPt2nf+ZUgE2zG w==;
X-CSE-ConnectionGUID: 71g0pJnJSTm0+pMkjb0Ctg==
X-CSE-MsgGUID: Kg3+eTS2QGuhrM6YTa36HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84630036"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="84630036"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 21:31:06 -0800
X-CSE-ConnectionGUID: HLvYU5lLSquRaeSN/MqLKQ==
X-CSE-MsgGUID: +KB1yE4zQTeBX/voOeM6rg==
X-ExtLoop1: 1
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2026 21:31:04 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com,
 zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com
Subject: [PATCH i-g-t v2 0/5] Add support for xe3p and prefetch fault test
Date: Tue,  3 Mar 2026 11:00:59 +0530
Message-ID: <20260303053104.1674811-1-priyanka.dandamudi@intel.com>
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
Add canonical helper for 48/57 bit vas
Add support for xe3p and xe3 in generate_iga64_codes scripts.
Add prefetch fault test.

v2: Address comments related to xe_canonical_va, use it wherever
required. Make some minute changes.

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
 lib/gpgpu_shader.c                            |  75 +++++-
 lib/gpgpu_shader.c.gen.iga64_codes.c          | 196 +++++++++++++++-
 lib/gpu_cmds.c                                | 208 +++++++++++++++++
 lib/gpu_cmds.h                                |  17 ++
 lib/iga64_macros.h                            |   5 +-
 lib/meson.build                               |   2 +-
 lib/xe/xe_util.h                              |   5 +
 lib/xehp_media.h                              |  65 ++++++
 scripts/generate_iga64_codes                  |   2 +-
 .../xe_eudebug_online.c.gen.iga64_codes.c     |  45 +++-
 tests/intel/xe_prefetch_fault.c               | 215 ++++++++++++++++++
 .../xe_prefetch_fault.c.gen.iga64_codes.c     |  21 ++
 tests/meson.build                             |   1 +
 15 files changed, 847 insertions(+), 13 deletions(-)
 create mode 100644 tests/intel/xe_prefetch_fault.c
 create mode 100644 tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c

-- 
2.43.0

