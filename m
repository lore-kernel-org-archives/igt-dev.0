Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3591CA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 13:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C3C10E709;
	Tue,  9 Sep 2025 13:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P261DeWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4C010E708
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 13:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757423361; x=1788959361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1KidE7oYfD/PwpXHLD3KKsVm09DlC9eXANM+MHy6hEo=;
 b=P261DeWH/Zu6PbX+QgqWXfYAurjXtdQJNZFKCIOCcnVj3PxOON2Az0ZO
 T+je4f7OJ7mALKbUWPoS4W8EDsn2jEfF0PZAhptTn2AQE635mK4ZEn8Pn
 18zwh/qU4CJ1tuTopQFr17w7n/runORcUn7j4JLIcgWSMziRT/0zIotBw
 HCXmomWGR8FPiaXog8zNoWAcUyDOHoywBlF3asbx3b+ffsUx215JseuUY
 f/Q7FiCy0YU6gkbDCUTLS0nsV/3dnD5wM+1MKNUdDNSA6h8YZLPLLcv/W
 3bRkVI4ERJZgrDPJ3QVlagE0lUEzOYm/9vOAlzMMco4ESgxJLFwNu7ACR g==;
X-CSE-ConnectionGUID: oa0m3rneR6CGtaWDRFZIXA==
X-CSE-MsgGUID: 4YfXNNmOR/m5m2l5T/Y0qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59644851"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59644851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:08:28 -0700
X-CSE-ConnectionGUID: J6TFcFnxS0O5y2mwcnLE1Q==
X-CSE-MsgGUID: fFEJ/g5URbyphdcnN/Qmhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172998498"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:08:25 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_compute: check root-only write
 permission for ccs_mode
Date: Tue,  9 Sep 2025 15:08:08 +0200
Message-ID: <20250909130808.54117-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909130808.54117-1-peter.senna@linux.intel.com>
References: <20250909130808.54117-1-peter.senna@linux.intel.com>
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

Add a call to igt_fs_check_root_perm() in test_ccs_mode() to verify that
the "ccs_mode" sysfs attribute is writable only by root. This enforces a
security requirement that only root can modify "ccs_mode", preventing
unintended or unauthorized writes by other users.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Kamil Konieczny  <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel/xe_compute.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 5e9140902..cedcb23d9 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -15,6 +15,7 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "igt_fs.h"
 #include "intel_compute.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -80,6 +81,12 @@ test_ccs_mode(void)
 
 		num_gt_with_ccs_mode++;
 		gt_fd = gt_sysfs_open(gt);
+
+		/* Check if ccs_mode is writeble only by root. Having root only
+		 * write permission is a security requirement.
+		 */
+		igt_assert(igt_fs_check_root_perm(gt_fd, "ccs_mode"));
+
 		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 0) < 0);
 		for (m = 1; m <= num_slices; m++) {
 			/* compute slices are to be equally distributed among enabled engines */
-- 
2.43.0

