Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC91C47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 09:22:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E53E10EAD1;
	Thu,  1 Feb 2024 09:22:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF67E10EAD1
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706779360; x=1738315360;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+anxadi0975lhTjcv8fbNDhGnIdZl2xSbFGYkKvQdSE=;
 b=MhhGFBkRQSsabwvhVZ1g4HwGj04O8p2zt7VszSIHwLUkw6NzGTHp2/Rs
 BS/jc+pxsqtH1QPrbB4NKuD/73QpMlGMi5ZA4DA26QZ7O3ke+zq6DpMQD
 tCH/ETD8SBMCPa70eLspyM8e0UMc3dVuqK+5lBgBFu4u+HMquiuvhGSxn
 U3ac+vNS/xphwBMcgBqjTIPYeFAtJOjJa2nlFfO0rVXnhfvD9ROM2GXQ7
 j7H+cE2xfOTA/6n5LJVAI0GtZK8RLhGNEvEwOzll7YENY1Q7JG73YFgyR
 b9qUXp05cpDgu2YqewS8l1Oh5NZt5f1+2Yn0J5VM/ej5P7YkjbkQ8+9Hi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2787581"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="2787581"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4324650"
Received: from kniesyn-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.112.105])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:22:33 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 0/4] Fill block-copy test gap for unaligned sizes
Date: Thu,  1 Feb 2024 10:22:23 +0100
Message-Id: <20240201092227.252502-1-zbigniew.kempczynski@intel.com>
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

Using 512x512 resolution for testing is too optimistic and hides intel_blt
limitation for using different (smaller) resolutions which also might
not be aligned to expected stride and height.

Address this by adding few helpers, change blt buffer creation size
calculation and add "increment" version of the test in xe_ccs.

v2: fix handling Tile64 what also requires bpp in dumping to
    png as helper for aligned height depend on it (Zbigniew)
v3: fix xmajor stride + make helpers public (Zbigniew)

Zbigniew Kempczyński (4):
  lib/intel_blt: Add helpers for calculating stride and aligned height
  lib/intel_blt: Change surface size calculation
  lib/intel_blt: Use object pitch and aligned height on png write
  tests/xe-ccs: Add tests which exercise small to large blit sizes

 lib/intel_blt.c                |  84 ++++++++++++++++-
 lib/intel_blt.h                |   6 +-
 tests/intel/gem_ccs.c          |  23 ++---
 tests/intel/gem_exercise_blt.c |  16 ++--
 tests/intel/xe_ccs.c           | 167 ++++++++++++++++++++++++---------
 tests/intel/xe_exercise_blt.c  |  16 ++--
 6 files changed, 238 insertions(+), 74 deletions(-)

-- 
2.34.1

