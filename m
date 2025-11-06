Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5D1CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 21:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7892910E9D5;
	Thu,  6 Nov 2025 21:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XD0EzL1e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5DB10E9D5
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762463060; x=1793999060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BCp1Ez1UcIeF1MjQ/gKtgxZHzQR18nU+xaNkC/PaYGM=;
 b=XD0EzL1elO4ZzXZqyI6YTM+1BW4FhD9tHnF3/Uu3nNaiD+j/OLOfCRao
 ZWwuiwWARhGajX+pYIXUpM7/M1xNrfMl6c+xedBMlboHXo7IdSxBmfUhk
 L6qaUB6e5IHwfez8N32IW6j0NcmReVCFiTeCSYq6JpzYKecKK0wjuDCuT
 93wk5AVzPhz8qOUZXbpoMyjO4kRVvbgiphmz9y7CpVOGcph+emuutSUVn
 RCYJxn1PYcQp/Y1R8rwRY8VS+6M/sv53NJgv0LttP0ZQpnewJYnU3OAjc
 KrM3KS/OdsOQbG0W1lI/TcZ2BwwTaLrsH1shCeKnRB0jf0T9m0q8+IUGD g==;
X-CSE-ConnectionGUID: YXS7Z6mHS3uNkbISMBg9zw==
X-CSE-MsgGUID: znsgBjIfTE2xpWZ7Z8GnfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="74904657"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="74904657"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 13:04:20 -0800
X-CSE-ConnectionGUID: 4ti2qBmwTtekWZzsj+NUuQ==
X-CSE-MsgGUID: Bm+s5VEfTU+9BdJow/hC4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="187812101"
Received: from dut4025lnl.fm.intel.com ([10.105.8.193])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 13:04:20 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH] tests/intel/xe_pmu: Update preempt timeout when sched_is_idle
Date: Thu,  6 Nov 2025 21:04:19 +0000
Message-ID: <20251106210418.258032-2-jonathan.cavitt@intel.com>
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

It's necessary for the VF/PF preempt timeout to not be infinity when
sched_is_idle is active, so update the value to be twice the exec
quantum during the fn-engine-activity-sched-is-idle subtest.  This value
is chosen because it's what we've used historically in cases like this.

Since we only want to update this value when sched_is_idle is active,
this necessitates a minor rework of how the test is initialized, but
test functionality is otherwise unmodified.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_pmu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 9525655ba2..2150c314b6 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -1192,9 +1192,20 @@ igt_main
 
 		igt_describe("Validate per-function engine activity when sched-if-idle is set");
 		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
-			xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
-			for (int fn = 0; fn < num_fns; fn++)
+			int preempt_timeout_us;
+			for (int fn = 0; fn < num_fns; fn++) {
+				preempt_timeout_us = 2000 *
+						    xe_sriov_get_exec_quantum_ms(fd, fn,
+										 eci->gt_id);
+				xe_sriov_set_preempt_timeout_us(fd, fn, eci->gt_id,
+								preempt_timeout_us);
+				xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
+
 				engine_activity_fn(fd, eci, fn);
+
+				xe_sriov_set_sched_if_idle(fd, eci->gt_id, 0);
+				xe_sriov_set_preempt_timeout_us(fd, fn, eci->gt_id, 0);
+			}
 		}
 
 		igt_fixture
-- 
2.43.0

