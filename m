Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C315E9D83B
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 06:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ED310E1DA;
	Mon,  6 Apr 2026 06:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfelNhBz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E67910E023
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 06:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775455896; x=1806991896;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6OMAm+l9zXv9xsNwsXkOXXWquQ+bBSzqsdrfcmk68og=;
 b=EfelNhBzyzbLRNFPWYopdlOqaOAg/1B0ijc2TJkL5ycQ9rlQghUM0Yjj
 i/1pFtKtNSkNxPuMN81tWuSfjJLRD5dQCMHDgJG1EBQsJmIKwPK8ilmqK
 i50Gf7Cov0v4pyHlo+Qa5ATD6dibzCOwMVhpKclwBBKjBxt6C1Cxu7qQp
 wTyTnqIgJayI4+3nZU/C5SE0xJRj5yU3S2MEQ3KU0AGmeAchyIX7aEp+z
 IoR09fpcNQIBQ52kIynGgAyKT9PfudaSScKc531BaEQY2ahkzL0V9Z22l
 XOFA2u3PmKXdRjaaHI4E5EsCvew0IETtteAAYz2+M2U+dqFpZ2SuFuKBU A==;
X-CSE-ConnectionGUID: HXLOSur7RbiUZswYCnTCZw==
X-CSE-MsgGUID: 8RRe4cmMRi+yNYY7mQGNcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76421175"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76421175"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:11:35 -0700
X-CSE-ConnectionGUID: KWZV31noRXOYwlCL6cwusQ==
X-CSE-MsgGUID: h6teSTrcRMKdEgzGsyM/Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="226968716"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:11:32 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 tvrtko.ursulin@igalia.com, tursulin@ursulin.net, lucas.de.marchi@gmail.com
Subject: [PATCH i-g-t v10 0/5] Close any open drm device after engine
 initialization in GPUTOP
Date: Mon,  6 Apr 2026 11:34:23 +0530
Message-Id: <20260406060428.2734117-1-soham.purkait@intel.com>
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

Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>

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
 tools/{gputop => gputop.src}/utils.h     |  15 +-
 tools/{gputop => gputop.src}/xe_gputop.c | 150 ++++++++---
 tools/{gputop => gputop.src}/xe_gputop.h |   8 +-
 tools/meson.build                        |  12 +-
 7 files changed, 407 insertions(+), 90 deletions(-)
 rename tools/{ => gputop.src}/gputop.c (65%)
 create mode 100644 tools/gputop.src/meson.build
 rename tools/{gputop => gputop.src}/utils.c (100%)
 rename tools/{gputop => gputop.src}/utils.h (84%)
 rename tools/{gputop => gputop.src}/xe_gputop.c (74%)
 rename tools/{gputop => gputop.src}/xe_gputop.h (86%)

-- 
2.34.1

