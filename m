Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119A5106FD7B
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 04:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F60010EADC;
	Fri, 13 Mar 2026 04:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2M07tlE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E9410EADC
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 04:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773376801; x=1804912801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tEA86WdMQrRawcYu91no89BrUzhL5ZVAD84zZWIT6M8=;
 b=L2M07tlE8nLI98JEM059PjI6hRex/e2o5nHhNKMEjFyaKHQGWs4tvm5k
 baRP5KA6VbHAOU5xfkOQMkeYIYDmdZW1COLbOBPn3oGwCotaVoFbE8nYT
 T7QNOrZeO/EbXggVKmf4qwde9mDHVV5bWMoRiOuKxnVDt5DccE1sV10qy
 lOaEjU8EnopXhz6pu7JClSJHxR5yaC1IvpFDkDMl5vyCYY4hVbENel18V
 f6Z+UjRpjrh1RcbUaiLNKTgsPGNoNSv/4ShS6womCxsGbFtXDN9GhVelW
 wri9oF9W7UJuiuM5xgw/j7UIt3rgK98lOKDDpYBSWoJNSuIoLU/SyQfJM w==;
X-CSE-ConnectionGUID: OKDLk+JBS4SY19vTzC0Acw==
X-CSE-MsgGUID: 3x+AJXpkT/mg3/iFQF9HOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74521861"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="74521861"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 21:40:00 -0700
X-CSE-ConnectionGUID: bCZkkARpSyO6cFuUp/mCVg==
X-CSE-MsgGUID: vYggvKh8TYmo+FWnCd1ECg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; d="scan'208";a="258957628"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 21:39:59 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 ramanaidu.naladala@intel.com, Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_rotation_crc: Drain queued CRCs to avoid
 stale comparisons
Date: Fri, 13 Mar 2026 10:30:54 +0530
Message-ID: <20260313050054.383109-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312050613.375306-1-sowmiya.s@intel.com>
References: <20260312050613.375306-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Clear any queued CRCs before computing the target vblank and reading a sample.
This ensures the next CRC corresponds to the first frame after the caller’s
commit, reducing rare stale-CRC mismatches seen around modesets/PSR/DRRS/DSC
transitions and DP link retrains. Improves determinism of
CRC-based tests.

v2: Remove second drain (Pranay)
    Move drain after crc start

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/kms_rotation_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4420053f1..2a5f61609 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -965,6 +965,8 @@ static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 		data->pipe_crc = igt_crtc_crc_new(crtc,
 						  IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_start(data->pipe_crc);
+		/* Drop any queued samples before we start targeting frames. */
+		igt_pipe_crc_drain(data->pipe_crc);
 
 		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
 			p[0].fbinfo = &planeconfigs[i];
-- 
2.43.0

