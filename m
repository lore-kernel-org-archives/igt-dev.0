Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F73C47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 10:07:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D6310E64F;
	Thu,  1 Feb 2024 10:07:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F092710E64F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706782054; x=1738318054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8RqlTa4ZnlGcF8JfFylx7LE4qZzbPMCgzWUhAIYgGuo=;
 b=G6osLuMxLURbcB1NFUJL/K+cdhmaA5KgKEUwhJlU9+GEHhbuw7yLGq3k
 RTc9jf29SYzVZQhjFUkmLF3Et4ws4s6bYIwSYu0y8Qfc+plm+a6JgzJx4
 k4hgBXRUeSvWqcktJOffMDdbQ2JQKyOiBd6J9ZDrzeq879C4ElDTHOr/j
 1NkEEO1U/qCf2TwoORCQtw+BQSiv2D/fb4WZdbMWCH9Ibzqfh0QlA+y4J
 GUcXk4hJfmw+TmuDJUVhnIMkyiFaw38fP4dnjBYTr1fXzDYEJ0/326rky
 mayQ3IUDgsHKEio8xy76oIG79jwdWq7p9GQqmi27TC4mM+DxaHSAhPeBn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="435022834"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="435022834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:07:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="45795"
Received: from kniesyn-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.112.105])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:07:30 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 0/5] Fill block-copy test gap for unaligned sizes
Date: Thu,  1 Feb 2024 11:07:19 +0100
Message-Id: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
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
    png as helper for aligned height depend on it
v3: fix xmajor stride + make helpers public
v4: use original width/height on filename write to png,
    extend fast-copy with different sizes test

Zbigniew Kempczyński (4):
  lib/intel_blt: Add helpers for calculating stride and aligned height
  lib/intel_blt: Change surface size calculation
  lib/intel_blt: Use object pitch and aligned height on png write
  tests/xe-ccs: Add tests which exercise small to large blit sizes
  tests/xe_exercise_blt: Exercise small to large fast-copy blits

 lib/intel_blt.c                |  89 +++++++++++++++++-
 lib/intel_blt.h                |   6 +-
 tests/intel/gem_ccs.c          |  23 ++---
 tests/intel/gem_exercise_blt.c |  16 ++--
 tests/intel/xe_ccs.c           | 167 ++++++++++++++++++++++++---------
 tests/intel/xe_exercise_blt.c  |  79 ++++++++++++----
 6 files changed, 293 insertions(+), 87 deletions(-)

-- 
2.34.1

