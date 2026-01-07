Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C116CF6C1C
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 09:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06AD10E579;
	Wed,  7 Jan 2026 09:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWjBD+0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1272F10E579
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767778036; x=1799314036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y/q+bH4cRPFlsAscfpbCH73FgG9IchtwNAaqIvRW80A=;
 b=aWjBD+0mF8KCY5Fu0IN6q1RdDJEa5P6S0JrnqST+6Q32b2/OrggwnGJk
 lzC1FPt8Ju+xR/6ITOUswHR0DdAYgluPltI2FOO8OyUfDx7OYtLccH43p
 0rnlFwyxGlCcsg9hK2LZaBJ59BA+dI9aE7aW0IoGlimNUuKEcsN/srTYz
 yYVsdmmONpRRcAxizBs1rYr6MKajph0L2sEnKCQMwTBunDiv4P6e2fbOF
 gjvPhX8EuAvufD8XLmr6oRoFhWca1j8+/2QljMAcbgkDBFp9jmo8T1UMR
 zOKlMWJYEAG3bdofTATyFF8gHTnYyck+02meYVyxDZZwUS63wdyrSSunf A==;
X-CSE-ConnectionGUID: f5Z5Vvc4QXiVNmWujny1rw==
X-CSE-MsgGUID: 7JzCcoDHQFKCqhNP0BqQNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68337742"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68337742"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:27:15 -0800
X-CSE-ConnectionGUID: gEv/VrxTRCqugUB9Pj6vzQ==
X-CSE-MsgGUID: 2QHjddQlS7GK8R+jUz8CYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207412516"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:27:11 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v2 0/7] Add NVL display related test updates
Date: Wed,  7 Jan 2026 15:05:28 +0530
Message-Id: <20260107093535.70116-1-swati2.sharma@intel.com>
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

This patch series adds NVL display related test updates.

Juha-pekka Heikkila (2):
  tests/intel/kms_flip_scaled_crc: add flip to reflect-x tests
  tests/kms_plane: add test and limitations for odd height planar tests

Nemesa Garg (1):
  tests/kms_plane: modify the condition for odd pan

Pranay Samala (1):
  tests/intel/kms_frontbuffer_tracking: Add FBC support to FP16 formats

Sai Teja Pottumuttu (1):
  tests/intel/kms_big_fb: NVL supports horizontal flip with linear
    surfaces

Swati Sharma (2):
  intel-ci: Add NVL display blocklist
  tests/intel/kms_test_config: Add NVL display blocklist entry

 tests/intel-ci/xe.nvl.display.blocklist.txt | 132 ++++++++++++++++
 tests/intel/kms_big_fb.c                    |  20 ++-
 tests/intel/kms_flip_scaled_crc.c           | 158 ++++++++++++++++++++
 tests/intel/kms_frontbuffer_tracking.c      |  58 ++++++-
 tests/intel/kms_test_config.json            |   3 +-
 tests/kms_plane.c                           |  74 ++++++++-
 6 files changed, 426 insertions(+), 19 deletions(-)
 create mode 100644 tests/intel-ci/xe.nvl.display.blocklist.txt

-- 
2.25.1

