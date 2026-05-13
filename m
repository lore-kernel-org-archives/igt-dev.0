Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D7ECD37AC
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 19:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609DE10F018;
	Wed, 13 May 2026 19:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrIk/y1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BEA10F018
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 19:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778699328; x=1810235328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ej3jmuuLPfsn2EV2hBqhsM4Cs677k7NrSOWc6C6snNo=;
 b=RrIk/y1mklS7T5GpJ04ZnAWWxExg2ayYJb2hkuNZK+eRTwazteVv8nm3
 GrHq6tlKs6x+rsBa3g3U/NNjW55NRQUI3exPA0exN6yL29hkHsFukNOFV
 MCo6KHWPTRYVakAY5VxdC6OyUC0kO3ndtYUZ4CiOHb8u1zRplMKQwpAuV
 SAWxLhK+Dt8/wVpCi9hjVZF64Wn2mMPzG+WL9oMJ/cHih+I0F+Mfe85T9
 4ZPldocTNu/7f3iddhXzkZD3HFhSMi0SJVcxTj2rBbZhixm0q/XZwdkXN
 mKNftNkLTQRo/c7rwYojkoZLZVjRtmjMUJlkiZiZTUvD00esHYZVEOthy Q==;
X-CSE-ConnectionGUID: /3R9/LkeQ9uQwQ1GYdJo/g==
X-CSE-MsgGUID: IP/EF6ZVTC+bjmeSVXtN0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79350485"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79350485"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 12:08:47 -0700
X-CSE-ConnectionGUID: N+7i8t8eRwS1XoV2I2AgBA==
X-CSE-MsgGUID: IoMoNB62TbqLZf+l+s2P+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="242511689"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 12:08:46 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 0/3] tests/intel/kms_sharpness_filter: Remove plane-scaler subtests
Date: Thu, 14 May 2026 00:47:29 +0530
Message-Id: <20260513191732.2420879-1-swati2.sharma@intel.com>
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

In the series,
    1. remove plane scaler subtests
    2. add crc val mechanism
    3. add new subtest

Swati Sharma (3):
  tests/intel/kms_sharpness_filter: Remove plane-scaler subtests
  tests/intel/kms_sharpness_filter: Add CRC comparison for positive
    tests
  tests/intel/kms_sharpness_filter: Add
    invalid-filter-with-nearest-neighbor

 tests/intel/kms_sharpness_filter.c | 154 ++++++++++-------------------
 1 file changed, 52 insertions(+), 102 deletions(-)

-- 
2.25.1

