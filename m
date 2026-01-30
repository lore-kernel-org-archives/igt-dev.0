Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624F0D49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 09:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E38E10E2C4;
	Fri, 30 Jan 2026 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neLL7R0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A6F10E955
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769767112; x=1801303112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qiOHgVNeZtv1WOSWdnLyvSlLUTMMWi/J2mWNeR3qZXs=;
 b=neLL7R0Kd0eVFzYhzVINXZv3bKeqCwpiP7NqxAkvdtNOnnHniBznXA0b
 rSe8D5+lGWERWTxP+iPJ1IGHZOx1sdMs2yt6+COPRVeMv6nyRlEGmmfCA
 xIykitAux0wzt7biHlqjsZ4fsH5Q89PT9nA6R++p4uBLR0Y/slG7Nu4ux
 7KkWwSFqpaBOx9Y8/GtWt6Di8+qBlxdhh1N17Ry36+ZvFLp7/bwbwO1Lg
 4erQEvGPR7eCr5FEGhBZeVt4p3LWRpLuEfa02yXVmqage6heF0zxLiJY2
 pcETNIj2RPoC+sc1ytAJzcoVegryGjYN+UJ72AQXlD+2lq49dno6FZlcR A==;
X-CSE-ConnectionGUID: OSMi9MvhQteMaVCmFy6fxg==
X-CSE-MsgGUID: UPEhKHT7SZGy97KpwDOWNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="58595941"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="58595941"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:58:31 -0800
X-CSE-ConnectionGUID: N2UQvWzMQYKIinPuD1zBAw==
X-CSE-MsgGUID: tF9O+SQGRfKItPI0+9uE2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208413945"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 01:58:29 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v7 0/5] Close any open drm device after engine
 initialization in GPUTOP
Date: Fri, 30 Jan 2026 15:23:13 +0530
Message-Id: <20260130095318.644256-1-soham.purkait@intel.com>
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
  tools/gputop.src/xe_gputop: Refactor xe_populate_engines to close
    card_fd and use direct ioctl calls
  tools/gputop.src/gputop: Enable support for multiple GPUs and
    instances
  tools/gputop.src/gputop: Add command line option for device filter

 tools/{ => gputop.src}/gputop.c          | 286 +++++++++++++++++++----
 tools/gputop.src/meson.build             |   1 +
 tools/{gputop => gputop.src}/utils.c     |   0
 tools/{gputop => gputop.src}/utils.h     |  11 +-
 tools/{gputop => gputop.src}/xe_gputop.c | 100 ++++++--
 tools/{gputop => gputop.src}/xe_gputop.h |   3 +-
 tools/meson.build                        |  12 +-
 7 files changed, 344 insertions(+), 69 deletions(-)
 rename tools/{ => gputop.src}/gputop.c (58%)
 create mode 100644 tools/gputop.src/meson.build
 rename tools/{gputop => gputop.src}/utils.c (100%)
 rename tools/{gputop => gputop.src}/utils.h (89%)
 rename tools/{gputop => gputop.src}/xe_gputop.c (83%)
 rename tools/{gputop => gputop.src}/xe_gputop.h (95%)

-- 
2.34.1

