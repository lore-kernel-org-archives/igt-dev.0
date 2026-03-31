Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1F1109B46D
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 14:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54FC10E1BC;
	Tue, 31 Mar 2026 14:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcxU6Jys";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC47210E1BC
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774965964; x=1806501964;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PbkLG6P5vbM1LvANSBDEShteCwUqSsfYRqBnrkSnb+U=;
 b=WcxU6JysTWvSA8tLD3TaRnmQ9eKbkPULbP7t2zVPYEzmx0ZUQoHULrmQ
 JSHUawKjwA72w7W6yNLxMbiiUqNCLDnaFBlYSJfWjPWSgQNbxrZopqr04
 CtL3Iptpr0c7bQoclPr9uoohQA8eTVNEcGXyEGaSQlfL+FXcqv0DyR/WW
 E66I0oQc5swYsrKQqRC45bn7XKyO1umkMZapWZQCNJ4hQlIUt/6JsdpZs
 0229sEGOc/5IYflOala0DyLIGM+r9mAi6jvImCYV3GVddKT/qrUei/BKP
 QX3sLfxFB8uYB4i44has1zrKru5VR/OTw9zqiBpvfouory0zEzRwQNfPf g==;
X-CSE-ConnectionGUID: 7WXyRxYSQgSHlQOTlHRy8Q==
X-CSE-MsgGUID: oqGnRRZjRsq8e03ygOvT5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="63531124"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="63531124"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:06:02 -0700
X-CSE-ConnectionGUID: dEqe8o+xRYS8JvZVA4qItA==
X-CSE-MsgGUID: OEswWMzIT+OfYnExfKz4dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="221509945"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.212])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 07:06:02 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH i-g-t v5 0/4] Verify PTA entries contains expected values
Date: Tue, 31 Mar 2026 16:05:42 +0200
Message-ID: <20260331140541.2561104-6-zbigniew.kempczynski@intel.com>
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

According to spec verify PAT entries in reset / suspend scenarios.
Extending parsing to media gt was necessary as it may contain
different PTA values for main / media gts. With this series
I also observe different PAT ATS values on BMGs.

v2: use pat debugfs instead of pat_sw_config
v3: add hw/sw PAT compare subtest
v4: simplify PTA comparison subtest (Matt)
v5: unify PTA/PAT tests

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Zbigniew Kempczyński (4):
  lib/intel_pat: Support other than gt0 during parsing debugfs PAT
  lib/intel_pat: Expose getter of PAT registers
  lib/intel_pat: Set PTA + ATS PAT entries to invalid value
  tests/xe_pat: Verify PAT entries contain expected values

 lib/intel_pat.c      | 51 ++++++++++++++++++++++++++--
 lib/intel_pat.h      |  3 +-
 lib/xe/xe_query.c    |  2 +-
 tests/intel/xe_pat.c | 81 +++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 132 insertions(+), 5 deletions(-)

-- 
2.43.0

