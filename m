Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22506CA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 09:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D002B10E647;
	Tue,  2 Sep 2025 09:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkvWQ9FU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC35710E647
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756806899; x=1788342899;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y0Opbn2ZeHbiXuGKHn1Tgt/Ivy7kyRDDeIUzkqbkRto=;
 b=IkvWQ9FUsaryrNvwV2nWcL7TWoI6wN7SDOHcyq9w5v6n8jPS3/UW1u01
 aHRLvvP4Oq+K8Hpr7S5Yj0itRn/fDa1zfgE8Wv/ucM7txTQ/wlWB3W5/0
 kO9guMtIpu/9xEd3Cp5UdCF6j4bIPnmiUQwFIiAjbkPZzuJ10zbJSrq6q
 l/ECQ7zkfYfchDAMFpXYjt6zvkzlcQ9eaNDLE5DDbevpvhEN1ZGoq+rZF
 2ipDaI4X7cl6ME3BH1zaJaxTXN0SpXrr5NgG6giqHnjDsTW6oCOvEv4lU
 YEiEEP9BBLnamAVP31jhlpMBmeaJRtLRkaz5FiYVDoi6c00MexitR+WG3 w==;
X-CSE-ConnectionGUID: Nf1ebklLQ+e+gH4qZTw7oA==
X-CSE-MsgGUID: 2fu5eMh1R8+CBUumwozhyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58277937"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="58277937"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 02:54:59 -0700
X-CSE-ConnectionGUID: PgAE4eXJTJas0yPXYkgM2A==
X-CSE-MsgGUID: wZ0kFDW3QZiq7ZFHONbQpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="176508188"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:54:57 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] kms_flip_tiling: reduce exec. time for sim env
Date: Tue,  2 Sep 2025 15:24:50 +0530
Message-ID: <20250902095450.1236804-1-jeevan.b@intel.com>
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

For simulation environment, we can reduce execution time
by running test only with basic tiling combincations.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_flip_tiling.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index ff9ad1229..8d77dc5b7 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -242,6 +242,18 @@ igt_main
 					if (plane->formats[j] != data.testformat)
 						continue;
 
+					if (igt_run_in_simulation() &&
+					    (plane->modifiers[i] != DRM_FORMAT_MOD_LINEAR ||
+					     plane->modifiers[i] != I915_FORMAT_MOD_4_TILED ||
+					     plane->modifiers[i] != I915_FORMAT_MOD_X_TILED))
+						continue;
+
+					if (igt_run_in_simulation() &&
+					    (plane->modifiers[j] != DRM_FORMAT_MOD_LINEAR ||
+					     plane->modifiers[j] != I915_FORMAT_MOD_4_TILED ||
+					     plane->modifiers[i] != I915_FORMAT_MOD_X_TILED))
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
 						      kmstest_pipe_name(pipe),
 						      igt_output_name(output),
-- 
2.43.0

