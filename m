Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778F5CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 04:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2064F10E0C4;
	Thu,  6 Nov 2025 04:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQxlIJyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9248810E0C4
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 04:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762404476; x=1793940476;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uvSKW8V9q8OBJmBo2HClq6TKBwJtx0Osfd4nTAMZcC4=;
 b=EQxlIJyqaNc9XNO1B3UJtWQFwVLjNXTt4Imu9nmyOqIpC2C6pF/R6rEL
 j/0lNvWTz4ZuzITPTc+39ndeTVHiePEcNN/lB4lBRhRM9KNMYxNFs2X+O
 xjOZMLWIYuGuiGxuVVkRrgNiyuRV7gvu1isbDun/s6saTemYOToFCuXdD
 I+wFWJO4Or6rZB+LwshuxhOWcDtGmTDSsyiqvgYoiYwjavHr6fMg/O9cT
 X/q5we4Kd1ngFLKvsWPkSw5pgo/A4vz1BSTHX+WgpcW4erK2NmJlmM24+
 ItMsCKgZzeAvVyQUzIC5cbqXdw++0eoA440pcVs+gM8jnt2RZpRtRxdz4 Q==;
X-CSE-ConnectionGUID: jd/9NqmuRqiHAMfzgJMiaA==
X-CSE-MsgGUID: nqVnxoXNSJKZLkA4qCVUXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64439568"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64439568"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 20:47:56 -0800
X-CSE-ConnectionGUID: NN3xIaXNRBO1RRSZbxIrPQ==
X-CSE-MsgGUID: xT6hw7PJQPWB88/91ZzQpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="188375028"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 20:47:55 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/2] LRR test to start above midpoint for multi-mode
 panels
Date: Thu,  6 Nov 2025 10:17:31 +0530
Message-ID: <20251106044733.1502397-1-ramanaidu.naladala@intel.com>
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

Update the seamless virtual RR test to begin from above the midpoint
of the VRR range when multiple modes are available. This avoids
fallback to lower physical modes near the LRR boundary, preventing
unintended clock changes and ensuring stable VRR behavior.

Naladala Ramanaidu (2):
  tests/kms_vrr: Start virtual RR test above midpoint to avoid mode
    fallback
  HAX patch do not merge

 tests/intel-ci/i915.fast-feedback.testlist | 183 +------------
 tests/intel-ci/xe-fast-feedback.testlist   | 288 +--------------------
 tests/kms_vrr.c                            |  11 +-
 3 files changed, 34 insertions(+), 448 deletions(-)

-- 
2.43.0

