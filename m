Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AD1F46455
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3FC10E3CC;
	Mon, 16 Mar 2026 11:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eDtSxvcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BF910E4BA
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773661809; x=1805197809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VUpnG4DpL2fHOMKiUsX8I9JuJdAEUN2SbEiqF8rN9DA=;
 b=eDtSxvcVFw9Veu5+aZ6bCadjR+HERkQ8pdOx0tZ7Ua+jUfpEqaDt3Wyp
 ghbZNlCJNjnY6En0F7Uc9JgyuHbAUihB3n1kfMrJwClccEFPS/+NHew1e
 kwnixwIHXb+mFldnH5f2za51ax+SiOyMbm7sGrsCu4HSsJwZFBl6v1JcH
 tvgnHBHBLKPdvCMKzfpBNuRD4zE+vLoMDhJoJ23GGsRJF3M4jDl4v03FK
 Ui+Ev3A5zQF5LhPCoPGbiFREBiquFoG+RnwSx0x36cxBYOk1CozBIJCcq
 qYNJW4USwZrZgLUYSJvDDK9KQZwF0zjNhF6/Twgy/09iXEm0RHGQcjmxE A==;
X-CSE-ConnectionGUID: 65wPkl0AQ2iRVQl6O5NR8g==
X-CSE-MsgGUID: wtSllhaATJW0t1KSeFLvaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74789874"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74789874"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:50:08 -0700
X-CSE-ConnectionGUID: zQ0Zore8QpmUDNsff+a8hg==
X-CSE-MsgGUID: Wj/DXngdSFCUO65gp4vavA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226351315"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:50:06 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v4 1/2] tests/chamelium/audio: Fix ALSA handle leak on skipped
 audio config
Date: Mon, 16 Mar 2026 17:17:07 +0530
Message-ID: <20260316114708.3342278-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260316114708.3342278-1-mohammed.bilal@intel.com>
References: <20260316114708.3342278-1-mohammed.bilal@intel.com>
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
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

