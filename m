Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AF9CCD194
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 06:14:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4289C10E948;
	Thu, 16 Oct 2025 06:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJzlvGfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F191F10E948
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 06:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760595255; x=1792131255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gtWatdSXadj/Z5fk/BN+goSlBdZE4ERpvpP6K6S5Dm4=;
 b=BJzlvGfhJYD68h3HnxQObJ2wPLlQgCYo25lwiRsWuBu/vd9GO3ZtXWXx
 IdvJZcNV9Xjt3+Kl7kXU4iLYslFDziDefG/no0pqXi2MykqYVSvWzuaQj
 86BtGMuf+BG5TPZ/IM4SMp04x6tQvIEaeCHoeqn2x3cz5X3bz1qqz3DJ2
 CHuJK5fVxS1gGH9KbSKMyE3uLw0QDS5KIA/E5kPbZLBpjE9Kxpvhybub1
 ZHgr+iU0A/1pPD3IBGZIvzvHitB6vFLn3P5lWPuQSJzOvDCtUiH24Ync1
 yGPx1tF3BmBODY5pbOCN2Jb+wPA1ZjBpiOI7PQCYspCcwcJ4I5o/gq0jn A==;
X-CSE-ConnectionGUID: UVJo5IKBQjuN35JxrfjpjQ==
X-CSE-MsgGUID: uHOAebkCTaCntoAiNDcnmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85398030"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="85398030"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:14:15 -0700
X-CSE-ConnectionGUID: mEX0OuIgTpiVBZ9RPNxFsA==
X-CSE-MsgGUID: fi9IRhCxRqilMrQfBe/UaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="187461852"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 23:14:13 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, pranay.samala@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/kms_dp_linktrain_fallback: Change
 debug mask to reduce log
Date: Thu, 16 Oct 2025 12:01:38 +0530
Message-ID: <20251016063138.2955320-3-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016063138.2955320-1-sowmiya.s@intel.com>
References: <20251016063138.2955320-1-sowmiya.s@intel.com>
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

Lower log level for subtests failing due to disk
limit when more than two displays are active.

v2: Remove the reset debug mask as in CI exit handler will
take care of it (pranay)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index fa58999e8..8f90dae53 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -617,6 +617,8 @@ igt_main
 	}
 
 	igt_subtest("dp-fallback") {
+		if (igt_get_connected_output_count(&data.display) > 2)
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
 		igt_require_f(run_lt_fallback_test(&data),
 			      "Skipping test as no output found or none supports fallback\n");
 	}
-- 
2.43.0

