Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A543C10F16
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 22:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A490411330F;
	Fri,  3 May 2024 22:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dB1KeDwY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBDC11330C
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714776426; x=1746312426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tY1enLXiQSsalvLAUrCaHfONHX1imPTz55aByto71N8=;
 b=dB1KeDwYGueKcNPpKX4OEHon+NPq3T7MtVQgCIuXQVkhtjMTUjGw/Jvv
 Z4cHjQwCdXCvQKDXH9s5/xE16d8sDH//M7NPReL7DN1eGXxmXL5I5vzg2
 7xhCMwhGIJMmmKb96e7Pjbxp4H45cmjQzxSu0ERPxlv+UfB2ZdsG/DkT/
 ERYpXMGH4TXoyJbDiXMfFbU3cUA9+pOcnpd0N4Vpk4sYrAL25S04HuHH6
 x+OfLlvdpOHqfr8Y2YzThnWWTMJ6TNpdnBVxDOdzZ0vdmXl12Avc3OrqJ
 7AoxKdKJMSExnlDTv0L80n4LEtbHeWC1w4+xjJLjDI8Ca83aGyaQ+9HOY A==;
X-CSE-ConnectionGUID: MHgd2fNMQKWHv4t45ViVzg==
X-CSE-MsgGUID: xA0rvnUDS5mnjbWSltiM2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="22010163"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; d="scan'208";a="22010163"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 15:47:02 -0700
X-CSE-ConnectionGUID: XvxdZlB0TzuSwqh3Qm3lpQ==
X-CSE-MsgGUID: JhYg7pU9RoaupzA1++izdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; d="scan'208";a="27609364"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 15:47:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pm: S4 to go up to devices only
Date: Fri,  3 May 2024 15:47:45 -0700
Message-ID: <20240503224745.14890-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240503224745.14890-1-lucas.demarchi@intel.com>
References: <20240503224745.14890-1-lucas.demarchi@intel.com>
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

Testing S4 (hibernation) is typically painful as there's mixed support
in OS versions and platforms in CI. Doing the entire dance of saving the
image to swap (which sometimes is a swapfile) and communicate that to
the kernel that is going to be booted (without initrd in the CI case) is
often a case of problems.

Main goal of xe_pm is to test if the xe driver and the graphics card are
working correctly, not that all the farm of machines correctly handle
all the corner cases (which is even more problematic as we test early
rc kernels).

Stop doing that and rather switch to going up to device shutdown +
platform low power state (the default in /sys/power/disk). If that is
acceptable and work out great, we may even do that unconditionally,
passing SUSPEND_TEST_DEVICES as it should work in other cases too.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1043
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_pm.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 5e79e80ec..9a0b362ab 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -414,9 +414,12 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 					INT64_MAX, 0, NULL));
 		igt_assert_eq(data[i].data, 0xc0ffee);
 
-		if (i == n_execs / 2 && s_state != NO_SUSPEND)
-			igt_system_suspend_autoresume(s_state,
-						      SUSPEND_TEST_NONE);
+		if (i == n_execs / 2 && s_state != NO_SUSPEND) {
+			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
+				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+
+			igt_system_suspend_autoresume(s_state, test);
+		}
 	}
 
 	igt_assert(syncobj_wait(device.fd_xe, &sync[0].handle, 1, INT64_MAX, 0,
@@ -662,8 +665,10 @@ igt_main
 
 	for (const struct s_state *s = s_states; s->name; s++) {
 		igt_subtest_f("%s-basic", s->name) {
-			igt_system_suspend_autoresume(s->state,
-						      SUSPEND_TEST_NONE);
+			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
+				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+
+			igt_system_suspend_autoresume(s->state, test);
 		}
 
 		igt_subtest_f("%s-basic-exec", s->name) {
@@ -673,8 +678,10 @@ igt_main
 		}
 
 		igt_subtest_f("%s-exec-after", s->name) {
-			igt_system_suspend_autoresume(s->state,
-						      SUSPEND_TEST_NONE);
+			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
+				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+
+			igt_system_suspend_autoresume(s->state, test);
 			xe_for_each_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, NO_SUSPEND,
 					  NO_RPM, 0);
-- 
2.43.0

