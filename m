Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE58DD35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA5510ED3B;
	Wed,  1 Apr 2026 11:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPdhsIp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D6510ECE4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775043343; x=1806579343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aBTpEneOMOW/dQ4NIcJN1wKu24s7CwX2/3h9YOmJ7OM=;
 b=hPdhsIp4VdNuqJ3FDwdVek6iktwfGg6A0PInxAcIil+XXt2h+v9sPpHU
 mMvE4Nxw5xw3ojuPiDo+yCA0i3F+8Zy8gJQPps9S6glvxlb6v6uQVuGZi
 BZ4HkwTleVWqVZxByYYF8IAcKea7aXjJqRfOIZnz2yV3D4clDObtuXXnc
 91Py/fMfCtJ9vts/NpVu3NSqYVGMgGSs9FGhlxJCNiF6OTQdc0NhFeFdB
 x4SUhscBZPzRZL4joCZXhuC0Y9YQ82UHo+ZCADlwVnH1yRw75uBNbCSzn
 /q/x7a9kyWRJlBvFNVK7B+hlbB1P48D7rQ1OaWCOo+6XxnHHfmpgusCGT A==;
X-CSE-ConnectionGUID: U+NlwAUPSq+NAXxW95s4cQ==
X-CSE-MsgGUID: QqoJ9WVXQDm6F75z9XTNdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78669804"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78669804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:35:43 -0700
X-CSE-ConnectionGUID: iZ9BrAWHQfCgnNEt2QO2yw==
X-CSE-MsgGUID: CoGpFHwDSYOOzO80IqFIEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228263476"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:34:28 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 5/6] tests/intel/kms_joiner: Require boundary mode for
 basic-max-non-joiner
Date: Wed,  1 Apr 2026 17:25:41 +0530
Message-Id: <20260401115542.1074290-6-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260401115542.1074290-1-kunal1.joshi@intel.com>
References: <20260401115542.1074290-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Skip when the returned mode's hdisplay is below the
platform's single-pipe limit.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_joiner.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 86226a3ba..5f3914ca1 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -572,6 +572,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 static void test_basic_max_non_joiner(data_t *data)
 {
 	igt_display_t *display = &data->display;
+	int max_hdisplay = igt_get_max_pipe_hdisplay(data->drm_fd);
 	int count;
 	enum pipe pipe;
 	igt_output_t **outputs, *output;
@@ -597,6 +598,9 @@ static void test_basic_max_non_joiner(data_t *data)
 				igt_require(max_non_joiner_mode_found(data->drm_fd,
 								      output->config.connector,
 								      max_dotclock, &mode));
+				igt_require_f(mode.hdisplay >= max_hdisplay,
+					      "Max non-joiner mode %dx%d below single-pipe limit %d\n",
+					      mode.hdisplay, mode.vdisplay, max_hdisplay);
 				igt_output_override_mode(output, &mode);
 				igt_info("Appplying mode = %dx%d@%d\n", mode.hdisplay,
 					 mode.vdisplay, mode.vrefresh);
-- 
2.48.1

