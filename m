Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADA5C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 11:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B5610E3E7;
	Mon, 17 Mar 2025 11:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANYhecMD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C7A10E3E7
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742211110; x=1773747110;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ulJXni4bb8lyJEWlF0pRkbn+xj9FUCrPyWlQ/MJiBbQ=;
 b=ANYhecMDGwp+kHrmCrVVy5xx3F84NrN32l3Tje1KhY4lL8EEwzxv6AkJ
 MB8Nq9l72Ui1gXjKv0jzodh55l89Ve3aD4oCij9G86GmgybHjS7tP5Nbe
 k585Bso97kXs6XbYbjfJm3FVJXy30sTXTVLWCKfp6HbrJfeyXquzO8CaK
 ZqUHF0MWfP4CzH6B+rPiE5Ml0Ba4irw6jTRVZqB/lAV/9xwXS1H0pM0h9
 ugszc3+o+UgmaQRB+nU7/sw/2H6QAhXkMM+LVMpYgCyCJYP+gahIWXkh2
 dqu2xUzlII63BNTgJXiPBgJSbjJpAshZANohBPAG6YXtwmhqTEx6EtIgO Q==;
X-CSE-ConnectionGUID: ocN3ivd5TKecURO8h1ZAkQ==
X-CSE-MsgGUID: cFqtbPtGR1KjKc/jH//5Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43167609"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43167609"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 04:31:50 -0700
X-CSE-ConnectionGUID: RDTi5A0oT2+IDsQLK9FOGQ==
X-CSE-MsgGUID: vFlOEzXTQeKLd+A8NMBHWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="126773536"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 04:31:47 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2] lib/igt_core: reinitialize log_buffer_mutex in child
 process
Date: Mon, 17 Mar 2025 12:31:46 +0100
Message-Id: <20250317113146.560156-1-zbigniew.kempczynski@intel.com>
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

For multi-process scenario intel-allocator is dedicated thread which
handles clients (children processes) allocations. Main thread which
spawns children may hit point of time where allocator thread locked
some mutex. One of it is log_buffer_mutex used in igt_log(). Children
which would try to call igt_info/warn/debug() family will stuck as
this mutex is already locked.

Reinitialize this mutex in igt_fork() to avoid deadlocks in allocator
scenarios.

Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 9702a94177..c19689a51e 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2600,6 +2600,7 @@ bool __igt_fork(void)
 		test_child = true;
 		pthread_mutex_init(&print_mutex, NULL);
 		pthread_mutex_init(&ahnd_map_mutex, NULL);
+		pthread_mutex_init(&log_buffer_mutex, NULL);
 		ahnd_map = igt_map_create(igt_map_hash_64, igt_map_equal_64);
 		child_pid = getpid();
 		child_tid = -1;
-- 
2.34.1

