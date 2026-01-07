Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B01D0D15D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 18:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C7610E1E9;
	Wed,  7 Jan 2026 18:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DMdFtM8R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A8A10E1E9
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767810722; x=1799346722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=29kBn/HbnTZufC8UZ+nGFLDUEFCOaxEVbUDcsG5Jg54=;
 b=DMdFtM8RRDmn/3/TVB3nRbN4UOsAx0PZu+tHKeiwty6OAN6BGl6nh+Pw
 0b6E6LLBPiVmLbBMzZLb7cv0Ivt589dHDeQ219Xmao38jtiQzre6E1KX9
 5VnZDx02aPaIann9QgRzlIG8x5u6PMjYHVfmhSMs6xM4tEwcNsVwXrtIF
 qi1yz3C++Zo8MbOTSEVclpdbStyKokV3be5Ym8wRJdWkHotb4KTlQEGDl
 BmWkShyohh0oIrFltTnUyewHE10c3/GsLNueCYZm8A1isfONfwzl6znY3
 msl3SGQ8M6b5NgngUHbg1Yr4lxmdJK/re4n3bt1J86zbMYLW/to4ueUUu g==;
X-CSE-ConnectionGUID: WhJ4Fs/kQ4W6etBXdFAT3Q==
X-CSE-MsgGUID: HfaC+trvSv+whtoRZBkCvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="80549389"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="80549389"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:32:02 -0800
X-CSE-ConnectionGUID: suzxg0uwSR66R1naQATKBA==
X-CSE-MsgGUID: FDOklCpxSSydJ83GY5nBaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207845946"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:31:26 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 0/6] Close any open drm device after engine
 initialization in GPUTOP
Date: Wed,  7 Jan 2026 23:56:48 +0530
Message-Id: <20260107182654.84173-1-soham.purkait@intel.com>
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

Soham Purkait (6):
  tools: Rename tools/gputop to tools/gputop.src
  tools/gputop.src/utils: Add clamp macro to remove dependency on
    lib/xe/*
  tools/gputop.src/xe_gputop: Close card_fd after engine population in
    xe_populate_engines()
  tools/gputop.src/gputop: Enable support for multiple GPUs and
    instances
  tools/gputop.src/meson: Change meson build files accordingly to
    generate  the binary under tools.
  tools/gputop.src/gputop: Add command line option for pci device filter

 tools/{ => gputop.src}/gputop.c          | 286 +++++++++++++++++++----
 tools/gputop.src/meson.build             |   1 +
 tools/{gputop => gputop.src}/utils.c     |   0
 tools/{gputop => gputop.src}/utils.h     |   8 +
 tools/{gputop => gputop.src}/xe_gputop.c |  64 ++++-
 tools/{gputop => gputop.src}/xe_gputop.h |   2 +-
 tools/meson.build                        |  12 +-
 7 files changed, 315 insertions(+), 58 deletions(-)
 rename tools/{ => gputop.src}/gputop.c (58%)
 create mode 100644 tools/gputop.src/meson.build
 rename tools/{gputop => gputop.src}/utils.c (100%)
 rename tools/{gputop => gputop.src}/utils.h (89%)
 rename tools/{gputop => gputop.src}/xe_gputop.c (86%)
 rename tools/{gputop => gputop.src}/xe_gputop.h (98%)

-- 
2.34.1

