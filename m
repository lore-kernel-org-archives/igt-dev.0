Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C327CD3424
	for <igt-dev@archiver.kernel.org>; Fri,  1 May 2026 12:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BE510E539;
	Fri,  1 May 2026 12:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0VHMA4O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E54F10E539
 for <igt-dev@lists.freedesktop.org>; Fri,  1 May 2026 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777638532; x=1809174532;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jS0rujkZCd9TviUabzEH4WI9G2m3Wwsw1JbtWdGAIgg=;
 b=I0VHMA4OBIfx1qwBhaMszXcwqeU9qtQDBt4L7o7HUHiCDRP4VyCHoUyd
 KotYdwjjGz8CwHqm0ShAV9+ZYK/CPoTuSm6sakKf4OMadyNQJIhE1TJs/
 L07nmmx01F1nUZo3jUvYAV+YkKeVBWgObZmFTmPtKh7RdFOoSESVocor0
 W0BkT3AqGPYVSnrTgAPiTngc/QZdtsqQdrnKRXwgI3lkaJ7PvHzRgkm/I
 7/3iT2yWZfkegC3Ts/xxDeFe+VZhU0vXqJvCQpYoF7avJn+bt/LVDkCbk
 YfyW1D/Dp5wClJBQF8URXwFnZhzn5857S70S+IfoPjnQB2YetqgIRwe+a w==;
X-CSE-ConnectionGUID: PQwIc2dDR1Wfib03MoLAqA==
X-CSE-MsgGUID: HTJd6iWBTnmlzlvRET1O1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="104050040"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="104050040"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2026 05:28:51 -0700
X-CSE-ConnectionGUID: CzsBy82DSvWk3+kr4XTuDg==
X-CSE-MsgGUID: h7CiAC9YRtG9SbTUerN4Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; d="scan'208";a="258203317"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 05:28:50 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, juhapekka.heikkila@gmail.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/3] tests/intel/kms_sharpness_filter: Remove
 plane-scaler subtests
Date: Fri,  1 May 2026 18:07:35 +0530
Message-Id: <20260501123738.2360414-1-swati2.sharma@intel.com>
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

 tests/intel/kms_sharpness_filter.c | 147 ++++++++++-------------------
 1 file changed, 48 insertions(+), 99 deletions(-)

-- 
2.25.1

