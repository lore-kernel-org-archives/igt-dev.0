Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CE7C44508
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 15:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF94710ED92;
	Tue, 14 Jul 2026 15:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRe95QRT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9C510ED92
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 15:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784042009; x=1815578009;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DHjJu5qGJUfc1Ia9/yGletmIBcCN94tJ2jfbJdx0nkI=;
 b=QRe95QRTKJ4+1XRy3PSYqncJDBojTTvlscb30YfsbDAGsgHv6o8eHl+D
 XtcEcbSzRUovOWqknWeDhhT9qLDvE42/iuZdP2c1Fl7wUebFA3KpXLexF
 kLUSWzkRDV2cxKxUyLrBBiJXnMmTqanoLmpII+yYHfs1V8emDMekOJX11
 vzE29yo234KLxQiw379e8MUvP/pYifDN16bVBgDOf03lc4PhhN1eLTwdx
 Lyr6DmN8STl2V5Bau8PemwbfNnm1GuteSZSuCa0ZZZJ4O0xLoAiTIQZJ1
 zPCxNIH/QcbAJQzi/2H/W7OJD8SKh8wr5qjMUGrNZ0f3NhqzOhuV2Y4yf w==;
X-CSE-ConnectionGUID: vdrZyFZUSLy0fBvahviJHw==
X-CSE-MsgGUID: M90qqAM/SU+aH20Yj4Xu9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84451975"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84451975"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:13:28 -0700
X-CSE-ConnectionGUID: PRiMMnf/SXieaf6R9oQw7Q==
X-CSE-MsgGUID: s4YUguytSq6l2c+K6Mz5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="255936320"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:13:28 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, lukasz.laguna@intel.com,
 tvrtko.ursulin@igalia.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/2] benchmarks/gem_wsim: explicit VM create/assign + LR
 mode
Date: Tue, 14 Jul 2026 17:12:33 +0200
Message-ID: <20260714151235.1246608-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

This series extends gem_wsim VM management for Xe.

Patch 1 adds explicit VM create/assign steps in workload descriptors:
V.N to create VM N and v.N.M to bind context M to VM N.

Patch 2 adds c.N to enable compute/LR mode on selected VMs.
README is updated with syntax and VM usage examples.

Marcin Bernatowicz (2):
  benchmarks/gem_wsim: add explicit VM create/assign steps
  benchmarks/gem_wsim: add compute/LR mode support for Xe VMs

 benchmarks/gem_wsim.c  | 310 ++++++++++++++++++++++++++++++++++++-----
 benchmarks/wsim/README |  32 +++++
 2 files changed, 311 insertions(+), 31 deletions(-)

-- 
2.43.0

