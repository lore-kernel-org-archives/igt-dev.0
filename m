Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1397EB7EAC
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 10:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D9910E9A1;
	Wed,  4 Mar 2026 10:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HlqQM/+q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B9410E9A1
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 10:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772618923; x=1804154923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=50tXyeSz1GCnFfVAsztN7D3+TFxl67zka3cRGpfyZpg=;
 b=HlqQM/+qKEhMGA8kRFMlodEnvyqRE2Bf9OR6KETQOd0+9V4/pB/78u2L
 +8nUo8HuiGPvpR3No5H9Z+hAlesGk0EhKLU4zeZnnr8i/gCRanXNcrPaP
 iO1wSXwhcEqtp5yGEFfeO73oCH69BOEzj61l6BdEBZFfqQKy1QVZIgAc+
 S9qcsML8PhnV3p1oiL6qEaP8q7o6+tmGrwaiilfwB01Ij1claxBu2NS5I
 JxN1PwN8t0NF65XqvEC2uM+MAaCL7gdU/T5mnpRp6DINcLIkLV+7FVlT7
 z4mlp2dRx0PDty7LLVZt7rYc6UHIA2DXKWBjodYTdI2XHUVNNjxy82c9D Q==;
X-CSE-ConnectionGUID: SOj8GEmTQ3WExxwg7KHIqA==
X-CSE-MsgGUID: l/ftRglBQ+KwT8zrcMsuTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96286681"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96286681"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:08:43 -0800
X-CSE-ConnectionGUID: f1NPBqaUS2GdfquBZAnTnA==
X-CSE-MsgGUID: UJb22B2HQlyqaAXoB7Vk5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="215263324"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:08:41 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 1/2] tests/chamelium/audio: Fix ALSA handle leak on skipped
 audio config
Date: Wed,  4 Mar 2026 15:35:52 +0530
Message-ID: <20260304100553.3075443-2-mohammed.bilal@intel.com>
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

When the audio configuration check fails, the loop continues without
closing previously opened ALSA handles. This leads to handle leaks
across iterations and may eventually cause file descriptor exhaustion
or configuration failures.

Fix by ensuring the handles are closed before continuing.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index df8d27c0c..2967e3c50 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -762,8 +762,10 @@ static void test_display_audio(chamelium_data_t *data,
 			sampling_rate = test_sampling_rates[i];
 
 			if (!check_audio_configuration(alsa, format, channels,
-						       sampling_rate))
+						       sampling_rate)) {
+				alsa_close_output(alsa);
 				continue;
+			}
 
 			run = true;
 
-- 
2.48.1

