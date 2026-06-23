Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B38DCDB471
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 18:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC2E10EC47;
	Tue, 23 Jun 2026 18:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bW+bW4C0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007E310EC41
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782239498; x=1813775498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IeYh48um9j/QwqpOjWIJUmEBHuzRlHgro9pKPpaD8Es=;
 b=bW+bW4C0emwS3Zq2fWEsqubYQyOg9b31YIrjf9EvNl5P9VpH6rNn6SER
 y1JAcAlHrw3NEVwYdlBuKquc+S5wpNZoH/NXqpYaIF4A1HZ9d72cI95Ae
 fGZdpNnn76/7t2kX8ByNfFnGtEEi9ujw/dm691t7Xk6gem88zPExZ7o3K
 ZLQGM9kxkPvylXsgo2E+ZQAatyW9mu2TSL8J1XsxiZc5yn+7ADlGpYklY
 VJ9YLoV+B54K65n8j4aOPqjlCxZ+7Iq0WwIVbU5EY7XM78NfBoCQYxUNE
 0NzYG3mMIuC5tfzk0REfM+vEUj/4pQ8udtTlzzguJ9PVY5sBDxnX3RSp5 Q==;
X-CSE-ConnectionGUID: I6Oojl9jREOmxFZWxJqu8Q==
X-CSE-MsgGUID: s57EFWYuS1m4DkTRxuYBsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100419507"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="100419507"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 11:31:37 -0700
X-CSE-ConnectionGUID: jUO3MX9GTZua76PF9oe+nw==
X-CSE-MsgGUID: U10UmxNzQ/elrUw6yxps9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; d="scan'208";a="245221967"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 11:31:31 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_atomic_transition: Fix retry-path resources
 in modeset tests
Date: Wed, 24 Jun 2026 00:12:33 +0530
Message-Id: <20260623184233.3015156-1-pranay.samala@intel.com>
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

When a bandwidth fallback retry happens, resources from
previous attempt may not be released, leading to accumulation
of allocated objects across retries.

Add cleanup before retry to ensure clean starting state by
releasing resources and removing allocated framebuffers,
preventing resource buildup.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_atomic_transition.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 58cadc560..37dc77c28 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1026,6 +1026,16 @@ retry:
 		bool found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
 		igt_require_f(found, "No valid mode combo found.\n");
 
+		if (is_intel_device(data->drm_fd)) {
+			for_each_crtc(&data->display, crtc) {
+				igt_pipe_crc_free(data->pipe_crcs[crtc->crtc_index]);
+				data->pipe_crcs[crtc->crtc_index] = NULL;
+			}
+		}
+
+		igt_remove_fb(data->drm_fd, &data->fbs[0]);
+		igt_remove_fb(data->drm_fd, &data->fbs[1]);
+
 		goto retry;
 	}
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-- 
2.34.1

