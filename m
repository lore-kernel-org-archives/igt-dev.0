Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E47CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 19:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8457710E2F8;
	Mon, 10 Nov 2025 19:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrVYgk6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCC810E2F8
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762802706; x=1794338706;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KyazWswGUOLNlTi6x+41o7lehewU3WYj0veBFJ8QOuU=;
 b=VrVYgk6x3thTzj32k/9om1ebuvrJ53MYJ2lZJQl2qgs/MvsZB8aFzPSU
 JEuhzh88pubcRK0UDk1WW8AUwn7X7l9ZbD7udLBhjxkHsq9Y4is+DTTQP
 TX5ZWO6HOd3wMizykx0maOcmJIVsvY0B32bqDKHoAN74b7EAnwerrwIlI
 Ys0dhi3ugNDj31XxaEUfcWwL3WgnTLIs/ripfiMjCkGMFHqvGFBgYy+VY
 h5NfL1Xww+fbBEu2BJ3yf5Uuhtn4/7ZsAWT+BtSkBnKMzJMUVvLa9ZSw8
 Tgn/n8qufb76gxfhKiifqHTZJ7qjxvhdL4ywBOy06qzYiuNdoiy1GpF2/ g==;
X-CSE-ConnectionGUID: OIvWbR8wSOOg7WJ0xd27NQ==
X-CSE-MsgGUID: FyUkTXcoStydQwD7R2B50w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64900252"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64900252"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:25:06 -0800
X-CSE-ConnectionGUID: TeRem1oETEeWeG8On5yM7g==
X-CSE-MsgGUID: fnqyWIXUS/CKKO/oAGrZ+A==
X-ExtLoop1: 1
Received: from linux-panther-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 11:25:04 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 0/8] Revert WAs and skip FBC on BMG
Date: Tue, 11 Nov 2025 00:54:46 +0530
Message-ID: <20251110192454.44385-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.48.1
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

Revert WAs and skip FBC on BMG platform.

Mohammed Thasleem (8):
  Revert "tests/intel/kms_frontbuffer_tracking: Enable the tests support
    variations based on the WAs"
  Revert "tests/intel/kms_dirtyfb: Enable the tests support variations
    based on the WAs"
  Revert "tests/intel/kms_fbcon_fbt: Enable the tests support variations
    based on the WAs"
  Revert "tests/intel/kms_psr: Enable the tests support variations based
    on the WAs"
  Revert "tests/intel/kms_psr2_sf: Enable the tests support variations
    based on the WAs"
  tests/intel/kms_*: Remove FBC disable comment
  tests/intel/kms_psr: Skip FBC tests on BMG platform
  tests/intel/kms_psr2_sf: Skip FBC tests on BMG platform

 tests/intel/kms_dirtyfb.c              |  6 ++----
 tests/intel/kms_fbcon_fbt.c            |  7 ++-----
 tests/intel/kms_frontbuffer_tracking.c | 15 ++++++---------
 tests/intel/kms_psr.c                  |  7 +++----
 tests/intel/kms_psr2_sf.c              | 10 +++++-----
 5 files changed, 18 insertions(+), 27 deletions(-)

-- 
2.48.1

