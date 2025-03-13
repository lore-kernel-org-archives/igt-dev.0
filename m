Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0266C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 14:34:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9832510E1DD;
	Thu, 13 Mar 2025 14:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBSlkqUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3762D10E884
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 12:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741870221; x=1773406221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BFXVMReItEdEKispwNesU/nwt8y6KYwKqt5hqxAA5CI=;
 b=EBSlkqUXyujSDl3f9Ygs5gD1luNV7xtWxIgibEoQui0jzY5RAfPHRvnk
 DRQiNUceqQ5PpfIyr54HlXcUaxb70OHQ8IRQGtgH+JxO6TduI5qGU45tV
 wZf6lywteumL26U9yi+4QcHham3zMFcaHDw40kBBomP1ozJjOZJmfRJ9W
 hA3/CZDhgCs/D8V+pt9NLaNijJpQYeyCk2C2oFPUzK7XXVrIGJenDrbUu
 7G+gCGqXtuJ19N4Fd0SYUstzF5rPXEHDgwRV0tNrpRX4H2ipDFpYEHoBG
 r0ak7bTiAZLIVuiU1P8ZZZXzSS753r1xVo6W2hk/Qo+WHBSQGHONX+Uq+ Q==;
X-CSE-ConnectionGUID: bnvIEx/gRviippD6tBwFoA==
X-CSE-MsgGUID: Dj1jKdB5T/mOvPMh/s8vpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54363016"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="54363016"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 05:50:20 -0700
X-CSE-ConnectionGUID: AXCYiHHwT9m2vqXVnM/W8g==
X-CSE-MsgGUID: sfffEgWXS5uRcwM7wXZg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="121445070"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.166])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 05:50:18 -0700
From: Pawel Sikora <pawel.sikora@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Thomas Wood <thomas.wood@intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 0/1] lib/igt_core: capture logs for child processes
Date: Thu, 13 Mar 2025 13:50:03 +0100
Message-Id: <20250313125004.3881354-1-pawel.sikora@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Mar 2025 14:34:31 +0000
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

Add a fix for proper log collection from child processes by the IGT runner.

This change addresses the issue of missing logs for child
processes in the IGT runner:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2178

The '_igt_log_buffer_dump()' function is now called before
exiting child processes, ensuring that logs are properly
captured and not lost when IGT fails and child processes
dump logs before exiting.

Also, removing unnecessary comment about silent exit.

Pawel Sikora (1):
  lib/igt_core: capture logs for child processes

 lib/igt_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.34.1

