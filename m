Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E902C5B549
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 07:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AC510E7F0;
	Fri, 30 May 2025 07:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5sUQ1Z4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F0B10E7CA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748591690; x=1780127690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jkZ0YyCbCyALQw3hI8PrZBa99kS2aN/+L1dRB7pFvwE=;
 b=F5sUQ1Z4f4CfFgkm+yb+dY3dXRoNDAjXz5RsilZXEf7BY7a+ckk6mMhx
 cEQN5dBjXIFHwL8oJQ4+jWkD14CGhmxaRnJCGiZ5WkOxyIq7JPZUDZRCi
 QJ5KntfWlvbBBbhJsm+iQLSHw8T4FfF4BMuGXoNq7JC8XBQqbnHFhnDtj
 l/coWSlAK65TAlM3Y/ehDnLxjTaS74p6Z9RrysIMwFnZRNQVpW98QFvea
 5/JTxKP00i06qx0yWiYb8sbz4bwP1djkowWWzs3hnRih7eC5slBbDgK8t
 K0eukGHfZb1Z1xldxdD3j9YC/goVO2OgUW1rINAfTFdJ/1IswSI6Ffb9v g==;
X-CSE-ConnectionGUID: SMKgDxj1QjyfVCKVP6ObWg==
X-CSE-MsgGUID: LbKStAvvRsGBmpdCr+qu1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="76068450"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="76068450"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 00:54:48 -0700
X-CSE-ConnectionGUID: Hwzisn3QTxKrysVgKE26Pg==
X-CSE-MsgGUID: 78SnyiE0SHCxw9FeZWa9+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="144787233"
Received: from linux-lunar-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa009.fm.intel.com with ESMTP; 30 May 2025 00:54:47 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v4 0/2] Refine FBC test conditions
Date: Fri, 30 May 2025 13:28:09 +0530
Message-Id: <20250530075811.1033-1-mohammed.thasleem@intel.com>
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

Refine FBC test conditions.

Mohammed Thasleem (2):
  lib/igt_debugfs: Add specific checks for WA in GTs
  tests/intel/kms_frontbuffer_tracking: Enable the tests support
    variations based on the WAs

 lib/igt_debugfs.c                      | 39 ++++++++++++++++++++++++++
 lib/igt_debugfs.h                      |  1 +
 tests/intel/kms_frontbuffer_tracking.c | 24 ++++++++++++----
 3 files changed, 58 insertions(+), 6 deletions(-)

-- 
2.34.1

