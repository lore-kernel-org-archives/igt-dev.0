Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F20EF8A14D
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2A410E098;
	Thu, 16 Apr 2026 09:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEl6jc2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7063C10E098
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331574; x=1807867574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qtKg6l5v5saCmlMC0QsfeVR8V4u5RN5eX5TYJgRvfLI=;
 b=OEl6jc2KHYaD4gAd6EeuguB7pbWgApojNySeGFXmgMLpmp4p9bJ07G0W
 0bVz32LlftOaQe05K6ekpIF2SrvBa/4vNT8l0JQTUs0oem004i+Xali/i
 VtFHij0n2rkPOvfhAhX3dnt7STeUDKE8VKJ4coDMQCXbzp0EUcYpbaPo3
 m/AgBMJCgOSIFDNd8vhnroRzzP3P5FqKawNZ3vNP48+D9e9pSvQNiwyMD
 gylZzWqcojYVXlfZEhwDxyGN1TQTtObVApjrteKQ3Z9EQdY9zpjBT2khJ
 xn3HkjxX1VzFK+CNO3RNTFYSKOj6PvgeqOAoX3uBaiJ7aG1boCCD4RWD9 A==;
X-CSE-ConnectionGUID: Z7hfmwJtTciUiihNBw26gA==
X-CSE-MsgGUID: XxvhiUtBT2WGEG/XQJPf4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775873"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775873"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:13 -0700
X-CSE-ConnectionGUID: ZVXg0d7SQEGbZVwUN24F4A==
X-CSE-MsgGUID: cjQFsxMxQfa4zTUXJbCMAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235062969"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:11 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 00/11] updates to fbc tests
Date: Thu, 16 Apr 2026 12:25:48 +0300
Message-ID: <20260416092559.88735-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

Some of the fbc status texts are outdated, fix those.
FBC cannot be enabled if the plane size is too big. Such cases
to be treated as skips instead of failures.
And some cleanups where we query the current fbc status from
the debugfs.

v2: a common function to check fbc skip reasons
    avoid multiple fbc status read for skip reasons
    removed the dirty rect patch from this series

v3: kms_fbcon_fbt to use the common fbc_skip_reasons check as well
    and some refactoring related to that.

Vinod Govindapillai (11):
  lib/i915/fbc: extract intel_fbc_get_fbc_status()
  tests/intel/kms_frontbuffer_tracking: use intel_fbc_get_fbc_status()
  tests/intel/kms_frontbuffer_tracking: update the outdated fbc status
    reasons
  tests/intel/kms_frontbuffer_tracking: consolidate fbc tests skip
    checks
  tests/intel/kms_frontbuffer_tracking: use a bigger buffer for fbc
    status
  tests/intel/kms_fbcon_fbt: use a bigger buffer for fbc status
  tests/intel/kms_fbcon_fbt: update the outdated fbc skip reasons
  tests/intel/kms_fbcon_fbt: refactor the code to get the right fbc
    status
  tests/intel/kms_fbcon_fbt: find and store the crtc index
  tests/intel/kms_fbcon_fbt: find the correct fbc status of a pipe
  tests/intel/kms_fbcon_fbt: use common routine to skip tests on fbc
    status

 lib/i915/intel_fbc.c                   | 101 ++++++++++++++--
 lib/i915/intel_fbc.h                   |   6 +
 tests/intel/kms_fbcon_fbt.c            | 154 +++++++++++--------------
 tests/intel/kms_frontbuffer_tracking.c |  75 ++++--------
 4 files changed, 184 insertions(+), 152 deletions(-)

-- 
2.43.0

