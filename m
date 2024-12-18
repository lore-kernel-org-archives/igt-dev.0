Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F02E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6483010E460;
	Wed, 18 Dec 2024 21:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMMz/8uB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D658E10E24C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734557818; x=1766093818;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/++nHzrtTRBknrJF8exnkw2+R8qcscGlq0WXNwf4LQg=;
 b=hMMz/8uBRhyMnq5wYScTVQg/ogzoaOv+ncLhokE++p092UQGfZtTQzjK
 QUhMCSIpWs2RgPSAng8SEECW1HpccrA2IjkX42tw+o45shavQ0O0RczZr
 Vjtl9W3XtiycDcs9irpWbjVeCUm706v11LtlhUirICIaVfFlcEEv/6DqK
 PcMHgMQ5286rjue4R8rNyt5h86rgszz6vOGxC2WS0juuB8sEYUBemiuCQ
 /rv2uiHUTsai2uGog9vxzneyzcHOVv14ftCZWfBT4sFfNBYM9DReCW2ET
 9sWl9G659zN804q5bq3Z/gLgg3k5gDI1TJXj6UJbF/MbQvVnEXYcIXpjL Q==;
X-CSE-ConnectionGUID: 80YYlWX6ThW38A9MjnUFuw==
X-CSE-MsgGUID: iq/mLFMbQ2m5a+yGeTDi9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34379755"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34379755"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
X-CSE-ConnectionGUID: 6e24LMkYRJKQwFdxiO1jEw==
X-CSE-MsgGUID: b9xchgBaRX+H8WbqET7YXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128973914"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 0/7] Initial PTL support
Date: Wed, 18 Dec 2024 13:36:47 -0800
Message-Id: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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

Initial set of patches to enable testing Pantherlake.

Juha-pekka Heikkila (4):
  tests/kms_addfb_basic: fix x-tiled tests for case when there is no
    x-tile
  tests/intel/kms_draw_crc: fix x-tiled tests for case when there is no
    x-tile
  tests/kms_cursor_legacy: flip_vs_cursor_busy_crc was requiring any
    driver but used intel x-tile
  tests/intel/kms_frontbuffer_tracking: fix x-tiled tests for case when
    there is no x-tile

Matt Atwood (1):
  lib/intel_chipset: add pantherlake definition and support

Matthew Auld (2):
  lib/intel_pat: extend for xe3
  tests/intel/xe_pat: extend for xe3

 lib/intel_chipset.h                    |  2 ++
 lib/intel_device_info.c                | 13 +++++++++++++
 lib/intel_pat.c                        |  3 ++-
 tests/intel/kms_draw_crc.c             |  6 ++++--
 tests/intel/kms_frontbuffer_tracking.c | 20 ++++++++++++++++----
 tests/intel/xe_pat.c                   |  4 ++--
 tests/kms_addfb_basic.c                | 22 ++++++++++++----------
 tests/kms_cursor_legacy.c              |  2 +-
 8 files changed, 52 insertions(+), 20 deletions(-)

-- 
2.25.1

