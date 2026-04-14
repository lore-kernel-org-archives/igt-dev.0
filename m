Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9BAF531F1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49FC10E072;
	Tue, 14 Apr 2026 07:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3gzx+mP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2196910E072
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150935; x=1807686935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0BiI28jRMgxvonbY8Ix1dERU8UlqD4OJ1qzxlYHf3hA=;
 b=R3gzx+mPzGQio95bETNZzpTC00Re7WOkwUkHoUWU+68IE1v8QbRFmAok
 2eiZqFiJfENbgrFRFBNialmLD0BEs+qUvqM2zNlmtVtYNwqitNkFGm9cq
 MP3tz8qwGNltVEKbu4sgBxHKehU9t6BisRjMvxgvhvspKZDiR+cRnNVgr
 QFcpp3KmW4s5g5oN1uqw+OkLfGDE+tpZS95vSdHxsTVxCzmtsqxR69S8k
 8JOblu/t8G02B5tAQ74WKGZ4Nd/dU+xzRntEa+WdI1PXdLB1EhYu4Gpt0
 k2SNfWM5jZ4vvnvF+hOzxp3M8PdWKQhTl3/PZS6VkMmP40qeI1jLX2UhP w==;
X-CSE-ConnectionGUID: hedJfmPvQ++blQjYtT/0qw==
X-CSE-MsgGUID: XeC3S7m5RMy1zBDuSHYCiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80690988"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80690988"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:35 -0700
X-CSE-ConnectionGUID: 295xFQ05S7+ozb31n5hRZg==
X-CSE-MsgGUID: q+KPaSNYS6CneILMoUZ6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225712584"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 11/16] tests/amdgpu/amd_plane: use for_each_output()
Date: Tue, 14 Apr 2026 10:14:31 +0300
Message-ID: <ee620888571be67cbfb7fcec01f2fe158b299176.1776150714.git.jani.nikula@intel.com>
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

Tweak the CRTC limit check slightly when removing the for loop.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/amdgpu/amd_plane.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index da0dc7822575..412a220b255f 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -151,8 +151,9 @@ enum test {
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i, n, max_pipes = igt_display_n_crtcs(display);
+	igt_output_t *output;
 	igt_crtc_t *crtc;
+	int n = 0;
 
 	for_each_crtc(display, crtc) {
 		data->crtc[crtc->crtc_index] = crtc;
@@ -168,8 +169,9 @@ static void test_init(data_t *data)
 			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
-	for (i = 0, n = 0; i < display->n_outputs && n < max_pipes; ++i) {
-		igt_output_t *output = &display->outputs[i];
+	for_each_output(display, output) {
+		if (n == igt_display_n_crtcs(display))
+			break;
 
 		data->output[n] = output;
 
-- 
2.47.3

