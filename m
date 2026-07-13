Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A74C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 08:58:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153EF10E879;
	Mon, 13 Jul 2026 08:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNuVtsXT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B77610E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932978; x=1815468978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vOL9xWON/qycfGNX13EAvQ5FHf5+ZSwWu0jpnMgb2VI=;
 b=cNuVtsXTusn11l/W9xQWk1KV31eCWj1a3xxp8fbUCsRFCUn3IGu8JA2Y
 gg1nuSF8cgI4Y+vV3UYQOnGc0Dhv3Phszs+uNwbM2+hg65MHe+CD0LGjK
 6U8fp3SdRD8yx/IqXt6hB/evkBZtov25cF0hLjiivr5YmLt1k8RTeg9Dn
 tjnzPgBCndqMZbRDbuFj7xIuZKJF74JmkAXsCtvV+1NoCqFoZWgOtzZNI
 2ipUYY+Q410biL0UeX0KpUCKfqqkfzF4mMb4d1czWoTkLHgwrKGd7j8jN
 utrC6p4ReexIhkPrIKAggnj3UzSu+y2vftEnknifYqOAraCIq6LJLQfVp w==;
X-CSE-ConnectionGUID: LLzSz9U/RiO0PFMPGZL1Hw==
X-CSE-MsgGUID: +lfJbSNPT9+URBKPy5W5Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081332"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081332"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:18 -0700
X-CSE-ConnectionGUID: MCNdKdq/T/uAeY66FdvNZQ==
X-CSE-MsgGUID: Hqd9cssrQFKXu8vzNu8KMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385931"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:17 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 11/16] tests/kms_sharpness_filter: fix typo
Date: Mon, 13 Jul 2026 10:55:10 +0200
Message-ID: <20260713085515.463575-12-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260713085515.463575-1-michal.grzelak@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Refer to the connector if connector does not have any scaling mode.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 8c60736691..f2e3fc9494 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -456,7 +456,7 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 	igt_plane_set_fb(data->plane[0], &data->fb[0]);
 
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
-		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
+		igt_require_f(has_scaling_mode(output), "No connector scaling mode found on %s\n", output->name);
 
 	if (type == TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR)
 		igt_require_f(igt_crtc_has_prop(data->crtc, IGT_CRTC_SCALING_FILTER),
-- 
2.45.2

