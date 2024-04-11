Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C81C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 17:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C729E10F249;
	Thu, 11 Apr 2024 17:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yl6Wdj5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9144E10F249
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 17:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712854952; x=1744390952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K9GC4W+YdIT8kYraVLFc0WMW7Zbn1bULFDd3w2WcgRI=;
 b=Yl6Wdj5f/6nB0jz852L/hnzEpkVJ/BTQ7PxdvdM54Cke4SISFf4KX/mA
 51WVgIcFbDKa2CSXIygOuebdkoJaKU4KesqrXTsW3R6K4KVonLcmpnTGT
 XGuGLC/8OjL7yXPMUFk0J/f4PZmcpA/qoOvvH+quhnsIJX2v5uITsSBYr
 S4h5QjqAwP7U6ICg8zeVoBehzT4902SI7fmaMAnaIA4pr7CCqleFf8USy
 EtzKzw/yPNnbf5feF75i41SBtBwFFfb3PWkv+q1hXGcsXXEAQc6C3wG2/
 /wg7LPgbczuK/TjIJcEKKzGGALcYJNhc7jfsXamCH7AhKzsse+bQErr1B w==;
X-CSE-ConnectionGUID: 8kg5JHeQRg+C16lRaV8TvA==
X-CSE-MsgGUID: Bt0aejF3STOqnCyAlzlP/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19673795"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="19673795"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 10:02:31 -0700
X-CSE-ConnectionGUID: u6ac+iA0RCqozaus5bQJNA==
X-CSE-MsgGUID: JD+MQWp6Ty6uO4dpvRtc2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20874180"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 10:02:30 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t 0/2 v2] Add mmap ptr draw method
Date: Thu, 11 Apr 2024 22:33:10 +0530
Message-ID: <20240411170312.5615-1-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
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

Add a new IGT_DRAW_MMAP_DRAW method, in case the tests wants
to pass already mmapped pointer.
This will help in reusing the already mmappped buffers.

Vandita Kulkarni (2):
  lib/igt_draw: Add support for writing onto already mmapped buffer
  tests/kms_async_flips: Reuse the already mmapped buffer

 lib/igt_draw.c                         | 37 ++++++++++++++++++++++++--
 lib/igt_draw.h                         | 10 ++++++-
 lib/igt_fb.h                           |  3 +++
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/kms_async_flips.c                | 19 +++++++++----
 5 files changed, 62 insertions(+), 9 deletions(-)

-- 
2.43.2

