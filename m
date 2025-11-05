Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF31DCCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 06:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727E810E177;
	Wed,  5 Nov 2025 06:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AljxZdf/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8576310E177
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 06:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762322452; x=1793858452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P+PlXBz/r1g2x3uk4x3gsc/xXTiaG7bNMvkVXczIgIE=;
 b=AljxZdf/sO7DMao1jN25NM+beSZ07rsM6iwOJr04dcA4aElhOsBq5gAb
 fzatvbW0ZDYmDRKS/KM1AfHyw+bymBdoYhEvhLVC0hwvdq7KGYYTbad9N
 gN7QT0nQPb5Qo0BJngyAGUJ7qI5l0+2+/RFY9RpXAcGqeaTZk/jBx/mLI
 Q5EYHWeH3l2548oQZT1t0Re3jnqui6hOuXwUaSmO4SpgdWPSrJnBiJSUr
 m+m3RGLR0ztlYy8703kPOWva7ym6Ip/ACZYaa4GESL6Rl6rgM2svqFQ2v
 QS+AU7PGkJLYaIZqrv/cWwcShgy2j9lBa4AYe35tAQHH0EyMlg6pzUUj0 Q==;
X-CSE-ConnectionGUID: m+gitg5GQ4uscNcJ7wNMMg==
X-CSE-MsgGUID: Zdqy8ldJSMagf4nrD136xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89891808"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="89891808"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 22:00:51 -0800
X-CSE-ConnectionGUID: reBGiucLSVGiFcy+78o72A==
X-CSE-MsgGUID: vuDt4zkCQmujh87kuk5UAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="186652013"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 04 Nov 2025 22:00:50 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/4] tools/displaytop: Series to add Display Top tool
Date: Wed,  5 Nov 2025 11:39:10 +0530
Message-Id: <20251105060914.673664-1-pranay.samala@intel.com>
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

Adith Narein T (4):
  tools/displaytop: Add Display Top - a terminal-based display pipeline
    monitor
  tools/displaytop: Add Display debugfs entry for display top
  tools/displaytop: Add DPCD register read support
  tools/displaytop: Add ftrace support to Display Top

 tools/displaytop/README.md                    |   81 +
 tools/displaytop/data/dpcd.json               | 4661 +++++++++++++++++
 tools/displaytop/include/data.h               |   53 +
 tools/displaytop/include/display.h            |   55 +
 tools/displaytop/include/log.h                |   49 +
 tools/displaytop/include/node.h               |  127 +
 tools/displaytop/include/populate.h           |   41 +
 tools/displaytop/include/utils.h              |  136 +
 tools/displaytop/meson.build                  |  118 +
 tools/displaytop/src/data.c                   |   43 +
 tools/displaytop/src/display.c                |  418 ++
 tools/displaytop/src/display_DPCD.c           |  252 +
 tools/displaytop/src/display_configuration.c  |  803 +++
 tools/displaytop/src/display_debugfs.c        |  124 +
 tools/displaytop/src/display_dump.c           |  199 +
 tools/displaytop/src/display_dump_tracing.c   |  133 +
 tools/displaytop/src/display_filter_tracing.c |  305 ++
 tools/displaytop/src/display_ftrace.c         |   98 +
 tools/displaytop/src/display_live_tracing.c   |  115 +
 tools/displaytop/src/display_search_bar.c     |  268 +
 tools/displaytop/src/display_summary.c        |  279 +
 tools/displaytop/src/log.c                    |   81 +
 tools/displaytop/src/main.c                   |   64 +
 tools/displaytop/src/node.c                   |  128 +
 tools/displaytop/src/populate.c               |   35 +
 tools/displaytop/src/populate_DPCD.c          |  233 +
 .../displaytop/src/populate_display_config.c  |  271 +
 .../displaytop/src/populate_display_debugfs.c |   96 +
 tools/displaytop/src/populate_ftrace.c        |   71 +
 tools/displaytop/src/utils.c                  |  163 +
 tools/displaytop/src/utils_cli.c              |   65 +
 tools/displaytop/src/utils_display.c          |  195 +
 tools/displaytop/src/utils_driver.c           |  186 +
 tools/displaytop/src/utils_drm.c              |  579 ++
 tools/displaytop/src/utils_registers.c        |   88 +
 tools/displaytop/src/utils_search.c           |   43 +
 tools/displaytop/src/utils_trace.c            |   61 +
 tools/meson.build                             |    1 +
 38 files changed, 10718 insertions(+)
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
2.34.1

