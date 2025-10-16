Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B58CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 16:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC33810E0AC;
	Thu, 16 Oct 2025 16:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daKMUBRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261D110E0AC
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760632005; x=1792168005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yTjKOddFzm6GI7JX+tRN8w0PhzlVeE9mxwt5M4EuB3g=;
 b=daKMUBRuu0H0jOeoXJc7fiueRjRRH1wybaTAmwrfL06H0E/6MfVZRd/f
 B96v8UQX7YGn7RxmdFaCNRJ7uOnK7+vUyUws01lsDmq0PLIpe9HKeHGz+
 T4W/HUyZPDe3Q8xmSkjHE0GgfU0kuSLpWHJIYRQyDbmg3TKm0al9DsL6Z
 ompueoj2/a0RW21MOfyi1FIuF8PzOLl9/mPlCHxsKHiAvum+DQsTQL9C6
 8esVsGxy/4OSH3vAVJJrs5JGQu4WOyKxs7s8KxC1IYH95DFzRo1hcK38s
 VVovlJ68iTvnxXVugt6dKBclgMWEnXlk25onyyeS2MbyCNNdz3mGk0X9M Q==;
X-CSE-ConnectionGUID: cZYXYS8uQMGxb/Kdk1s5qg==
X-CSE-MsgGUID: 0KlUZjMCQEm0N9v6L0NoRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62879787"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62879787"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:26:44 -0700
X-CSE-ConnectionGUID: GfTHTil1QjGYBDbuA9xX1g==
X-CSE-MsgGUID: XebB8aT0TfGDwyHT7LwI4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182910055"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:26:41 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 badal.nilawar@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t 0/2] Close any open drm device after engine
 initialization
Date: Thu, 16 Oct 2025 21:46:55 +0530
Message-Id: <20251016161657.3707264-1-soham.purkait@intel.com>
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
Once the required configs and engines are obtained, the card_fd is closed
as opened card_fd in gputop makes appear itself as DRM client.

  GPUTOP is also capable of running without superuser access through setting
CAP_PERFMON, although in that case GPU client busyness is not available
as without being superuser, other processes' fd could not be inspected.

Steps to enable GPUTOP to run without root:
$ cd /path/to/igt-gpu-tools/
$ sudo setcap cap_perfmon=+ep $(pwd)/build/tools/gputop/gputop
$ sudo sh -c "echo $(pwd)/build/lib > /etc/ld.so.conf.d/lib-igt.conf"
$ sudo ldconfig
Steps to revert once done:
$ sudo setcap cap_perfmon=-ep $(pwd)/build/tools/gputop/gputop
$ sudo rm /etc/ld.so.conf.d/lib-igt.conf
$ sudo ldconfig

Soham Purkait (2):
  tools/gputop/xe_gputop: Close card_fd after engine population in
    xe_populate_engines()
  tools/gputop/gputop: Enable support for multiple GPUs and instances

 tools/{ => gputop}/gputop.c | 260 ++++++++++++++++++++++++++++++------
 tools/gputop/meson.build    |   6 +
 tools/gputop/xe_gputop.c    |   2 +
 tools/meson.build           |   6 +-
 4 files changed, 229 insertions(+), 45 deletions(-)
 rename tools/{ => gputop}/gputop.c (61%)
 create mode 100644 tools/gputop/meson.build

-- 
2.34.1

