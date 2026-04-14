Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CCEF531F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6040510E072;
	Tue, 14 Apr 2026 07:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2hucS0U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F87710E580
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150949; x=1807686949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nWNSybmpZzaEsKfBLePF5GvBP91SPwyH1sEEPvYNzS0=;
 b=T2hucS0UmnqFuCXNm8d4PSznT7uuug1YDdWE6uVeKnwqShfhSbbZrfXx
 ZGnCqDE5kDdf2lQwIbE+gFPYZNG5NyzGNQTQQ0P0gKxEqz0C7m6DmSLzI
 ps47OrwvkbHjt8EbTXIj6bsijjR4g5A6wDXXSmeiTM5htcMs/OZiFqSI8
 qmFz3oIQTdt4sekygXNfWcDMwZc/d7aQqlHlxUhpJkxrZAASAGQkmGGVZ
 anaTRIZjUmgFFFczUTFk+XwfcWVlavT9wnjeApulbjH5DusgvWvlCa9aC
 WKb0+1+vKX6HQsSEy91G3/Bc/sN0nDNJuxMkjYbwBDHLFQj8/MTuFVLam Q==;
X-CSE-ConnectionGUID: uf7uNyAKSouGsdGf0HhzLw==
X-CSE-MsgGUID: eYhCvB+fRoKDWt0afF5LqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64633912"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="64633912"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:48 -0700
X-CSE-ConnectionGUID: WIybvFlFTDC2OA1+y8TCCg==
X-CSE-MsgGUID: K6Ntbq9+S6aN0Hjp6PSyqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="229889136"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 14/16] tests/kms_content_protection: use
 for_each_output()
Date: Tue, 14 Apr 2026 10:14:34 +0300
Message-ID: <6ae71c5b775eb9bbca4aac2613d631d26e746807.1776150714.git.jani.nikula@intel.com>
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
 tests/kms_content_protection.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index caf3d7a56ae4..a42f699e9c64 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -395,10 +395,10 @@ static void test_cp_enable_with_retry(igt_output_t *output,
 static bool igt_crtc_is_free(igt_crtc_t *crtc)
 {
 	igt_display_t *display = crtc->display;
-	int i;
+	igt_output_t *output;
 
-	for (i = 0; i < display->n_outputs; i++)
-		if (igt_output_get_driving_crtc(&display->outputs[i]) == crtc)
+	for_each_output(display, output)
+		if (igt_output_get_driving_crtc(output) == crtc)
 			return false;
 
 	return true;
-- 
2.47.3

