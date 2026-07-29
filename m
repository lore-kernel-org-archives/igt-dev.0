Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB878C54F51
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 12:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823F510EBD5;
	Wed, 29 Jul 2026 12:22:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Md5dbOEw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613C910E046
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785327688; x=1816863688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fl5USavcQopf3VvOEAdmLZWbYJbHKatJQLrTVktOdvE=;
 b=Md5dbOEwc0Wt0/LCK+lt1kGl+soYSmCzlXYPz0+exbqQqpYWfAc6DqIK
 Lp4qi56Fd0rCjpsjiIooDR4DHr7ASJ2/Pmy3JuNZeeuclQoEXxNQ+uq/E
 lcBuL3Fc7Q2C7lMGKqolrOYOhYlJit9yZh+eqVV17V1I9dGCarvF6WKJu
 z2CpI/gVKF77G1YLsIoqEm2OXxZQZXCHQKMQga1WrNqMtJEyHNKsNP5zO
 FGgtuC6J6NB3PM6ZRQz2AcLhbXJRR6aJJ6O2QQy/jKUi4HAHD++W60ElA
 EUwdtCdKbzCAYrBEpMvm7OkzKjQuzoewjtEfU89MCkPUEExnQgIq6ldir A==;
X-CSE-ConnectionGUID: O/ZbrexSROqdq6C2oHkBTA==
X-CSE-MsgGUID: 6OVIuJ5jR8SMci7Nq7FuOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="108725220"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="108725220"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:21:28 -0700
X-CSE-ConnectionGUID: VcpHU9asR/OCEHTUj5koaw==
X-CSE-MsgGUID: Ptnhgr1RT2G/tB794l6JGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="263802434"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 05:21:26 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com, raag.jadav@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH 8/8] tests/intel/xe_err_injection: add CRI GPU requirement
 check
Date: Wed, 29 Jul 2026 17:49:59 +0530
Message-Id: <20260729121959.603890-9-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
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

Add support to verify the CRI GPU and skips test gracefully
on non-cri platforms

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_err_injection.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 0303f4a56..4df4589b3 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -20,6 +20,7 @@
 
 #include "igt.h"
 #include "lib/igt_drm_netlink.h"
+#include "lib/intel_chipset.h"
 #include "lib/intel_reg.h"
 #include "lib/intel_compute.h"
 
@@ -508,6 +509,14 @@ static void l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
 	CLEANUP_ON_ERROR(ctx, fw_handle);
 }
 
+static void igt_require_cri(int fd)
+{
+	uint16_t dev_id = xe_dev_id(fd);
+
+	igt_require_f(IS_CRESCENTISLAND(dev_id),
+		      "This test requires CRI GPU, but found device ID 0x%04x\n", dev_id);
+}
+
 static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
 {
 	igt_info("Starting Error Injection test: %s\n", injection);
@@ -531,6 +540,11 @@ int igt_main()
 	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
+		igt_require_cri(fd);
+		/*
+		 * TODO: Add firmware query for error injection support.
+		 * Should check: EOM (End of Manufacturing) status and error injection jumper state.
+		 */
 		xe_mmio_access_init(fd, &mmio);
 		igt_require(xe_mmio_is_initialized(&mmio));
 	}
-- 
2.34.1

