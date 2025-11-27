Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF9ACFD2F6
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 09:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB4310E7FA;
	Thu, 27 Nov 2025 09:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RA85pKI6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EC910E7FA
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 09:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764237070; x=1795773070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=etscxkwR23DasX/WrQUTAK5ZNtm86kEzgeLqbJZ9nu4=;
 b=RA85pKI6eJjjJHjGFD8giMnvTUX9NVo9KcL9zzHqvZHVXj8mH4KYKKyQ
 iGhsF7fzrkHvDU/9vFwseZ8srpcxJyHyG7Pmtgp1WgLoqO2sj+LGLNliN
 ZtFigHPtppF3POomDnZhOK+WqnVgZamXwKzV8JwV7fKndZkB5tbq55bef
 6YStiwb8lRyu4rRGxc3q4PzKhZ1eQMuXI8o+oQX4oxupS8WQTEmYBGAX0
 VjUJkm3JQUma0YmGFghUNa21xx5yLRMaf8Yrmid9xvNhqFn0MJHi9pdY/
 qVWFsujuAEWylIpBuDMoQwl8dnILX/z7wB1Mu0UwQZF2B4Glc3JrhjxjH Q==;
X-CSE-ConnectionGUID: QNPwH6fDR4qPsFyxyC1KfA==
X-CSE-MsgGUID: +5WGjMUuTxSuWLaS9BVxnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65467980"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="65467980"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:51:10 -0800
X-CSE-ConnectionGUID: xv8ijSiOThec0XdP+dVa2A==
X-CSE-MsgGUID: hJqbRgq/SpuRwWYOasUn6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="194001871"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:51:07 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t 0/2] Close any open drm device after engine
 initialization in GPUTOP
Date: Thu, 27 Nov 2025 15:10:41 +0530
Message-Id: <20251127094043.3916839-1-soham.purkait@intel.com>
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
  
  GPUTOP is also capable of running without superuser access through setting
CAP_PERFMON or an appropriate perf_event_paranoid setting, although in that
case GPU client busyness is not available as without being superuser, other
processes' fd could not be inspected.

Steps to enable GPUTOP to run without root (using CAP_PERFMON):
$ cd /path/to/igt-gpu-tools/
$ sudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop/gputop
$ sudo sh -c "echo $(pwd)/build/lib > /etc/ld.so.conf.d/lib-igt.conf"
$ sudo ldconfig
Steps to revert once done:
$ sudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop/gputop
$ sudo rm /etc/ld.so.conf.d/lib-igt.conf
$ sudo ldconfig

Steps to enable GPUTOP to run without root (using perf_event_paranoid):
# Save the current value
$ orig_val=$(sysctl -n kernel.perf_event_paranoid)
# Set the value to allow running GPUTOP without root privileges
$ sudo sysctl -w kernel.perf_event_paranoid=-1
Steps to revert once done:
$ sudo sysctl -w kernel.perf_event_paranoid=$orig_val

Soham Purkait (2):
  tools/gputop/xe_gputop: Close card_fd after engine population in
    xe_populate_engines()
  tools/gputop/gputop: Enable support for multiple GPUs and instances

 tools/{ => gputop}/gputop.c | 253 ++++++++++++++++++++++++++++++------
 tools/gputop/meson.build    |   6 +
 tools/gputop/xe_gputop.c    |   6 +-
 tools/meson.build           |   6 +-
 4 files changed, 224 insertions(+), 47 deletions(-)
 rename tools/{ => gputop}/gputop.c (63%)
 create mode 100644 tools/gputop/meson.build

-- 
2.34.1

