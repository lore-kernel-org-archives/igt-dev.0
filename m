Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF36AC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 06:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE6510E55A;
	Fri, 19 Apr 2024 06:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7XWmA6C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC23010E55A
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 06:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713508153; x=1745044153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y2niHxjYuhfKMRyOZbEFva4ySBdG/t6GUfcHL5mLSKY=;
 b=M7XWmA6CqOnjeW3aIO8I6NFJlkrdfWwnz6s411Q8HGWmRYCtGR08yPUJ
 hdavwM0Zq3EqdpC3KMI2yw+t7CYHOkFgnuhM5IGN6X5+58iiVtZnsHjwe
 y7wGPw2c6EefNxTKl8wKoa8O71yolSrf9+HYcOczSnkpX5HCDVvdKQl9m
 tNsv6giJNfAu1Z7TpR+7vQ4g0qB6A1SMfXMnZOg7WzySpAe6fPUwW6bLk
 eBapNwif5+WJB4ZPF6jQVjoqJPEZ7/BzUc4Sx2IC6zI5rr8L0iS/aUDJe
 bXCJqacgh8MmDwUiVwvbyEkHo7LqkpltF1iK8TeHO5yNvsiQnRvDooXmY w==;
X-CSE-ConnectionGUID: qLR+Nob1TIy8TA5zZIEBwA==
X-CSE-MsgGUID: q1BwYRkWTdOghnR99IEk5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9637538"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9637538"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 23:29:12 -0700
X-CSE-ConnectionGUID: nuBf9VqrQOSrdPq40JDHdw==
X-CSE-MsgGUID: QXb4VDQ4Sk2w2z5vHOUNow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23310756"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 23:29:11 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/7] cleanup and fixes for kms_big_joiner
Date: Fri, 19 Apr 2024 12:09:54 +0530
Message-Id: <20240419064001.2401850-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

fixes and cleanup for kms_big_joiner test

Kunal Joshi (7):
  lib/igt_kms: don't run on unsupported platform
  tests/intel/kms_big_joiner: fix crash in multi joiner test
  tests/intel/kms_big_joiner: add missing commit after reset
  lib/igt_kms: add support for forcing bigjoiner on particular connector
  tests/intel/kms_big_joiner: use kmstest_force_connector_bigjoiner
  lib/igt_kms: remove unused igt_force_and_check_bigjoiner_status
  HAX: Do not merge

 lib/igt_kms.c                         | 105 +++++++++++++++++++-------
 lib/igt_kms.h                         |   2 +-
 tests/intel-ci/fast-feedback.testlist |   5 +-
 tests/intel/kms_big_joiner.c          |  28 ++++---
 4 files changed, 98 insertions(+), 42 deletions(-)

-- 
2.25.1

