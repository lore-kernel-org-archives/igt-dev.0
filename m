Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A36CA100F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 16:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C0F10E19E;
	Mon, 22 Sep 2025 16:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnzaxQP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7FB10E19E
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557395; x=1790093395;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F5v85nfeO+CsdeuZLA4+hMTewMH4bpHECk+tmTt9l+Y=;
 b=AnzaxQP9SHxpT4qqJAA4WGkesmL82PDMyouZYqaoSgb3jQwVVBuGog2Q
 hsW8uRmIIhRajj1kzisqsMmNpL2dJrBqzmbvqiXIZ/ihw1CZnG6E29SPS
 0phSgVR8FLq0roh8mmrOWkN+gk3xdXgWI1W9QsidsmtR/1dAdgx3+JBof
 776TY50a7/NaeDzhMuH4l2R11rkQGZVrP2QIHn9AeOr0UqmkYqJAvQ6PL
 Z+MRTeEmLVcZmZOIcDzwkh8zP/paLTIYaKM5e7bvOfV/ydZ5QI2vSrK9N
 n/I8Q0wc1QxpwulHXpzsKF7HgkYWyJw2mwN4/gimGJu7U9Z4FrEobmnOn g==;
X-CSE-ConnectionGUID: jUwYgG5zTl+N/bhhVGejwA==
X-CSE-MsgGUID: jEFQ3DRZT0mZyAyNlEyx8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83425513"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="83425513"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:09:54 -0700
X-CSE-ConnectionGUID: xpCcdwAKRoeOe0VzlP+Rbw==
X-CSE-MsgGUID: 6u/bqnIYRS+24fqfk03k7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181664920"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:09:53 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/7] tools/intel_display_poller: Various things
Date: Mon, 22 Sep 2025 19:09:42 +0300
Message-ID: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Various things for tools/intel_display_poller:
- Fix IGT_NO_FORCEWAKE (also for other igt tools)
- scanline offset handling to make life easier
- DSB status bit polling

Ville Syrjälä (7):
  lib/gt: Fix IGT_NO_FORCEWAKE handling
  tools/intel_display_poller: Fix long opts
  tools/intel_display_poller: Use intel_display_ver() instead of
    intel_gen()
  tools/intel_display_poller: Add --scanline-offset/-o command line
    option
  tools/intel_display_poller: Add --auto-scanline-offset/-O comamnd line
    option
  tools/intel_display_poller: Add dsb-status-live test
  tools/intel_display_poller: Add --dsb-id/-d command line option

 lib/igt_gt.c                 |   3 +
 lib/intel_reg.h              |   5 +
 tools/intel_display_poller.c | 332 +++++++++++++++++++++--------------
 3 files changed, 212 insertions(+), 128 deletions(-)

-- 
2.49.1

