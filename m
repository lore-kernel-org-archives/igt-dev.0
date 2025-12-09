Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582F4D3B98C
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 17:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF21C10E159;
	Tue,  9 Dec 2025 17:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdMNqrb9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C54810E159
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 17:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765302361; x=1796838361;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x7HF8N4W/BpC8Wv2ouTHrQDrlFBzBDPe7c0zh2T9ePU=;
 b=UdMNqrb9XF4NvSKI+ialdOaiKG5GfkNaprP+DZ9S6l3q69QyBEg1DTi7
 nk/8KM8QPFa319q9CWO1U0IB5qrNhEgVh089GYNkY6vUqPo/8DLn1P4p1
 cMP8bBl3P3LYkhIMt69BR5i/+CEpi04jEf1kbrwKHYl6YvP11RgmYE4CG
 tB3/uPBj0LTZhdAacNxNjnpERM1SqLpbibb/6KL0Zaq4uyI+aGUK436zv
 A4/oLFvtGkmscsy1PMZOFKiZNXCET+9SVPpLj93QBSmsFUjPAD+HI3Yin
 Ys3udgWFqcK6hrutTPYJ2zgngsCLoj276uE6qRgF+gsYiuJoTCCJ3eVG5 w==;
X-CSE-ConnectionGUID: adHVrsYSTaSf7RdfFTuT1w==
X-CSE-MsgGUID: NsMBMMb8QqWoE2gV0bV77Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71127244"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="71127244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 09:46:00 -0800
X-CSE-ConnectionGUID: cp6TOaE8TciqbYniFCWwTw==
X-CSE-MsgGUID: sUMKUN+gTo6RrO2CxFQ46Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="197056889"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 09:45:58 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v1 0/2] Close any open drm device after engine
 initialization in GPUTOP
Date: Tue,  9 Dec 2025 23:05:11 +0530
Message-Id: <20251209173513.4020947-1-soham.purkait@intel.com>
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

 tools/{ => gputop}/gputop.c | 283 +++++++++++++++++++++++++++++++-----
 tools/gputop/meson.build    |   6 +
 tools/gputop/xe_gputop.c    |   7 +-
 tools/meson.build           |   6 +-
 4 files changed, 255 insertions(+), 47 deletions(-)
 rename tools/{ => gputop}/gputop.c (59%)
 create mode 100644 tools/gputop/meson.build

-- 
2.34.1

