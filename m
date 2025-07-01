Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574B6C7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 11:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CC810E58A;
	Tue,  1 Jul 2025 11:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htLjI+nk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AE110E58A
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 11:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751367718; x=1782903718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PvPvETlrCZyg5KntCgm7vkZjTfIVK31pWqyAvLCTLeE=;
 b=htLjI+nkzrPZrnKKG7JG2gM60uMuZPidRw91TTojfUNyQDW3jFc5+f6h
 dfMd+U52BS09hJb72Plbh3IOFeym+q51uKNTUnpqTgpxsw51OqJT61+VX
 qN9lv1Kik4wC1en7ijsPeVv36L62tMO0hxu6W6J7hEVAztsZAfZ86G3xf
 Tt2x5/pQXTPTNjT2CtAuYnGjwk5f4L5GTQwuUoQTPiC3NooFZq3RxzEBO
 rdXXd51kXccFNCOJI+HrAGZ4FNuOCderBkX/DOA0JSugvEscG7JcFFRoi
 XyXETf7Ywh5dLb8fyooSJ0ms5zUxrz3634lHVI5uYK/ghfVDBC3mT8wiP g==;
X-CSE-ConnectionGUID: UcGs9Vm7ScidtjD26zz2Jg==
X-CSE-MsgGUID: tkwUwqAWRo+Zaxt7UDRycg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53751026"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53751026"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:01:58 -0700
X-CSE-ConnectionGUID: DOkRoh6KTROu1kk7/x1e1g==
X-CSE-MsgGUID: 86yAPlsoRjW09FOHLpf6Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="184785798"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:01:56 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, arun.r.murthy@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/kms_flip: Adjust pass rate threshold based
 on frame rate
Date: Tue,  1 Jul 2025 16:31:48 +0530
Message-ID: <20250701110149.395301-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701110149.395301-1-ramanaidu.naladala@intel.com>
References: <20250701110149.395301-1-ramanaidu.naladala@intel.com>
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

For high frame rates (>120 fps), the pass rate threshold is reduced
from 85% to 75% to account for increased timing sensitivity. This
change improves test reliability on high refresh rate displays,
where occasional frame drops are more likely due to tighter frame
intervals.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 98bdc169d..4dfa1c483 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1228,6 +1228,7 @@ static bool check_final_state(const struct test_output *o,
 			      const struct event_state *es,
 			      unsigned int elapsed)
 {
+	int threshold = 85;
 	igt_assert_f(es->count > 0,
 		     "no %s event received\n", es->name);
 
@@ -1239,16 +1240,19 @@ static bool check_final_state(const struct test_output *o,
 		int expected = elapsed / actual_frame_time(o);
 		float pass_rate = ((float)(count - error_count) / count) * 100;
 
+		if ((1000000.0/actual_frame_time(o)) > 120)
+			threshold = 75;
+
 		igt_info("Event %s: expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
 			 es->name, expected, count, pass_rate, o->kencoder[0]->encoder_type);
 
 		/*
-		 * TODO: Review the use of the hardcoded threshold (85). This value is
+		 * TODO: Review the use of the hardcoded threshold (85/75). This value is
 		 * currently a placeholder for the acceptable pass rate. In the future,
 		 * we should either justify this value or refine the logic to skip
 		 * frames near the evasion time.
 		 */
-		if (pass_rate < 85) {
+		if (pass_rate < threshold) {
 			igt_debug("dropped frames, expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
 				  expected, count, pass_rate, o->kencoder[0]->encoder_type);
 			return false;
-- 
2.43.0

