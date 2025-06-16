Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524D8C7115C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 06:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D2010E2B2;
	Mon, 16 Jun 2025 06:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENEVp9Dr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9A210E2B2
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 06:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750055951; x=1781591951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vJBjRl1UIYVzei0IvqUUfscrD8QDRd8/Nb1cz+qXQ4s=;
 b=ENEVp9DrH9sJmoRUl9XRdI6C1a1SU0BKH8PLR1R27L/8o0tlZZcTfXO5
 KNaqVwnpLR2iUHn5nbf1kHyYAkTVIHFdgFjCyJy00Za2c4YspcIAjFjqw
 nTjSKpcg/0cHOAkeBMw99QIN4B0jmxBKePQzUjiyqRsrcf5eNWfczMiG5
 ZAsoFf3lD9sSUepQglktk5Jce89NurCMKLd/Xc//9fod10Ol57idC5huZ
 yAOUYLE+Lsa/JCOa/eTYZw0MUntGvIDURghxDxdZk1W/0TGEaD9r6sMWN
 +PRIh02a2uXOMBeFsmbxTNTaykvgZEdRV1U8xxJDoy9wKCyH/Md71/kQF w==;
X-CSE-ConnectionGUID: LISWQph8SOCyVsoYCva0vA==
X-CSE-MsgGUID: yF7B/AlvSPuXRniM6nTwIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52280821"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="52280821"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:39:11 -0700
X-CSE-ConnectionGUID: 2EOXlsBjR5SBF2EHQmJzmw==
X-CSE-MsgGUID: Zraaz7rUSxmeG/wLpvdJUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153536001"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:39:10 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 4/5] tests/kms_flip: Track and report unexpected
 events with pass rate metric
Date: Mon, 16 Jun 2025 12:08:30 +0530
Message-ID: <20250616063831.3332042-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
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

At higher refresh rates, There is a possibility of flips being
submitted during the evasion window, which can result in one extra
frame and cause the test to fail. To address this, the test has
been modified to calculate a pass rate based on the number of
expected versus erroneous frames. A threshold of 85% is enforced
to determine test success.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 5873591fa..5ac0e2c4d 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -309,6 +309,7 @@ struct event_state {
 	unsigned int current_seq;		/* kernel reported seq. num */
 
 	int count;				/* # of events of this type */
+	int err_frames;				/* # of unexpected events */
 
 	/* Step between the current and next 'target' sequence number. */
 	int seq_step;
@@ -677,7 +678,7 @@ static void vblank_handler(int fd, unsigned int frame, unsigned int sec,
 	fixup_premature_vblank_ts(o, &o->vblank_state);
 }
 
-static bool check_state(const struct test_output *o, const struct event_state *es)
+static bool check_state(const struct test_output *o, struct event_state *es)
 {
 	struct timeval diff;
 
@@ -706,6 +707,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
 	    es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
 		igt_debug("unexpected %s seq %u, should be >= %u\n",
 			  es->name, es->current_seq, es->last_seq + o->seq_step);
+		es->err_frames++;
 		return true;
 	}
 
@@ -735,7 +737,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
 			igt_debug("unexpected %s seq %u, expected %u\n",
 				  es->name, es->current_seq,
 				  es->last_seq + o->seq_step);
-
+			es->err_frames++;
 			return true;
 		}
 	}
@@ -1233,16 +1235,16 @@ static bool check_final_state(const struct test_output *o,
 	 * those use some funny fake timings behind userspace's back. */
 	if (o->flags & TEST_CHECK_TS) {
 		int count = es->count * o->seq_step;
-		unsigned int min = actual_frame_time(o) * (count - 1);
-		unsigned int max = actual_frame_time(o) * (count + 1);
-
-		igt_debug("expected %d, counted %d, encoder type %d\n",
-			  (int)(elapsed / actual_frame_time(o)), count,
-			  o->kencoder[0]->encoder_type);
-		if (elapsed < min || elapsed > max) {
-			igt_debug("dropped frames, expected %d, counted %d, encoder type %d\n",
-				  (int)(elapsed / actual_frame_time(o)), count,
-				  o->kencoder[0]->encoder_type);
+		int error_count = es->err_frames * o->seq_step;
+		int expected = elapsed / actual_frame_time(o);
+		float pass_rate = ((float)(count - error_count) / count) * 100;
+
+		igt_info("Event %s: expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
+			  es->name, expected, count, pass_rate, o->kencoder[0]->encoder_type);
+
+		if (pass_rate < 85) {
+			igt_debug("dropped frames, expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
+				  expected, count, pass_rate, o->kencoder[0]->encoder_type);
 
 			return false;
 		}
-- 
2.43.0

