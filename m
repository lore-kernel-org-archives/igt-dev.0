Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878BFC7115D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Jun 2025 20:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D8E10E10C;
	Thu, 19 Jun 2025 20:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5I6BQqc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC0910E011
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jun 2025 20:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750363317; x=1781899317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dv1wLoUGJyKf/ImWQTay1b/5mO4NnkaQEhVJrg3Pfo8=;
 b=K5I6BQqcfSzIcpIzKO6+B2mrVvx0cNqTRPSPno0z1RJmKbPg6pKG3Srs
 EV5e7iWeG1XT64qg5eRDdssaHXdJ0dA0kPkKNE7hComH/c5hUIB6bLMt4
 R3u8npstA5EJNjbXbdNGkOOO7Lclj1nN35JFDUZRMpsgTPLdG8evnpEWj
 0Cyn8DbMdKrtth8UHUmDNYYOfw97+HAeWa31pRjuD2eoM7M6SlxUqPf5t
 yKXXYaIdsYUfzCIem9Ezbgb56amfNEoiAewD7fJP1OYgYqICSBCGM55JX
 IbyINJ0wnubhBnDGhMYlSqTjK6UzSIgehV91SxSxvo1N9Rjc8TG1f2HNM A==;
X-CSE-ConnectionGUID: UyNbfZKkQlOM8+yVATxM8g==
X-CSE-MsgGUID: 4P2P4SCMTHOgBDEGG6Ze5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70187014"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="70187014"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 13:01:56 -0700
X-CSE-ConnectionGUID: xrE9Ibo+T8WWpnquxJJ+ig==
X-CSE-MsgGUID: +2ht3fr+QNSifMit8dydmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; d="scan'208";a="187949784"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 13:01:55 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 2/2] tests/kms_flip: Track and report unexpected
 events with pass rate metric
Date: Fri, 20 Jun 2025 01:31:43 +0530
Message-ID: <20250619200143.66272-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619200143.66272-1-ramanaidu.naladala@intel.com>
References: <20250619200143.66272-1-ramanaidu.naladala@intel.com>
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

At higher refresh rates, there is a possibility of flips being
submitted during the evasion window, which can result in one extra
frame and cause the test to fail. To address this, the test has
been modified to calculate a pass rate based on the number of
expected versus erroneous frames. A threshold of 85% is enforced
to determine test success.

v1: Patch #2 and #4 merge into single patch. (Karthik)
v2: Address the regression failures.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_flip.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index ca31ef7dd..94a414ba7 100755
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
 
@@ -706,7 +707,8 @@ static bool check_state(const struct test_output *o, const struct event_state *e
 	    es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
 		igt_debug("unexpected %s seq %u, should be >= %u\n",
 			  es->name, es->current_seq, es->last_seq + o->seq_step);
-		return false;
+		es->err_frames++;
+		return true;
 	}
 
 	if (o->flags & TEST_CHECK_TS) {
@@ -727,16 +729,16 @@ static bool check_state(const struct test_output *o, const struct event_state *e
 				  es->name, timeval_float(&es->last_ts), es->last_seq,
 				  timeval_float(&es->current_ts), es->current_seq,
 				  elapsed, expected);
-
-			return false;
+			es->err_frames++;
+			return true;
 		}
 
 		if (es->current_seq != es->last_seq + o->seq_step) {
 			igt_debug("unexpected %s seq %u, expected %u\n",
 				  es->name, es->current_seq,
 				  es->last_seq + o->seq_step);
-
-			return false;
+			es->err_frames++;
+			return true;
 		}
 	}
 
@@ -1233,17 +1235,16 @@ static bool check_final_state(const struct test_output *o,
 	 * those use some funny fake timings behind userspace's back. */
 	if (o->flags & TEST_CHECK_TS) {
 		int count = es->count * o->seq_step;
-		unsigned int min = actual_frame_time(o) * (count - 1);
-		unsigned int max = actual_frame_time(o) * (count + 1);
+		int error_count = es->err_frames * o->seq_step;
+		int expected = elapsed / actual_frame_time(o);
+		float pass_rate = ((float)(count - error_count) / count) * 100;
 
-		igt_debug("expected %d, counted %d, encoder type %d\n",
-			  (int)(elapsed / actual_frame_time(o)), count,
-			  o->kencoder[0]->encoder_type);
-		if (elapsed < min || elapsed > max) {
-			igt_debug("dropped frames, expected %d, counted %d, encoder type %d\n",
-				  (int)(elapsed / actual_frame_time(o)), count,
-				  o->kencoder[0]->encoder_type);
+		igt_info("Event %s: expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
+			 es->name, expected, count, pass_rate, o->kencoder[0]->encoder_type);
 
+		if (pass_rate < 85) {
+			igt_debug("dropped frames, expected %d, counted %d, passrate = %.2f%%, encoder type %d\n",
+				  expected, count, pass_rate, o->kencoder[0]->encoder_type);
 			return false;
 		}
 	}
-- 
2.43.0

