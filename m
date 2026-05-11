Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70D5CD37B7
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 05:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507F110E485;
	Mon, 11 May 2026 05:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xu+uyVWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15B510E485
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 05:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778476952; x=1810012952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xPNJXMsfcRmy9Ar8ooiQduQ3M6zKqy/sh7pO9zTasu8=;
 b=Xu+uyVWpQKKYRmGZ+2HPId9NLkvB2onoPfq6gWnNa1RPlJiaB8MzKY+n
 wAPMTgzgqxIv0K9pVm8UBc7O3TShl51CyaZsTHEkc0GQAq7VMrsMjr4Wg
 TuCvVUNUfV91QEgprYiWE6NFiR0zoMff8eNvJ0qyreuADzI1DnR0NeUbq
 U7ocSEdOyhMz69hYq3Tk35s8MfqaoU1oAOzgnzc1Zp35IPeSVhkqelt44
 Al4gL1CiH8e/8f2rcYAWwIbNs/vwG6T18m4adakKNyaT+gt271emAI7p3
 QTCb1nSPhQEs3BTb7fraTuF6+Cwl7fvnPpZ2SMZUlVtkMNW/86D1LIug9 w==;
X-CSE-ConnectionGUID: i2aR8zNZT4GtJhhqvMerBA==
X-CSE-MsgGUID: Gzm5Kk/ZQHKgFeAoHOTO1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="90823860"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="90823860"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 22:22:32 -0700
X-CSE-ConnectionGUID: wxOXcB4aROSCsgFqkBIDgA==
X-CSE-MsgGUID: wMtXVq25Q9yHiAmzksOouQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="237299736"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 22:22:32 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/kms_tbt: Add DP tunneling validation
 tests
Date: Mon, 11 May 2026 11:13:54 +0530
Message-Id: <20260511054356.1313884-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add an IGT test binary (kms_tbt) that validates the DP tunneling
debugfs ABI exposed by drm/display/dp_tunnel and consumed by
i915 / xe. Pairs with the kernel DP-tunnel debugfs RFC series.

Patch 1 adds a connector-enumeration helper backed by
libdisplay-info for look-up by EDID serial / MST PATH across
re-probes, plus clock-based mode-selection utilities.

Patch 2 is the kms_tbt test: 18 single-display subtests and 9
multi-display / MST subtests covering BWA toggle, bw_limit cap
injection, suspend/resume, and mode filtering.

Below link points to corresponding KMD patch series
https://patchwork.freedesktop.org/series/166289/

Kunal Joshi (2):
  lib/igt_connector_helper: Add DRM connector helpers using
    libdisplay-info
  tests/intel/kms_tbt: Add DP tunneling validation tests

 lib/igt_connector_helper.c |  525 ++++++++
 lib/igt_connector_helper.h |   45 +
 lib/meson.build            |    5 +
 meson.build                |    3 +
 tests/intel/kms_tbt.c      | 2583 ++++++++++++++++++++++++++++++++++++
 tests/meson.build          |    5 +
 6 files changed, 3166 insertions(+)
 create mode 100644 lib/igt_connector_helper.c
 create mode 100644 lib/igt_connector_helper.h
 create mode 100644 tests/intel/kms_tbt.c

-- 
2.25.1

