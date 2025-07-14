Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBABC83F17
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 17:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA37C10E02E;
	Mon, 14 Jul 2025 17:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L46bWq3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD0410E02E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 17:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752512490; x=1784048490;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mJeFZxHdoyvcKABgwaNSikuegZEnHhSRY6ELdtW7I78=;
 b=L46bWq3oO6tVhXwXe2MnnKWg1efxkEM+YNBRTKxqgIYw1tUAqjkZeTqo
 tUxYzMjm8xliR9w3zjaAkizqnCCQ6L2KPdGR1c1/c8DBRUMlP8dv6rqo2
 seE/VFRSTp4gwlLzIS8d7hDqL6EmhHslNQQ5JCYMZd/r+8TDOCy1xf/sY
 16Uw0ycDhk3HUOoajPnWFstqCmfPxd8C1Uoz8Gc+CuH6sUR3n9WAR0Bjy
 BOH+mVjojoQyKSORLhomwjOYSNzuzm4PRrDJuWz3tYHWGOkqFHMnfq05E
 dYAyzP26Yce0RBiS/Mcd6NXvlJQ8yDVDDI/Rt01xmvnwvMKuv6FuLQGBY Q==;
X-CSE-ConnectionGUID: cyj1k3uRQWyLgc6HS9B45Q==
X-CSE-MsgGUID: wiHVZ3AiSQinHwkJS2Jltg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54802182"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="54802182"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:29 -0700
X-CSE-ConnectionGUID: GzqFx/xZQI2e9jWSiPAgPQ==
X-CSE-MsgGUID: b1bfN/QSRkWb1X2k46g6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="161306011"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 10:01:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 0/5] System allocator test fixes, improvements 
Date: Mon, 14 Jul 2025 10:03:04 -0700
Message-Id: <20250714170309.2949211-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Continuation of [1]. The last patch in the series adds an IGT that
mirrors the compute UMD append memory copy kernel. The compression
sections will fail on drm-tip due to a KMD bug, for which a fix will be
posted shortly.

Matt

[1] https://patchwork.freedesktop.org/series/151363/

Matthew Brost (5):
  tests/intel/xe_exec_system_allocator: Add section to trigger 64k fault
  tests/intel/xe_exec_system_allocator: Add prefetch sections
  tests/intel/xe_exec_system_allocator: Wait on mapping BO's to mirror
  tests/intel/xe_exec_system_allocator: Set data to non-zero value
  tests/intel/xe_exec_system_allocator: Add append memory copy tests

 tests/intel/xe_exec_system_allocator.c | 638 ++++++++++++++++++++++++-
 1 file changed, 624 insertions(+), 14 deletions(-)

-- 
2.34.1

