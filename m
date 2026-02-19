Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8498E9A048
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 09:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7C310E254;
	Thu, 19 Feb 2026 09:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQPk2LGp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ACC10E254
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771494836; x=1803030836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Da3j6bZG0g5suHBNVeVSCNLY6popTCYf3aUf7eeOe4Q=;
 b=UQPk2LGp0S8Kp70LY9nZSrnUViqOxaW6iV3CX6TwtXBoqSoMhEMWaF9q
 8BY3Zqcy84HSe2226qh+K7CjioU1N2nzWilOYmOIfKS3pN59vH8BiJbmP
 Hj0REh5VeftpjGuRnYv3EDZaDnGsdhJntkr/TI8nXXWx1MGwmi2qutwZW
 AFlhzLDcOMt9MFgoWhhrST1rotSdIjo6L7JZFMLfcmTI4RaIni11DJ7vD
 nPzOIMfL/9CMP5N/T3bDF0SGaXAgDwS5LtYsc/NtKAIyXKHZNXtCy2EdO
 Ndn6oDTDXOKdkPkUN9xJzvh4kOV0bMAORroESfuB/TS0Of71qNuFtf4OL Q==;
X-CSE-ConnectionGUID: ar1ZpNsARkSHb8EYiwJ1bw==
X-CSE-MsgGUID: XHwcjpYfQo+UVkV0Z32x+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="82901411"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="82901411"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:53:56 -0800
X-CSE-ConnectionGUID: CsT44dYTRMSdFJxGnFbt1A==
X-CSE-MsgGUID: ORf4zYHYSk26WPA/JkEe2w==
X-ExtLoop1: 1
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 01:53:53 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com,
 ashutosh.dixit@intel.com, vinay.belgaumkar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v8 0/5] Close any open drm device after engine
 initialization in GPUTOP
Date: Thu, 19 Feb 2026 15:17:59 +0530
Message-Id: <20260219094804.835429-1-soham.purkait@intel.com>
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

 tools/{ => gputop.src}/gputop.c          | 292 +++++++++++++++++++----
 tools/gputop.src/meson.build             |   1 +
 tools/{gputop => gputop.src}/utils.c     |   0
 tools/{gputop => gputop.src}/utils.h     |  11 +-
 tools/{gputop => gputop.src}/xe_gputop.c | 108 +++++++--
 tools/{gputop => gputop.src}/xe_gputop.h |   3 +-
 tools/meson.build                        |  12 +-
 7 files changed, 352 insertions(+), 75 deletions(-)
 rename tools/{ => gputop.src}/gputop.c (57%)
 create mode 100644 tools/gputop.src/meson.build
 rename tools/{gputop => gputop.src}/utils.c (100%)
 rename tools/{gputop => gputop.src}/utils.h (89%)
 rename tools/{gputop => gputop.src}/xe_gputop.c (81%)
 rename tools/{gputop => gputop.src}/xe_gputop.h (95%)

-- 
2.34.1

