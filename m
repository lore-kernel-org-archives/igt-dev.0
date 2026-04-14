Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5C9F531F1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1818710E072;
	Tue, 14 Apr 2026 07:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5BwocLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEFE10E072
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150953; x=1807686953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k2+H27Rh/gMAP27OE0/yiwmhb4ZFmxJ0LY72ekd1m50=;
 b=B5BwocLytva1FyexEypOtidwldxrg6xihwINHRCCVGgQLvIGiYmgvUeh
 9rAO5BDuQ70xZiCeY8wcRTD5fOZrozQZ2SbJ9sWnM1OGQqMtLkspeTqus
 yUv8iDOHGcCf7tMxdRJlq0IzmmEdwSqf5wFT/ykZL4eskHaocnaQmY5Ap
 KLz0p8GLNmjCIs7shnR1edAsfFxPBaaYxgq9vWyhIMKN+WtSkoDC7YHjI
 vcliUZigcSFhUdiY5wWTXSBMydbZ3X+qsyzHnBdpRUyGmJ2L4WyQweUEB
 tbd/GD6LTLjd9VQ6gfW24x84p6McLpw9BXXKvMmW93yPhKdUKnNTj+7KB w==;
X-CSE-ConnectionGUID: yzfvbxarTPajV7KQP5QreQ==
X-CSE-MsgGUID: sLYCBTeRSTKySMlBm5rZ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64633920"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="64633920"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:53 -0700
X-CSE-ConnectionGUID: BW98FLKvSRqL+MLmNKgqiw==
X-CSE-MsgGUID: euUKefokRbC4tPAN3fAqkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229889141"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 15/16] tests/kms_getfb: use for_each_output()
Date: Tue, 14 Apr 2026 10:14:35 +0300
Message-ID: <931245711347c0edcb0ce805044f6d3d9fb96b1a.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
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

Use for_each_output() instead of manually iterating display->outputs[i].

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_getfb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 7ceca73f3997..972a38d7d6e7 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -131,8 +131,9 @@ static bool has_getfb_iface(int fd)
  */
 static uint32_t get_any_prop_id(igt_display_t *display)
 {
-	for (int i = 0; i < display->n_outputs; i++) {
-		igt_output_t *output = &display->outputs[i];
+	igt_output_t *output;
+
+	for_each_output(display, output) {
 		if (output->props[IGT_CONNECTOR_DPMS] != 0)
 			return output->props[IGT_CONNECTOR_DPMS];
 	}
-- 
2.47.3

