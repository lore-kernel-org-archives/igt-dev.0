Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC400EA8550
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 09:22:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C05210E6A5;
	Tue, 10 Mar 2026 09:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kF1OUXbI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2E710E6A5
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773134561; x=1804670561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VUpnG4DpL2fHOMKiUsX8I9JuJdAEUN2SbEiqF8rN9DA=;
 b=kF1OUXbIBXQjH5PWB/KY6OXSrHtO8/f7JOaN6FcwNEzaUifAyzqijtZ0
 Dy0+PbW70FgITmPWlkSRnn9dGnTsWuXC6zIi1rzOFMYRo9QT+QdkNgtmw
 84f2+nr4rPki+lB54xdaqzUVtPKI/eHJVxsTaU9mCigFMimpLDK0+gxVI
 KJkMWVK0jSa5Ws50QNmwvH3bPAVuQwRZ2uXyzNDF4NozylA9FPzQsYeIT
 TPs9lLcOBeFB9ECKn97Ebh3fX1WDQaL/8G1+hS7aLiKXd0XUyO2GZ9Yks
 H870moyFcNIM6ev0WvkiJGYj5jgB8r/7Y+/WnNs8S3Z+dZUP56EIWNVvN g==;
X-CSE-ConnectionGUID: IEUYLgkpS1m4RBBC+bsSmQ==
X-CSE-MsgGUID: pK3s+wIJQwq2Or/kgQDiFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84885572"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84885572"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:22:41 -0700
X-CSE-ConnectionGUID: eFCSeDveSYSP31df2nWwUg==
X-CSE-MsgGUID: gEEZWvwnS3eWSne4bGi8CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224511066"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:22:40 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sebastian.brzezinka@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 1/2] tests/chamelium/audio: Fix ALSA handle leak on skipped
 audio config
Date: Tue, 10 Mar 2026 14:49:55 +0530
Message-ID: <20260310091956.3171295-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260310091956.3171295-1-mohammed.bilal@intel.com>
References: <20260310091956.3171295-1-mohammed.bilal@intel.com>
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

