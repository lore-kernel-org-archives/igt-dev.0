Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A8BC28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 09:08:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507CB10E039;
	Thu, 20 Mar 2025 09:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtPXIH6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9351510E039
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742461680; x=1773997680;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZfVIouZGVDcI00nrrKH5FcgckPR4t3f5M76qogZsJT8=;
 b=YtPXIH6ZcyWRlYXth47HEZrS1SJXj1edi29lFmRcAKOYrSUt47fYhY+N
 Yk6BdS3jNDjR4ENGZGOV+LVfULKBJPltRfbcMwh3RNqkbKc0ItghsX7g5
 3fmMQPCY4OYNe966w5bIvPr/iOMT/0WvVLyGaG1YWH0Dmq6V5iQWyB2HM
 SZs8/VQpJBkZDazz23X9sp7hdtuKplFetG+mmyYAi31TT18PVjqFOyEiy
 u3nye29pSN25sIIkeHmcXxuadWagksHIN3e3cMEQ9Ra+8IfCZMHcegxg1
 lfccWoqQaXYrYp/RBEKYa9+PisAyb6FtrBgUaLvmTI2yxaILMspcZYF+o Q==;
X-CSE-ConnectionGUID: PblSDWMMSSOu+HYaKtRZbw==
X-CSE-MsgGUID: 9Rv47Ob0QUu1NbCq4GDu4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47457131"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="47457131"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 02:08:00 -0700
X-CSE-ConnectionGUID: YDXV7A5ORAetlZRjXd0X9A==
X-CSE-MsgGUID: BdGL3yWNQ/6H70yTozNcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123493604"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2025 02:07:57 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 0/2] Refactor DRM Debug Severity Handling for
 enhanced precision
Date: Thu, 20 Mar 2025 14:37:53 +0530
Message-Id: <20250320090755.482723-1-pranay.samala@intel.com>
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

This patch addresses the need for more flexible handling of the debug 
mask in the test framework. The changes enable users to pass a bitmask 
option during execution, allowing for dynamic updates to the debug 
mask as required. If no mask is provided, the debug mask defaults to 0x4.

Additionally, the exit handler has been updated to restore the original 
debug mask at the end of the test, ensuring consistency. This 
modification improves the flexibility and robustness of the DRM debug 
logic, making it easier to control the debug mask throughout the test.

Pranay Samala (2):
  lib/igt_sysfs: Update DRM debug mask handling for verbosity control
  tests/kms: Simplify DRM debug mask update

 lib/igt_sysfs.c                         | 61 ++++++++++++++-----------
 lib/igt_sysfs.h                         | 20 ++++++--
 tests/intel/kms_dp_linktrain_fallback.c | 40 ++++++++++++----
 tests/kms_atomic_transition.c           | 25 +++++-----
 tests/kms_cursor_legacy.c               | 38 +++++++++++----
 5 files changed, 123 insertions(+), 61 deletions(-)

-- 
2.34.1

