Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822A2C7115B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 20:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFFD10E158;
	Thu, 19 Jun 2025 20:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwVe8BgA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8967B10E10C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 20:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750363558; x=1781899558;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dq1PJO6fMEybn7yw8eIgLzOHo/HCtPn17jL+lByJABc=;
 b=YwVe8BgAz/eLc1DauVRpmhK9lyoVEiifma8j1k7BvhUfwNSlTugKoY1J
 UA71p49Mnxq4K0v4ugx31UlcvfdRclv2IdVHAeLjQD5c+1FnZO9OMTuBa
 81kPo8LYHIhuEcmhL0DM9mugMaJ9YgkrZpVSLlpUcvzbvN3ltGIQ9CHjv
 m6ywukzsjB4DOjLMUw2JAxmScrk2PRnMvT36rNGZ3VSGesJ0TcK54ZXPA
 EeQljsEEN2XFb7FqoxWrUasnYyJxj7NQ4xdl6GluOerMTpv49hhMmAM4U
 +F0+O2Aq7EPoQmYqhkKEiXn9Ekvma8viT6VZmQ31X7cwajV13fv1kKvE4 g==;
X-CSE-ConnectionGUID: XKkiJKVKQoWTwgw0jadFEg==
X-CSE-MsgGUID: 9M4nghQ1RqmuTAS0iyc9PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="56446599"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="56446599"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 13:05:57 -0700
X-CSE-ConnectionGUID: JXE0MgNMQUugU4UdDTX1ew==
X-CSE-MsgGUID: 0iSVXVf8T3mvS8gKDEXWug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="181756420"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 13:05:55 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 0/2] tests/kms_flip: Improve frame timing checks for
 high refresh rates
Date: Fri, 20 Jun 2025 01:35:47 +0530
Message-ID: <20250619200549.66329-1-ramanaidu.naladala@intel.com>
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

This patch will improve the test timing checks.

Naladala Ramanaidu (2):
  tests/kms_flip: Default to tiled modifiers for stable flips on high
    refresh panels
  tests/kms_flip: Track and report unexpected events with pass rate
    metric

 tests/kms_flip.c | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

-- 
2.43.0

