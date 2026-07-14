Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391E7C44508
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 15:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB44E10E355;
	Tue, 14 Jul 2026 15:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLWSMK0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3278E10E355
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 15:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784041774; x=1815577774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZnQdaLS4szDENiYAvukFFK8yTIuNEy6XvzkqNXFWRU4=;
 b=KLWSMK0vB1j8r6+CM4gAJqXoXOzUcG3QGd9h+mggKoZjm8WPbFpqx1sX
 lnnr7tOvwA+2GYXmxLtxD+DyNdE9JQcKR1lz0f1Hx+YL/1A0mghJcHwL/
 9X3nqETIiWr5eJfCO193wNCdD4DPNjl1p7cxi0TdsC1is4Basb0PhL5UU
 QMLhY4aJ2RtUB5ndHvPnDccib1Mq5/+ZoZM2sAgt35DkEGPUPv7ABmbeV
 +JKeyeCz4OnWSRf/ShLlleom06VSePrgS0U819Vl52Y4NW6+H7By+DLKr
 FmbEP7VgkQqK6BoTfo6G2nHTcHAXNslPk53V8kowAHVde7ZlljvP0U/lK w==;
X-CSE-ConnectionGUID: ElFKXacsTyaThzg0pMzpeQ==
X-CSE-MsgGUID: arGUfLmdTRyfrMR/FYlmnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88488862"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="88488862"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 08:09:34 -0700
X-CSE-ConnectionGUID: Y8trIMIaSYqWDQX0tL1pAw==
X-CSE-MsgGUID: Ww0NEiRST0mwHIbxOe1opA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="257839057"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa004.fm.intel.com with ESMTP; 14 Jul 2026 08:09:32 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH i-g-t 2/2] tests/kms_properties: set client cap for color
 pipeline
Date: Tue, 14 Jul 2026 20:15:32 +0530
Message-Id: <20260714144532.351294-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
References: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
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

Set DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE for colorop subtests.
Unset it when done.

Cc: John Harrison <John.Harrison@Igalia.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_properties.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index f735839da..93bf1ea26 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -340,10 +340,18 @@ static void colorop_properties(igt_display_t *display, bool atomic)
 	bool found_any = false, found;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
+	int ret;
 
 	/* colorops are only available with atomic */
 	igt_skip_on(!display->is_atomic);
 
+	ret = drmSetClientCap(display->drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1);
+	igt_skip_on_f(ret, "DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE not supported\n");
+
+	igt_display_fini(display);
+	igt_display_require(display, display->drm_fd);
+	display->has_plane_color_pipeline = true;
+
 	for_each_crtc(display, crtc) {
 		found = false;
 
@@ -369,6 +377,12 @@ static void colorop_properties(igt_display_t *display, bool atomic)
 		}
 	}
 
+	ret = drmSetClientCap(display->drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 0);
+	igt_assert_eq(ret, 0);
+
+	igt_display_fini(display);
+	igt_display_require(display, display->drm_fd);
+
 	igt_skip_on(!found_any);
 }
 
-- 
2.25.1

