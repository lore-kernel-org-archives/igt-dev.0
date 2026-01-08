Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232AED1D483
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 19:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC96210E0E4;
	Thu,  8 Jan 2026 19:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjGHbk4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC80510E378
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 19:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767901689; x=1799437689;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aA6g052eqPfR4MV+hUNUVaks3PDDqOzd4LK6Pq9CP2E=;
 b=BjGHbk4TfKx4n8+Zy2lxKfspjslXU45HLL4tC+k7LYUxc/SHVVhp0Owh
 tI02E7SF5W2ZF0opyDShoW6/xcxDPKOG38z5IwygWzhmCa3kOtJuEpc40
 kZQo9Zn255xVG+kK187dUkiz9Y57zWuFuh1XZqzJ1GcbPFScAPyblCIW6
 B4kW2cpoBr+sJa5k9/5x8BJqpgFAsnW52rVGt7o2+AnVuvhNABxV7dRXJ
 ZUJG9VQb0uXH65VK87FFEtW7jLtor/s+jpYEjkehMa/bsICzEpJL+KjN6
 58uMIHrWd9ebpQrJFJjDMHhUf0B0gMC2YElCU/7XK4z6updGdF8ZIo64Q A==;
X-CSE-ConnectionGUID: cTU1Ps20R9Kq1g3D8QsQvQ==
X-CSE-MsgGUID: T/93YcLeQJ+HDV6mSNb8rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73136091"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="73136091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:48:09 -0800
X-CSE-ConnectionGUID: nLgYYoYRTi2CLHVPeinDGg==
X-CSE-MsgGUID: UH2V8NztR+qeo9myUWvCmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202496591"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:48:05 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 0/2] tests/intel/xe_gt_freq: Modify test to support new
 throttle reasons sysfs
Date: Fri,  9 Jan 2026 01:18:59 +0530
Message-ID: <20260108194858.2124790-4-sk.anirban@intel.com>
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

Change throttle_basic_api to read the new atomic reasons attribute
instead of checking status and individual reason files separately.
This validates the kernel's TOCTOU-free throttling interface.

Sk Anirban (2):
  tests/intel/xe_gt_freq: Modify test to support new throttle reasons
    sysfs
  HAX: Add throttle_basic_api test to fast feedback list

 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_gt_freq.c                 | 48 ++++++++----------------
 2 files changed, 16 insertions(+), 33 deletions(-)

-- 
2.43.0

