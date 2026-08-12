Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5F0C5B56A
	for <igt-dev@archiver.kernel.org>; Wed, 12 Aug 2026 13:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486EB10EFC9;
	Wed, 12 Aug 2026 13:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2tf3O+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095FB10EFC9
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Aug 2026 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786540052; x=1818076052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DUI966ndDab+CdbNvgzBkjI9vA4StejVI0zbych8cj4=;
 b=D2tf3O+RaXDw6d6dKV1KkNjmHm2HiPzkh+U2lHYRLQK/0Zi29rxDY37j
 N1NViYKPUeTSRxs/nwP3iZJywPi8u2FwsFs6k9PAqeC0twFEdNvxZjnXY
 wVGMKqgkQFN7OEmOWruQ8vnpkkfd1wEtvujp5C8HkiwBYyYXFLp9RSutQ
 +mveRORI8cWhNhK4nZPjueOMN3u5DJKxgfM1k3n5EYBwtNBI4LeUhu7o5
 PZgez0kpCQljbG2PrFgLM3fVfBDETiii65s7k4JDGsFHs5eBiKMbOXKB3
 PP7eFmjDdHahOdLpkPQ6wRy/IxN7R/P19hcf9tUDP8Qkzzoqc8dZedNC8 A==;
X-CSE-ConnectionGUID: gLCKdWHnSSSgQjH9Ly1O3Q==
X-CSE-MsgGUID: G4ltfnJyQYeGG4vC4T1tRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98454599"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="98454599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 06:07:31 -0700
X-CSE-ConnectionGUID: IwbhOHrHTh2dxYU+8ozXvA==
X-CSE-MsgGUID: pELgoMzfQ46iAhf/bWqT6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="267503528"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 06:07:30 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v4 0/2] Add CMRR subtests
Date: Wed, 12 Aug 2026 18:37:34 +0530
Message-ID: <20260812130738.1242659-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add a subtests to validate CMRR with video mode and fixed mode.

Naladala Ramanaidu (2):
  lib/igt_vrr:Add VRR helper library for display refresh rate testing
  tests/kms_vrr: add CMRR fixed and video mode subtests

 lib/igt_vrr.c   | 154 ++++++++++++++++++++++++++++++++++++
 lib/igt_vrr.h   |  44 +++++++++++
 lib/meson.build |   1 +
 tests/kms_vrr.c | 204 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 403 insertions(+)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

-- 
2.43.0

