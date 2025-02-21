Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46152C021B5
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 15:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083D610E2D3;
	Fri, 21 Feb 2025 15:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iILGuU8O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB6410E2D3
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740152266; x=1771688266;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+iOSQpL3j3jMFDBGIWk+tYkcFOoasU3GMtZ+JeeVpJA=;
 b=iILGuU8Ov1mnRFPfk28Fop+Q0RfQwuOs7y3i2ejOL2Zux88k5hozmbDQ
 6OKko4R/VpEm2hoyBertWwzyfJ9dNjdXDXY84zp2M0a3CGXbCpogOqbSo
 VANI6C82TEsTwFC6Mk9VzZvKSlMLJJyM6uy8equHD5UhqmoXGvNNaXyqh
 cFSzB9Sg/Y8h+69NiN3LgVZQ38tkDkPgh14pKE1IDSGHnzokP/OphsCH+
 Vf9qWEDmA0Dhbsr6+r/cQTe0KU2/Cq+5GtiOrflox8HUFUYSmQ9Ahr5o8
 JYqzwq7SmN3JSYF6bG1R/IjygdRrtcwXaOD0GzcH0XKqhi4yD9i1syA8J A==;
X-CSE-ConnectionGUID: wHMQ7uZmR3GvseFh95+0zw==
X-CSE-MsgGUID: IWk0IpLkSBSAG+/1j5vr2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51599063"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="51599063"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:37:45 -0800
X-CSE-ConnectionGUID: l9Ij5K28Twutm+Bag2YnSQ==
X-CSE-MsgGUID: a28XTT+5T3mJLk33ukzncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120378232"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 07:37:44 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v5 0/4] xe: Test scratch page under fault mode
Date: Fri, 21 Feb 2025 10:53:32 -0500
Message-Id: <20250221155336.378911-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

This series intoduces a subtest for Xe to test scratch page under fault
mode.

It also includes some helper functions to make the test easier.

Today most of igt tests use one single function to perform multiple
subtests. flags are used to control the behavior of the test. While
this is a good way to write efficient tests, it also makes the test
difficult to maintain, especially when we add more and more subtests
into single test function.

This patch series introduces some helper functions with which we can
write more readable tests. This is illustrated in patch 4 of this series.

Note the intention of this patch series is not to replace the existing
igt tests, but to provide an alternative way to write simple tests.

Bommu Krishnaiah (1):
  lib/xe/xe_util: Introduce helper functions

Oak Zeng (3):
  lib/xe: Fix a comment error
  tests/intel/xe_vm: Exclude invalid_flags tests from LNL and BMG
  tests/intel/xe_exec_fault_mode: Test scratch page under fault mode

 lib/xe/xe_ioctl.c                |   2 +-
 lib/xe/xe_util.c                 | 239 +++++++++++++++++++++++++++++++
 lib/xe/xe_util.h                 |  39 +++++
 tests/intel/xe_exec_fault_mode.c |  68 +++++++++
 tests/intel/xe_vm.c              |  47 ++++--
 5 files changed, 379 insertions(+), 16 deletions(-)

-- 
2.26.3

