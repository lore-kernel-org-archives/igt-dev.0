Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A523E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 22:54:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557EF10E970;
	Wed,  8 Jan 2025 22:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnLfxmmY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6016110E970
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 22:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736376875; x=1767912875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iR32D28wT/d64V3neyVoEyxrD9POwz40XdLMCE8ZS8s=;
 b=jnLfxmmY4YIE+Rwu1N7+5SLIy03ddCnJIE66qZWq1eza80tObZt5Ehgb
 padeuEyLs/ODt7HRKq0gF1byAhbxq7oUH4ztnN99s73VlMk/CxA5CF8In
 s7Akl60H89/iHmifUhYsITr6l0LJk7/TOi0SmkMRBkrMQSkpXMzBLHvkC
 vJ07B3InAkhjMPpIaUpEEhzuUBjBAqzdr1o/mBuLlmj8D15y8WyAXD/MX
 iSgc8YpnRrUt2pD+343R/FEWeafSjwcdggozkApuMBcU7CsVh6vUR9DCs
 9m9v9xFQ6o0l+Tu62nrjzuylLUKF9SXBLZMk27248nwXqvhupR6o3Ilnf A==;
X-CSE-ConnectionGUID: 9SCom6DkTYClKHqCc6sSmg==
X-CSE-MsgGUID: /TwijpCIRGWHgtET5mrREA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36317397"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="36317397"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 14:54:34 -0800
X-CSE-ConnectionGUID: Njn3STOeTV22euQme47HXg==
X-CSE-MsgGUID: b8eYUCt1Rv6dZntet2rjAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="103184690"
Received: from dut136arlu.fm.intel.com ([10.105.23.66])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 14:54:33 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org,
	Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: Add a vm_unbind after the
 stress test completes
Date: Wed,  8 Jan 2025 22:54:24 +0000
Message-Id: <20250108225424.95051-1-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
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

The test is submitting workloads in a tight loop and then
destroying the exec queue for each of these. There is a
potential that the GuC IDs could get used up during these
submissions and before a GT reset goes through. If that
happens, the subsequent submissions will essentially be
"lost" in that they aren't submitted to GuC and just wait
for a submission timeout to happen, at which point we do
a reset_async in the driver. What seems to be happening
however is these workloads are lingering beyond the
completion of the xe_exec_reset test. Then when the
reset_async eventually goes through, the submissions
from a next test can also hang (or possibly because
they too ran into the guc_id exhaustion case).

Add an explicit vm_unbind before destroying the VM
to give time for those submissions to complete
before the test ends.

https://gitlab.freedesktop.org/drm/xe/kernel/issues/4015

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 tests/intel/xe_exec_reset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a3eaf8bbf..ca5566d11 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -645,6 +645,8 @@ static void submit_jobs(struct gt_thread_data *t)
 		xe_exec_queue_destroy(fd, exec.exec_queue_id);
 	}
 
+	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
+
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 	xe_vm_destroy(fd, vm);
-- 
2.34.1

