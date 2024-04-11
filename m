Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396ECCD1292
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 11:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9B510E0F5;
	Thu, 11 Apr 2024 11:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ab/lMFUH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A72110F053
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712836047; x=1744372047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wijfOHxxcLyl+kRA53IMN78EKKxkvaorK7AKnvbI+Ms=;
 b=Ab/lMFUHWB3lDz3d542sOvQW/u5gFC9DshqGS4qM1yESaklE/5MytyqE
 AJPUGzhruF+dk5sRmoXtKxGuQQ4RGWGJxgzf8thHaHlsfqyYAHkpINxFt
 FQjBa6mvdb8G5g6ZT5LgA1aVD0zazJWIZqYUeN1j+EOw0DmNCfVrPpTiU
 lQsxoALRaeL0Gm1/Xb5VXR7Y3pNPEySx0KBy+j8FgH1JE2rpguYKhlN13
 fO1nyy5aF7xZhxisDa+59pob0cmVwki/IEccLpIiOzt/8G8hMtWgUoQfY
 IzWkpwJPqfDIhy25bnujBcNGudQVZq3chokcJxd2NJCDCXUN2JmS6XBAw g==;
X-CSE-ConnectionGUID: G6pEcPXvRMu2lNSOyqi24A==
X-CSE-MsgGUID: 2RWciFL1QnCRKElWb3T5gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12018162"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="12018162"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:47:25 -0700
X-CSE-ConnectionGUID: /BWzK+J5TYGQJc1k//DMLw==
X-CSE-MsgGUID: YAOQBgUqSXqHjzK5GDDHsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20922564"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 04:47:24 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t 0/2] Add mmap ptr draw method
Date: Thu, 11 Apr 2024 17:18:02 +0530
Message-ID: <20240411114804.21206-1-vandita.kulkarni@intel.com>
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
 lib/igt_draw.h                         | 11 +++++++-
 tests/intel/kms_frontbuffer_tracking.c |  2 +-
 tests/kms_async_flips.c                | 19 +++++++++----
 4 files changed, 60 insertions(+), 9 deletions(-)

-- 
2.43.2

