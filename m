Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FECD1D865
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 05:18:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E6210E00D;
	Thu,  4 Dec 2025 05:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNx489Ej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD1E10E00D
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 05:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764825513; x=1796361513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=icPCwennegkn3zujepsI20gNZ3TTiZC3+22NGgp0Kzc=;
 b=kNx489EjRG4BKqV3+R1AcKox4/UlXLsvSVAtlllr9zK7Cz9z5aknKjeP
 G02C35Mxb/2EJl5TrfR3YAxVd8xgRCmhrd7Phfs/c8OIHk6mf33WqhnYB
 9vF8+l5PRcXhftAq8e+gZqmm2ScJmloxNjxVhdFyZqauR7dfMCX9n1dBj
 USDVUb0HTG2UUDVcS0W2IrxmOwZTsoQ/uHB8aa5WLRHAkaSNw7Wu7vKvx
 A9VujXJ9kYfPyPaErv/rSxZmiyFM/WbRWtAiFaY0XbTaMaBCAFFXnpqYd
 CxDQYOHUWeF1PB1gWOM/uSPKnGljt1GRjhUCyPlKRBtOhWvIibQOhqP3+ g==;
X-CSE-ConnectionGUID: dHbC/AjJSC2s3994piem4Q==
X-CSE-MsgGUID: zUr1jHB8RYeqv5lKtTWhew==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92314595"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92314595"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 21:18:32 -0800
X-CSE-ConnectionGUID: GvsA2q3pTTy6sRCT9Hgbjw==
X-CSE-MsgGUID: 6RsBmm7ETAirTR/O5cBMfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199303578"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa005.fm.intel.com with ESMTP; 03 Dec 2025 21:18:31 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 0/4] tools/displaytop: Series to add Display Top tool
Date: Thu,  4 Dec 2025 10:56:54 +0530
Message-Id: <20251204052658.232429-1-pranay.samala@intel.com>
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

This patch series introduces the Display Top tool — a terminal-based
monitoring utility focused on the display pipeline.

Display Top reads real-time display metrics from debugfs, DPCD registers,
and ftrace logs to help developers and testers analyze display behavior,
bottlenecks, and event sequences.

The series adds:
 - A curses-based terminal UI tool
 - A debugfs entry to expose display pipeline stats
 - DPCD register read integration
 - Basic ftrace parsing support
 - Provides the ability to dump data for all of the above features

v2:
- Rebased the patch series on top of the latest IGT
- Fixed coding style and formatting improvements

v3:
- Code refactoring
- Edit license header (Karthik)
- Replace with all the possible existing igt helpers (Karthik)

Adith Narein T (4):
  tools/displaytop: Add Display Top - a terminal-based display pipeline
    monitor
  tools/displaytop: Add Display debugfs entry for display top
  tools/displaytop: Add DPCD register read support
  tools/displaytop: Add ftrace support to Display Top

 tools/displaytop/README.md                    |   47 +
 tools/displaytop/data/dpcd.json               | 4661 +++++++++++++++++
 tools/displaytop/include/data.h               |   31 +
 tools/displaytop/include/display.h            |   32 +
 tools/displaytop/include/node.h               |  106 +
 tools/displaytop/include/populate.h           |   20 +
 tools/displaytop/include/utils.h              |  108 +
 tools/displaytop/meson.build                  |   86 +
 tools/displaytop/src/data.c                   |   22 +
 tools/displaytop/src/display.c                |  417 ++
 tools/displaytop/src/display_DPCD.c           |  232 +
 tools/displaytop/src/display_configuration.c  |  783 +++
 tools/displaytop/src/display_debugfs.c        |  103 +
 tools/displaytop/src/display_dump.c           |  162 +
 tools/displaytop/src/display_dump_tracing.c   |  113 +
 tools/displaytop/src/display_filter_tracing.c |  285 +
 tools/displaytop/src/display_ftrace.c         |   77 +
 tools/displaytop/src/display_live_tracing.c   |   95 +
 tools/displaytop/src/display_search_bar.c     |  246 +
 tools/displaytop/src/display_summary.c        |  258 +
 tools/displaytop/src/main.c                   |   40 +
 tools/displaytop/src/node.c                   |  107 +
 tools/displaytop/src/populate.c               |   14 +
 tools/displaytop/src/populate_DPCD.c          |  198 +
 .../displaytop/src/populate_display_config.c  |  211 +
 .../displaytop/src/populate_display_debugfs.c |   72 +
 tools/displaytop/src/populate_ftrace.c        |   36 +
 tools/displaytop/src/utils.c                  |  139 +
 tools/displaytop/src/utils_cli.c              |   44 +
 tools/displaytop/src/utils_display.c          |  174 +
 tools/displaytop/src/utils_driver.c           |  134 +
 tools/displaytop/src/utils_drm.c              |  242 +
 tools/displaytop/src/utils_registers.c        |   67 +
 tools/displaytop/src/utils_search.c           |   22 +
 tools/displaytop/src/utils_trace.c            |   41 +
 tools/meson.build                             |    1 +
 36 files changed, 9426 insertions(+)
 create mode 100644 tools/displaytop/README.md
 create mode 100644 tools/displaytop/data/dpcd.json
 create mode 100644 tools/displaytop/include/data.h
 create mode 100644 tools/displaytop/include/display.h
 create mode 100644 tools/displaytop/include/node.h
 create mode 100644 tools/displaytop/include/populate.h
 create mode 100644 tools/displaytop/include/utils.h
 create mode 100644 tools/displaytop/meson.build
 create mode 100644 tools/displaytop/src/data.c
 create mode 100644 tools/displaytop/src/display.c
 create mode 100644 tools/displaytop/src/display_DPCD.c
 create mode 100644 tools/displaytop/src/display_configuration.c
 create mode 100644 tools/displaytop/src/display_debugfs.c
 create mode 100644 tools/displaytop/src/display_dump.c
 create mode 100644 tools/displaytop/src/display_dump_tracing.c
 create mode 100644 tools/displaytop/src/display_filter_tracing.c
 create mode 100644 tools/displaytop/src/display_ftrace.c
 create mode 100644 tools/displaytop/src/display_live_tracing.c
 create mode 100644 tools/displaytop/src/display_search_bar.c
 create mode 100644 tools/displaytop/src/display_summary.c
 create mode 100644 tools/displaytop/src/main.c
 create mode 100644 tools/displaytop/src/node.c
 create mode 100644 tools/displaytop/src/populate.c
 create mode 100644 tools/displaytop/src/populate_DPCD.c
 create mode 100644 tools/displaytop/src/populate_display_config.c
 create mode 100644 tools/displaytop/src/populate_display_debugfs.c
 create mode 100644 tools/displaytop/src/populate_ftrace.c
 create mode 100644 tools/displaytop/src/utils.c
 create mode 100644 tools/displaytop/src/utils_cli.c
 create mode 100644 tools/displaytop/src/utils_display.c
 create mode 100644 tools/displaytop/src/utils_driver.c
 create mode 100644 tools/displaytop/src/utils_drm.c
 create mode 100644 tools/displaytop/src/utils_registers.c
 create mode 100644 tools/displaytop/src/utils_search.c
 create mode 100644 tools/displaytop/src/utils_trace.c

-- 
2.34.1

