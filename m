Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F2DF3C26D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:22:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61EC10E510;
	Mon,  9 Mar 2026 14:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I75PeqeT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910FC10E4FA
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066127; x=1804602127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tph1UibSZ04Rsau2FLCm2zbCi+5Cn/NNzl/yeyJ1CHQ=;
 b=I75PeqeTj8MgscAqktjTIf4nqd/TiCccxNVQ2rAiKxmXVyWJskegAJDY
 7OxB/X1yPvLcEwFPc8RNcDA5ctwJPeJxXq+mq3mXoPavY5sZFC8x23TNG
 xhHkcOpQVP4iEt1SbK1YSUtHGiTu7vmnc5wOkCC2DBJTtqDToWNBEVI6+
 kDnv8M/eDqq1xt1ybKXBtQ6RRZ7xyCk7M+HOigVmZbxLI7HD40uj8DSKv
 oxkt6Mkk7Ce5EuC/6myi4vTn4XwxgIh7XGRbdi2xN8jfEighBXoTVaazy
 OiB2BCjJWPQSzXH1zZZ3I5BIvkT/f01YKuF0RXj5WP0nYyxjfFFyKRmrJ w==;
X-CSE-ConnectionGUID: RVJ8neb6TCmTenO2gFoDpw==
X-CSE-MsgGUID: 68zFdIaBTK2AQT8o/Tj7oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="99559751"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="99559751"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:06 -0700
X-CSE-ConnectionGUID: pIUld8teRM+bWUu41KOf1g==
X-CSE-MsgGUID: xS9dDtqOQJGIejmgwhqVIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="224466043"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 03/10] tests/kms_color_pipeline: use igt_crtc_name()
Date: Mon,  9 Mar 2026 16:21:37 +0200
Message-ID: <96cca12b47167905ce64ad873bef76d5e4538cf1.1773066012.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773066012.git.jani.nikula@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Prefer using igt_crtc_name() instead kmstest_pipe_name(crtc->pipe).

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_color_pipeline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index d31df6ff2319..78860a845e59 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -194,7 +194,7 @@ static void test_plane_colorops(data_t *data, igt_crtc_t *crtc,
 		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
 			continue;
 
-		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
+		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc), plane_id)
 			_test_plane_colorops(data, plane, fb_colors,
 					     &ref_crc, colorops);
 	}
-- 
2.47.3

