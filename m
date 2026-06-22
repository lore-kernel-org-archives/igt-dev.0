Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07940CDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 22:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9FB10E2A4;
	Mon, 22 Jun 2026 22:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwD8tp12";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D946110E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 22:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782169104; x=1813705104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o0KjQDewk+IMx4yrnzpOfxwjeEc2PgsWsX+Uo2lM494=;
 b=KwD8tp12snv+uE4Yx0xBk4z73Xdf0GFtcAQGKHD/U1AYbGJTUnT4xPg6
 6boyQ+leFj/342SVWpn210lxCW1y89l4BcDcFqESUdVkxhXWXk54sSnJr
 2mo+2TkVAJXXbAgxI16CNOjSBJx0D4vAHHWDlxyg2LuBAdFkzfByJLHhq
 stCvGLMf2ynohw7R1foJZLU6bwqbJyB9DFsEx3XRPzUbVGByAVYKyEH1m
 cQ5bjpUbzKcCm04/vUis/1lQrg5cMc++3rwYmJTrAtjG0jZcLmQ+1K6UO
 9D0iGPnEIl3SUzt/2uQrPPOJ4hQiEXArXfKNdDWROomJg/RFLVcOnMswK A==;
X-CSE-ConnectionGUID: yx4FxrKGTd+EFbqLN5OfGQ==
X-CSE-MsgGUID: H5V+yGRESy+1qgrRycxxEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82010417"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="82010417"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 15:58:24 -0700
X-CSE-ConnectionGUID: WHyNJIKOTR66JL2Qv0jzwQ==
X-CSE-MsgGUID: RmKEBuIiTUm8UBnpX5DTRw==
X-ExtLoop1: 1
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jun 2026 15:58:23 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 1/3] tests/kms_ccs: s/pipe/crtc
Date: Tue, 23 Jun 2026 00:58:09 +0200
Message-ID: <20260622225811.1703400-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260622225811.1703400-1-michal.grzelak@intel.com>
References: <20260622225811.1703400-1-michal.grzelak@intel.com>
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

Fix leftover reference to pipe, which should refer to crtc.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 lib/igt_kms.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3df3ba8663..3bcaf2883e 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -773,7 +773,7 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
  *
  * If you only need to test a single output for each pipe, use
  * for_each_crtc_with_single_output(), if you only need an
- * output for a single CRTC, use igt_get_single_output_for_pipe().
+ * output for a single CRTC, use igt_get_single_output_for_crtc().
  */
 #define for_each_crtc_with_valid_output(display, crtc, output) \
 	for ((output) = &(display)->outputs[0], (crtc) = &(display)->crtcs[0]; \
-- 
2.45.2

