Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD13C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 10:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE7810F1AC;
	Thu, 25 Apr 2024 10:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7gpgEJJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7948010EA10
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714042047; x=1745578047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e/vzufVdzFcEfZ/wxVPRhzlqcV0Jivde1qtxVB9mYMw=;
 b=W7gpgEJJcr+6En391mq+HzWKLRKLut7/P89G+DChvHCUvJId30L2Q9t+
 Hf7dUSG3RiXWV5LLBbpRpzCsMls02f1RkKBX6jhfo7MXoBapei4sb8pug
 5JsYNJt2BH4FsJNWJm5YjxP+U04rj65Y41BaiEsdrMmo+BJwEoiNKGpIg
 M3TF95l9mtfCYHrodL46AcVZuxKf6effZPI0S7haCTIaEPEE1ka+ExTZ0
 6FeGJO6f7f2eczDarVqOSq69EUQDB2oaKm7c7glqYgBdZuC3u2vUO67Tg
 3R/pVYJGlP/NCiB6dt5xhnfJi8cx1sBpsWL7iQDPxIZ/vpuPPcPiwLjrm Q==;
X-CSE-ConnectionGUID: IfVrWsMMTISHcGDY4u5V9A==
X-CSE-MsgGUID: rYo3D1kERUWtzHPbvPakAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="32209681"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="32209681"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:27 -0700
X-CSE-ConnectionGUID: hVWVC5bAS3aQe5ZuTyiAdg==
X-CSE-MsgGUID: O7LAHu2gQFu0jLojPJ563g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25018079"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:26 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/7] Add render-copy compression on Xe+
Date: Thu, 25 Apr 2024 12:47:14 +0200
Message-Id: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
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

Fills the gap of testing render-copy compression with different
tilings.

Zbigniew Kempczyński (7):
  lib/intel_bufops: Store devid on buffer ops creation
  lib/intel_blt: Rename confusing fb tile to i915 tile
  lib/intel_blt: Add i915 -> blt tile helper converter
  lib/intel_bufops: Drop tilings restrictions
  lib/intel_bufops: Start supporting compression on Xe2+
  lib/rendercopy_gen9: Allow to use all tilings on flatccs platforms
  tests/xe_render_copy: Add subtest which exercises compression

 lib/intel_blt.c              | 25 ++++++++++++-
 lib/intel_blt.h              |  3 +-
 lib/intel_bufops.c           | 33 ++++++++++++-----
 lib/rendercopy_gen9.c        |  4 +-
 tests/intel/xe_render_copy.c | 71 +++++++++++++++++++++++++++++++++---
 5 files changed, 117 insertions(+), 19 deletions(-)

-- 
2.34.1

