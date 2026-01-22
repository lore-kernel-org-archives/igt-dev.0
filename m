Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB07C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 08:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51EB10E94C;
	Thu, 22 Jan 2026 08:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RR4ATS71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5561210E94C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769071876; x=1800607876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zd30Y1yWm9m8xNd88ri2XooGCYQbusMlqlB0T6A3adI=;
 b=RR4ATS71Mr9HUYSx4s0Xa2qRbM0RaY/kbC5BBXiETgcXyDyb231/FaUf
 cAUByXkB3VKTKK9TGZt0QuxYdkgRFSyjDJGShSAcSfJi/pci+9mwz0PG0
 lVMUOYlcowdZacCxZYdshSaAGtbEohG7+xU7xDDKO6qxyyHbG9bQfasKX
 0E0s32EZnDLtcAu62UqVrMaDo3XvtCqRulEvFXajfSLtAFMFOakPzhpm3
 n+gE63FSIWWCph30HSHIU5LI9ZBaim+6Iq7vDfY+bsTwh6/FlPxx//JiH
 cRIYyIaSZOSOXRHkrkNZI412GMA0cEmFd9TOIUWguBZXCrIeqsaqtP3cM A==;
X-CSE-ConnectionGUID: hN5IW0wFSPKfS+ebvDwGFg==
X-CSE-MsgGUID: tzE00AdtRYa1WUsTtNX+Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70031095"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="70031095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:50:33 -0800
X-CSE-ConnectionGUID: vgYw3y+zR2OwgN9T/u5M1w==
X-CSE-MsgGUID: 1Pt2QlSQSM2vrbLvS0T4ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="244280467"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:50:30 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v5 0/5] Close any open drm device after engine
 initialization in GPUTOP
Date: Thu, 22 Jan 2026 14:15:21 +0530
Message-Id: <20260122084526.538837-1-soham.purkait@intel.com>
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

       During the engine initialization for a specific device, igt helper
functions need card_fd to access each engine and respective configs which
is required in obtaining the busyness of the same through PMU.
But during KMS tests no other DRM client should run. So once the required
configs and engines are obtained, the card_fd should be closed as opened
card_fd in gputop makes appear itself as DRM client.
  
  GPUTOP engine busyness is also capable of running without superuser access
through setting CAP_PERFMON or an appropriate perf_event_paranoid setting,
Otherwise user could continue with only GPU client busyness if required.

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
  tools/gputop.src/xe_gputop: Close card_fd after engine population in
    xe_populate_engines()
  tools/gputop.src/gputop: Enable support for multiple GPUs and
    instances
  tools/gputop.src/gputop: Add command line option for device filter

 tools/{ => gputop.src}/gputop.c          | 286 +++++++++++++++++++----
 tools/gputop.src/meson.build             |   1 +
 tools/{gputop => gputop.src}/utils.c     |   0
 tools/{gputop => gputop.src}/utils.h     |  11 +-
 tools/{gputop => gputop.src}/xe_gputop.c |  64 ++++-
 tools/{gputop => gputop.src}/xe_gputop.h |   3 +-
 tools/meson.build                        |  12 +-
 7 files changed, 316 insertions(+), 61 deletions(-)
 rename tools/{ => gputop.src}/gputop.c (58%)
 create mode 100644 tools/gputop.src/meson.build
 rename tools/{gputop => gputop.src}/utils.c (100%)
 rename tools/{gputop => gputop.src}/utils.h (89%)
 rename tools/{gputop => gputop.src}/xe_gputop.c (86%)
 rename tools/{gputop => gputop.src}/xe_gputop.h (95%)

-- 
2.34.1

