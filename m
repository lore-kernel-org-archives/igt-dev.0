Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2088AC54FB3
	for <igt-dev@archiver.kernel.org>; Thu, 29 May 2025 14:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36C210E72E;
	Thu, 29 May 2025 14:25:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUD5d6R0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B118710E72E
 for <igt-dev@lists.freedesktop.org>; Thu, 29 May 2025 14:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748528724; x=1780064724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dauvk52MIHvdOMK1jXkaGS2TuuPBmA9m5U+shnrpczU=;
 b=XUD5d6R0GrUJAZSm86CRepFF2px3P7gpydSED8QGNJQjakKbF4SBPNvp
 3To5J1XQeCPdXim8/73e2/8dFVmJfE5O82pT/JTAxiwGszQ/2x33S/SAB
 Ny6ufjVsYmclyog9/T+KR5kidJhyehXwTLGfzIA7n22vD60mbsfPB6ssu
 sNtN2bRqcXhW0VCr/X+wfixkIOodAoTyVKOS/Su7tn92rdrahcboEhCke
 WIx5HQvxjF2Z7p8Nf9+C8cVWRtHPDz+gLblDs0GpiPTk4PaZD8/XtIbvr
 UU2fWRyehQKMYTtqHPSFcGWxx/jLWqJOT6JHxh5xWoxXmjlxt6JDolyDN Q==;
X-CSE-ConnectionGUID: tntbp2X4SAqsI1CkKIszkA==
X-CSE-MsgGUID: 6N7NpSOvSFGIl87yJIfeyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50477180"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50477180"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 07:25:24 -0700
X-CSE-ConnectionGUID: HE7zVlzqT3yXkJMjBQi8SA==
X-CSE-MsgGUID: jdev6yXtQDqwB2MU6hH07g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="166753034"
Received: from unknown (HELO adith-NUC7i7BNH.iind.intel.com) ([10.227.91.1])
 by fmviesa002.fm.intel.com with ESMTP; 29 May 2025 07:25:20 -0700
From: Adith Narein T <adith.narein.t@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, adithnarein1305@gmail.com,
 uma.shankar@intel.com, kamil.konieczny@intel.com, arun.r.murthy@intel.com,
 jani.saarinen@intel.com, ville.syrjala@intel.com, karthik.b.s@intel.com,
 pranay.samala@intel.com, suresh.kumar.kurmi@intel.com,
 Adith Narein T <adith.narein.t@intel.com>
Subject: [PATCH i-g-t 0/4] tools/displaytop: Series to add Display Top tool
Date: Thu, 29 May 2025 19:53:39 +0530
Message-ID: <20250529142401.2474-1-adith.narein.t@intel.com>
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

Adith Narein T (4):
  tools/displaytop: Add Display Top - a terminal-based display pipeline
    monitor
  tools/displaytop: Add Display debugfs entry for display top
  tools/displaytop: Add DPCD register read support
  tools/displaytop: Add ftrace support to Display Top

 tools/displaytop/README.md                    |   81 +
 tools/displaytop/data/dpcd.json               | 4661 +++++++++++++++++
 tools/displaytop/include/data.h               |   53 +
 tools/displaytop/include/display.h            |   54 +
 tools/displaytop/include/log.h                |   45 +
 tools/displaytop/include/node.h               |  126 +
 tools/displaytop/include/populate.h           |   40 +
 tools/displaytop/include/utils.h              |  126 +
 tools/displaytop/meson.build                  |  113 +
 tools/displaytop/src/data.c                   |   42 +
 tools/displaytop/src/display.c                |  480 ++
 tools/displaytop/src/display_DPCD.c           |  277 +
 tools/displaytop/src/display_configuration.c  |  877 ++++
 tools/displaytop/src/display_debugfs.c        |  133 +
 tools/displaytop/src/display_dump.c           |  215 +
 tools/displaytop/src/display_dump_tracing.c   |  135 +
 tools/displaytop/src/display_filter_tracing.c |  318 ++
 tools/displaytop/src/display_ftrace.c         |   97 +
 tools/displaytop/src/display_live_tracing.c   |  124 +
 tools/displaytop/src/display_search_bar.c     |  281 +
 tools/displaytop/src/display_summary.c        |  308 ++
 tools/displaytop/src/log.c                    |   84 +
 tools/displaytop/src/main.c                   |   63 +
 tools/displaytop/src/node.c                   |  140 +
 tools/displaytop/src/populate.c               |   35 +
 tools/displaytop/src/populate_DPCD.c          |  250 +
 .../displaytop/src/populate_display_config.c  |  295 ++
 .../displaytop/src/populate_display_debugfs.c |   99 +
 tools/displaytop/src/populate_ftrace.c        |   78 +
 tools/displaytop/src/utils.c                  |  168 +
 tools/displaytop/src/utils_cli.c              |   70 +
 tools/displaytop/src/utils_display.c          |  195 +
 tools/displaytop/src/utils_driver.c           |  243 +
 tools/displaytop/src/utils_drm.c              |  585 +++
 tools/displaytop/src/utils_registers.c        |   97 +
 tools/displaytop/src/utils_search.c           |   49 +
 tools/displaytop/src/utils_trace.c            |   67 +
 tools/meson.build                             |    1 +
 38 files changed, 11105 insertions(+)
 create mode 100644 tools/displaytop/README.md
 create mode 100644 tools/displaytop/data/dpcd.json
 create mode 100644 tools/displaytop/include/data.h
 create mode 100644 tools/displaytop/include/display.h
 create mode 100644 tools/displaytop/include/log.h
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
 create mode 100644 tools/displaytop/src/log.c
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
2.43.0

