Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F32C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 12:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D471110E9F9;
	Fri, 28 Mar 2025 12:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQbJWDZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67BD10E9F9
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743166005; x=1774702005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ImzqnnPQCkc6qu9U7p4VWG7zZ1cr0M/KFc9HTM3c2ms=;
 b=IQbJWDZClUm3Bg1B93U2oowtsLckH7nJtmt8xOtsefj/B7EQaV4tcTi5
 dwCruLgUXYOsy4Zq3zalA46erXsrjcJjBmPSyCJqa+1t5Qehmk5hEdu3A
 ZWi2vbdN50PV+Uil5xwzN5A20IR/GIDaFSbwvcja25yFdl0PZh2yIwUHP
 sNgGP0aNf4l+VkiW6KZimP/tObiITdj4KBFZhHYMOmEylzZHZFv9miBhQ
 PhQ64G6JsBfjeHWJMM3vZCwBYzzHyEj9TkX571rE1mkLcKqwkET/kVhqM
 Lk6c8ywQd/LKbvv6IpXpH8pbnDYaBGq71+pl8+b2l1jED+DavO79sPhbM A==;
X-CSE-ConnectionGUID: 63NNny5oRnCDSWTGuoNevw==
X-CSE-MsgGUID: Yf07OoAPQxS+PEIzUp8/cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44419775"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="44419775"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:46:45 -0700
X-CSE-ConnectionGUID: SI+2ncWQSwCnIoVSgnihog==
X-CSE-MsgGUID: KHl0kqQbRVWhcrnluwTcAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="125441273"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 05:46:44 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v1 0/2] Fault variations of tests
Date: Fri, 28 Mar 2025 12:45:53 +0000
Message-Id: <20250328124555.255036-1-jan.sokolowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

This is a series of patches introducing fault variations, that is,
tests are accessing the memory via debugfd, by creating
a vm in FAULT_MODE.

Signed-off-by:Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>

Dominik Grzegorzek (2):
  tests/xe_eudebug: Implement faultable variations of some testcases
  tests/xe_eudebug_online: Implement faultable variations of some
    testcases

 tests/intel/xe_eudebug.c        | 84 +++++++++++++++++++++++++--------
 tests/intel/xe_eudebug_online.c | 22 ++++++++-
 2 files changed, 86 insertions(+), 20 deletions(-)

-- 
2.34.1

