Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04237D65526
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 09:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9603810E21F;
	Wed, 17 Dec 2025 09:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmJjvK3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC96A10E21F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765964527; x=1797500527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=swHEeg8nqyrstZdWIZy0rgp/iPwqIl3f2xyCIxdFI4Q=;
 b=mmJjvK3ijyIiRM0ZoCMzXEcXcZJGGkk6DmTMXk78yHmq3M4kN8uiRwPn
 90FM4FUuvAKtloeSNlwIppk+eEAfen7Jus2AB0Gc0g6nJCktzhiGUyi5w
 ElvvY2oBGJzUzOLDkWIbz90XVZogJ4LPEd2ThPLtEOds2P9Zm3RTRLpN4
 0dMC+Sqb+neLwjfc9cezC4zukTQr9IKw3X1OUGXfK5diFihLFyd53iOzJ
 Cy17QuG4uJmG6Jzd6H6vdwvh41yVzPof0lCptjHEKUPLQjti9vS8gSJSX
 U3iLHGa5NcM1noeDG9bXLHJ0iwHK8i3BnZR7wlPVxPeK1blvhLc8wuAjU A==;
X-CSE-ConnectionGUID: bO0wRvwsSHONLlfhg3Qv4g==
X-CSE-MsgGUID: 9MC7rkHYRpKjUlUX2pYafQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71754614"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71754614"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:42:06 -0800
X-CSE-ConnectionGUID: N/cJFeMxS1mT5UFoZ3ctEQ==
X-CSE-MsgGUID: ALxGtUx2QEi8EGoJ4iV8ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198255495"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:42:04 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v2 0/2] Close any open drm device after engine
 initialization in GPUTOP
Date: Wed, 17 Dec 2025 15:01:07 +0530
Message-Id: <20251217093109.4096902-1-soham.purkait@intel.com>
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
$ sudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop/gputop
$ sudo sh -c "echo $(pwd)/build/lib > /etc/ld.so.conf.d/lib-igt.conf"
$ sudo ldconfig
Steps to revert once done:
$ sudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop/gputop
$ sudo rm /etc/ld.so.conf.d/lib-igt.conf
$ sudo ldconfig

Steps to enable engine busyness to run without root (using perf_event_paranoid):
# Save current value
$ orig_val=$(sysctl -n kernel.perf_event_paranoid)
# Set the value to allow running GPUTOP without root privileges
$ sudo sysctl -w kernel.perf_event_paranoid=-1
Steps to revert once done:
$ sudo sysctl -w kernel.perf_event_paranoid=$orig_val

Soham Purkait (2):
  tools/gputop/xe_gputop: Close card_fd after engine population in
    xe_populate_engines()
  tools/gputop/gputop: Enable support for multiple GPUs and instances

 tools/{ => gputop}/gputop.c | 299 +++++++++++++++++++++++++++++++-----
 tools/gputop/meson.build    |   6 +
 tools/gputop/xe_gputop.c    |   7 +-
 tools/meson.build           |   6 +-
 4 files changed, 271 insertions(+), 47 deletions(-)
 rename tools/{ => gputop}/gputop.c (58%)
 create mode 100644 tools/gputop/meson.build

-- 
2.34.1

