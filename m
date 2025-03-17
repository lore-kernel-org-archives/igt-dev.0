Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF906C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 10:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588BC10E3E3;
	Mon, 17 Mar 2025 10:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJA3pDHB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E08A10E3E3
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 10:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742208974; x=1773744974;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e+1EdHx7w+b+Cm+RHmEKXjQKJdCFSiiFZzpeMv35R9I=;
 b=RJA3pDHBiewssSyjCkIYsr6E8Rth7X6J0lb0TcFTEe0oytPQY4/uVLJw
 OyWkEVBjGdnUWu47qcQcsIM/Udz9Aj+W2yln1Lq9bdQn4rWLOve0t7/km
 aY8spWp7RMvz6AlRwH+g47jD3OCoeFlkZFNrZ+19bG8/E+0maNi7aogpA
 0N7UsOCcQZck9shLkRc9MaUCCXzMo4pWsZqJfvrnnvKr7NfN1z8/ZYTDG
 SdvhsIck0W2c9AEK/8EuTVHzp3fKKK8JcVk4VdW6cieIRR0ocxkm6RFoR
 KYJa4tUtljFJCbUDOQpJw+82HK3IQkK+huZmkncZJPNOWNv6iOYt1S9B3 w==;
X-CSE-ConnectionGUID: WuhdthZoR0CcrguS6wI2qg==
X-CSE-MsgGUID: CC9Ez97yT5O96bIfO+dhRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="46940827"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="46940827"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 03:56:14 -0700
X-CSE-ConnectionGUID: WEUqHhxuRsyAm3ounPz4UQ==
X-CSE-MsgGUID: u0PiSPTSRdiAeXTBH+9zsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="126766840"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 03:56:11 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] lib/igt_core: reinitialize log_buffer_mutex in child
 process
Date: Mon, 17 Mar 2025 11:56:10 +0100
Message-Id: <20250317105610.556587-1-zbigniew.kempczynski@intel.com>
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

For multi-process scanario intel-allocator is dedicated thread which
handles clients (children processes) allocations. Main thread which
spawns chilren may hit point of time where allocator thread locked
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

