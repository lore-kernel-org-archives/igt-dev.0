Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07604D0D169
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 18:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A1210E279;
	Wed,  7 Jan 2026 18:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mvCEY1Y1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943D210E279
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 18:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767811334; x=1799347334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=29kBn/HbnTZufC8UZ+nGFLDUEFCOaxEVbUDcsG5Jg54=;
 b=mvCEY1Y13MauH1UdctgwbmIxNF20LkzNhaF7VdFkb07QjVDZ49Lz0f4c
 iPNmc2Z0yzLNYCaPXfYH6SIW7VtjAm+6TQpkDPd8982JcKaciAOz1SQfs
 Vh6uM9YLXqAUYwXyiYLuOkP1blitIFCiIYjqDzalhEsAgAqSBdNQIt2cF
 7JZLOR2ofRMeCElIly72D3rTFJC/t/lD+qK+0YWYGu0YhXWyHJjYIAiah
 n56SIi9elY+Qflt+crNRLpy1nKS6V+EUeZLRqgqc49H66iukzwJjVPOcH
 EmLua9X53WXrVReknK1VzK0fE5Fj1ROdNzN2nL1kKO2KlUq7JCFLgqpAa A==;
X-CSE-ConnectionGUID: WwHt0ZfURO+kKAmXeUeNwQ==
X-CSE-MsgGUID: 1MI44q7CSharwPyitt0yKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69236249"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="69236249"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:42:14 -0800
X-CSE-ConnectionGUID: C2FbUKm0TjWlJOy6Dj95ZQ==
X-CSE-MsgGUID: 8yykyU5RSfOOHRvkEkXWow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="202199862"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 10:42:12 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 0/6] Close any open drm device after engine
 initialization in GPUTOP
Date: Thu,  8 Jan 2026 00:07:33 +0530
Message-Id: <20260107183739.84597-1-soham.purkait@intel.com>
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

