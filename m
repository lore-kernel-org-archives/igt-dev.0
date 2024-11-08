Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5ABD5E140
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 06:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB0E10E155;
	Fri,  8 Nov 2024 06:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEIPxPtC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89B410E26E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 06:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731048441; x=1762584441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NmX0me7YaBLSXIxwaz3dYjS7IIEi4xRuzso1t+Oy6L0=;
 b=LEIPxPtCa6AzF38ptUKR1mlcqJCjt4q6Fo086t1vWJIiIt/2EIBJiHlg
 FH+7R0mixUgc5ypv8JKJzQ1Lfexmy+KS4600VDxxFwwLvGI4WkRvXU6kA
 d3Q/+XZPXk6MiRtB0pkRLS+g9ToxgcpUISA5FuftHHD34rXDNMCFn2ZmV
 INXdnJH1oPF51Q7oIlH3JGqQqyDFn1bEnaU25SpWOwicfMD3UEwMoOHm/
 Thkdki6+yL9PwTrS2Cd5IszvyS+tknld7OdQ1jRTxtRKAg7/NFjUa9jEh
 kMC+RMDHwZQOqvrAHfvbq6bE1DBUQKHx42x/EAxU2z+hYb+GlRx5sD97Y w==;
X-CSE-ConnectionGUID: PTY7F+1xQoOEmZNs38vEIQ==
X-CSE-MsgGUID: 2/kFBa9vTneqTdgstXTNLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34613011"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34613011"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:47:21 -0800
X-CSE-ConnectionGUID: OZeMGcmNSq2t9jbirMqZmg==
X-CSE-MsgGUID: f82YKT80SYeMyJKMpil6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="86230917"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.236])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 22:47:19 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/3] Extend intel_blt to support large ctrl-surf-copy
 blits
Date: Fri,  8 Nov 2024 07:47:09 +0100
Message-Id: <20241108064712.252927-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

On Xe single ctrl-surf-copy is able to handle 64MiB surface, on
Xe2 4MiB (bigger granularity). Start supporting larger surfaces
by looping and populating the batchbuffer with couple of blits
if necessary.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Zbigniew Kempczyński (3):
  lib/intel_blt: Handle multiple ctrl-surf-copy blits on big surface
  tests/xe_ccs: Add large-ctrl-surf-copy subtest
  tests/gem_ccs: Add large-ctrl-surf-copy subtest

 lib/intel_blt.c       | 121 +++++++++++++++++++++++++----------
 tests/intel/gem_ccs.c | 130 +++++++++++++++++++++++++++++++++++++
 tests/intel/xe_ccs.c  | 145 +++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 359 insertions(+), 37 deletions(-)

-- 
2.34.1

