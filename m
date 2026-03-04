Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631E8EB7EB5
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 10:08:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CD910E9A3;
	Wed,  4 Mar 2026 10:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSZ3PfQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB6310E9A3
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772618925; x=1804154925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J4vxw9H35zql7X3cKjRdB2MRvVyUw6H1xdsbMB9UbE8=;
 b=iSZ3PfQC0A+W8hakKl9F16XhAJ/9/DH0SWpnvYKnxvN6BOIhM2V3yDQd
 jx4//vPJhaKJ9PNXBKzXZBTpatJUIdym9bse6tDdggPDDCjeTscSVz/H9
 LYqngU1l0lNJq1KvRQeI1KKfeYA8N4zArbUCc4uWG5rCg2j/23S4lTEVq
 Fqemu/vYKAp8wwziYIDJiodxzETm5HtVFuK7tnACo/YuNENNHgO4g1oNO
 B993RpkKPIda+mi1La3Wu0CyEAywxWkWsCKjs7b+HE4d7DsJ8VL7QBkTr
 lWi65vt8xBIgmTkf8ZJMw3cNhP03WON39QFYFZYzOXkUnKzhGrN5VPgy8 w==;
X-CSE-ConnectionGUID: umkakKVPRtuTGv9TJKgPQA==
X-CSE-MsgGUID: QM7bw0mxTcCixGO7cWd6Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96286683"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96286683"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:08:45 -0800
X-CSE-ConnectionGUID: xEm5v1BsQ7SkbJy6mGhrbg==
X-CSE-MsgGUID: QnAtbZhGRG613ke6T72EfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="215263333"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:08:43 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 2/2] tests/chamelium/audio: Fix resource leaks on assertion
 failure
Date: Wed,  4 Mar 2026 15:35:53 +0530
Message-ID: <20260304100553.3075443-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260304100553.3075443-1-mohammed.bilal@intel.com>
References: <20260304100553.3075443-1-mohammed.bilal@intel.com>
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

Fatal assertions can bypass cleanup paths, causing resources to remain
unreleased when failures occur during audio tests.

Replace fatal assertions with non-fatal checks and route failures
through a common cleanup path to ensure proper cleanup.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c | 43 ++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 2967e3c50..41cbe92d9 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -426,9 +426,21 @@ static bool test_audio_frequencies(struct audio_state *state)
 
 	audio_state_start(state, "frequencies");
 
-	igt_assert_f(state->capture.rate == state->playback.rate,
-		     "Capture rate (%dHz) doesn't match playback rate (%dHz)\n",
-		     state->capture.rate, state->playback.rate);
+	/* Initialize heap pointers to NULL so the cleanup path can safely
+	 * free them regardless of where an error occurs.
+	 */
+	channel = NULL;
+	buf = NULL;
+	recv = NULL;
+	recv_len = 0;
+	success = false;
+
+	if (state->capture.rate != state->playback.rate) {
+		igt_critical("Capture rate (%dHz) doesn't match playback "
+			     "rate (%dHz)\n",
+			     state->capture.rate, state->playback.rate);
+		goto out;
+	}
 
 	/* Needs to be a multiple of 128, because that's the number of samples
 	 * we get per channel each time we receive an audio page from the
@@ -447,10 +459,6 @@ static bool test_audio_frequencies(struct audio_state *state)
 	buf = malloc(sizeof(int32_t) * buf_cap);
 	buf_len = 0;
 
-	recv = NULL;
-	recv_len = 0;
-
-	success = false;
 	streak = 0;
 	while (!success && state->msec < AUDIO_TIMEOUT) {
 		audio_state_receive(state, &recv, &recv_len);
@@ -460,13 +468,21 @@ static bool test_audio_frequencies(struct audio_state *state)
 
 		if (buf_len < buf_cap)
 			continue;
-		igt_assert(buf_len == buf_cap);
+		if (buf_len != buf_cap) {
+			igt_critical("Unexpected buffer length: %zu != %zu\n",
+				     buf_len, buf_cap);
+			goto out;
+		}
 
 		igt_debug("Detecting audio signal, t=%d msec\n", state->msec);
 
 		for (j = 0; j < state->playback.channels; j++) {
 			capture_chan = state->channel_mapping[j];
-			igt_assert(capture_chan >= 0);
+			if (capture_chan < 0) {
+				igt_critical("Invalid channel mapping for "
+					     "channel %zu\n", j);
+				goto out;
+			}
 			igt_debug("Processing channel %zu (captured as "
 				  "channel %d)\n",
 				  j, capture_chan);
@@ -489,6 +505,7 @@ static bool test_audio_frequencies(struct audio_state *state)
 		success = streak == MIN_STREAK * state->playback.channels;
 	}
 
+out:
 	audio_state_stop(state, success);
 
 	free(recv);
@@ -587,6 +604,7 @@ static bool test_audio_flatline(struct audio_state *state)
 	recv = NULL;
 	recv_len = 0;
 	amp_success = false;
+	align_success = false;
 	streak = 0;
 	while (!amp_success && state->msec < AUDIO_TIMEOUT) {
 		audio_state_receive(state, &recv, &recv_len);
@@ -595,7 +613,11 @@ static bool test_audio_flatline(struct audio_state *state)
 
 		for (i = 0; i < state->playback.channels; i++) {
 			capture_chan = state->channel_mapping[i];
-			igt_assert(capture_chan >= 0);
+			if (capture_chan < 0) {
+				igt_critical("Invalid channel mapping for "
+					     "channel %zu\n", i);
+				goto out;
+			}
 			igt_debug("Processing channel %zu (captured as "
 				  "channel %d)\n",
 				  i, capture_chan);
@@ -661,6 +683,7 @@ static bool test_audio_flatline(struct audio_state *state)
 		}
 	}
 
+out:
 	success = amp_success && align_success;
 	audio_state_stop(state, success);
 
-- 
2.48.1

