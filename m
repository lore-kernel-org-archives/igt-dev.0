Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE53C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 14:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73D410E216;
	Mon,  5 Aug 2024 14:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6w5sSnQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E52E10E216
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 14:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722868643; x=1754404643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N2PM7QBmcfWBK8UOs9PwGY4zF6iLKZgnEGHEzVhmY6Q=;
 b=E6w5sSnQzBatlrhqpD7N6irY0AKUEkSwVIpaC/6CVimP0+N7pgLV17of
 S2o0ucEioysrLfCaf7PJYZ+tK3tDb8EtuTULcMsm4zuy1czAkIrkOrlno
 rrBvxIPUBbsiboLvLJJCyi0Qxp4vhb7o7Jf6mqpYBbdNT429IpvBrWxaI
 ai6hYroIBnihHXJoof+tfbRlsrNCrTRX3vbh0657XDlNOFOOJ9oG7GgqH
 fXHxH1XWZoEdVg2YQtlrb1lUrkaq3Zb6XdKkMjEZsaU4IRJqxTDoYBG+L
 XA4qNAsMtJAWzUg483DvVzVrKhouwOYUU+V+FUvsR0g50ZfevGHaTvX8V A==;
X-CSE-ConnectionGUID: /z6qFfunTK2lnrx6pv6WOA==
X-CSE-MsgGUID: 5Qx5u3jyRDmd5nBvlfHN5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="24702266"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="24702266"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:22 -0700
X-CSE-ConnectionGUID: mRRQH9vxRDu/mV5ReeRSBw==
X-CSE-MsgGUID: 1lMmI2K/RrOyBBiWsuK/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56754843"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.245.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 07:37:20 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/8] tests/core_hotunplug: Make it fail only once
Date: Mon,  5 Aug 2024 16:37:03 +0200
Message-ID: <20240805143713.76034-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Test core_hotunplug has some checks outside of subtest which
could turn it into a failed subtest. When it do a fail, then every
other fixture will also fail and repeats printing same logs. Changed
that into check performed only once when it is really needed, e.g. only
after an actual subtest was done.

Added also some helpers in drmtest lib to print what driver we are testing
and make sure we reload the same, not some other.

v1 was sent here: https://patchwork.freedesktop.org/series/134626/

v2: Added few more prints into subtest to better see after which step
  it started failing, changes series title

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>

Kamil Konieczny (8):
  lib/drmtest: add function for retriving chipset
  tests/core_hotunplug: set known chipset before tests
  lib/drmtest: Allow to get drm device name
  tests/core_hotunplug: Open the same driver
  tests/core_hotunplug: Fix device close
  tests/core_hotunplug: Skip if no render available
  tests/core_hotunplug: Check health once after subtest
  tests/core_hotunplug: Print info between steps

 lib/drmtest.c          |  35 +++++++++-
 lib/drmtest.h          |   4 ++
 tests/core_hotunplug.c | 153 +++++++++++++++++++++++++++--------------
 3 files changed, 141 insertions(+), 51 deletions(-)

-- 
2.43.0

