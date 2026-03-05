Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16748F3092A
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 09:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37B210EBD5;
	Thu,  5 Mar 2026 09:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZS8P1CXu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18CE10EBD5
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703190; x=1804239190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1z5qF11fckZAU6sFW45QgbleO3ULlICtFIocp5ekLoE=;
 b=ZS8P1CXu47njsTOAfngIo9OGaeOBbWGWVNWUQbkxaHXq3LFgkHNe+13A
 ByOCbUAtHPV9lsogBelsiZz0ST9ZT+7+Ire7BqaUQamKYKWScXrLT5wd3
 oHfwHCCQ8i6Kh3lkBGftH1cDofA2XhJO+zzrzG6A/xKyiEQDmlEHJUDWj
 TKP5BrYtVMwsp1dXvdIqmuWWr/PBL/nO1xFeELKp63ioE+qLtWQn6k8jx
 P+hCgWgDVMRTCwY7IRig1KZpYd/RPt7G5A2oaODfuCOnI/mUxWiim6/6E
 AcIzPd+z9wMETReh1SxZ+OSNryOiwi5+YnxaXZV/dUgg+Ipgj94nsSA4L g==;
X-CSE-ConnectionGUID: LhUJm3osRPKIRVH/h+5wCA==
X-CSE-MsgGUID: DZS72JgySIax2gU/0xzyxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73854076"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73854076"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:33:10 -0800
X-CSE-ConnectionGUID: zgmMK6J3Rv2fbuh2dP8Cjw==
X-CSE-MsgGUID: VmIgg2LDRXmqqovTI3X1Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="222775351"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:33:09 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on assertion
 failure
Date: Thu,  5 Mar 2026 15:00:25 +0530
Message-ID: <20260305093025.3107101-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260305093025.3107101-1-mohammed.bilal@intel.com>
References: <20260305093025.3107101-1-mohammed.bilal@intel.com>
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
 tests/chamelium/kms_chamelium_audio.c | 42 ++++++++++++++++++---------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 2967e3c50..201be0ba2 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -389,11 +389,11 @@ static int audio_output_frequencies_callback(void *data, void *buffer,
 static bool test_audio_frequencies(struct audio_state *state)
 {
 	int freq, step;
-	int32_t *recv, *buf;
-	double *channel;
+	int32_t *recv = NULL, *buf = NULL;
+	double *channel = NULL;
 	size_t i, j, streak;
-	size_t recv_len, buf_len, buf_cap, channel_len;
-	bool success;
+	size_t recv_len = 0, buf_len, buf_cap, channel_len;
+	bool success = false;
 	int capture_chan;
 
 	state->signal = audio_signal_init(state->playback.channels,
@@ -426,9 +426,12 @@ static bool test_audio_frequencies(struct audio_state *state)
 
 	audio_state_start(state, "frequencies");
 
-	igt_assert_f(state->capture.rate == state->playback.rate,
-		     "Capture rate (%dHz) doesn't match playback rate (%dHz)\n",
-		     state->capture.rate, state->playback.rate);
+	if (state->capture.rate != state->playback.rate) {
+		igt_critical("Capture rate (%dHz) doesn't match playback "
+			     "rate (%dHz)\n",
+			     state->capture.rate, state->playback.rate);
+		goto out;
+	}
 
 	/* Needs to be a multiple of 128, because that's the number of samples
 	 * we get per channel each time we receive an audio page from the
@@ -447,10 +450,6 @@ static bool test_audio_frequencies(struct audio_state *state)
 	buf = malloc(sizeof(int32_t) * buf_cap);
 	buf_len = 0;
 
-	recv = NULL;
-	recv_len = 0;
-
-	success = false;
 	streak = 0;
 	while (!success && state->msec < AUDIO_TIMEOUT) {
 		audio_state_receive(state, &recv, &recv_len);
@@ -460,13 +459,21 @@ static bool test_audio_frequencies(struct audio_state *state)
 
 		if (buf_len < buf_cap)
 			continue;
-		igt_assert(buf_len == buf_cap);
+		if (buf_len > buf_cap) {
+			igt_critical("Buffer overflow: %zu > %zu\n",
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
@@ -489,6 +496,7 @@ static bool test_audio_frequencies(struct audio_state *state)
 		success = streak == MIN_STREAK * state->playback.channels;
 	}
 
+out:
 	audio_state_stop(state, success);
 
 	free(recv);
@@ -587,6 +595,7 @@ static bool test_audio_flatline(struct audio_state *state)
 	recv = NULL;
 	recv_len = 0;
 	amp_success = false;
+	align_success = false;
 	streak = 0;
 	while (!amp_success && state->msec < AUDIO_TIMEOUT) {
 		audio_state_receive(state, &recv, &recv_len);
@@ -595,7 +604,11 @@ static bool test_audio_flatline(struct audio_state *state)
 
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
@@ -661,6 +674,7 @@ static bool test_audio_flatline(struct audio_state *state)
 		}
 	}
 
+out:
 	success = amp_success && align_success;
 	audio_state_stop(state, success);
 
-- 
2.48.1

