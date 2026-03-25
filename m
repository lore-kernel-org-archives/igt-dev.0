Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB28A109C034
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 15:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D02410E7BC;
	Wed, 25 Mar 2026 15:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0+0LY5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6425010E7BC
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453053; x=1805989053;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a5E3uBWrkGPrI52wqYh5N2Z8RBW2aUvVUrLXhfPpyT0=;
 b=H0+0LY5XJ3fxz3tM3nk7wQAiXvEkqJhNrINZlD/qAq7m36WCPyLOYT8D
 MvBalg8oNqIqpzfdLlzNBRulZufMTCCI44DSZHnoF5zE8SJ7JbanK1is2
 i5DNy8ldXcDq76QfxkTXvu8vkt5XM9kmGX/4vKenxs2O6CdxOxAXFLs1Q
 +tQtOadic+jMJsnWNJRSEW5XeQ5Rj3VrZu3+6uOekDO/tYGICTZkiICs5
 06MkIuHoDVhyyhy4Vx9Voez5F/yL0e8xJKlZmXBC5BjaFPFtECX9nzbDx
 WsiqjBxQA7YQ/Lis46THnWQb7b/fOLPdqzNj31eoib2LN5d/4oBPDfFH7 Q==;
X-CSE-ConnectionGUID: m7by0B9KS6qZP+VboWQGTw==
X-CSE-MsgGUID: p36ruczdSFGqM5c9QJ6dXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75209528"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75209528"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:37:33 -0700
X-CSE-ConnectionGUID: SiPFTt9EToCqejkqJHP69A==
X-CSE-MsgGUID: aXB/TrqHTbayv8m+V6+VOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="228784587"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:37:28 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 tvrtko.ursulin@igalia.com, tursulin@ursulin.net, lucas.de.marchi@gmail.com
Subject: [PATCH i-g-t v9 0/5] Close any open drm device after engine
 initialization in GPUTOP
Date: Wed, 25 Mar 2026 21:00:33 +0530
Message-Id: <20260325153038.2099329-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

       During engine initialization for a specific device, the helper
functions require an open card_fd to query engines and configurations
needed to compute engine busyness via PMU. However, KMS tests require
that no other DRM client be active, and keeping card_fd open causes
gputop to appear as a DRM client. Therefore, card_fd is closed immediately
after discovery.
     Additionally, this patch removes the lib/xe/* dependency and perform
engine discovery using direct ioctl calls, simplifying the implementation
and reducing external dependencies, while also providing a fallback to
report only client busyness when engine busyness counters are not
accessible to non-root users.

   GPUTOP engine busyness is also capable of running without superuser
access through setting CAP_PERFMON or an appropriate perf_event_paranoid
setting, Otherwise user could continue with only GPU client busyness if
required.

Steps to enable engine busyness to run without root (using CAP_PERFMON):
$ cd /path/to/igt-gpu-tools/
$ sudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop
$ sudo sh -c "echo $(pwd)/build/lib > /etc/ld.so.conf.d/lib-igt.conf"
$ sudo ldconfig
Steps to revert once done:
$ sudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop
$ sudo rm /etc/ld.so.conf.d/lib-igt.conf
$ sudo ldconfig

Steps to enable engine busyness to run without root (using perf_event_paranoid):
# Save current value
$ orig_val=$(sysctl -n kernel.perf_event_paranoid)
# Set the value to allow running GPUTOP without root privileges
$ sudo sysctl -w kernel.perf_event_paranoid=-1
Steps to revert once done:
$ sudo sysctl -w kernel.perf_event_paranoid=$orig_val

Soham Purkait (5):
  tools: Rename tools/gputop to tools/gputop.src
  tools/gputop.src/utils: Add clamp macro to remove dependency on
    lib/xe/*
  tools/gputop.src/xe_gputop: Use direct ioctls with card_fd cleanup
  tools/gputop.src/gputop: Add support for per-engine busyness
    monitoring
  tools/gputop.src/gputop: Add command line option for device filter

 tools/{ => gputop.src}/gputop.c          | 311 ++++++++++++++++++++---
 tools/gputop.src/meson.build             |   1 +
 tools/{gputop => gputop.src}/utils.c     |   0
 tools/{gputop => gputop.src}/utils.h     |  13 +-
 tools/{gputop => gputop.src}/xe_gputop.c | 150 ++++++++---
 tools/{gputop => gputop.src}/xe_gputop.h |   6 +-
 tools/meson.build                        |  12 +-
 7 files changed, 405 insertions(+), 88 deletions(-)
 rename tools/{ => gputop.src}/gputop.c (65%)
 create mode 100644 tools/gputop.src/meson.build
 rename tools/{gputop => gputop.src}/utils.c (100%)
 rename tools/{gputop => gputop.src}/utils.h (87%)
 rename tools/{gputop => gputop.src}/xe_gputop.c (74%)
 rename tools/{gputop => gputop.src}/xe_gputop.h (90%)

-- 
2.34.1

