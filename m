Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4054DCCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 15:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC0B10E92E;
	Thu,  6 Nov 2025 15:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TZhyb0tD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFE210E92E
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762442899; x=1793978899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1gNLJtf9gBSzP3Tay5qvtD88GzhNkacjHRaG2RK0oXk=;
 b=TZhyb0tDPYWNMNHJq1hz/SGTMaIk0Vw0OM8D3vKDK0Ncyw09gPcwv+iM
 rxf9w/GZzOUV/K3mBYwN9wsnQyyVncDjkdpW+pVpsUDfmup0SJH/+rZ8l
 eI4LSzy14tloHWzOtPOlmC7I/1NE+eLRzfLArn7W3rKmKbls7ylC63fVl
 uQokE1HA901fojvOnXIwAjIRypsQPVOizSy87yjh8KTP1KgG7aoW2yGBa
 BQyDC8+7Lxal1CyZfZf7LHj6BqONQxezVitJbMCnkHiWJREzASc7H18eQ
 iSbn9xbENp9Ez0JNvlEKAZVNW9YMUKOpxb5Lfkiv7IVYC8dLPmyGYGgDN A==;
X-CSE-ConnectionGUID: kA39AvviSl2je1FOKYe5oQ==
X-CSE-MsgGUID: k8Zx9WJrRzCD67HTQSxSVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="67193175"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="67193175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:28:18 -0800
X-CSE-ConnectionGUID: HkqWBVOpQvWVWgcPJ51ODQ==
X-CSE-MsgGUID: GSWaNT3aRDC8Qmp+bv/p0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187445941"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.65])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:28:17 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: piotr.piorkowski@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/6] Multi-tile support for xe_sriov_flr and related
 MMIO improvements
Date: Thu,  6 Nov 2025 16:28:04 +0100
Message-ID: <20251106152811.1997614-1-marcin.bernatowicz@linux.intel.com>
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

v2: 
 - Drop misleading GT-oriented helpers (Lukasz)
 - Add missing colon in xe_tiles_count function doc (Lukasz)
 - Use xe_mmio_tile_read32; update patch 4/6 title; fix extra space (Piotr)
 - Switch num_vfs to unsigned int in struct g_mmio (Piotr)

Marcin Bernatowicz (3):
  tests/intel/xe_sriov_flr: Make subchecks Tile aware
  tests/intel/xe_sriov_flr: Use global MMIO context initialized in
    verify_flr
  tests/intel/xe_sriov_flr: Do not ignore failed prerequisites

Piotr Piórkowski (3):
  lib/xe_mmio: Introduce tile-level XE MMIO access helpers
  lib/xe_mmio: Add init flag and helper to check initialization
  lib/xe/xe_query: Add tile helpers and iteration macro

 lib/xe/xe_mmio.c               |  92 +++++----
 lib/xe/xe_mmio.h               |  15 +-
 lib/xe/xe_query.c              |  45 ++++
 lib/xe/xe_query.h              |   6 +
 lib/xe/xe_sriov_provisioning.c |   6 +-
 lib/xe/xe_sriov_provisioning.h |   2 +-
 tests/intel/xe_sriov_flr.c     | 365 ++++++++++++++++++---------------
 7 files changed, 312 insertions(+), 219 deletions(-)

-- 
2.43.0

