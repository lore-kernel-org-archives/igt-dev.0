Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCF3C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 10:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BD910F571;
	Wed, 31 Jan 2024 10:51:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DF410F571
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706698314; x=1738234314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jaHizhGi6hq3f/+THAWlC5EEZNN1oO1bBczIvl7+fOo=;
 b=bQdB0phzUWGy+dNVhNaoJ8rF8XoAiGO2wVrKCDhr9TSlo8v6LVgwrrJD
 VHAKfDybLE6YdPRrfNr2n3vIXgsnRiaxhfobaQPIJ0tjQX4hy8r11D4Tz
 X52dlhqUxLgIpFiamUzVDYjRQAaccBnxDE/oLDUKxnpzk3t0QtKmSeNNi
 NWPQZexWcPvFVVuQAGyWQ7jJdXlgkTSIg+WyADxkEyOX0RP7oSqcxKUIt
 0oL5NbWvZbb0qC1JmWtPeYv0KODWbyopZd1Rup6Ce2dajQfSJx4ZKe7eK
 i6UTSXD4l1vh4ALTM7HuXMIPEMarS96MoQNGIV70wm3kgxcF/v3J4+O6s Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10666429"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10666429"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911753068"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="911753068"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:51:52 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/4] Fill block-copy test gap for unaligned sizes
Date: Wed, 31 Jan 2024 11:51:44 +0100
Message-Id: <20240131105148.182261-1-zbigniew.kempczynski@intel.com>
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

Zbigniew Kempczyński (4):
  lib/intel_blt: Use object pitch and aligned height on png write
  lib/intel_blt: Add helpers for calculating stride and aligned height
  lib/intel_blt: Change surface size calculation
  tests/xe-ccs: Add tests which exercise small to large blit sizes

 lib/intel_blt.c      |  69 ++++++++++++++++++++-
 tests/intel/xe_ccs.c | 144 +++++++++++++++++++++++++++++++++----------
 2 files changed, 179 insertions(+), 34 deletions(-)

-- 
2.34.1

