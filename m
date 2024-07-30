Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9F5C3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 21:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A67F10E057;
	Tue, 30 Jul 2024 21:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZE8q4Kv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFF310E057
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 21:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722375343; x=1753911343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X7Aw6kHJhg+yHKg0ltdN60VlgnMfKrtiSt179uv6hec=;
 b=ZE8q4Kv6B5TmMRzKNh6kW/biO7cFq0dwB8Bys6lct12lHs05kfP05YrP
 qFZ3Cr/RjAWZg7OHqSNiw+w2H8h6T/IEZf1Lo+vCa3v4ieV43hkg4naD9
 PmuKo5LeSdFqrUYp32K4KhZaBJornM436HmH5ixMNIhZanvc7hR+kUwoU
 A5MUSpnqGgF22rYDA2fFfSct92tKESd2omS1EeWUOdLxQx9dmwS52kXWr
 vXmUENj2wLBbbU12ORqOuVhWYmAbeAHllFkzJaBF5HaCvLnIz7oeMGNk9
 mSiVHn0sKKX+JiRxxCWT76MDv4adPunIy8pxQro1NIEqEhhk1lPtcbYxW A==;
X-CSE-ConnectionGUID: DTzqA4sCQBS+PSPACwH9wg==
X-CSE-MsgGUID: CiAPAKQHRNeCm3AtoJNxrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="37694588"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="37694588"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:42 -0700
X-CSE-ConnectionGUID: MJXWngS9Rgmm2DkDapchlg==
X-CSE-MsgGUID: DYCXODIoQAma489em+sAXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59321708"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.190.219.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 14:35:41 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 00/10] add test to validate fallback
Date: Wed, 31 Jul 2024 02:43:31 +0530
Message-ID: <20240730211343.58703-1-kunal1.joshi@intel.com>
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

[1] provides debugfs interfaces to force link training
failures, retrain link, set/get current/max link rate/lane count.

add new test using newly exposed interfaces to validate fallback.

[1] https://patchwork.freedesktop.org/series/133624/

Kunal Joshi (10):
  lib/igt_kms: add enum for link rate and lane count
  lib/igt_kms: add function to force/read a target link rate/lane count
  lib/igt_kms: add function to get max link rate/lane count
  lib/igt_kms: add function to force link training failure
  lib/igt_kms: add function to force link retrain
  lib/igt_kms: add function to check if retrain disabled
  lib/igt_kms: add function to check force link training failure support
  lib/igt_kms: add helper to get pending lt failures
  tests/intel/kms_dp_fallback: add test for validating fallback
  HAX: Do not merge

 lib/igt_kms.c                            | 389 +++++++++++++++++++++++
 lib/igt_kms.h                            |  39 +++
 tests/intel-ci/fast-feedback.testlist    |   3 +
 tests/intel-ci/xe-fast-feedback.testlist |   4 +
 tests/intel/kms_dp_fallback.c            | 361 +++++++++++++++++++++
 tests/meson.build                        |   1 +
 6 files changed, 797 insertions(+)
 create mode 100644 tests/intel/kms_dp_fallback.c

-- 
2.43.0

