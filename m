Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463AEC9830B
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 00:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDE610E26A;
	Sat, 17 Jan 2026 00:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEkzM/i3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F7910E264
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 00:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768608356; x=1800144356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jS496odumhe2j3NN2lNhWEZ29WQm5X2nDb4ngOIASS0=;
 b=LEkzM/i3UimRxhleOAeBVDQeNllt1+Zk3Dzwh7ijHZOw+BeOsd8G3nrn
 29z/9Ww/YSHdfQJPNjV6tAac7GGzbGoiczVr7WAXZr84Rd3zmLWb8sb9f
 P+bxjnolY+9WUNXoraroePNa4YtWuABPPTlMfT4oJwbM/8DM/4reAUMpM
 OPUXcMaF/b6JEXilwqzZkOL+S04X3QAKGg8hoknoSiTl/2yj0rCKRianA
 HSDUAkDIQuH5noi6XY/yIbVX3YR8tY59IoHLWKd4bzAKXgjTslfLrGdI6
 0Mn5ncdVT2PnXaTtniLtfg6jKm7NoA2ndM+Ei/8GSmco5ZfCPu1cCgiKp Q==;
X-CSE-ConnectionGUID: pkcnwEnwRK+eQ/bkN3S+Qw==
X-CSE-MsgGUID: Mqr+eP17TQGK4tdAGJqGTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73556385"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="73556385"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 16:05:56 -0800
X-CSE-ConnectionGUID: ITgaJQueTqC5s2KzqFyjfg==
X-CSE-MsgGUID: gy5gZyzpSi6Fv/ALG91n6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="210237898"
Received: from dut6079bmgfrd.fm.intel.com ([10.80.54.82])
 by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2026 16:05:55 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
	Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 2/5] lib/xe/xe_legacy: Init LONG_SPIN ctx_ticks after open
Date: Sat, 17 Jan 2026 00:04:53 +0000
Message-Id: <20260117000456.26207-3-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260117000456.26207-1-shuicheng.lin@intel.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
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

Avoid computing LONG_SPIN ctx_ticks before any CLOSE_FD re-open logic.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 lib/xe/xe_legacy.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index d4f060f76..17d0839be 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -64,9 +64,6 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	} *data;
 	struct xe_spin_opts spin_opts = {
 		.preempt = flags & PREEMPT,
-#define THREE_SEC	(3 * 1000000000ull)
-		.ctx_ticks = flags & LONG_SPIN ?
-			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
 	};
 	int i, b;
 	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
@@ -79,6 +76,10 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
+#define THREE_SEC	(3 * 1000000000ull)
+	if (flags & LONG_SPIN)
+		spin_opts.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, THREE_SEC);
+
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * (n_execs + extra_execs);
 	bo_size = xe_bb_size(fd, bo_size);
-- 
2.34.1

