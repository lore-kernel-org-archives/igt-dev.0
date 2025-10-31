Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3F2CCF9F8
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 12:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4601210E072;
	Fri, 31 Oct 2025 12:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBHT6DaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E6910E072
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761915424; x=1793451424;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ePx5W8KsW9p/5MXtjj0RoQhDRqK8IgClORHNfCIs/GA=;
 b=FBHT6DaWjb/duo8Ici0wPnUNSRhkiOpDU+MFDVQ+q8exU/c+fhxR6Dfe
 7wfLXb0vU7AD++OIxVFZtWtU514nkZswiUgRg1QcctcY2q0uHdTep0yuW
 YJQdwk/6P+LFNmyeNTrDY5xNsms+Za4bxsaoHHZxXGqQMe1LiJDUe3L+6
 L5p6wVVn56bRTu5tmcT4VL7I+aT/2HpsrwRk+Qjjs9ogIKoB8S/ofuw4Q
 vXAvtQ78UGllOZvOWYZoPTib1YvzxbJRfH6mE6Lo9ekF688ZGNz2o/ixm
 ApwY00k954k63hI+YiI8f71jWkY3CbpTPMl1lx6EHwwg2YaKIBgQBC5oT w==;
X-CSE-ConnectionGUID: VN0vVuD/SGyFgsvt7ThSEQ==
X-CSE-MsgGUID: ZaVjuK8BSBqX3yeEHmppAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63095070"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63095070"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:57:03 -0700
X-CSE-ConnectionGUID: gHPjVvWkS8yJmOAexV/+SQ==
X-CSE-MsgGUID: GjSf8W0VTQ+SJlUB39cFig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186166501"
Received: from lburylo-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.246.19.11])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 05:57:01 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/6] Multi-tile support for xe_sriov_flr and related
 MMIO improvements
Date: Fri, 31 Oct 2025 13:56:27 +0100
Message-ID: <20251031125633.1374273-1-marcin.bernatowicz@linux.intel.com>
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

This series builds on Piotr Piórkowski’s v2 of the tile-aware VF FLR
test (see [1]) and reworks xe_sriov_flr test.

Main updates:
 - Move shared helper logic to lib/xe_query (tile helpers)
 - Refactor xe_sriov_flr test to use per-tile subchecks
 - Use proper MMIO initialization helpers (xe_mmio)
 - Keep verify_flr() template intact while isolating per-tile data
 - Simplify MMIO initialization/cleanup
 - Mark failed prerequisites to ensure CI detects them

Thanks to Piotr for the groundwork and earlier revisions.

[1] https://patchwork.freedesktop.org/series/156216/ 

Marcin Bernatowicz (3):
  tests/xe_sriov_flr: Make subchecks Tile aware
  tests/intel/xe_sriov_flr: Use global MMIO context initialized in
    verify_flr
  tests/intel/xe_sriov_flr: Do not ignore failed prerequisites

Piotr Piórkowski (3):
  lib/xe_mmio: Introduce tile-level XE MMIO access helpers
  lib/xe_mmio: Add init flag and helper to check initialization
  lib/xe/xe_query: Add tile helpers and iteration macro

 lib/xe/xe_mmio.c               | 108 ++++++++--
 lib/xe/xe_mmio.h               |  18 +-
 lib/xe/xe_query.c              |  45 ++++
 lib/xe/xe_query.h              |   6 +
 lib/xe/xe_sriov_provisioning.c |   6 +-
 lib/xe/xe_sriov_provisioning.h |   2 +-
 tests/intel/xe_sriov_flr.c     | 365 ++++++++++++++++++---------------
 7 files changed, 354 insertions(+), 196 deletions(-)

-- 
2.43.0

