Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDA7C2BA1A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 08:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924EF10E5DB;
	Tue, 18 Jun 2024 08:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHrmRtMl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5832310E5DA
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718699455; x=1750235455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j5yljLZREE3qpLiZPytmtcU5QlYJQUhzGCiDeSuqvHE=;
 b=lHrmRtMl0pBdFpcDqttj7a/hc9nNAKhe5ncOoYIdSqKlruZEMtyZbCkQ
 ARoXWVDXLDL+RE3+0Y03sqUSEE4JFIvzQIq8Z5oU3HvWOTqpbVudnx6hu
 xGVn5Qx4j4dQWmPsemIrF4nuVby29TPTAAYHueQ8iqeOzvM5Bqm5J3IVz
 hS9eGypVjdM+7fQ/y5xKRGNsjnpdVy05dkJQehxLlhT2CwkMbWswNNF92
 60UxHiA/U/noIXzDj8AqkReVIyhvu/iy7vpGm6+Dihs4Jz8kixDMVAcRR
 4ITVLiH6JML/1UjJBuGFY4MQ70+f/kbSoZp3YwypuPDiHP+ttQ2IzNOP2 A==;
X-CSE-ConnectionGUID: +C085UepSt6MbPKccwC2Fw==
X-CSE-MsgGUID: IizAoD/XTduHNLaOhRrBJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="38082161"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="38082161"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:30:55 -0700
X-CSE-ConnectionGUID: rXQm9DrFSAGwClt64SgbiQ==
X-CSE-MsgGUID: 3npLdPpjRDm0yS9Oh7EXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="64699516"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 01:30:52 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	jeevan.b@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [i-g-t V6 1/8] lib/igt_kms: Split the bigjoiner check into multiple
Date: Tue, 18 Jun 2024 13:52:41 +0530
Message-ID: <20240618082248.4070611-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
References: <20240618082248.4070611-1-bhanuprakash.modem@intel.com>
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

To increase the readabilty, split the bigjoiner check
into multiple small ones. So that it would be easy to
extend/fix the logic further.

V2: - Use Primary/Seconary instead of Master/Slave (Jani)

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 57 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af63d13b1..5a1e47183 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6376,6 +6376,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	struct {
 		enum pipe idx;
 		drmModeModeInfo *mode;
+		igt_output_t *output;
 	} pipes[IGT_MAX_PIPES];
 	int max_dotclock;
 
@@ -6393,11 +6394,12 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 
 		pipes[pipes_in_use].idx = output->pending_pipe;
 		pipes[pipes_in_use].mode = igt_output_get_mode(output);
+		pipes[pipes_in_use].output = output;
 		pipes_in_use++;
 	}
 
 	if (!pipes_in_use) {
-		igt_debug("We must set at least one output to pipe.\n");
+		igt_info("We must set at least one output to pipe.\n");
 		return true;
 	}
 
@@ -6414,16 +6416,51 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
 	 *  - current & previous crtcs are consecutive
 	 */
 	for (i = 0; i < pipes_in_use; i++) {
-		if ((igt_bigjoiner_possible(pipes[i].mode, max_dotclock) &&
-		     ((pipes[i].idx >= (total_pipes - 1)) ||
-		      (!display->pipes[pipes[i].idx + 1].enabled) ||
-		      ((i < (pipes_in_use - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
-		    ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock) &&
-		     ((!display->pipes[pipes[i - 1].idx + 1].enabled) ||
-		      (abs(pipes[i].idx - pipes[i - 1].idx) <= 1)))) {
-			igt_debug("Pipe/Output combo is not possible with selected mode(s).\n");
+		if (igt_bigjoiner_possible(pipes[i].mode, max_dotclock)) {
+			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
+				 kmstest_pipe_name(pipes[i].idx),
+				 igt_output_name(pipes[i].output),
+				 max_dotclock);
+			kmstest_dump_mode(pipes[i].mode);
+
+			if (pipes[i].idx >= (total_pipes - 1)) {
+				igt_info("pipe-%s: Last pipe couldn't be used as a Bigjoiner Primary.\n",
+					 kmstest_pipe_name(pipes[i].idx));
+				return false;
+			}
 
-			return false;
+			if (!display->pipes[pipes[i].idx + 1].enabled) {
+				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
+					 kmstest_pipe_name(display->pipes[pipes[i].idx + 1].pipe));
+				return false;
+			}
+
+			if ((i < (pipes_in_use - 1)) &&
+			    (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)) {
+				igt_info("Consecutive pipe-%s: Not free to use it as a Bigjoiner Secondary.\n",
+					 kmstest_pipe_name(pipes[i + 1].idx));
+				return false;
+			}
+		}
+
+		if ((i > 0) && igt_bigjoiner_possible(pipes[i - 1].mode, max_dotclock)) {
+			igt_info("pipe-%s-%s: (Max dot-clock: %d KHz)",
+				 kmstest_pipe_name(pipes[i - 1].idx),
+				 igt_output_name(pipes[i - 1].output),
+				 max_dotclock);
+			kmstest_dump_mode(pipes[i - 1].mode);
+
+			if (!display->pipes[pipes[i - 1].idx + 1].enabled) {
+				igt_info("Consecutive pipe-%s: Fused-off, couldn't be used as a Bigjoiner Secondary.\n",
+					 kmstest_pipe_name(display->pipes[pipes[i - 1].idx + 1].pipe));
+				return false;
+			}
+
+			if (abs(pipes[i].idx - pipes[i - 1].idx) <= 1) {
+				igt_info("Consecutive pipe-%s: Not free to use it as a Bigjoiner Secondary.\n",
+					 kmstest_pipe_name(pipes[i].idx));
+				return false;
+			}
 		}
 	}
 
-- 
2.43.2

