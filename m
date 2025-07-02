Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54643C83038
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 19:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0947210E062;
	Wed,  2 Jul 2025 19:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwjSLveI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E9F10E062
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484784; x=1783020784;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i5CkuRcx7t8qv4XlqMKz+KQi0R8IhhPmTOcmWp68nv0=;
 b=nwjSLveIU6vZsnqGTRCFsVvORrXLnhdJ8KEimRHNyZmYQeAmiKt45Icx
 4MwGPQGXiEkchzX013LTfn6vgfCuh9C91CnhC6sB2t3wkqrc9UWsvguWu
 K0aoK/GWfcKRqPeYqJdDI6hpN5ADblu0x6b9rfR+1+ClVl8McrmH6H2qL
 w9eKO65z6Qvo4aPSPOtu9OyE/wcpHRRpYOQgWgPLZbrb7tvMehRe1JL5s
 T/RwCsaFgNigSFn0ucwviXYl2qtjblDczYGghUkVyVJxz7wFMAYAPbu1N
 D9e/7sUDb1X+60koLd12jj91sXyNYwF3AgSBNV1EDRZOZLQNh9ogRczyA Q==;
X-CSE-ConnectionGUID: kogYs24QQOuyVv/WwpE5gA==
X-CSE-MsgGUID: k1ExEU9cRiuPVOvZzIHGWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53028470"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53028470"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:03 -0700
X-CSE-ConnectionGUID: ra4dTxN2QfSpOQWQSUAcqQ==
X-CSE-MsgGUID: gS5buGYSQnecVuHWMlZJhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154241542"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 0/7] Future-proof GT ID handling for Xe
Date: Wed,  2 Jul 2025 12:32:55 -0700
Message-ID: <20250702193254.2613121-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
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

Current Intel platforms fall into one of three cases:
 * Single tile, single GT (primary)
 * Multiple tiles, one GT each (primary)
 * Single tile, two GTs (primary+media)

In all three cases, the GTs are always consecutive (0 and 1) and the
GT's uapi ID matches its index in the xe_query GT list.  Future
platforms could potentially have multiple tiles with multiple GTs each,
and/or could introduce new types of GTs.  In either case, it's possible
that there might be "holes" in the set of GT IDs returned by the GT
query (e.g., 0, 2, 3 if a multi-tile platform only media on the second
tile; or 0, 2 if a single-tile platform introduced a new type of GT, but
lacked media).

We need to break IGT's assumption that the uapi ID used to represent a
GT always matches its index in the GT query.  This series shouldn't have
any functional impact on today's Intel platforms; the goal is to just
future-proof the code for new types of platforms that could show up in
the future.  Similar refactoring and cleanup is happening on the xe.ko
side at https://patchwork.freedesktop.org/series/150192/  although this
series does not depend on the kernel work.

v2:
 - Various tweaks to ensure 'unsigned long long' masks are handled
   properly on 32-bit architectures.  (Zbigniew)
 - Correct logic for xe_compute test; we need to ensure that the body
   of the per-GT loop doesn't have any open DRM fd's.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Matt Roper (7):
  lib/xe: Track valid GT IDs
  lib/xe: Don't assume GT ID matches location in GT query list
  lib/xe: Populate vram_size[] and visible_vram_size[] by GT ID
  lib/xe: Ensure GT loops iterate over all GTs properly
  tests/intel/xe_query: Look up GT reference clock correctly
  lib/xe: Add xe_dev_max_gt()
  tests/xe: Don't assume max GT ID is num_gt - 1

 lib/xe/xe_query.c        | 78 ++++++++++++++++++++++++++++++----------
 lib/xe/xe_query.h        | 10 ++++--
 lib/xe/xe_util.c         |  7 ++--
 tests/intel/xe_compute.c | 40 ++++++++++++++++-----
 tests/intel/xe_gt_freq.c |  8 ++---
 tests/intel/xe_query.c   | 13 +++----
 6 files changed, 112 insertions(+), 44 deletions(-)

-- 
2.49.0

