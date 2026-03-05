Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62E6F30929
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 09:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797BC10EBDB;
	Thu,  5 Mar 2026 09:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fiHTUtTV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120F510EBDA
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703188; x=1804239188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=50tXyeSz1GCnFfVAsztN7D3+TFxl67zka3cRGpfyZpg=;
 b=fiHTUtTVah35HTMnJRwmesE5TJJIQ0ECMLDDOAw7DJ4IqbdpgKNvvN3P
 7EsFY4o2/XO3tLTEGHJ1o5HbGY9t4lWWycwUo3F+oEZ1arAGZtQJmx0b5
 hbPhbmsTNO1W6MCbAH4Nsm2HyUN6iZY/Og+t9ysoP+Y0Cxpbq7X3gbwz+
 DYJdEZEanL5zGnL0RvQ8DG6jjW/Tl9wQmFK+XzmeBRfkSYB+jtoRTD3CY
 nnfs1+V6r1rvFT3C3xQMm4Ogn2yMGW39+dQFwEvn78ukAVKh4Gzrpm5nL
 UxgXzgEzJ1gNX2Iz73SaTCZIKM0TolaVGINfRxVH8xzqPFdRy/88GV6/B w==;
X-CSE-ConnectionGUID: tmdz1FJ8RuK3zGBxByUnNQ==
X-CSE-MsgGUID: /nK1P4ART7KpVmxX8vsJRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73854062"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73854062"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:33:08 -0800
X-CSE-ConnectionGUID: fbXCjHhqSYeMzyzzbwI6iQ==
X-CSE-MsgGUID: tpW+mj/eRHSNUeoHlEw9MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="222775336"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:33:07 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v2 1/2] tests/chamelium/audio: Fix ALSA handle leak on skipped
 audio config
Date: Thu,  5 Mar 2026 15:00:24 +0530
Message-ID: <20260305093025.3107101-2-mohammed.bilal@intel.com>
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

