Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167D1C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 16:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C8610E861;
	Mon, 13 May 2024 16:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKyxc3+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C6610E3D2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715617434; x=1747153434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rpvpguLiv541y4WgTqmXh8kh0YsKr76hcA3GB1XYgrU=;
 b=AKyxc3+WchjYf+/YwK1N/MMovIsNDxCUuoDiXwBumsJhLh+YvN3GYfsb
 W8dbKpj+FdHfbWD2C2rpFB4ooSr6hOUn4U8wiBHiLIsm2KahUpelr6YEK
 lnNWjxFCrcCEGfwiFSWtROrVPFg7yKwPW6l0bBwQEcmYGS9TDukXR8s2g
 Uy4x/KQh3qd/xyPQvlYmA29U29FAqYR1DR818PfN3aRAaoDP6Xp69o6B0
 1J068ZcvRqbGQEnJW1zp0gBvfgahtnnWT4a9M9eX66po++DYvZx7oIu6u
 hhIfosrVLVvw6qx81th7pTobihdMgEDuA/x1ecMakoD8LY0XYnS0K4w8S A==;
X-CSE-ConnectionGUID: cl7DWnbvQTWwkASaMqqiEg==
X-CSE-MsgGUID: szOvKCr4S1ueh66rOSLUJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11500847"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11500847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:23:54 -0700
X-CSE-ConnectionGUID: pZgWUk/cT0KhPt9Oc74cCQ==
X-CSE-MsgGUID: gMY6tn4YTBCA3mchM1WakQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="30424795"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 09:23:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_pm: Fix S4 testing
Date: Mon, 13 May 2024 09:24:34 -0700
Message-ID: <20240513162435.952578-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240513162435.952578-1-lucas.demarchi@intel.com>
References: <20240513162435.952578-1-lucas.demarchi@intel.com>
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

The additional s4-mocs implementation crossed with the change of how S4
is tested in commit 4b767566bbc6 ("tests/intel/xe_pm: S4 to go up to
devices only").  Apply the same logic as in other tests.

Fixes: 1a77ac56d453 ("tests/intel/xe_pm: Add mocs S2-idle/S3/S4 suspend resume test")
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_pm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 584cb8548..3cbdb6a96 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -655,7 +655,10 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
 			close(fw_handle);
 			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 		} else {
-			igt_system_suspend_autoresume(s_state, SUSPEND_TEST_NONE);
+			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
+				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+
+			igt_system_suspend_autoresume(s_state, test);
 		}
 		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
 		igt_debugfs_dump(device.fd_xe, path);
-- 
2.43.0

